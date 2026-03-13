## RICHIESTA
Nella cantina lo **scoiattolo** deve raccogliere e mangiare **tutte le ghiande** presenti prima di uscire il più rapidamente possibile, per evitare l’arrivo del padrone di casa.

La cantina è modellata come una **griglia discreta**.  
Lo scoiattolo può muoversi **di una cella alla volta** nelle quattro direzioni cardinali (su, giù, sinistra, destra).  
Quando lo scoiattolo occupa la stessa cella di una ghianda, **mangia la coppia di ghiande** presente in quella posizione.  
Durante il movimento deve **evitare ostacoli e buche nel pavimento**, che non possono essere attraversati.

L’obiettivo dello scoiattolo è quindi **percorrere il cammino sicuro più breve** che gli consenta di **raccogliere tutte le ghiande** e **raggiungere l’uscita** nel minor tempo possibile.

![[Pasted image 20260129102532.png|center]]

Si richiede di:
1. **Descrivere in logica** l’ambiente, l’agente, lo spazio degli stati e il goal, sfruttando se possibile l’ereditarietà per rappresentare le loro caratteristiche.  
    _(4 punti)_
    
2. **Definire l’ambiente** e le **interrogazioni logiche** che consentono di determinare le azioni possibili dell’agente.  
    _(6 punti)_
    
3. **Definire le interrogazioni alla KB** tramite le quali agente e ambiente interagiscono, specificando come la KB viene letta e modificata in seguito alle azioni dell’agente.  
    _(4 punti)_
    
4. **Definire l’attività dello scoiattolo** rispetto al suo goal come un **problema di ricerca nello spazio degli stati** e descrivere l’**algoritmo di ricerca euristico** utilizzato per pianificare le azioni.  
    _(8 punti)_



---

## PEAS
P -> performance -> l'agente scoiattolo deve mangiare tutte le ghiandole presenti nella cantina per poi uscire, il tutto minimizzando il costo totale e evitando le buche e gli ostacoli.

E -> environment -> l'ambiente cantina in cui opererà l'agente è modellata come una griglia $5 \times 5$, lo scoiattolo si trova inizialmente nella cella `(1,4)` (ingresso), le celle `(3,1)` e `(5,3)` sono occupare della ghiande, la cella `(3,5)` corrisponde all'uscita e alcune celle contengono buche/ostacoli invalicabili.

A -> attuatori -> gli attuatori del nostro agente sono le zampe, utili per muoversi nell'ambiente, e la bocca, utilizzata per mangiare le ghiande

S -> sensori -> il sensore dell'agente è la vista, la quale gli permette di osservare l'ambiente circostante

## DESCRIZIONE AMBIENTE
L'ambiente in questo contesto è
- COMPLETAMENTE OSSERVABILE
- MONO AGENTE
- DETERMINISTICO
- DISCRETO
- NOTO
- SEQUENZIALE
- STATICO

## DESCRIZIONE AGENTE
L'agente scelto è basato su obiettivo, e può quindi agire da pianificatore.
Dato che l'ambiente è COMPLETAMENTE OSSERVABILE, STATICO E DETERMINISTICO, l'agente può operare in due fasi distinte
- PIANIFICAZIONE 
- ESECUZIONE


## STATI
In questo contesto possiamo distinguere diversi stati
- **STATO DEL MONDO**: è la descrizione dello stato dell'ambiente in un dato momento, e può essere descritto mediante la seguente N-UPLA $$S_{mondo} = \langle P_{scoiattolo}, P_{ghianda1} , P_{ghianda2}, OSTACOLI, BUCHE \rangle$$
	- dove P sono le varie posizioni descritte dalla coppia `(x,y)` con $x,y \in [1, ..., 5]$
	- OSTACOLI è l'insieme delle posizioni degli ostacoli
	- BUCHE è l'insieme delle posizioni delle buche


- **STATO SPAZIO RICERCA**: è la descrizione delle caratteristiche utili per la ricerca, rappresenta quindi l'astrazione utilizzata dall'algoritmo di ricerca. Anche in questo caso possiamo descriverlo come una Tupla $$S_{ricerca} = \langle P_{scoiattolo} , MANGIATE\rangle$$
	dove
	- MANGIATE è la lista delle ghiandole mangiate e $MANGIATE \subseteq \{G1, G2\}$

- **STATO INIZIALE**: Lo scoiattolo si trova nella cantina e deve mangiare entrambe le ghiande $$S_{start} = \langle (1,3), \varnothing \rangle$$
- **STATO GOAL 1**: lo scoiattolo ha mangiato una ghianda $$S_{G1} = \langle (x,y), \{G1 / G2\} \rangle$$
	- dove `(x,y)` è la posizione  della cella contenente la ghianda e nell'insieme inserisco la ghianda mangiata

