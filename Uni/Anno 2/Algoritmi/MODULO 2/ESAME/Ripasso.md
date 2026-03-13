# Interval Scheduling
Dati in input
- un insieme di `n` intervalli $l_{1},...,l_{n}$
	- l'intervallo $l_{i}$ ha un **inizio** $s_{i}$ e una **fine** $f_{i}$
Trovare
- un sottoinsieme con cardinalità massima di intervalli **mutualmente compatibili**, ossia un sottoinsieme in cui presi due intervalli $l_{i}, l_{j} \in S$, abbiamo che $l_{i}$ non si sovrappone con $l_{j}$

##### SOLUZIONE **GREEDY** MIGLIORE: ***Earliest FINISH time***
Ordiniamo i **jobs** in ordine crescente di fine $f_{j}$ e, una volta preso il primo job (CHE POST ORDINAMENTO VA PRESO PEFFORZA), inseriamo nell'insieme i job che sono compatibili con quelli già presi.
##### PSEUDOCODICE
![[Pasted image 20250811154231.png]]

###### ESEMPIO (già concluso)
![[Pasted image 20250811154214.png]]
##### Correttezza
Siano $i_{1}, i_{2},...,i_{k}$ i job selezionati dal greedy
Siano $j_{1}, j_{2},...,j_{m}$ i job selezionati dall'ottimo

E chiamiamo $f(i_{r})$ il tempo di fine del job $i_{r}$

>[!lemma] LEMMA: Per ogni $r=1,2,...,k$, abbiamo che $$f(i_{r}) \le f(j_{r})$$
>Ossia, hanno lo stesso numero di job presi
>
>*FAI DIMOSTRAZIONE*
>![[Pasted image 20250812133550.png]]


>[!lemma] TEOREMA: l'**earliest-finish-time-first** è ottimo.
>*FAI DIMOSTRAZIONE* (pag 2 file simone)
>![[Pasted image 20250812133541.png]]


---

# Interval Partitioning
Date in input
- un insieme di `n` intervalli (lezioni) $l_{1},...,l_{n}$
	- l'intervallo $l_{i}$ ha un **inizio** $s_{i}$ e una **fine** $f_{i}$
Trovare
 - il minimo numero di classi necessarie per schedulare tutte le lezioni (e non devono esserci contemporaneamente due lezioni in una classe)

ESEMPIO
![[Pasted image 20250812132130.png]]
Posso usare **3 classi**
![[Pasted image 20250812132153.png]]

##### SOLUZIONE **GREEDY** MIGLIORE: ***Earliest START time***
Consideriamo le lezioni in ordine **crescente** di $s_{j}$, e
- assegniamo ogni lezione a una classe disponibile
- se nessuna classe può contenere quella lezione, apriamo una nuova classe.
##### PSEUDOCODICE
![[Pasted image 20250812133102.png]]
##### ESEMPIO
Ordiniamo le classi per tempo di inizio
![[Pasted image 20250812133304.png]]
Una volta fatti tutti i confronti avremo una cosa del genere
![[Pasted image 20250812133330.png]]

>[!lemma] PROPOSITION: L'**earliest-start-time-first** può essere implementato in tempo $O(n \cdot log(n))$
>*FAI DIMOSTRAZIONE* (pag 3 simone)
>![[Pasted image 20250812133520.png]]


***DEFINIZIONE***: Profondità
>La profondità di un insieme di intervalli è il **numero massimo di intervalli che si sovrappongono in un qualsiasi istante di tempo**.


*OSSERVAZIONE CHIAVE*: il numero di classi richieste $\ge$ alla profondità
![[Pasted image 20250812134147.png]]

>[!lemma] TEOREMA: L'earliest-start-time-first riesce a usare un **numero di classi esattamente pari alla profondità**, quindi è **ottimo**
>*FAI DIMOSTRAZIONE* (pag 4 simone)
>![[Pasted image 20250812134418.png]]


---

# Il problema Union-Find
Abbiamo una collezione di **insiemi disgiunti** (cioè non si sovrappongono, ogni elemento è in un solo insieme) che contengono elementi distinti — ad esempio gli interi da 1 a $n$.  
Dobbiamo poter eseguire 3 tipi di operazioni:
1. **`makeSet(x)`**  
    Crea un nuovo insieme che contiene solo l’elemento $x$.  
	    Esempio: `makeSet(5)` crea `{5}`.
    
2. **`union(A, B)`**  
    Unisce i due insiemi $A$ e $B$ in **un unico insieme**.
    - Il nuovo insieme prende il “nome” di $A$.
        
    - Gli insiemi originali $A$ e $B$ “spariscono” come entità separate.
    
3. **`find(x)`**  
    Restituisce il “nome” dell’insieme che contiene l’elemento $x$.
    - si suppone di accedere direttamente all’elemento x

ESEMPIO
![[Pasted image 20250812135421.png]]


>[!tip] OBIETTIVO: progettare una struttura dati (la Union-Find) che sia efficiente su una sequenza arbitraria di operazioni.
>
>L'idea è quella di rappresentare gli **insiemi con una foresta di alberi**
>- Ogni insieme è un **albero radicato**
>- La radice contiene il nome dell'insieme (ossia dell'elemento rappresentativo)

![[Pasted image 20250812135732.png]]


