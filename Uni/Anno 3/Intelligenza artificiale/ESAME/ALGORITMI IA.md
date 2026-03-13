# AGENTI REATTIVI SEMPLICI
```scss
function AGENTE-REATTIVO-SEMPLICE( percezione ) returns azione
	
	persistent: regole  // un insieme di regole condizione-azione
	
	stato <- INTERPRETA-INPUT (percezione)
	regola <- REGOLA-CORRISPONDENTE (stato, regole)
	azione <- regola.AZIONE()
	
	return azione
```



# AGENTI BASATI SUL MODELLO
```scss
function AGENTE-REATTIVO-SEMPLICE( percezione ) returns azione
	
	persistent: stato,      // descrizione dello stato corrente
				modello,    // conoscenza del mondo
				regole,     // insieme di regole condizione-azione
				azione,     // azione più recente
	
	stato <- AGGIORNA-STATO (stato, azione, percezione, modello)
	
	regola <- REGOLA-CORRISPONDENTE (stato, regole)
	azione <- regola.AZIONE()
	
	return azione
```


---


# BFS
```scss
function Ricerca-Ampiezza-A(problema) returns soluzione oppure fallimento
	nodo = un nodo con "stato = problema.stato-iniziale" e "costo-di-cammino = 0"
	
	if problema.Test-Obiettivo(nodo.Stato) then 
		return Soluzione(nodo)
	
	frontiera = coda FIFO con "nodo" come unico elemento
	
	loop do
		if EMPTY?(frontiera) then 
			return fallimento
		nodo = POP(frontiera)
		
		for each azione in problema.Azioni(nodo.Stato) do
			figlio = Nodo-Figlio(problema, nodo, azione)
			if Problema.TestObiettivo(figlio.Stato) then 
				return Soluzione(figlio)
			frontiera = InCoda(figlio, frontiera)
end
```


# UC
```scss
function UNIFORM-COST-SEARCH(problem) returns soluzione o fallimento
	nodo = un nodo con "STATO = problema.STATO-INIZIALE" e "COSTO-CAMMINO = 0"
	frontiera = "coda con priorità" ordinata per "COSTO-CAMMINO" e con "nodo" come                 unico elemento
	esplorati = "insieme vuoto"
	
	loop do
		if EMPTY?(frontiera) then 
			return fallimento
			
		nodo = POP(frontiera)  /* sceglie il nodo nella FRO con il costo minore */
		if problema.GOAL-TEST(nodo.STATO) then
			return SOLUZIONE(nodo)
		aggiungi nodo.STATO a esplorati
		
		for each azione in problema.AZIONI(nodo.STATO) do
			child = CHILD-NODO(problem, nodo, azione)
			
			if child.STATO non è in esplorati e non in frontiera then
					frontiera = INSERT(child, frontiera)
			else if child.STATO è in frontiera con un COSTO-CAMMINO >> then
				sostituisce quel nodo nella frontiera con "child" 
```

>[!tip] N.B: COSTO-CAMMINO sarebbe `g(n)`


# DFS su grafi (cambiano sono le cose in azzurro)
![[Pasted image 20251022112357.png]]

# UC su grafi (è identico)
![[Pasted image 20251022112419.png]]


# DFS LIMITATA
```scss
function RICERCA-APPROFONDIMENTO-ITERATIVO(problema) returns un nodo soluzione o fallimento
	for profondità = 0 to ∞ do
		risultato = RICERCA-PROFONDITÀ-LIMITATA(problema, profondità)
		if risulato ≠ soglia then 
			return risultato


function RICERCA-PROFONDITÀ-LIMITATA(problema, l) returns un nodo soluzione o un fallimento o soglia
	frontiera = una coda LIFO (stack) con NODO(problema.STATO-INIZIALE) come 
                elemento iniziale
    risultato = fallimento
    
    while not VUOTA?(frontiera) do
	    nodo = POP(frontiera)
	    if problema.È-OBIETTIVO(nodo.STATO) then 
		    return nodo
		
		if profondita(nodo) > l then
			risultato = soglia
		
		else if not È-CICLO(nodo) do
			for each figlio in ESPANDI(problema, nodo) do
				aggiungi figlio a frontiera
	
	return risultato  
```



---

# Best first classico (è identico a UC)
![[Pasted image 20251024114221.png]]

# Best first greedy (identico a UC ma non conta `g(n)`)
![[Pasted image 20251024114344.png]]


# A* (identico a UC ma nell'`else if` ho `f(n)`)
```scss
function A* (problem) returns a solution or failure
	nodo <- nodo con stato = problem.initialstate
	frontiera <- coda di priorità ordinata in base a f(n) con all'inizio solo nodo 
                 "nodo"
	esplorati <- insieme dei nodi esplorati inizialmente vuoto
	
	loop do
	    if VUOTA?(frontiera) then return failure
	    
	    nodo <- POP(frontiera)
	    
	    if problem.GOALTEST(nodo.state) then return SOLUTION(nodo)
		
		aggiungi nodo.state a esplorati
	    
	    for each action in problem.ACTIONS(nodo.state) do
	        child <- CHILD-NODE(problem, nodo, action)
	        if child.state non in frontiera or esplorati then
	            frontiera <- INSERT(child.state)
	        else if child.state is in frontiera con f(n) più alto allora
	            sostituisci quel nodo nella frontiera con "child"
```


---


# Hill Climb
```scss
function Hill-climbing(problema) returns uno stato che è un "massimo locale"
	nodo-corrente = CreaNOdo(problema.Stato-iniziale)
	
	loop do
		vicino = "il successore di nodo-corrente di valore più alto"
		if vicino.Valore ≤ nodo-corrente.Valore then
			return nodo-corrente.Stato  /* interrompe la ricerca */
		nodo-corrente = vicino
```



# Simulated Annealing
```scss
function SIMULATED-ANNEALING(problema, schedule) returns "una stato 'soluzione'"
	(schedule è funzione per calcolare la temperatura corrente)
	
	current = MAKE-NODE(problemA.STATO-INIZIALE)
	
	for t = 1 to ∞ do
		T = shcedule(t)
		
		if T = 0 then
			return current
		
		next = un successore di "current" scelto randomicamente
		
		ΔE = next.VALORE - current.VALORE
		if ΔE > 0 then 
			next
		else current = next 'SOLO CON PROBABILITÀ e^{ΔE / T}'
```