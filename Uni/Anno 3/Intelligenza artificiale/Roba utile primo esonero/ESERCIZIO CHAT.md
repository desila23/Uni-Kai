## ESERCIZIO – Agente nel magazzino (stile IA)
Un agente **Robot** opera in un **magazzino** modellato come una **griglia discreta 6×6**.  
All’interno del magazzino sono presenti:
- una **cella di ingresso** (posizione iniziale del robot) $(1,1)$
- una **cella di uscita** $(6,6)$
- **due pacchi** da ritirare $(3,2), (5,4)$
- alcune **celle occupate da scaffali** (ostacoli invalicabili)

Il robot:
- si muove di una cella alla volta
- può muoversi solo in **alto, basso, sinistra, destra**
- ogni movimento ha **costo 1**
- raccogliere un pacco ha **costo 0**
- può trasportare **un solo pacco alla volta**
- per uscire deve aver **raccolto entrambi i pacchi**

L’ambiente è **statico** e **completamente osservabile**.

### Si richiede di:
1. **Analisi PEAS**
    - definire Performance, Environment, Actuators, Sensors
        
2. **Proprietà dell’ambiente**
    - osservabilità
        
    - determinismo
        
    - staticità
        
    - discreto/continuo
        
3. **Descrizione dello stato**
    - definire formalmente lo **stato del mondo**
        
    - definire lo **stato dello spazio di ricerca**
        
    - definire **stato iniziale** e **goal**
        
    - calcolare la **cardinalità dello spazio degli stati**
        
4. **Modello di transizione**
    - definire Result(s, a)
        
    - descrivere le azioni applicabili
        
5. **Algoritmo di soluzione**
    - descrivere l’agente
        
    - scegliere l’algoritmo di ricerca
        
    - definire f(n), g(n), h(n)
        
    - discutere completezza e ottimalità
        
6. **Euristica**
    - proporre una euristica ammissibile
        
    - motivarne la correttezza
        
7. **Strutture dati**
    - definire la struttura dello **stato**
        
    - definire la struttura di un **nodo A***
        

---


## PEAS
- P -> L'agente robot deve ritirare due pacchi (uno per volta) e portarli entrambi all'uscita, il tutto minimizzando il costo totale.
- E -> L'agente opera in un magazzino modellato come una griglia $6 \times 6$ e 
	- una cella è di ingresso (posizione iniziale del robot)
	- una della è di uscita
	- due celle sono occupate dai pacchi
	- alcune celle sono occupare da scaffali (ostacoli)
- A -> gli attuatori del nostro agente sono gambe e braccia che gli consentono rispettivamente di muoversi nell'ambiente e raccogliere i pacchi
- S -> il sensore del nostro agente è la vista, che userà per avere tutte le percezioni necessarie dall'ambiente

## Descrizione ambiente
L'ambiente su cui opera l'agente è
- COMPLETAMENTE OSSERVABILE
- DETERMINISTICO
- MONO AGENTE
- DISCRETO
- SEQUENZIALE
- NOTO
- STATICO

## DESCRIZIONE AGENTE
L'agente scelto è basato su obiettivo, quindi può agire da pianificatore.
Dato che l'ambiente è completamente oss. , statico e deterministico, il nostro agente opererà in due fasi distinte
- PIANIFICAZIONE (in questo caso la pianificazione è composta perché ci sono due goal distinti)
- ESECUZIONE


## STATI
Si può dividere la descrizione degli stati come segue
- **STATO DEL MONDO**: rappresenta una descrizione dell'ambiente in un dato momento e può essere rappresentato come una n-upla $$S_{mondo} = <P_{robot}, P_{p1}, P_{p2}, P_{uscita}, \ \text{Pacco in mano} \ , \text{OSTACOLI}>$$dove 
	-  P sono le varie posizioni definite come $(x, y)$ con $x, y \in [1, 6]$ 
	- Pacco in mano $\in \{none, \ P1, P2\}$
	- ostacoli è l'insieme di tutte le posizioni degli ostacoli $OSTACOLI = \{(x_{1}, y_{1}), (x_{2}, y_{2}), ..., (x_{k}, y_{k})\}$

- **STATO SPAZIO DI RICERCA**: rappresenta l'astrazione utilizzata dall'algoritmo di ricerca. La tupla in questo contesto è $$\langle P_{robot}, \ \text{Pacchi raccolti}, \ \text{Pacco in mano} \rangle$$dove pacchi raccolti $\subseteq \{P1, P2\}$



- **STATO INIZIALE**: Il robot si trova in entrata e deve raggiungere il primo pacco $$S_{start} = \langle(1,1), \ \varnothing, \ \{none\} \rangle$$
- **STATO INTERMEDIO 1**: Il robot ha preso un pacco $$S_{I1} = \langle(x,y), \ \{P1/P2\} , \ \{P1/P2\} \rangle$$dove $(x,y)$ corrispondono alle coordinate di un pacco.

- **STATO INTERMEDIO 2**: Il robot si trova sull'uscita, ha appena consegnato il primo pacco ma deve raccogliere un altro pacco $$S_{I2} = \langle(6,6), \{P1 / P2\}, \{none\} \rangle$$