- **STATO GOAL 2**: lo scoiattolo ha mangiato entrambe le ghiande $$S_{G2} = \langle (x,y), \{G1, G2\} \rangle$$
- **STATO GOAL 3**: lo scoiattolo ha mangiato entrambe le ghiande e si trova sull'uscita $$S_{G3} = \langle (3,5), \{G1, G2\} \rangle$$


## Modello di transizione e costo
In questo contesto possiamo distinguere due azioni principali
1) MOVIMENTO
	 - L'azione è definita $$a = move(d)$$dove `d` è una direzione tra
		 - `NORD`
		 - `SUD`
		 - `EST`
		 - `OVEST`
	L’azione `move(d)` è applicabile se la cella adiacente nella direzione `d` è valida.
	
	E il risultato di questa azione, applicata a uno stato `s` è un nuovo stato `s'` $$Result(s, a) = s'$$con la `s'` che contiene la nuova posizione dello scoiattolo

2) MANGIARE
	- Qui l'azione $$a=mangia(ghianda)$$applicata a uno stato `s`, genera un nuovo stato `s'`$$Result(s,a) = s'$$con la posizione dello scoiattolo invariata ma con l'aggiunta di una nuova ghianda nell'insieme delle ghiande mangiate (`MANGIATE`)

La funzione costo `c(s,a,s')` rappresenta il valore numerico associato alla transizione dallo stato `s` allo stato `s'` a seguito dell'azione `a`.

Il costo totale in questo caso rappresenta la somma totale delle transizioni.


## DEFINIZIONE AMBIENTE e INTERROGAZIONI LOGICHE
L’ambiente viene rappresentato tramite una **base di conoscenza logica** che descrive la posizione dello scoiattolo, delle ghiande, dell’uscita e degli ostacoli presenti nella griglia. Le **interrogazioni logiche** consentono di stabilire quando un’azione è applicabile, in particolare il movimento e la raccolta delle ghiande.
```
% DEFINSCO I FATTI
pos(scoiattolo, 1, 4).
ghianda(3,1).
ostacolo(2,3).  % ne inserisco solo uno per praticità
buca(4,2).      % stessa cosa di sopra
uscita(3,5).


% DEFINISCO LE ADIACENZE
adiacente(X, Y, X1, Y) :- X1 is X+1.
adiacente(X, Y, X1, Y) :- X1 is X-1.
adiacente(X, Y, X, Y1) :- Y1 is Y+1.
adiacente(X, Y, X, Y1) :- Y1 is Y-1.
 

% DEFINISCO UNA CELLA LIBERA
libera(X,Y) :- 
	not(ostacolo(X,Y)),
	not(buca(X,Y)).	


% DEFINISCO IL LIMITE PER LA GRIGLIA
in_griglia(X,Y) :- 
	X >= 1, 
	X =< 5, 
	Y >= 1, 
	Y =< 5.


% PREDICATO DI "MOVIMENTO"
puo_muoversi(X, Y, X1, Y1) :- 
	pos(scoiattolo, X, Y),
	adiacente(X, Y, X1, Y1),
	in_griglia(X1, Y1),
	libera(X1, Y1).	


% PREDICATO DI "MANGIA"
puo_mangiare :- 
	pos(scoiattolo, X, Y),
	ghianda(X,Y).
```

## ESEMPIO DI INTERROGAZIONI
#### AGENTE CHIEDE SE PUÒ MUOVERSI`
```
?- puo_muoversi(X, Y, X1, Y1).
```

#### AGENTE CHIEDE SE PUÒ MANGIARE
```
?- puo_mangiare.
```

#### MODIFICA DELLA KB
- scoiattolo cambia posizione
```
?- retract(pos(scoiattolo, X, Y)).
?- assert(pos(scoiattolo X1, Y1)).
```

- scoiattolo mangia (ovviamente questo vale se `puo_mangiare == TRUE`)
```
?- retract(ghianda(X,Y)).
```


## PROBLEMA DI RICERCA e ALGORITMO DI RICERCA
L'attività dello scoiattolo è modellata come un problema di ricerca nello spazio degli stati, dove ogni stato rappresenta una configurazione possibile del mondo.

Dato che il nostro agente è di tipo pianificatore, l'algoritmo scelto in questo contesto è `A*`, in quanto troverà il cammino di costo minimo nella maniera più efficiente.
Tale algoritmo opera offline.

Prima di descrivere `A*` è utile, ai fini della ricerca, modellare l'ambiente (precedentemente descritto come una griglia) in un grafo di ricerca $G = (V, E)$ dove,
- ogni nodo rappresenta una cella della griglia e ha una struttura di questo tipo $$NODO = \langle stato, padre, azione, g, f \rangle$$dove
	- stato -> è lo stato dello spazio di ricerca
	- padre -> è il nodo che lo ha generato
	- azione -> è l'azione che ha generato il nodo corrente
	- g -> è il cammino calcolato da nodo start fino al nodo corrente
	- f -> è la funzione di valutazione di `A*` definita come `f = g + h`

- ogni arco rappresenta una possibile transizione dal nodo corrente ai nodi vicini.

