![[WhatsApp Image 2025-01-31 at 13.42.56_c3d8b4d7.jpg]]

## PEAS
- P -> PERFORMANCE -> l'agente topolino deve, partendo dalla posizione start, prendere il formaggio e portarlo verso l'uscita, il tutto minimizzando il costo totale
- E -> ENVIRONMENT -> l'ambiente su cui opera l'agente è una griglia $5 \times 5$ dove
	- una posizione è occupata dal topo (1, 3)
	- una posizione dal formaggio (5,2)
	- una posizione dall'uscita (5,4)
	- due posizioni dalle colonne (3,2) e (3,3)

- A -> ATTUATORI -> gli attuatori del nostro agente sono le zampe, per muoversi nell'ambiente, e la bocca, per trasportare il formaggio.
- S -> sensori -> il sensore del nostro agente è la vista che gli permette di avere una visione completa dell'ambiente circostante


## DESCRIZIONE AMBIENTE
L'ambiente su cui opera l'agente è
- COMPLETAMENTE OSSERVABILE
- MONO AGENTE
- DETERMINISTICO
- STATICO
- DISCRETO
- NOTO
- SEQUENZIALE

## DESCRIZIONE AGENTE
L'agente scelto è di tipo "basato su obiettivo", e può quindi agire da pianificatore.
Dato che l'ambiente è COMPLETAMENTE OSSERVABILE, STATICO E DETERMINISTICO, l'agente opererà in due fasi distinte
- PIANIFICAZIONE (l’obiettivo è composto e può essere raggiunto attraverso sottogoal)
- ESECUZIONE


## STATI 
Possiamo distinguere quattro stati principali
- **STATO DEL MONDO** -> è la descrizione dell'ambiente in un dato momento e può essere descritto come una `N-upla` $$S_{mondo} = \langle P_{topo}, \ P_{formaggio}, \ P_{uscita}, \ \text{LISTA OSTACOLI} \rangle$$ dove 
	- Le P sono le posizioni descritte come una coppia $(x, y) : x,y \in [1, ..., 5]$
	- La lista degli ostacoli è una lista contenente le coppie in cui sono presenti ostacoli ${(x_{1},y_{1}), (x_{2}, y_{2}), ...,(x_{k}, y_{k})}$

- **STATO SPAZIO DI RICERCA**: è la descrizione delle caratteristiche utili per la ricerca, è quindi l'astrazione utilizzata dall'algoritmo di ricerca. Dato che l'ambiente in questo contesto è statico, le posizioni degli obiettivi e degli ostacoli rimangono invariate, quindi lo stato dello spazio del mondo viene definito come segue $$S_{ricerca} = \langle P_{topo}, \ PRESO \rangle$$dove PRESO è un flag utile per capire se il formaggio è stato preso o meno e quindi $$PRESO \in \{TRUE, FALSE\}$$

- **STATO INIZIALE**: $S_{start} = \langle (1,3), FALSE \rangle$
- **STATO GOAL 1** (raccogliere il formaggio): $S_{G1} = \langle (5,2), TRUE \rangle$
- **STATO GOAL 2** (recarsi all'uscita): $S_{G2} = \langle (5,4), TRUE \rangle$


## MODELLO DI TRANSIZIONE e COSTO
In questo contesto possiamo definire due azioni principali
1) MOVIMENTO
	- $a = move{(x, y), (x^{'}, y^{'}) \ | \ (x^{'}, y^{'}) \in conf((x, y))}$
		- dove `conf((x,y))` è l'insieme di tutte le celle adiacenti a `(x,y)`
	Il risultato di tale azione, applicata a uno stato `s`, è un nuovo stato `s'` dove la posizione del topo è cambiata $$Result(s, a) = s^{'}$$ e il movimento può essere uno tra `N`, `S`, `E`, `O` se e solo se la cella adiacente non è un muro invalicabile

2) PRESA
	- $a = prendi(formaggio)$
	Il risultato anche qui è un nuovo stato `s'` ma la posizione del topo rimane invariata.

La funzione costo `c(s, a, s')` rappresenta il valore numerico associato alla transizione dallo stato `s` allo stato `s'` a seguito di un'azione `a`.
Nel testo non vengono citati i costi ma possiamo ipotizzare un qualcosa del genere
- `c(s, a, s') = 1` se `a` = movimento
- `c(s, a, s' = 2` se `a` = prendi(formaggio)

Il costo totale quindi è la somma di tutti i costi delle transizioni.


## ALGORITMO DI RICERCA
L'algoritmo di ricerca scelto è `A*`, in quanto troverà il cammino di costo minimo in maniera efficiente.