## QuickFind
L'idea è quella di usare una foresta di alberi **di altezza 1** per rappresentare gli insiemi disgiunti.
In ogni albero
- RADICE = nome dell'insieme
- FOGLIE = elementi (**incluso** l'elemento rappresentativo)

ESEMPIO
![[Pasted image 20250812135904.png]]


### Esempio con tutte le operazioni
![[QuickFind.gif]]

## Costo delle operazioni
![[Pasted image 20250812141806.png]]


>[!question]- Cosa succede se eseguo una sequenza arbitraria di operazioni?
>`Find` e `MakeSet` entrambe richiedono comunque tempo $O(1)$ ma ci sono sequenze particolari di `Union` che possono richiedere tempo **quadratico**
>
>Ad Esempio
>![[Pasted image 20250812141933.png]]
>Qui il numero totale di cambi di puntatori è dato dalla somma $$1+2+3+...+(n-1)$$
>E ricordiamo che la somma dei primi `k` numero naturali è dato dalla formula
>![[Pasted image 20250812142036.png|center]]

#### Miglioria alla QuickFind: EURISTICA *UNION BY SIZE*
L'idea è fare in modo che un nodo/elemento non cambi troppo spesso padre
- per farlo, quando devo unire $(A,B)$, se $A < B$ per numero di nodi, **sposto tutti i nodi di $A$** e poi **cambio il nome alla radice di $B$**
	- in una situazione normale avrei spostato i nodi di $B$
![[Pasted image 20250812142715.png]]

ESEMPIO
Riprendendo la GIF di prima, facciamo una modifica a $union(4,2)$
![[QuickFIndUnionBySIze.gif]]

##### Costo operazioni con Union By Size
![[Pasted image 20250812143216.png]]

#### Complessità di una Union
![[Pasted image 20250812143258.png]]

>[!tip]- SPIEGAZIONE DELLA DOMANDA CRUCIALE
>![[Pasted image 20250812143328.png]]
>*FAI DIMOSTRAZIONE*
>![[Pasted image 20250812143355.png]]
>![[Pasted image 20250812143404.png]]

## QuickUnion
L'idea è quella di usare una foresta di alberi **di altezza ANCHE MAGGIORE DI 1** per rappresentare gli insiemi disgiunti.
In ogni albero
- RADICE = elemento rappresentativo dell'insieme
- RIMANENTI NODI = altri elementi (**escluso** l'elemento rappresentativo)

IMPLMENTAZIONE DELLE OPERAZIONI
![[Pasted image 20250812143610.png]]

ESEMPIO DELLE OPERAZIONI![[QuickUnion.gif]]
#### Complessità operazioni
![[Pasted image 20250812144259.png]]

>[!question] Cosa succede se eseguo una sequenza arbitraria di operazioni?
>Alcune `Union` possono portare a alberi di altezza `n`, rendendo così molto inefficienti le `Find` ($n-1$ nel caso peggiore)
>![[Pasted image 20250812144414.png]]

#### Miglioria alla QuickUnion: EURISTICA *UNION BY SIZE*
L'idea è far sì che l'albero corrispondente a una `Union` abbia altezza piccola.
- per farlo, rendiamo ogni volta la radice dell'albero **con meno nodi** figlia della radice dell'albero **con più nodi**

>[!tip]- PUNTO FONDAMENTALE: in questo contesto, non possiamo cambiare la radice (perché nella radice ora non abbiamo un "nome" ma proprio un elemento).
>Quindi, se dobbiamo fare $union(A,B)$ ma $A < B$ per numero di nodi (e quindi $A$ diventa la figlia di $B$), quello che facciamo è assegnare alla radice **un nuovo campo** chiamato "**radice**" in cui andiamo ad inserire la **radice effettiva dell'albero risultante**
>![[Pasted image 20250812145115.png]]

ESEMPIO
![[FFHFHFHFHF.gif]]
>[!lemma]- Dimostrazione 
>![[Pasted image 20250812151830.png]]
>![[Pasted image 20250812151836.png]]

#### Ulteriore euristica: Compressione dei cammini
Quando eseguo la `find` e attraverso il cammino da `x` alla radice, **comprimo il cammino**, ovvero rendo tutti i nodi del cammino figli della radice

>[!lemma] TEOREMA: usando in `QuickUnion` entrambe le euristiche, una qualsiasi sequenza di **n makeset, n-1 union, m find** hanno costo di $$O(n + m \cdot \alpha(n+m \cdot n))$$


---

# Minimum Spanning Tree
Dato un Grafo $G=(V,E,w)$ ***NON ORIENTATO E PESATO***, un MST è un sottoinsieme di archi $T \subseteq E$ tale che $T$ è uno **spanning tree** (albero che tocca tutti i vertici) la cui somma degli archi è **minimizzata**

>[!tip] DETTO IN ALTRE PAROLE: voglio trovare un sottografo (o albero) che abbia **TUTTI I NODI DI G e dove la somma degli archi presi per collegare tutti i nodi è minima**

>[!lemma] TEOREMA DI CAYLEY: Esistono $n^{n-2}$ spanning tree di un grafo.

PROPRIETÀ IMPORTANTE: se $G$ ha **pesi distinti** allora il suo **MST** è unico
>Caso in cui NON è unico![[Pasted image 20250812152910.png]]


### Cicli, cuts e cutset
- **CICLO**: insieme di archi della forma $a-b, b-c, c-d,...,y-z,z-a$
	![[Pasted image 20250812153242.png]]
- **CUT**: un sottoinsieme di nodi $S$ (guarda i nodi neri nella foto sotto)
- **CUTSET**: deriva direttamente da un **cut `S`** ed è il sottoinsieme di archi che hanno esattamente un estremo in `S` (**un nodo in `S`** e **un nodo NON in `S`**) (guarda archi blu)
	![[Pasted image 20250812153458.png]]

>[!lemma] L'intersezione tra Ciclo e Cutset ha **cardinalità pari**
>![[Pasted image 20250812153546.png]]

#### Due proprietà importanti
###### PROPRIETÀ DEL CUT
>[!lemma] Sia `S` un sottoinsieme di nodi e sia `e` un arco di costo minimo collegato con ESATTAMENTE un nodo in `S` -> allora esiste un **MST che contiene `e`**
>![[Obsidian_O7TSw4aGHe.png|center]]
>*FAI DIMOSTRAZIONE*
>![[Pasted image 20250812153940.png]]


###### PROPRIETÀ DEL CICLO
>[!lemma] Sia `C` un ciclo e sia `f` un arco di costo massimo appartenente a `C` -> allora esiste un **MST che NON contiene `f`**.
>Se ho un ciclo, allora vuol dire che uno di quegli archi non lo prendo (sarebbe inutile, tanto ho già collegato tutti i nodi) -> allora sicuramente non prendo quello di costo maggiore (in almeno un MST)
>![[Pasted image 20250812154058.png|center]] 
>*FAI DIMOSTRAZIONE*
>![[Pasted image 20250812154212.png]]


## Algoritmo di Kruskal
L'idea è 
- partire con $T=\varnothing$
- considerare gli archi in ordine **crescente di costo**
- inserire un arco `e` in $T$ ***SOLO SE NON CREO UN CICLO***

>[!tip] Un'implementazione efficiente di Kruskal usa la *Union-Find*

###### Pseudocodice
![[Pasted image 20250812154615.png]]

ESEMPIO
![[Kruskal.gif]]

#### Correttezza di Kruskal
1. **Quando Kruskal aggiunge un arco (x, y)**
	- Kruskal ordina gli archi per peso crescente.
	- Consideriamo il momento in cui esamina l’arco `(x, y)`.  
	    Se questo **non forma un ciclo** con quelli già scelti → allora lo aggiunge.
	- Perché è lecito aggiungerlo?  
	    Perché `(x, y)` è l’arco di **peso minimo** che attraversa un certo **taglio** (cut) del grafo (il taglio separa i vertici già connessi da quelli non ancora connessi).
	- Proprietà dei MST: **l’arco più leggero che attraversa un taglio appartiene sempre a un MST** (cut property).  
	
	→ quindi Kruskal non sbaglia mai ad aggiungere quell’arco.

2. **Quando Kruskal scarta un arco (x, y)**
	- Se l’arco `(x, y)` **crea un ciclo** con quelli già inseriti, allora Kruskal lo scarta.
	- Perché è corretto scartarlo?  
	    Nel ciclo che si forma, ci sarà sicuramente un arco con peso ≥ a quello di `(x, y)`.  
	    Visto che Kruskal considera gli archi in ordine crescente, l’arco che stiamo guardando `(x, y)` **non può essere più leggero** degli altri già presi → anzi, è ≥.
	- Proprietà dei MST: **in ogni ciclo, l’arco più pesante non appartiene mai a un MST** (cycle property).  
	
    → quindi è giusto scartarlo.

![[Pasted image 20250812160055.png]]


>[!tip] Altro algoritmo: REVERSE DELETE ALGO
>Si comporta in modo complementare all’algo di kruskal: Parte con $T= G$, considera gli archi in **ordine decrescente di peso**, l’arco `e` viene rimosso <u>solo se rimuovendolo il grafo resta connesso</u>.


## Algoritmo di Prim
Praticamente identico a Dijsktra.
L'idea è
- Partire con un nodo radice `s`, che sarà la radice del nostro **MST** (`T`)
- vedere tutti gli **archi uscenti da `s`**, prendere il più piccolo e aggiungerlo a $T$
- ad ogni step quindi, aggiungiamo a $T$ l'**arco più piccolo che ha ESATTAMENTE un nodo in $T$** (e uno NON in $T$)

>[!tip] La correttezza sta nel fatto che questo algoritmo è una **diretta conseguenza della *cut property***, usata esattamente $n-1$ volte

ESEMPIO VISIVO
![[Prim.gif]]

#### Idea efficiente (simil Dijsktra)
- Mantieni un insieme di **nodi esplorati `S`**
- Usa una **coda con priorità** per mantenere i nodi **NON esplorati**
	- Per ogni nodo `v` non esplorato, la chiave è il costo dell'arco incidente (minimo fino a quel momento) che lo collega ad un nodo presente in `S`
		- questo lo chiamiamo `a[v]`

###### PSEUDOCODICE
![[Pasted image 20250812161521.png]]


---

# CLUSTER
Dato un insieme `U` di `n` elementi etichettati $p_{1},...,p_{n}$ e un intero `k`, vogliamo dividere gli oggetti in `k` **sottoinsiemi non vuoti affinché lo spacing sia massimo**.

##### Proprietà importanti
![[Pasted image 20250828161317.png]]

### Algoritmo Greedy (Kruskal)
![[Pasted image 20250828161753.png]]

---

# Programmazione dinamica (`Pd`)
## `Pd`: Insieme indipendente di peso massimo
Un **insieme indipendente** (II) di un cammino **G** è un sottoinsieme di nodi che NON contiene due nodi adiacenti 
	ossia, per ogni coppia di nodi dell'insieme, i due nodi non possono essere collegati da un arco.

Quindi
Dato in INPUT
- un cammino **G** di `n` nodi, ogni nodo $v_{i}$ ha un **peso** $w_{i}$
Si vuole trovare 
- un insieme indipendente di peso massimo, ovvero un insieme **S** di nodi tale che
	- **S** è un II
	- $w(S) = \sum_{v_{i} \ \in \ S} w_{i}$ è il più grande di tutti 
		- ossia il peso totale deve essere il più grande possibile

ESEMPIO
![[Pasted image 20250813165710.png|center]]

#### Idea della soluzione
Parlando di programmazione dinamica, l'obiettivo è esprimere la soluzione **del problema generale** come combinazione di **soluzioni di (opportuni) sottoproblemi**. 

![[Pasted image 20250813165926.png]]
![[Pasted image 20250813165936.png]]

>[!tip] PROPRIETÀ
>L'II di peso massimo per **G** deve essere o:
>1. l'II di peso massimo per **G'** (caso 1)
>2. $v_{n}$ unito all'II di peso massimo per **G''** (caso 2)

#### IDEA PER LA SOLUZIONE
Procediamo **iterativamente** considerando i prefissi di **G** dai più piccoli verso i più grandi
- il prefisso `j-esimo` di **G** ($G_{j}$) è il sottocammino composto dai primi `j` vertici di **G**
- il **sottoproblema j** consiste nel calcolare il peso del miglior II per $G_{j}$
	- `OPT[J]` è il valore della soluzione del  **sottoproblema j**

Abbiamo diversi casi
- `OPT[1]` = $w_{1}$ 
	- (ho solo un nodo, lo prendo)
- `OPT[2]` = $max\{w_{1}, w_{2}\}$
	- ho due nodi, prendo il massimo tra i due
- `OPT[j]` = $max\{OPT[j-1], \ w_{j} + OPT[j-2]\}$
	- quindi
		- o prendo la soluzione di `OPT[j-1]` (e quindi non prendo il nodo attuale $v_{j}$)
		- oppure prendo il nodo attuale $v_{j}$ e lo sommo alla soluzione di `OPT[j-2]`

ESEMPIO
![[Pasted image 20250813172958.png]]

###### PSEUDOCODICE
![[Pasted image 20250813173042.png]]
>[!tip] OSSERVAZIONE IMPORTANTE: questo algoritmo calcola **IL VALORE DELLA SOLUZIONE OTTIMA** ma **NON RITORNA L'EFFETTIVA SOLUZIONE**.

Per ritornare la soluzione effettiva possiamo usare il vettore `OPT[]` (ovviamente alla fine dell'algoritmo precedente)
![[Pasted image 20250813173229.png]]
###### PSEUDOCODICE
![[Pasted image 20250813173449.png]]
- utilizziamo l'insieme $S^{*}$ per sapere **quali nodi abbiamo effettivamente preso**
- la `riga 3` ha $\ge$ perché se $$OPT[j-1] = w_{j} + OPT[j-2]$$vuol dire che nell'iterazione $v_{j}$ non l'ho preso (e quindi nemmeno il suo peso).
	![[Pasted image 20250813173725.png]]
	qui `8` e il secondo `4` hanno la stessa soluzione, vuol dire che `4` non lo avevo preso in considerazione
 

>[!tip]- SLIDE PER CAPIRE LA PROGRAMMAZIONE DINAMICA
>![[Pasted image 20250813173909.png]]![[Pasted image 20250813173917.png]]![[Pasted image 20250813173927.png]]


---

## `Pd`: Weighted interval scheduling
È identico a quello delle classi ma ora abbiamo anche un **peso** associato ad ognuna.

NON possiamo usare l'algoritmi greedy *earliest-time first*
![[Pasted image 20250814151938.png]]

### Verso la soluzione
***DEFINIZIONE***: `p(j)`
> `p(j)` è l'indice più grande, con $i < j$, tale che il job `i` sia compatibile con il job `j`
 
 ESEMPIO
![[Pasted image 20250814152515.png]]



***DEFINIZIONE***: `OPT(j)`
>È il massimo peso (o profitto) ottenibile da un **sottoinsieme di job mutualmente compatibili**, presi tra il job `1` fino al job `j`

Il nostro obiettivo è `OPT(n)`, ossia il massimo profitto considerando tutti i job.

Abbiamo due casi per `OPT(j)`
1. **`OPT(j)` non include il job `j`**
	- allora la soluzione ottima è `OPT(j-1)`
2. **`OPT(j)` include il job `j`**
	- allora 
		- prendo il profitto $w_{j}$
		- escludo tutti i job non compatibili con `j`
			- per farlo sfrutto `p(j)` calcolato in precedenza, e nello specifico i job che NON posso selezionare sono `{p(j) + 1, p(j) + 2, ..., j-1}`
		- aggiungo la soluzione ottimale per i job **compatibili rimanenti**, ossia `OPT(p(j))`

>[!tip] Nel secondo punto io sfrutto `p(j)` perché se io già so quali job sono compatibili, una volta che seleziono un job vado a controllare la soluzione SOLO per quelli compatibili, ossia proprio `p(j)`

###### PSEUDOCODICE 
![[Pasted image 20250814154741.png]]
1. ordino i job in base al tempo di fine -> mi serve per calcolare **`p(j)`**
2. calcolo i vari **`p(j)`** con la ricerca binaria -> parto dal job `j` e guardo indietro fino a cercare l'ultimo indice che finisce prima (o al massimo in contemporanea) dell'inizio di `j`.
3. costruisco un array in cui inserisco per ogni job il massimo profitto fino a quel job
	- uso l'equazione di bellman
		- **Caso 1:** Non prendo `j` → profitto `M[j-1]`.
		- **Caso 2:** Prendo `j` → profitto = `w_j` + migliore soluzione compatibile = `M[p(j)]`.
	- Qui usiamo **valori già calcolati** (`M[j-1]` e `M[p(j)]`) → per questo è bottom-up.
4. ritorno `M[n]`


###### ALTRA VERSIONE (ricorsiva)
![[Pasted image 20250814160404.png]]

>[!lemma] CLAIM: La versione Top-Down impiega tempo $O(n \cdot log(n))$
>DIMOSTRAZIONE
>![[Pasted image 20250814160803.png]]
>- per $\phi$ qui si intende il numero di celle inizializzate
>	- all'inizio è 0
>	- alla fine è $\le n$
>	- ogni volta che calcoliamo una nuova cella `M[j]` $\phi$ cresce di uno e facciamo AL MASSIMO **due chiamate ricorsive**

Anche in questo caso `M[j]` da come risultato **IL VALORE** della soluzione, non gli effettivi job presi.
Per trovare i job usiamo un'algoritmo chiamato **FIND SOLUTION**
![[Pasted image 20250814161156.png|center]]
- se non ci sono job -> ritorno $\phi$
- se entro nell'`else if` vuol dire che il job `j` l'ho preso -> lo aggiungo e trovo calcolo `FIND-SOLUTION` sul `p(j)`
- se entro nell'`else` vuol dire che `j` non l'ho preso -> calcola `FIND-SOLUTION` per `j-1`

![[Pasted image 20250814161402.png]]

>[!tip]- Vantaggi e Svantaggi di entrambe le versioni
>![[Pasted image 20250814161424.png]]


---

## `Pd`: Longest Increasing Subsequence (LIS)
Data 
- una sequenza di `n` oggetti $i_{1},..., i_{n}$
	- l'oggetto $i_{i}$ ha valore $s_{i}$
Trovare
- una sotto sequenza di cardinalità massima affinché
	- per ogni coppia di oggetti $(i,j)$, con $i < j$, vale che $$S_{i} < S_{j}$$
![[Pasted image 20250814162142.png]]
###### Ragioniamo in modo Programmazione dinamica
- **DEFINIZIONE DEL SOTTOPROBLEMA**
	- `OPT[i]`: la lunghezza della LIS che vanno da `S[1]` fino a `S[i]` e che **deve terminare per forza con `S[i]`**
		- la scritta in rosso è una restrizione utile che molte volte aiuta in esercizi come questo
	
- **CASO BASE**
	- `OPT[1] = 1`
	
- **SOLUZIONE**
	- $max_{i=1,2,...,n} \ OPT[i]$
	
- **ESEMPIO VISIVO**
![[LIS.gif]]
	
- **FORMULA RICORSIVA**
	 ![[Pasted image 20250814163646.png]]
###### PSEUDOCODICE
![[Pasted image 20250814163714.png]]

>[!tip]- ESEMPIO CONCRETO
>![[Obsidian_HjxCRWXbXV.png]]
>![[Pasted image 20250814163910.png]]


---

## `Pd`: Segmented Least Squares
L'idea è
- dati `n` punti in un piano
- voglio trovare una retta $y = ax + b$ che **minimizza la somma degli errori "quadratici"**
	![[Pasted image 20250814171211.png]]
	Il quadrato lo metto per due motivi
	- non voglio avere valori negativi -> magari ho `-4` e `+4` che si annullano, se metto il quadrato ho `+8` in entrambe e va tutto bene
	- voglio accentuare gli errori

Formula standard
![[Pasted image 20250814171240.png]]

Domanda da risolvere
>[!question] Qual è una scelta ragionevole per far sì che $f(x)$ bilanci **accuratezza** (poco errore) e **parsimonia** (poche rette)?
![[Pasted image 20250814171433.png]]
Nel senso, ogni retta ha un costo quindi non posso usarne tante, ma non posso nemmeno usarne una sola e avere un errore enorme.

##### Obiettivo
- Minimizzare $$f(x)= E + c \cdot L$$per qualche costante $c > 0$ e con
	- `E` -> somma di tutti gli errori **per ogni retta tracciata**
	- `L` -> **numero di rette**
	- `c` -> **costo** di ogni retta
	![[Pasted image 20250814171703.png]]

##### Notazioni
- `OPT(j)` -> costo minimo per approssimare i punti $p_{1}, p_{2}, ..., p_{j}$
	- quindi la **soluzione ottima per i primi `j` punti** (con anche più rette)
- $e_{ij}$ -> errore SSE (somma errori quadratici) se approssimi i punti $p_{i},..., p_{j}$ con **una sola retta**

##### COME TROVARE `OPT(j)`
L'idea è: per trovare la soluzione ottima per i primi `j` punti, devi decidere **da dove inizia l'ultimo segmento**
- supponiamo che l'ultimo segmento parta da $p_{i}$ e arrivi a $p_{j}$
	- il costo di questa retta è: $e_{ij} + c$
	- però, dato che questo è l'ultimo segmento, in precedenza ho già calcolato la soluzione ottima per i punti da $p_{1}$ a $p_{i-1}$, ossia $$OPT(i-1)$$
QUINDI$$\text{Costo totale} = e_{ij} + c + OPT(i-1)$$
![[Pasted image 20250814172532.png]]![[Pasted image 20250814172541.png]]

>[!tip]- ESEMPIO GRAFICO PER CAPIRE MEGLIO
>![[Pasted image 20250814172607.png]]

###### PSEUDOCODICE
![[Pasted image 20250814172626.png]]

>[!lemma] TEOREMA: Questo algoritmo risolve il problema del *segmented least squares* in tempo $O(n^{3})$ e spazio $O(n^{2})$
>![[Pasted image 20250814174009.png]]
>
>Possiamo migliorare il tempo a $O(n^{2})$ se **precalcoliamo** le sommatorie (e quindi tutti i cicli for)
>![[Pasted image 20250814174051.png]]
>LE SOMMATORIE SI CHIAMANO "***somme cumulative***"


---

## `Pd`: Knapsack problem
L'obiettivo è
- dato uno zaino con una capienza massima `W`
- dati degli elementi `i` con 
	- un peso $w_{i} > 0$
	- un valore $v_{i} > 0$
Vogliamo **massimizzare il valore totale presente nello zaino non sforando `W`**

ESEMPIO
![[Pasted image 20250814180332.png]]

##### Definizione sottoproblemi: DUE VARIABILI
Per questo problema particolare non possiamo usare solo `OPT(i)`, ma ci servono due variabili
- **DEFINIZIONE**: `OPT(i,w)` -> valore ottimale per risolvere il problema prendendo in considerazione gli elementi $1,...,i$, il tutto soggetto a un peso limite `w` 

DUE CASI
1. **Caso 1 – Non prendo l’oggetto `i`**
	- Può succedere per due motivi:
	    1. **L’oggetto è troppo pesante** → `w_i > w` (non entra nello zaino).
	    2. **Anche se entra**, la soluzione ottimale preferisce non prenderlo.
	
	- In questo caso il miglior valore è lo stesso che avrei avuto **senza considerare l’oggetto `i`**, cioè: $$OPT(i,w)=OPT(i−1,w)$$
    → guardo solo i primi `i-1` oggetti, con la stessa capacità `w`.
    
2. **Caso 2 – Prendo l’oggetto `i`**
	- Se decido di prendere l’oggetto `i`:
	    1. **Aggiungo il suo valore**: $v_{i}$
	    2. **Ridimensiono la capacità rimanente**: nuovo limite peso = $w - w_{i}$.
	    3. Il resto dello zaino posso riempirlo con il **miglior valore** ottenibile usando solo i primi `i-1` oggetti con capacità `w - w_i`.
	Quindi: $$OPT(i, w) = v_i + OPT(i-1, w - w_i)$$

![[Pasted image 20250814180837.png]]

###### PSEUDOCODICE
![[Pasted image 20250814180911.png]]

###### ESEMPIO VISIVO
![[Pasted image 20250814180951.png]]
Le cose importanti da ricordare sono
- se entro nell'`if` -> ricopio il valore presente sopra la cella che sto scrivendo (`i-1, w`)
- se entro nell'`else`
	-  o copio il valore presente sopra la cella che sto scrivendo (`i-1, w`)
	- oppure salgo sempre alla riga precedente (`i-1`), e cerco la colonna con un peso che posso effettivamente prendere (`w - w_i`).


>[!question] Sempre la solita domanda, come posso trovare la soluzione effettiva se con questo algoritmo trovo SOLO il valore finale?
>- Parto dall'ultimo valore a sinistra
>- Ogni volta controllo il **valore che si trova sopra la cella in esame**
>	- se sono **uguali**, salgo **verticalmente**
>	- se sono **diversi**
>		- guardo l'**ultimo elemento presente nell'insieme**
>		- cerco il **suo peso**
>		- calcolo $w - w_{i}$
>		- **salgo di una riga e cerco nella colonna** $w - w_{i}$

![[Pasted image 20250814181728.png]]

>[!tip]- L'algoritmo che risolve il Knapsack problem È PSEUDOPOLINOMIALE
>![[Pasted image 20250814181943.png]]![[Pasted image 20250814181953.png]]


---

## `Pd`: Edit distance
**Edit distance** tra due stringhe `x` e `y` è **il numero minimo di operazioni elementari** necessarie per trasformare `x` in `y`.
	![[Pasted image 20250818161821.png]]

EDIT DISTANCE: tra due parole, devi pagare
- il costo di un **gap** $\delta$
- il costo di un **penalty** $\alpha_{pq}$
	![[Pasted image 20250818161949.png]]

### Sequence alignment
**OBIETTIVO**: date due stringe $x_{1}, x_{2}, ..., x_{m}$ e $y_{1}, y_{2}, ..., y_{n}$, trovare un **allineamento di costo minimo**

***DEFINIZIONE***: Allineamento
>Un insieme di coppie ordinate tra caratteri di due stringhe, con due regole
>	- ogni carattere può stare **in una sola coppia**
>	- **non ci devono essere incroci**, nel senso che se allineo $x_{3}$ con $y_{5}$, poi non posso allineare $x_{6}$ con $y_{4}$

***DEFINIZIONE***: costo di un allineamento
>![[Pasted image 20250819105427.png]]


***DEFINIZIONE SOTTOPROBLEMI***:  `OPT(i,j)` = costo minimo per allineare i primi `i` caratteri della parola `x` e i primi `j` caratteri della parola `y`
>IL NOSTRO OBIETTIVO È `OPT(m,n)`

Abbiamo tre casi principali
1. `OPT(i,j)` **accoppia** (anche forzatamente) $x_{i} - y_{j}$
	**Pago l'eventuale mismatch** per $x_{i} - y_{i}$ + il **costo minimo** per allineare $x_{1}, ..., x_{i-1}$ e $y_{1}, ..., y_{j-1}$ (quest'ultima cosa la calcolo ricorsivamente)
	
2. `OPT(i,j)` **lascia** $x_{i}$ **non matchato**
	Pago il gap per $x_{i}$ + il costo minimo per allineare $x_{1}, ..., x_{i-1}$ e $y_{1}, ..., y_{j}$ 
	
3. `OPT(i,j)` **lascia** $y_{j}$ **non matchato**
	Pago il gap per $y_{j}$ + il costo minimo per allineare $x_{1}, ..., x_{i}$ e $y_{1}, ..., y_{j-1}$ 

![[Pasted image 20250820122536.png]]

###### PSEUDOCODICE
![[Pasted image 20250820122611.png]]

ESEMPIO VISIVO
![[Pasted image 20250820122638.png]]
>[!tip]- Funzionamento
>- La prima riga e la prima colonna le riempio all'inizio
>- Poi, ogni cella della matrice la riempio scegliendo la migliore opzione tra
>	- **Valore presente in diagonale (accoppiamento) + il costo dell'eventuale mismatch** (in questo caso 1)
>	- **Valore sopra (gap su x) + costo del gap** (in questo caso 2)
>	- **Valore a sinistra (gap su y) + costo del gap** (in questo caso 2)
>- Una volta finito, devo partire da `OPT(m,n)` e risalgo al contrario cercando di capire quale scelta ho fatto
>	- per esempio, guarda il mismatch `(t-a)`, lì avevo due strade possibili

![[Pasted image 20250820123139.png]]

###### SOLUZIONE MIGLIORE
![[Pasted image 20250820123331.png]]
**IDEA**: dato che una data colonna la riempio basandomi SOLO sui valori presenti sulla colonna precedente, **posso tenere salvate in memoria solo queste due senza usare un'intera matrice**.
	![[Pasted image 20250820123502.png|350]]![[Pasted image 20250820123714.png|300]]

##### Grafo dell'edit distance
###### PARTE 1
`f(i,j)` è la lunghezza del percorso più piccolo tra `(0,0)` a `(i,j)`.
>[!lemma] LEMMA: `f(i,j) = OPT(i,j)` per tutti gli `i` e `j`
![[Pasted image 20250820152117.png]]

La cosa molto interessante è che posso calcolare $f(\cdot, j)$ per tutte le `j` in
- TEMPO = $O(mn)$
- SPAZIO = $O(m+n)$ -> salvando una sola colonna `j` per volta
![[Pasted image 20250820152603.png]]

###### PARTE 2
- `g(i,j)` è la lunghezza del percorso più corto da `(i,j)` a `(m,n)`
	![[Pasted image 20250820152720.png]]

>[!question] Come calcolare `g(i,j)`?
>- Selezioni `(m,n)` come inizio 
>- Inverti gli archi
>- Calcoli il percorso migliore che arriva a `(i,j)`
>![[Pasted image 20250820152857.png]]![[Pasted image 20250820152902.png]]

###### PARTE 3
Ragiona su una cosa
- la colonna (vettore) risultante da `f` È DIVERSA da quella risultante da `g`.

Ora, possiamo prendere questi due vettori e sommarli, perché il cammino più corto che usa `(i,j)` è dato da $$f(i,j) + g(i,j)$$![[Pasted image 20250820153256.png]]

Ora, per risolvere il problema più generale, possiamo prendere la **colonna che si trova a metà di questa matrice**, `n/2`, e possiamo selezionare la riga `q` che **minimizza** $f\left(q, \frac n 2\right) + g(q, \frac n 2)$, ossia la **riga con il valore minore**.
>[!lemma] ALLORA esiste un percorso ottimo (corto) da `(0,0)` a `(m,n)` che usa proprio il punto `(q, n\2)`
>![[Pasted image 20250820154128.png]]

#### SOLUZIONE FINALE
Allora possiamo usare la tecnica del **divide et impera**
- **DIVIDE**: troviamo ricorsivamente l'indice `q` e ci salviamo il nodo `i-j` come parte della soluzione
- **IMPERA**: calcoliamo ricorsivamente la soluzione ottimale 
![[Pasted image 20250820154420.png]]
- per calcolare $OPT[m,n]$ ci basta utilizzare due colonne per volta
- l'algoritmo inizia scegliendo la metà della stringa $Y$
- calcola in forward con $f(*,j)$ e poi in backward invertendo gli archi calcola $g(*,j)$ 
- con $j=|Y|/2$ parte intera inferiore
-  Scegli $q = \arg\min_i (f(i,n/2)+g(i,n/2))$ 
    - Quel punto è la **cella di taglio**: il cammino ottimo passa da lì.
- poi da lì ricorsivamente andiamo a calcolare la prima metà e la seconda metà 
    - $x_1,...x_q$ e $y_1,....,y_j$ 
    -  $x_{q+1},...x_m$ e $y_{j+1},....,y_n$

![[Pasted image 20250820154445.png]]
![[Pasted image 20250820154517.png]]


---

## `Pd`: Shortest paths con pesi negativi
***DEFINIZIONE***: dato un grafo $G = (V,E)$, con pesi sugli archi arbitrari, trova il percorso più breve da un nodo `s` a un nodo `t`.
![[Pasted image 20250820154917.png]]

***DEFINIZIONE***: ciclo negativo
>Un ciclo negativo è un **ciclo diretto dove la somma totale degli archi è negativa**.

>[!definizione]- FOTO
>![[Pasted image 20250820155104.png]] 



>[!lemma] Lemma 1
>Se un percorso `v↝t` contiene un ciclo negativo, allora NON esiste uno shortest path per `v↝t`
>
>Dimostrazione:
>![[Pasted image 20250820155219.png]]

>[!lemma] Lemma 2
>Se `G` NON ha cicli negativi, allora **esiste uno shortest path** `v↝t` che è **semplice** (e ha $\le n-1$ archi)
>![[Pasted image 20250820164045.png]]

##### Due problemi
![[Pasted image 20250820164415.png]]

***DEFINIZIONE***: `OPT(i,v)` = lunghezza di uno shortest path `v↝t` che usa $\le i$ archi

**OBIETTIVO**: `OPT(n-1,v)` per ogni `v`  (`n-1` deriva dal *lemma 2*)
1. CASO 1: cammino minimo `v↝t` usa ≤ `i-1` archi 
	- `OPT(i, v) = OPT(i-1, v)`
	
2. CASO 2: cammino minimo `v↝t` usa esattamente `i` archi
	- se `(v, w)` è il primo arco nel cammino minimo `v↝t`, allora comporta un costo $l_{vw}$
	- seleziona poi il miglior cammino `w↝t` che usa $\le$ `i-1` archi

![[Pasted image 20250827102337.png]]

###### PSEUDOCODICE
![[Pasted image 20250820164704.png]]


>[!lemma] ![[Pasted image 20250820164833.png]]

###### Ottimizzazione dello spazio
Utilizzo due array unidimensionali
- `d[v]` -> dove indico la lunghezza del cammino `v↝t` più breve trovato finora
- `successor[v]` -> dove indico il nodo successivo nel percorso `v↝t`

>[!tip] NB: in dijsktra `d[v]` era la stima

###### Ottimizzazione delle performance
- se durante l'iterazione `i-1` `d[w]` non è cambiato, non serve ricontrollarlo durante l'iterazione `i`
	![[Pasted image 20250820165651.png]]

###### PSEUDOCODICE
![[Pasted image 20250820165714.png]]

>[!tip]- ESEMPIO VISIVO
>![[Pasted image 20250820165747.png]]


>[!lemma] ![[Pasted image 20250820165833.png]]

>[!lemma] ![[Pasted image 20250820170000.png]]![[Pasted image 20250830130516.png]]


>[!lemma] ![[Pasted image 20250820170036.png]]


**CLAIM**: nel corso dell'algoritmo, se seguissimo i vari puntatori in `successor[v]` riusciremmo a trovare il percorso più corto `v↝t` di lunghezza `d[v]`.
>[!attention]- IL CLAIM È FALSO
>![[Pasted image 20250821114655.png]]![[Pasted image 20250821114720.png]]


>[!lemma]- ![[Pasted image 20250821114906.png]]
>![[Pasted image 20250821114915.png]]

>[!tip]- Spiegazione chatgpt
>![[Pasted image 20250821115003.png|center|400]]


>[!lemma]- ![[Pasted image 20250821115111.png]]
>![[Pasted image 20250821115125.png]]

###### PSEUDOCODICE
Viene aggiunto alla fine un controllo sui cicli negativi
![[Pasted image 20250827103513.png]]

>[!lemma]- ![[Pasted image 20250821115243.png]]
>![[Pasted image 20250821115251.png]]


---

# Flow Network
Una **rete di flusso** è un grafo diretto e pesato $$G = (V, E, s, t, c)$$
- con una **sorgente `s`** $\in V$ e un **pozzo `t`** $\in V$
- **capacità** $c(e) \ge 0$ per ogni $e \in E$ 
![[Pasted image 20250821120752.png]]

***DEFINIZIONE***: `st-cut (cut)` 
>è una partizione `(A,B)` di nodi con $s \in A$ e $t \in B$

***DEFINIZIONE***: `capacità` di un `st-cut`
>è la somma delle capacità degli archi che partono da `A` e arrivano in `B` (SOLO QUELLI, non quelli nel mezzo) ![[Pasted image 20250821121149.png|center]]

![[Pasted image 20250821121209.png|300]]![[Pasted image 20250821121219.png|400]]
![[Pasted image 20250821121307.png]]


### Min-Cut problem 
**OBIETTIVO**: Trovare un `taglio` di **capacità minima**.

***DEFINIZIONE:*** ![[Pasted image 20250821121959.png]]
>[!definizione]- FOTO
>![[Pasted image 20250821122018.png]]

***DEFINIZIONE:*** ![[Pasted image 20250821122122.png]]
>[!definizione]- FOTO
>![[Pasted image 20250821122131.png]]

### Max-flow problem
**OBIETTIVO**: trovare un flusso con valore massimo
	Nel senso, vogliamo trovare un valore che, partendo da `s` possa riuscire ad arrivare INTATTO fino a `t` (e che ovviamente sia il più grande possibile).

>[!tip]- Esempio
>![[Pasted image 20250821122558.png]]
>Qui se vedi
>- da `s` può uscire 30
>- verso `t` può entrare 30
>- MA nel mezzo non c'è modo per far sì che 30 arrivi intatto da `s` a `t`


### Residual Network
###### Qualche definizione
- **ARCO ORIGINALE** -> $e = (u,v) \in E$, con
	- **flow** $f(e)$ -> quanto sta passando ora
	- **capacità** $c(e)$ -> quanto può passare al massimo
	![[Pasted image 20250821134040.png]]
	
- **ARCO INVERSO** -> $e^{\text{reverse}} = (v,u)$
	- è un arco virtuale che rappresenta la possibilità di **togliere flusso già inviato**
	![[Pasted image 20250821134049.png]]
	
- **CAPACITÀ RESIDUA** -> dice quanto flusso in più posso ancora mandare sull'arco
	![[Pasted image 20250821134133.png]]
	
- **RESIDUAL NETWORK** -> $G_{f} = (V, E_{f}, s, t, c_{f})$
	 ![[Pasted image 20250821134321.png]]
	- gli archi possono essere 
		- in **avanti** $e: f(e) < c(e)$ 
		- all'**indietro** $e: f(e^{reverse}) > 0$ 

>[!lemma] ![[Pasted image 20250821141945.png]]
>Nel senso che io in $G_{f}$ posso mandare del flusso solo se in $G$ posso mandare $f + f^{'}$

###### ESEMPIO
![[Pasted image 20250821142032.png]]

***DEFINIZIONE***: Cammino aumentante
> è un cammino semplice `v↝t` presente nella rete residua $G_{f}$ (in sostanza è un cammino dove ho ancora capacità residua)

***DEFINIZIONE***:  bottleneck capacity di un cammino aumentante `P` 
> è la **capacità residua più piccola tra tutti gli archi in `P`**


>[!tip] ![[Pasted image 20250821150639.png]]
>![[Pasted image 20250821150645.png|center|400]]
>Nel senso che, se ho un cammino aumentante e voglio mandare altro flusso, il flusso risultante `f'` sarà dato dal flusso originale `f` + l'arco con la capacità residua più piccola.

###### PSEUDOCODICE
![[Pasted image 20250821150819.png]]

ESEMPIO
![[Pasted image 20250821151159.png]]


>[!question]- Come scegliere il successivo cammino aumentante in Ford-Fulkerson?
>Scegli quello che usa meno archi (il più corto) -> usa la BFS.
>Scegliendo i più corti saturi velocemente gli archi "colli di bottiglia"
>![[Pasted image 20250822160657.png]]


>[!lemma] Lemma del valore del flusso
>Sia f un flusso qualsiasi e sia (A,B) un taglio qulsiasi. Allora, il valore del flusso f è uguale al flusso netto attraversante il taglio (A,B).
>
>Dimostrazione
>![[Pasted image 20250821152758.png]]![[Pasted image 20250830161111.png]]![[Pasted image 20250830161128.png]]

>[!tip]- Tre esempi
>![[Pasted image 20250821152540.png]]![[Pasted image 20250821152559.png]]![[Pasted image 20250821152550.png]]
\

>[!lemma] ![[Pasted image 20250821152911.png]]

>[!lemma]- ![[Pasted image 20250821153044.png]]
>![[Pasted image 20250821153055.png]]
>![[Pasted image 20250830163114.png]]
>![[Pasted image 20250821153100.png]]
>

>[!lemma] ![[Pasted image 20250821153116.png]]![[Pasted image 20250822152551.png]]

>[!tip]- Dimostrazione 
>![[Pasted image 20250822152829.png]]![[Pasted image 20250822152910.png]]![[Pasted image 20250822153022.png]]![[Pasted image 20250822153034.png]]![[Pasted image 20250822153050.png]]

  
>[!lemma]- ![[Pasted image 20250822153209.png]]
>![[Pasted image 20250906104049.png]]

>[!ldanger] ![[Pasted image 20250827162425.png]]


>[!danger] L'algoritmo di **Ford-Fulkerson è PSEUDO-POLINOMIALE** rispetto all'input
>Se la capacità massima è `C`, allora impiega $\ge C$ iterazioni
>
> Posso renderlo Polinomiale forzando la dimensione massima di `C`, imponendo magari che `C` può essere al massimo $n^{3}$

>[!danger]- ALTRA COSA FONDAMENTALE: il numero di cammini aumentanti può essere **ESPONENZIALE** rispetto all'input.
>![[Pasted image 20250822153859.png|center]]

L'obiettivo principale è **scegliere dei cammini aumentanti** tali che
- possano essere **trovati in modo efficiente** (quindi in $O(m)$)
- vengano eseguite **poche iterazioni** (e quindi pochi aumenti)

Per farlo possiamo sceglierli con
- una **bottleneck capacity molto grande** -> così ogni aumento contribuisce MOLTO al flusso totale
- pochi archi -> riduci la probabilità di dover "tornare indietro"

###### Verso l'algoritmo
Partendo dai due punti precedenti, l'idea è questa
- Usiamo un **parametro** $\Delta$ -> è un valore grande
- Costruisco un **sottografo** $G_{f}(\Delta)$ contenente SOLO gli archi che hanno capacità $\ge \Delta$ 
- In questo modo ogni cammino aumentante nel nuovo grafo ha una **bottleneck capacity** $\ge \Delta$
	![[Pasted image 20250822154538.png]]

###### PSEUDOCODICE
![[Pasted image 20250822154600.png]]

>[!tip]- COSTO
>![[Pasted image 20250822160429.png]]![[Pasted image 20250822160455.png]]![[Pasted image 20250822160503.png]]![[Pasted image 20250822160508.png]]


>[!lemma]- ![[Pasted image 20250822170657.png]]![[Pasted image 20250822170702.png]]
>![[Pasted image 20250822170717.png]]


---

# Algoritmi di approssimazione
***DEFINZIONE*** 
> Un $\alpha-$approximation algorithm per un problema di ottimizzazione è un **algoritmo polinomiale** che per tutte le instanze del problema produce una soluzione il cui valore è compreso entro un fattore $\alpha$ rispetto al valore di una soluzione ottima.

#### Problema di minimizzazione
- $\alpha \ge 1$
- Per ogni soluzione restituita `x`, il costo `cost(x)` deve essere $$cost(x) \le a \cdot OPT(x)$$
	- ossia l'algoritmo garantisce un **costo (soluzione) non troppo più alto dell'ottimo**

#### Problema di massimizzazione
- $\alpha \le 1$
- Per ogni soluzione restituita `x`, il valore `value(x)` deve essere $$value(x) \ge \alpha \cdot OPT(x)$$
	- ossia l'algoritmo garantisce che il **valore (soluzione) non sia troppo più basso dell'ottimo** 

>[!tip] NB: in entrambi i casi vogliamo vedere quanto si discosta la soluzione rispetto all'ottimo, del tempo impiegato ci importa una sega (tanto è polinomiale!)


---

## Problema del Load Balancing
***DEFINIZIONE***
> Date `m` identiche macchine, $n \ge m$ jobs, ogni job ha un processing time $t_{j}$
> 	- il job `j` deve essere **eseguito contiguamente** su una macchina
> 	- una macchina **può processare al più un job alla volta**
> 	- assegnare ogni job a una macchina affinché il **makespan** sia **minimo**

***DEFINIZIONE:*** Load
> Sia `S[i]` il sottoinsieme di job assegnati alla macchina `i`.
> Il **load** della macchina è $$L[i] = \sum\limits_{j \in S[i]} t_{j}$$

***DEFINIZIONE:*** makespan
> Il **makespan** è **il tempo totale che serve per completare tutti i job**, e quindi corrisponde al Load più alto tra tutte le macchine $$L = max_{i} \ L[i]$$

#### Algoritmo: List scheduling
- Considera i job in un qualche ordine fisso
- Assegna il job `j` alla macchina `i` il cui carico è finora il più piccolo

![[Pasted image 20250828103718.png]]


>[!lemma] ![[Pasted image 20250828103915.png]]![[Pasted image 20250828103945.png]]![[Pasted image 20250828103958.png]]


##### Il problema dell'algoritmo greedy
Se non scegliamo bene l'ordine con cui vedere i job, può capitare che arrivi un job troppo lungo alla fine che fa raddoppiare il carico massimo su una macchina.
>[!tip]- Esempio
>![[Pasted image 20250828104115.png]]

#### Soluzione: longest processing time (LPT)
Prima di eseguire l'algoritmo, **ordiniamo i job in base ai più lunghi**
![[Pasted image 20250828104220.png]]


###### Analisi costo
![[Pasted image 20250828104416.png]]![[Pasted image 20250828104426.png]]


---

## Problema dei k-centri (2-approximation)
***DEFINIZIONE***
> Dati un set di `n` siti $s_{1}, ..., s_{n}$ e un intero `k` $> 0$.
> selezionare `k` centri `C` affinché la distanza tra un sito e il centro più vicino sia minima.

![[Pasted image 20250828105024.png]]

>[!tip] `r(C)` indica la distanza peggiore tra tutte le `dist(s_i, C)`
>Nel senso
>- calcola TUTTE le distanze dei siti dai centri più vicini
>- prendi la peggiore -> quella è `r(C)`
>- così tu sai che il minimo raggio di copertura per coprire tutti i siti è questo valore qui
 
#### Algoritmo greedy
Sceglie `k` volte il sito più lontano da qualsiasi centro finora creato, e lo usa come prossimo centro.
![[Pasted image 20250828105111.png]]


>[!lemma] ![[Pasted image 20250906111611.png]]
>L'algoritmo greedy potrebbe non essere ottimo ma la sua soluzione non si discosta più del doppio rispetto all'ottimo.
>
>DIMOSTRAZIONE
>1. Per assurdo ipotizziamo che l'ottimo sia molto più piccolo $$r(C^{*}) < \frac1 2 r(C)$$
>	- ossia il centro ottimale copre con sfere grandi la metà di quelle del greedy
>2. Costruiamo sfere intorno ai centri trovati $c \in C$, con raggio $\frac1 2 r(C)$
>	- in questa nuova sfera deve esserci ALMENO un centro ottimo $c_{i}^{*}$ altrimenti l'ipotesi sarebbe sbagliata
>3. Tutte le sfere, per costruzione, sono disgiunte (non si sovrappongono) e quindi in ognuna c'è ESATTAMENTE un centro ottimale
>	- quindi c'è una corrispondenza tra i centri di `C` e quelli di `C*`, in particolare $$|C| = |C^{*}|$$
>4. Ora colleghiamo un sito `s` al suo centro
>	- prendiamo un sito `s`
>	- sia $c_{i}^{*}$ il centro ottimo più vicino a `s`
>	- e sia $c_{i}$ il centro di `C` che "si abbina a $c_{i}^{*}$" (ossia che si trova nella stessa sfera)
>	- LA DISTANZA DI `s` dal centro $c_{i}$ trovato dal greedy soddisfa $$dist(s,C) \le dist(s, c_{i}^{*}) + dist(c_{i}^{*}, c_{i})$$
>		- la prima parte $dist(s, c_{i}^{*})$ è al massimo $r(C^{*})$, per definizione
>		- la seconda parte $dist(c_{i}^{*}, c_{i})$ anche è al massimo $r(C^{*})$, perché i due centri si trovano nella stessa sfera
>5. QUINDI la distanza totale è $$dist(s, C) \le 2 \cdot r(C^{*})$$
>6. E QUESTO VALE PER OGNI SITO `s`


---

# Riduzioni polinomiali
L’idea è classificare i problemi in base a quali sono risolvibili in tempo polinomiale e quali no.

Supponiamo di avere un problema `Y` che si può risolvere in tempo polinomiale.

***DEFINIZIONE:*** Riduzione
> Un problema `X` si riduce in tempo polinomiale a un problema `Y` (scriviamo $X \le_{P} Y$) se
> 	- riesco a trasformare qualunque istanza di `X` in un'istanza di `Y` in tempo polinomiale 
> 		- e le istanze di `X` saranno di grandezza AL PIÙ polinomiale alla grandezza dell'istanza di `X`
> 	- e posso ottenere la soluzione di `X` combinando (in tempo polinomiale) la soluzione di quelle istanze di `Y`

![[Pasted image 20250831123834.png]]

![[Pasted image 20250831123857.png]]

## Algoritmi polinomiali
### Indipendent Set
![[Pasted image 20250831123928.png]]

### Vertex cover
***DEFINIZIONE***
> Dato un grafo $G = (V, E)$ e un intero `k`, dire se esiste un sottoinsieme di `k` (o meno) vertici tali che ogni arco è incidente ad almeno un vertice dell'insieme.

![[Pasted image 20250831124416.png]]

>[!lemma] TEOREMA: Indipendet-Set  $≡_{P}$ Vertex-Cover 
>Quindi dobbiamo dimostrare $\iff$ 
>![[Pasted image 20250831124939.png]]![[Pasted image 20250831125024.png]]


### Set Cover
***DEFINIZIONE***
> Dato un insieme `U` di elementi, una collezione `S` di sottoinsiemi di `U` e un intero `k`, trovare (se esistono) al massimo `k` sottoinsiemi la cui unione è uguale a `U`
![[Pasted image 20250831125536.png]]


>[!lemma] TEOREMA: Vertex-Cover $\le_{P}$ Set-Cover
>Il set cover è la GENERALIZZAZIONE del vertex cover.
>
>Visivamente per dimostrarlo costruiamo un grafo non diretto e
>- tutti gli archi associati a un nodo formano l'insieme $S_{i}$ usato nel set-cover
>	![[Pasted image 20250831145628.png]]

![[Pasted image 20250831150340.png]]![[Pasted image 20250831150350.png]]


---

# Soddisfacibilità
***DEFINIZIONE:*** Letterale
> È una variabile booleana o la sua negazione
> ![[Pasted image 20250831150544.png|center]]

***DEFINIZIONE:*** Clausola
> Una disgiunzione di letterali
> ![[Pasted image 20250831150554.png|center]]

***DEFINIZIONE:*** Formula Normale Congiuntiva (CNF)
> Una formula proposizionale $\phi$ in CNF è una congiunzione di clausole 
> ![[Pasted image 20250831150812.png|center]]


### SAT
Data una formula $\phi$ in CNF, trovare (se esiste) un'assegnazione che la renda vera
### 3-SAT
SAT dove ogni clausola ha esattamente 3 letterali (e ogni letterale corrisponde a una variabile diversa).
![[Pasted image 20250831150947.png]]

>[!tip] SECONDO DELLE IPOTESI NON ESISTE UN ALGORITMO POLINOMIALE CHE RISOLVA 3-SAT


>[!lemma] TEOREMA: 3-SAT $\le_{P}$ INDIPENDENT-SET
>![[Pasted image 20250831151107.png]]

![[Pasted image 20250831151128.png]]![[Pasted image 20250831151134.png]]

#### Ecco la scala dei problemi
![[Pasted image 20250831151209.png]]![[Pasted image 20250831151216.png]]

>[!tip] NB: data la definizione di riduzione, dato che non esiste un algoritmo polinomiale per 3-SAT, sappiamo già che non esisterà nemmeno per tutti gli altri!


---

# Problemi decisionali
- Abbiamo un problema `X` che corrisponde a un insieme di stringhe
- L'istanza `s` è una stringa
- L'algoritmo `A` risolve il problema `X`
	![[Pasted image 20250831160328.png|center]]

### Algo Polinomiale e P
***DEFINIZIONE:*** Algoritmo in tempo polinomiale
> Un algoritmo usa tempo polinomiale se per ogni stringa `s`, `A(s)` termina in $\le p(|s|)$ "passi", dove $p(\cdot)$ è una qualche funzione polinomiale.


***DEFINIZIONE:*** P
> È un insieme di problemi per cui esiste un **algoritmo di tempo polinomiale**
>![[Pasted image 20250831163101.png]]

### Certificatore e NP
***DEFINIZIONE:*** Certificatore
> Un algoritmo `C(s,t)` è un certificatore per un problema `X` se per ogni stringa `s` $$s \in X \iff \text{esiste una stringa t tale che} \ C(s,t) = si$$

***DEFINIZIONE:*** NP
> È un insieme di problemi decisionali per cui esiste un **certificatore di tempo polinomiale** e il certificato `t` deve essere **di dimensione polinomiale**: $|t| \le p(|s|)$ per una qualche $p(\cdot)$ 
> ![[Pasted image 20250831163116.png]]

>[!tip] PER 3-SAT un certificato è un'assegnazione a tutte le variabili
>![[Pasted image 20250831163539.png]]

### EXP
***DEFINIZIONE:***
> Insieme di problemi decisionali per cui esiste un **algoritmo di tempo esponenziale**


![[Pasted image 20250831163747.png]]

>[!lemma] FATTO $$P \ne EXP  \Rightarrow quindi \ o \ P \ne NP, \ oppure \ NP \ne EXP, \ o \ entrambi$$


### NP-completo
***DEFINIZIONE*** 
> Un problema `Y` è NP-completo se $Y \in NP$ e per ogni problema $X \in NP$ vale che $$X\le_{P}Y$$

![[Pasted image 20250831165411.png]]

![[Pasted image 20250831165506.png]]


### CO-NP
Per NP abbiamo dei certificati brevi SOLO per le istanze si.
- è più facile trovare UNA assegnazione a 3-SAT che dire che NON NE ESISTE NESSUNA.

***DEFINIZIONE***
> dato un problema X in NP, il suo **complemento** $\overline{X}$ è quello con le risposte sì/no invertite.

Quindi -> co-NP = classe di tutti i complementi di problemi in NP.

>[!question] Come dimostro che un problema sta in `CO-NP`?
>Prendo il problema, e verifico che il suo complemento sta in `NP`.
>Se il suo complemento sta in `NP` allora il problema originale sta in `CO-NP`.


>[!example] PROBLEMA APERTO: $NP == co-NP$?
>Si ipotizza di no.
>


>[!lemma] TEOREMA: Se $NP \ne co-NP \Rightarrow P \ne NP$
>Perché
>- `P` è chiusa rispetto al complemento
>- Se `P = NP` allora anche NP sarà chiusa rispetto al complemento
>- E quindi $NP = co-NP$