Descrivendo ora l'algoritmo `A*`, se l'euristica `h` scelta è ammissibile e monotona, tale algoritmo risulta essere COMPLETO e OTTIMALE,
- COMPLETO -> in quanto trova sempre la soluzione se questa esiste e se vale che $$g(n) \ge d(n) \cdot \epsilon$$
- OTTIMALE -> in quanto espanderà sempre prima i nodi più promettenti, ossia quelli con la $f(n)$ più bassa; quindi troverà sempre il cammino di costo minimo.

La funzione di valutazione di `A*`, come già descritto in precedenza, è $$f(n) = g(n) + h(n)$$dove `h(n)` è l'euristica, che rappresenta la stima del costo del cammino dal nodo `n` al nodo `goal`.

In questo contesto, l'euristica scelta è la MANHATTAN DISTANCE così calcolata $$h_{MAN} = |nodo.x - goal.x| + |nodo.y - gaal.y|$$Tale euristica è AMMISSIBILE e MONOTONA, 
- AMMISSIBILE -> in quanto non sovrastima mai il costo reale `h*(n)` ($h(n) \le h^{*}(n)$)
- MONOTONA -> in quanto non decresce mai $$h(n) \le c(n,n') + h(n')$$dove 
	- `c(n,n')` rappresenta il costo della transizione da `n` a `n'`
	- `h(n')` è la stima calcolata su `n'`

L’algoritmo A* viene utilizzato per pianificare l’intera sequenza di azioni prima dell’esecuzione, essendo l’ambiente statico e completamente osservabile.


## OPZIONALE IN QUESTO ESERCIZIO
#### PROGRAMMA AMBIENTE
```
function RUN-ENV(UPDATE-fn, stato, agente, PERFORMANCE-fn) returns score
	local variable score
	
	loop do
		percezione <- GET-PERCEPTION(stato, agente)
		azione <- AGENT-PROG(percezione)
		stato <- UPDATE-fn(stato, azione)
		score <- PERFORMANCE-fn(stato, score)
	until TERMINATION(stato)  // lo stato di terminazione sarà calcolato dopo che 
                              // l'azione dell'agente sarà STOP
	
	return score
```


#### PROGRAMMA AGENTE
```
function AGENT-PROG(percezione) return azione
	persistent stato
			   piano
			   problema
			   MANGIATE <- VUOTO
	
	
	// aggiorno stato interno
	stato.P_scoiattolo <- percezione.P_scoiattolo
	
	
	// controllo se l'agente può mangiare / uscire
	if percezione.P_scoiattolo == percezione.P_G1 
		and percezione.P_g1 not in MANGIATE then
		SVUOTA(piano)
		MANGIATE <- MANGIATE U {P_G1}
		return mangia(G1)
	
	if percezione.P_scoiattolo == percezione.P_G2 
		and percezione.P_G2 not in MANGIATE then
		SVUOTA(piano)
		MANGIATE <- MANGIATE U {P_G2}
		return mangia(G2)
	
	if percezione.P_scoiattolo == percezione.P_uscita and |MANGIATE| == 2 then
		return STOP  // la condizione che mi porta nello stato di terminazione	
	
	
	// pianifico il piano se non lo ho
	if piano is empty then
		problema <- FORMULATE-PROBLEM(percezione, MANGIATE, stato)
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
	nodo <- nodo con 'nodo.stato == problema.stato-iniziale'
	frontiera <- coda con priorità inizialmente contenente solo 'nodo'
	             // la priorità è la funzione di valutazione f(n)
	esplorati <- insieme vuoto // insieme dei nodi già esplorati (espansi)
	
	while not vuota?(frontiera) do
		nodo <- frontiera.pop()  // estraggo il nodo dalla frontiera
		
		if problema.GOAL-TEST(nodo.stato) then  // controllo se il nodo è il goal
			return soluzione(nodo.stato)
		
		esolorati <- esplorati U {nodo.stato}	
		
		for each problema.azione(nodo.stato) do
			figlio <- CHILD-NODE(problema, nodo, azione)
			
			if figlio not in frontiera and not in esplorati then
				frontiera.push(figlio)
			
			else if figlio is in frontiera ma con una f(n) maggiore
				sostituisci quel nodo.stato con 'figlio.stato'
	
	return failure	
``` 


## Ambiente parzialmente osservabile
Nel caso in cui l'ambiente fosse parzialmente osservabile, lo scoiattolo non disporrebbe di una conoscenza completa della mappa e dovrebbe quindi pianificare le proprie azione in modo incrementale.
In questo contesto non sarebbe possibile utilizzare una pianificazione offline, ma l'agente dovrebbe basarsi su una ricerca euristica locale, scegliendo ad ogni passo l'azione localmente migliore in base alle informazioni disponibili.
Dopo ogni azione, l'agente aggiornerebbe la propria conoscenza dell'ambiente tramite le percezioni. 
Tale approccio consente adattabilità dinamica ma non garantisce l'ottimalità globale della soluzione.