Prima di descrivere le caratteristiche di `A*`, ai fini delle ricerca, l'ambiente precedentemente descritto come una griglia viene astratto in un grafo di ricerca $G = (V, E)$.
- Ogni nodo rappresenta una cella della griglia e ha una struttura di questo tipo $$ NODO = \langle stato, \ padre, \ azione, \ g, \ f \rangle$$dove 
	- `stato` = stato spazio di ricerca
	- `padre` = nodo che ha generato il nodo corrente
	- `azione` = azione che ha portato a generare il nodo corrente
	- `g` = costo del cammino da nodo start a nodo corrente
	- `f` = funzione di valutazione di `A*` (`f = g + h)`
		- dove `h` è l'euristica scelta

- Gli archi rappresentano le possibili transizioni tra celle adiacenti

L'algoritmo `A*`, se l'euristica scelta è ammissibile e monotona, risulta essere
- COMPLETO -> in quanto trova sempre la soluzione ottima se questa esiste e se vale che $$g(n) \ge d(n) \cdot \epsilon$$dove
	-  `d(n)` è la profondità del nodo `n`
	- $\epsilon > 0$ è il costo associato agli archi connessi a `n`

- OTTIMALE -> in quanto espande sempre prima i nodi più promettenti (ossia quelli con `f(n)` più bassa)

La funzione di valutazione, come precedentemente descritto è $$f(n) = g(n) + h(n)$$
L'euristica `h` scelta per questo problema è la Manhattan Distance, calcolata come segue $$h_{MAN} = |nodo.x \ - \ goal.x| + |nodo.y \ - \ goal.y|$$Tale euristica è
- AMMISSIBILE -> in quanto non sovrastima mai il costo effettivo `h*` ($h(n) \le h^{*}(n)$)
- MONOTONA -> in quanto non decresce mai $$h(n) \le c(n, n^{'}) + h(n^{'})$$
dove 
- `c(n, n')` è il costo della transizione da `n` a `n'`
- `h(n')` è la stima calcolata su `n'`


## PROGRAMMA AMBIENTE
```
functin RUN-ENV(UPDATE-fn, stato, agente, PERFORMANCE-fn) returns score
	local variable score
	
	loop do
		percezione <- GET-PERCEPTION(stato, agente)
		azione <- PROG-TOPO(percezione)
		stato <- UPDATE-fn(stato, azione)
		score <- PERFORMANCE-fn(stato, score)
	until TERMINATION(stato)   // lo stato di terminazione è conseguente 
                               // all'azione "EXIT" descritta nell'agente
	
	return score
```

## PROGRAMMA AGENTE
```
function PROG-TOPO(percezione) returns azione
	persistent stato
			   goal // una lista di obiettivi inizialmente vuota
			   problema
			   piano
			   PRESO <- FALSE
	
	
	// aggiorno stato interno
	stato.P_topo <- percezione.P_topo
	
	
	// riempio la lista degli stati
	if goal is empty do
		goal <- append(percezione.P_formaggio)  // così goal[0] = P_formaggio
		goal <- append(percezione.P_uscita)     // così goal[1] = P_uscita
	
	
	if percezione.P_topo == percezione.P_formaggio and PRESO == FALSE then
		PRESO <- TRUE
		SVUOTA(piano)
		REMOVE_FIRST(goal)   // ora il goal sarà goal[1] che diventa goal[0]
		return prendi(formaggio)
	
	else if percezione.P_topo == percezione.P_uscita and PRESO == TRUE then
		return STOP
	
	
	if piano is empty 
		problema <- FORMULATE_PROBLEM(percezione, FIRST(goal)) 
			
		piano <- A*(problema)
		if piano == failure then
			return NULL-ACTION
	
	azione <- FIRST(piano)
	piano <- REST(piano)
	return azione
```


## ALGORITMO DI RICERCA A*
```
function A*(problema) returns soluzione or failure
	nodo <- nodo con "nodo.statoiniziale = problema.statoiniziale"
	frontiera <- coda con priorità inizialmente contenente solo 'nodo'
	             // la priorità e la funzione di valutazione f(n)
    esplorati <- insieme di nodi già esplorati // inizialmente vuoto
    
    while not vuota?(frontiera) do
	    nodo <- frontiera.pop()
	    
	    if PROBLEMA.GOAL-TEST(nodo.stato) then
		    return soluzione(nodo.stato)
		
		aggiungi nodo.stato a esplorati
		
		for each problema.azione(nodo.stato) do
			figlio <- CHILD-NODE(problema, nodo, azione) 
			
			if figlio not in frontiera and not in esplorati then
				frontiera.push(figlio)
			
			else if figlio is in frontiera ma con una f(n) maggiore then
				sostituisci quel nodo.stato con figlio.stato
	return failure
```


## DOMANDA FACOLTATIVA
Il robot potrebbe sfruttare tecniche di Machine Learning per migliorare le proprie prestazioni stimando in modo più accurato i costi delle azioni o apprendendo una funzione euristica più informativa a partire dall’esperienza.

In particolare, tramite apprendimento per rinforzo, l’agente può aggiornare una stima dei costi di raggiungimento del goal in base agli episodi precedenti, riducendo il numero di esplorazioni non necessarie.

L’algoritmo di ricerca rimane invariato, ma l’euristica appresa permette di guidare la pianificazione in modo più efficiente, mantenendo la correttezza della soluzione.