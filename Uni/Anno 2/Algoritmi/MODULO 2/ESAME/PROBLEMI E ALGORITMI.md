# Interval Scheduling -> Earliest FINISH time $O(n \cdot log(n))$
- `n` intervalli 
- li ordino per tempo di fine $f_{i}$
- aggiungo all'insieme $S$ solo i compatibili


# Interval Partitioning -> Earliest START time $O(n \cdot log(n))$
- `n` intervalli
- li ordino per tempo di inizio $s_{j}$
- se una lezione è compatibile con una classe $d$ -> la inserisco 
- se non è compatibile con nessuna classe -> creo una classe $d+1$


# MST -> Kruskal $O(m \cdot log(n))$ / Prim $O(m + n \cdot log(n))$
- Grafo $G$
- Voglio trovare un albero che tocchi tutti i nodi (MST) con pesi minimi
##### Kruskal
- Costruisco la `UF`
- Ordino gli archi in ordine crescente di peso
- Inizializzo un insieme vuoto `T`
- Per ogni nodo eseguo `makeset(v)`
- Per ogni arco `(x,y)` in ordine
	- `find(x)` e `find(y)`
		- se diversi -> `union(x,y)` e aggiungo l'arco a `T`
		- se uguali -> skip
##### Prim
- Per ogni vertice `v` -> `a[v] = +inf`
- `a[s] = 0`
- Inizializzo coda con priorità `Q`
	- metto tutti i vertici in `Q`
- Inizializzo un insieme vuoto `S`
- Inizializzo un albero `T` con radice `s`
- FInché `Q` non è vuota
	- estraggo il minimo `u`
	- lo metto in `S`
	- controllo gli archi uscenti
		- se il nodo adiacente non sta in `S` e l'arco ha peso minire della sua stima `a[v]`
			- cambio la stima e lo rendo figlio di `u` in `T`


# Cluster -> Kruskal + rimuovo `k-1` archi più pesanti


# Indipendent Set -> $$max\{OPT[j-1], w_{j}+OPT[j-2]\} \ \ + \ \ \text{Find Solution}$$
- Dato un cammino $G$
- voglio trovare un insieme di nodi NON ADIACENTI di peso massimo (`IS`)

Vari casi
- `OPT[1] = w_1`
- `OPT[2] = max{w_1, w_2}`
- `OPT[j] = max{OPT[j-1, w_j + OPT[j-2]}`

##### Find solution
- Inizializzo  un insieme vuoto `S*`
- Parto dalla fine di `OPT[]` e aggiungo un nodo a `S*` se e solo se $w_{j} + OPT[j-2] \ge OPT[j-1]$


# Weighted interval scheduling -> Bottom-Up / Top-Down ($O(n \cdot log(n))$) + Find solution
- Dati in input `n` intervalli, ognuno con $s_{i}, \ f_{i} \ \text{e} \ w_{i}$
- Voglio selezionare il maggior numero di classi mutualmente compatibili il cui peso è massimo
##### Bottom-UP
- Ordino le classe per tempo di fine ($O(n \cdot log(n)$)
- Calcolo tutti i `p[j]` con la ricerca binaria ($O(n \cdot log(n)$)
- `M[0] <- 0`
- Per ogni nodo, trovo $M[j] \leftarrow max\{OPT[j-1], w_{j} + OPT[p[j]\}$
##### Top-Down
Stessa cosa di prima ma per riempire `M[]` uso una funzione ricorsiva che
- se (e solo se) `M[j]` non è inizializzato calcola $$M[j] \leftarrow max\{M-COMPUTE-OPT[j-1], w_{j} + M-COMPUTE-OPT[p[j]\}$$
##### Find solution
- Faccio i vari controlli e ritorno la soluzione


# Longest increasing subsequence -> LIS $O(n^{2})$
- Ho una lista con dei valori
- Voglio trovare la sequenza crescente di cardinalità massima 

##### Algo -> ogni `OPT(j)` deve prendere l'elemento `j`
- Il primo elemento lo prendo per forza
- Dal secondo in poi, faccio $M[j] = 1 + max\{0, max_{j=1,...n} OPT[j]\}$
	- uno perché l'elemento `j` devo prenderlo per forza


# Segmented Least Square -> $O(n^{3})$
- `n` punti su un piano
- vogliamo trovare una retta che minimizzi l'errore quadratico (ossia quando dista ogni punto dalla retta)
	- Vogliamo minimizzare $f(x) = E + c \cdot L$

##### Algo -> `OPT(j)` è il costo minimo se uso una sola retta passante per un punto `i` e un punto `j`
- Due cicli for 
	- uno da `j=1` fino a `n`
		- uno da `i=1` fino a `j`
			Per ognuno calcolo l'errore da `i` a `j`
- Poi prendo tutti i valori ottenuti e prendo il minimo di $e_{ij} + c + OPT[i-1]$
	- $e_{ij}$ -> errore calcolato nei for
	- c -> costo (sarebbe $\cdot 1$ perché uso una sola retta)
	- $OPT[i-1]$ -> la soluzione ottima per tutti i punti prima di `i`


# Knapsack -> Matrice $O(n \cdot W)$
- Uno zaino con capienza massima `W`
- Degli oggetti con 
	- peso `w`
	- valore `v`
- Voglio inserire nello zaino la somma più grande tra tutti i valori rispettando il peso massimo `W`

##### Algo -> sottoproblemi con due variabili
- `OPT[i, w]` è il sottoproblema che va da `1` fino a `i` rispettando un certo peso `w`

Uso una matrice
- Prima riga e prima colonna impostate a `0`
- Poi vedo per ogni cella cosa mi conviene di più tra
	- non inserire l'oggetto corrente -> `M[i,w] = M[i-1, w]`
	- inserire l'oggetto corrente -> `M[i,w] = v_i + M[i-1, w-w_i]`
		- prendo il valore di quell'oggetto e trovo la soluzione migliore che rimane nel nuovo peso limite `w - w_i`

##### Find Solution
- Parto dalla fine `M[n, W]`
- Risalgo in verticale finché ho una corrispondenza
- Mi sposto in diagonale quando non ho più una corrispondenza


# Edit distance e Sequence Alignment
- Due stringe `x` e `y`
- Vogliamo trovare un accoppiamento di costo minimo 