- **STATO INTERMEDIO 3**: Il robot si trova sull'uscita e deve raccogliere l'altro pacco (LA TUPLA È UGUALE ALLA PRECEDENTE)

- **STATO INTERMEDIO 4**: Il robot ha raccolto il secondo pacco $$S_{I2} = \langle(x,y), \{P1,P2\}, \{P1/P2\} \rangle$$
- **STATO GOAL**: Il robot si trova sull'uscita e ha raccolto tutti i pacchi $$S_{I2} = \langle(6,6), \{P1,P2\}, \{none\} \rangle$$
	QUESTO STATO CORRISPONDERÀ ANCHE ALLO STATO DI TERMINAZIONE


## MODELLO DI TRANSIZIONE
In questo contesto abbiamo due tipologie di azioni
1) MOVIMENTO
	- $a = move\{(x,y), (x^{'}, y^{'}) \ \ | \ \ (x^{'}, y^{'}) \in conf((x,y))\}$
		- dove `conf((x,y))` sono tutte le celle adiacenti alla cella `(x,y)`
	
		Il risultato di tale azione, applicata a uno stato `s`, è un nuovo stato `s'` con la posizione dell'agente spostata$$Result(s,a) = s^{'}$$e questo vale se e solo se la cella di destinazione non è un ostacolo.
		I movimenti quindi possono essere `in alto`, `in basso`, `sinistra` e `destra` nelle celle adiacenti.

2) PRESA
	- $a = prendi(pacco)$
	In questo caso il risultato è un nuovo stato `s'` in cui 
	- la posizione del robot rimane invariata
	- il pacco viene aggiungo all'insieme dei pacchi raccolti
	- il pacco viene aggiungo alla variabile `pacco in mano`


La funzione costo `c(s, a, s')` rappresenta il valore numerico corrispondente al costo di quell'azione `a` applicata allo stato `s`.
I costi in questo contesto sono
- `c(s, a, s') = 1` se `a` è un'azione di movimento
- `c(s, a, s') = 0` se `a` è un'azione di presa

Il costo totale è quindi la somma di tutti i costi delle transizioni.


## ALGORITMO DI RICERCA
L'algoritmo di ricerca scelto in questo contesto è `A*`, in quanto riesce a trovare la soluzione migliore in maniera efficiente. 

#### ASTRAZIONE DELL'AMBIENTE PER A*
Prima di descrivere nel dettaglio `A*`, ai fini della pianificazione, l'ambiente descritto precedentemente come una griglia viene ora astratto in un grafo di ricerca.
Ogni nodo del grafo rappresenta una cella della griglia e ha una struttura di questo tipo $$Nodo = \langle stato, padre, azione, g, f \rangle$$dove
- stato = stato dello spazio di ricerca
- padre = nodo che ha generato il nodo corrente
- azione = azione che ha portato alla generazione del nodo corrente
- `g` = costo del cammino dal nodo `start` al nodo corrente
- `f` funzione di valutazione di `A*` applicata al nodo corrente (la funzione è `f = g + h`)

L'algoritmo `A*`, se l'euristica `h` scelta è ammissibile e monotona, risulta essere
- COMPLETO -> in quanto trova sempre la soluzione se questa esiste e se vale che $$g(n) \ge d(n) \cdot \epsilon$$dove 
	- `g(n)` descritto in precedenza
	- `d(n)` profondità del nodo `n`
	- $\epsilon > 0$ è il costo degli archi associati a `n`

- OTTIMALE -> in quanto espande sempre prima i nodi più promettenti (quelli con la `f(n)` più piccola) e quindi troverà sempre il cammino di costo minore

#### Funzione di valutazione
Come descritto in precedenza la funzione di valutazione è $$f(n) = g(n)+h(n)$$dove `h(n)` è l'euristica, ossia la stima del costo del cammino dal nodo `n` al nodo `goal`

#### EURISTICA
L'euristica `h` scelta è la Manhattan Distance, calcolata come segue $$h_{man} = |nodo.x \ - \ goal.x| + |nodo.y \ - \ goal.y|$$
Tale euristica risulta essere:
- AMMISSIBILE -> in quanto non sovrastima mai il costo reale `h*` ($h(n) \le h^{*}(n)$)
- MONOTONA -> in quanto non decresce mai $$h(n) \le c(n, n^{'}) + h(n^{'})$$dove
	- `c(n, n')` è il costo della transizione dal nodo `n` al nodo `n'`
	- `h(n')` è la stima calcolata su `n'`


## FUNZIONE AMBIENTE
```java
function RUN-ENV(UPDATE-fn, stato, agente, PERFORMANCE-fn) returns score
	
	local variable score
	
	loop do
		percezione <- GET-PERCEPTION(stato, agente)
		azione <- ROBOT-PROG(percezione)
		stato <- UPDATE-fn(stato, azione)
		score <- PERFORMANCE-fn(stato, score)
	until TERMINATION(state) 
	
	return score
```


## FUNZIONE AGENTE
```java
function ROBOT-PROG(percezione) returns AZIONE
	persistent stato
			   goals  // insieme contenente i vari obiettivi
			   problema
			   piano
	
	// verifico se l'agente si trova in   
	if (percezione.P_robot == percezione.P_pacco1)
```