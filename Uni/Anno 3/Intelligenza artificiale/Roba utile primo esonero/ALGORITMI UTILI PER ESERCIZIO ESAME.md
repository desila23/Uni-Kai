# Modello transizione
- STATO MONDO -> tupla con info sull'ambiente $$S = (POS_{agente}, \ POS_{obiettivo_{1}}, \ ..., POS_{obiettivo_{n}}, \ \text{INSIEME POS OSTACOLI})$$
- STATO SPAZIO DI RICERCA -> tupla con in aggiunta un flag (se abbiamo più obiettivi) $$S = (POS_{agente}, \ POS_{obiettivo_{1}}, \ ..., POS_{obiettivo_{n}}, \ \text{INSIEME POS OSTACOLI}, \ BOOL (flag))$$
- AZIONI (prendiamo il caso in cui abbiamo più obiettivi)
	- **MOVIMENTO SENZA OBIETTIVO PRECEDENTE RAGGIUNTO** $$a = move(x', y')$$ $$S = (NEWPOS_{agente}, \ POS_{obiettivo_{1}}, \ ..., POS_{obiettivo_{n}}, \ \text{INS. POS OSTAC.}, \ FLAG = FALSO)$$con
		- se `move = sx` -> $x' \in \{2, ..., n\}$ e $y' \in \{1, ..., n\}$
		- se `move = dx` -> $x' \in \{1, ..., n-1\}$ e $y' \in \{1, ..., n\}$
		- se `move = su` -> $x' \in \{1, ..., n\}$ e $y' \in \{1, ..., n-1\}$
		- se `move = giù` -> $x' \in \{1, ..., n\}$ e $y' \in \{2, ..., n\}$
	
	
	- **OBIETTIVO ATTUALE RAGGIUNTO** $$a = azione$$ $$S = (POS_{agente}, \ POS_{obiettivo_{1}}, \ ..., POS_{obiettivo_{n}}, \ \text{INS. POS OSTAC.}, \ FLAG = VERO)$$
	
	- **MOVIMENTO CON OBIETTIVO PRECEDENTE RAGGIUNTO** $$a = move(x', y')$$ $$S = (NEWPOS_{agente}, \ POS_{obiettivo_{1}}, \ ..., POS_{obiettivo_{n}}, \ \text{INS. POS OSTAC.}, \ FLAG = VERO)$$con
		- se `move = sx` -> $x' \in \{2, ..., n\}$ e $y' \in \{1, ..., n\}$
		- se `move = dx` -> $x' \in \{1, ..., n-1\}$ e $y' \in \{1, ..., n\}$
		- se `move = su` -> $x' \in \{1, ..., n\}$ e $y' \in \{1, ..., n-1\}$
		- se `move = giù` -> $x' \in \{1, ..., n\}$ e $y' \in \{2, ..., n\}$


# FUNZIONE AGENTE
- L'agente usa l'algoritmo `A*`, un algoritmo offline che permette di trovare la sequenza migliore di azioni per raggiungere l'obiettivo. 
- Si tratta di un algoritmo 
	- COMPLETO -> trova la soluzione se esiste e se vale $g(n) \ge d(n) + \epsilon$ 
	- OTTIMALE -> espande sempre i nodi con `f(n)` più bassa
	
- FUNZIONE di valutazione $f(n) = g(n) + h(n)$
	
- Euristica MANHATTAN DISTANCE, una metrica per misurare la distanza tra due punti ottenuta in questo modo $$|x_{1} - x_{2}| + |y_{1} - y_{2}|$$Tale euristica è
	- AMMISSIBILE -> perché non sovrastima mai il costo reale per arrivare al goal ($h(n) \le h^{*}(n)$)
	- MONOTÒNA -> le stime non decrescono mai ($h(n) \le c(n, n') + h(n')$)


# PROGRAMMA AMBIENTE
```scss
function RUN-ENV(Update-FN, stato, agente, Performance-FN) returns score
	local variable score
	
	loop do
		percezione = (POS_agente, POS_obiettivo1, ..., POS_obiettivoN, 
                    INSIEME_POS_OSTACOLI) = GET-PERCERPT(stato, agente)
        azione = PROGRAMMA-AGENTE(percezione)
        stato = Update-FN(stato, azione)
        score = Performance-FN(stato, score)
    until TERMINATION(stato)
	
	return score
```


# PROGRAMMA AGENTE
```scss
function PROGRAMMA-AGENTE(percezione) returns azione
	persistent stato
			   goal
			   problema
			   piano
			   FLAG  (OPZIONALE)
	
	if POS_AGENTE == POS_obiettivo "and flag == come lo vogliamo" then
		"cose che vogliamo modificare (es. cambia stato flag o svuota piano)"
		return azione (es. mangia o esci)
	
	if piano is empty then
		goal = FORMULATE-GOAL(percezione)   /* QUI USA IF-ELSE */
		problema = FORMULATE-PROBLEM(percezione, goal)
		piano = Algoritmo_ricerca(problema)  /* NOI USIAMO A* */
		
		if piano == failure then
			return NULL action
	
	azione = FIRST(plan)
	piano = REST(plan)
	return azione
```


# A*
```scss
function A*(problema) returns soluzione oppure failure
	nodo = con "stato = problema.stato-iniziale"
	frontiera = coda con priorità inizialmente solo con "nodo"
	esplorati = insieme di nodi già esplorati (inizialmente vuoto)
	
	loop do
		if frontiera is empty then
			return failure
		
		nodo = POP(frontiera)
		
		if problema.GOALTEST(nodo.stato) then
			return soluzione(nodo)
		
		aggiungi nodo.stato a "esplorati"
		
		for each azione in problema.azioni(nodo.stato) do
			figlio = CHILD-node(problema, nodo, azione)
			if figlio.stato not in frontieta o esplorati then
				frontieta = INSERT(figlio.state)
			else if figlio.stato in frontieta ma con f(n) > then
				sostituisci quel nodo con figlio.stato
```



----

