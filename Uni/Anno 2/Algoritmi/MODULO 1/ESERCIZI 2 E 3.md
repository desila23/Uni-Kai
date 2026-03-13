# 💚FACILI (relativamente ad algoritmi si intende)
ESAME 19/02/2024 - ESERCIZIO 2
![[Pasted image 20250617170226.png]]
#### Idea
Potrei usare due indici, e uno dei due si muove solo quando l'altro è su un valore più grande, e continuo così finché gli indici non si superano

#### Pseudocodice
```c
Trova_i(A)
	n = lunghezza di A
	
	i = 1
	j = n
	
	Sx = A[i]
	Dx = A[j]
	
	while(i < j) do
		if(Sx <= Dx) then
			i++
			Sx += A[i]
		else
			j--
			if(j > i) then
				Dx += A[j]
	
	if (Sx > Dx) then
	    return i
	else
	    return -1
```

#### Costo
Tempo: $O(n)$ -> vedo tutti gli elementi dell'array una sola volta
Spazio: $O(1)$ -> lavoro in loco

#### Correttezza
Abbiamo quattro casi principali
- Se Sx è $\le$ di Dx allora vuol dire che devo incrementare il valore di Sx
- Se invece è $>$ allora, vuol dire che posso decrementare Dx per vedere fin dove posso spingermi
	- però se una volta decrementato j  mi accorgo che `i==j`, non devo incrementare Dx ma mi fermo
- Una volta uscito dal while (quindi gli indici si sono incrociati) controllo se Sx è > di Dx
	- se lo è -> ritorno `i`
	- se non lo è -> non esiste un indice



ESAME 18/02/2025 - ESERCIZIO 3
![[Pasted image 20250617170839.png]]
#### Idea e algoritmo
Qui l'idea è quella di calcolare dijkstra in due modi
- da `x` a tutti gli `s`, con l'aggiunta poi dei costi degli archi e del pagamento dello studente
- poi da tutti gli `s` a `t`
	- mi salvo il costo totale in `s`
- una volta trovati tutti ritorno il migliore

```
Taxi(G, x)
	Calcolo Dijsktra con sorgente x e mi salvo su ogni percorso il c(e) totale
	
	arrivato ad un s_i -> p_i -= c(e) totale da x -> s_i
	
	Calcolo dijsktra inverso con sorgente t  
	arrivato ad un s_i -> p_i -= c(e) totale da t -> s_i
	
	ritorno il p_i massimo (con annesso percorso)
```

#### Costo
Dijsktra costa $O(m log(n))$, lo eseguo due volte, però il costo rimane comunque $$O(m + n \cdot log(n))$$
Calcolo poi per `k` volte il costo per ogni studente $O(1)$, quindi il costo è $$O(k)$$ma dato che `k` è nell'ordine di $O(n)$ lo posso rimuovere

COSTO TOTALE $$O(m + n \cdot log(n))$$
#### Correttezza
Calcolo, con sorgente `x` tutti i percorsi minimi per arrivare ad ogni studente `s_i` con annesso costo -> deriva correttezza di Dijsktra

Stessa cosa con sorgente `t` -> anche qui deriva correttezza di Dijsktra


ESAME 13/06/2024 - ESERCIZIO 3
![[Pasted image 20250617171039.png]]

```c
Sburritrix(v, max_antenato) 
	if (v == NULL) then     // è una foglia
		return 0
	
	if (sx(v) == NULL && dx(v) == NULL) then
		if v.val + max_antenato >= 100
			return 1
		else return 0
	
	if (v.val > max_antenato) then
		max_antenato = v.val
	
	return Sburritrix(sx(v), max_antenato) + Sburritrix(dx(v), max_antenato)


Chiamata_Sburritrix(u)
	if(u == NULL) then 
		return 0
	
	if(sx(u) == NULL && dx(u) == NULL && u.val >= 100) 
		return 1
	
	return Sburritrix(sx(u), u.val) + Sburritrix(dx(u), u.val)
```

#### Costo
Vengono visitati in totale `n` nodi al più una volta, quindi costo $$O(n)$$
#### Correttezza
L'algoritmo chiedeva di verificare le foglie valide, quindi quelle foglie il cui valore, sommato a quello di un qualche antenato, sia $\ge$ 100.
Portandomi dietro il valore massimo di un antenato del nodo `v`, riesco a determinare in tempo costante se una foglia è valida.



ESAME 16/07/2024 - ESERCIZIO 2
![[Pasted image 20250617171207.png]]
#### Idea
Prendo un km, mi salvo nel suo contatore la posizione della colonnina, se trovo una posizione più vantaggiosa, la confronto con quella nel contatore e poi la cambio.

```c
SOS_sbux(A, n)
    B_sx = nuovo vettore di lunghezza n/2
    B_dx = nuovo vettore di lunghezza n/2
    B    = nuovo vettore di lunghezza n
	
    i = 0
    j = n - 1
	
    ultimo_sx = -1
    ultimo_dx = -1
	
    while (i <= j) do
        if A[i] == 1 then
            ultimo_sx = i
        B_sx[i] = ultimo_sx
		
        if A[j] == 1 then
            ultimo_dx = j
        B_dx[j] = ultimo_dx
		
        i++, j--
	
    // Confronto finale
    for k = 0 to n-1 do
        if B_sx[k] == -1 then
            B[k] = B_dx[k]
        else if B_dx[k] == -1 then
            B[k] = B_sx[k]
        else if |k - B_sx[k]| <= |k - B_dx[k]| then
            B[k] = B_sx[k]
        else
            B[k] = B_dx[k]
		
    return B
```

#### Costo
L'array viene controllato due volta per intero, quindi $$O(2n) = O(n)$$
Vengono creati 3 array, di cui
- `B_sx` e `B_dx` = $O(n)$ (precisamente $\frac n 2$)
- `B` = $\Theta(n)$ 



ESAME 16/07/2024 - ESERCIZIO 3
![[Pasted image 20250617171502.png]]

```c
algoritmo visitaBFS (vertice s,t) 
	 rendi tutti i vertici (v,λ) non marcati
	 T ← albero formato da un solo nodo (s,0)
	 CodaF
	 marca il vertice s; dist(s) ← 0
	 F.enqueue((s,0))
	   
	 while ( not F.isempty() ) do
	   (u,temp_corr) ← F.dequeue()
		 if (u==t) return 1
		   for each ( arco(u,v) in G ) do
	     if ( v non è ancora marcato && temp_corr <= λ(u,v) ) then
	       F.enqueue((v,λ))
	       marca il vertice v;
	return 0
```



ESAME 9/09/2024 - ESERCIZIO 2
![[Pasted image 20250617171958.png]]

#### Pseudocodice
```c
Sbrinxus(v)
	if(sx(v) == NULL && dx(v) == NULL) then
		if(v.col == 1) then
			return [1, 0]
		else
			return [0, 1]
	
	// Questi sono i contatori per i figli sx e dx della radice
	[sx_1, sx_2] = [0, 0]    // [cammini_1, cammini_2] sul sottoalbero sx
	[dx_1, dx_2] = [0, 0]    // [cammini_1, cammini_2] sul sottoalbero sx
	
	if(sx(v) != NULL && sx(v).col != v.col) then
		[sx_1, sx_2] = Sbrinxus(sx(v))
	
	if (dx(v) != NULL && dx(v).col != v.col) then
		[dx_1, dx_2] = Sbrinxus(dx(v))
	
	return [sx_1 + dx_1, sx_2 + dx_2]
```

#### Costo
Vengono visitati tutti i nodi al più una volta, quindi $$O(n)$$
#### Correttezza
In ogni nodo viene inizializzato un contatore con i rispettivi valori dei cammini dei figli, che verrà aggiornato solo quando si arriva ad una foglia.
Una volta arrivato ad una foglia





# 🧡MEDI
ESAME 19/02/2024 - ESERCIZIO 3
![[Pasted image 20250617170525.png]]
#### Idea
Posso partire da s, applicare dijsktra verso ogni magazzino, basandomi sui pesi $w_{1}$.
Una volta trovato il magazzino, applico da lì dijsktra per trovare tutte le filiali, e
- calcolo per tutte il $w_{1}$ dell'andata
- calcolo per tutte il $w_{2}$ del ritorno (quindi dalla filiale a `s`)
- faccio la differenza e scelto quale percorso mi conviene seguire

#### Algoritmo
```
Sbux(G, s)
	Applico dijsktra da s (trovo tutte i traffici mattutini `w_1`) 
		- utilizzando, per ogni arco e, il suo w_1(e)
		- per ogni magazzino -> `traffico_magazzino` = w_1(s -> magazzino)
	
	Applico Dijsktra per ogni m -> filiale
		- per ogni filiale 
			traffico_filiale_mattina = w_1(s -> m) + w_1(m -> t)
	
	
	Inverto gli archi
	Applico Dijkstra da s (trovo tutti i `w_2`)
		- per ogni filiale -> traffico_filiale_pomeriggio = w_2(s -> f)
	
	Per ogni filiale
		traffico_tot = traffico_mattina + traffico_pomeriggio 
	
	return min{traffico_tot} 
```

#### Costo
Disjktra = $O(m + n \cdot log(n))$
- il dijsktra che mi costa di più è quello che faccio per ogni magazzino quindi $$O(|M| \cdot (m  + n \cdot log(n)))$$
Calcolo del traffico tot = $O(k)$ ma non serve asintoticamente

COSTO TOTALE $$O(|M| \cdot (m + n \cdot log(n)))$$

ESAME 13/06/2024 - ESERCIZIO 2
![[Pasted image 20250617171011.png]]
#### Idea
Parto da una finestra con i primi `k` elementi.
Sfrutto un dizionario in cui inserisco tutti gli elementi che ho nella finestra con la conta di quante volte compaiono
Ogni volta mi salvo, per quella finestra, il massimo valore dei distinti.

#### Pseudocodice
```c
Sgrodol(S, k)
	conta <- INSIEME VUOTO     // AVL 
	massimo     // massimo dei valori distinti in una finestra
	distinti
	
	for i = 1 to k do
		if (conta[S[i]] == NULL) then   
			distinti += 1    // incremento solo se quel numero non c'è già
			conta.insert([S[i]])
		conta[S[i]] += 1
	
	
	massimo = distinti
	indice_max = 1
	
	
	for y = k+1 to n do
		conta[S[y - k]] -= 1
		if conta[S[y - k]] == 0 then   // se quell'evento non c'è più
			distinti -= 1    
		
		if (conta[S[y]] == NULL) then
			distinti += 1
			conta.insert([S[i]])
		conta[S[i]] += 1
		
		if (distinti > massimo) then
			massimo = distinti
			indice_max = y - (k-1)
	
	
	return indice_max, massimo
```

#### Costo
Primo for -> $O(k)$
Secondo for -> Visito `n-k` i nodi al più una volta -> $O(n-k)$ -> che con il `k` di prima diventa $O(n)$
Operazioni nell'AVL -> $O(log(k))$

COSTO TOTALE $$O(n \cdot log(k))$$
#### Correttezza
Verifico TUTTE le finestre possibili di grandezza `k`, scegliendo tra quelle la finestra con il numero di distinti maggiore.



ESAME 24/09/24 - ESERCIZIO 2
![[Pasted image 20250617172221.png]]
#### Idea
Tipo potrei costruire la mia struttura dati inserendo, in modo ordinato, i giorni in base a quanto incasserà l'azienda.
Così, alla domanda della query, potrei rispondere in tempo $log(n)$

```c
Bringol(A)
	Y = array di dimensione n     // da rivedere ma ciupa
	
	Y[1] = A[1]
	
	for y = 2 to n do
		Y[i] = A[i] + A[i+1]
	
	return Y

Cuchaz(Y, i, f, x)
	centro = [(i + f) / 2]   // PARTE INFERIORE
	
	if(Y[centro] == x and Y[centro-1] != x) then 
		return m
	
	else if ((Y[m] == x and Y[m-1] == x) or Y[centro] > x) then
		Cuchaz(Y, i, m, x)
	
	else 
		Cuchaz(Y, m+1, f, x)
```





ESAME 21/01/25 - ESERCIZIO 3
![[Pasted image 20250617172713.png]]
#### Idea
Eseguo dijsktra(s -> t), e, per ogni nodo salvo nella coda con priorità il peso del cammino + il $w_{i}(v)$.
In teoria, quando ritorno su quel nodo, se ho un costo < di quello precedentemente salvato, lo cambio.

#### Pseudocodice
```c
Sphinx(G, s)
	C <- coda con priorità
	
	per ogni v in V:
	    D_sv ← +inf
	
	D_ss ← 0
	C.insert(s, 0)
	T <- radice s
	
	while(not C.isempty())
		u <- C.deletemin()
		per ogni arco u -> v
			if(col(u -> v) == c_1) then
				nuovo_costo ← D_su + w(u → v) + w_1(v) 
				if (nuovo_costo < D_sv) then
				    C.decreasekey(v, D_sv - nuovo_costo))
				    rendi u padre di v in T
			
			else
				nuovo_costo ← D_su + w(u → v) + w_2(v) 
				if (nuovo_costo < D_sv) then
				    C.decreasekey(v, D_sv - nuovo_costo))
				    rendi u padre di v in T
	
	return D_st, T_st
```




# ❤️‍🔥DIFFICILI
ESAME 18/02/2025 - ESERCIZIO 2
![[Pasted image 20250617170748.png]]

ESAME 9/09/2024 - ESERCIZIO 2
![[Pasted image 20250617171836.png]]

```c
Permutare(A)
	B = array di dimensione n
	
	for i = 0 to n do
		
```


ESAME 24/09/24 - ESERCIZIO 3
![[Pasted image 20250617172251.png]]



ESAME 21/01/25 - ESERCIZIO 2
![[Pasted image 20250617172658.png]]
#### Idea
La mia idea è fare tipo una somma dei valori dell'array e poi dividere quella somma per `n / 2`.
	in pratica io so già quanti gruppi devo avere, e con questa formula posso calcolare quale somma devo avere all'interno dei miei gruppi
Poi, per un valore, cerco il suo "corrispettivo" facendo in modo che `somma_gruppo = somma_array`.

`A = [1, 3, 2, 2]` -> MEDIA = 2 -> `[1,3] - [2,2]`

`A = [1, 1, 1, 5]` -> MEDIA = 2 -> nessun gruppo può dare come somma 4

#### Idea $n^{2}$
```c
Bagante(A)
	somma = 0
	n = lunghezza di A
	
	for i = 1 to n do    // O(n)
		somma += A[i]
	
	gruppi = n/2
	somma_cercata = somma / gruppi
	
	gruppi_corretti = 0
	B = array di lunghezza n inizialmente vuoto   
	// inserisco dentro B le posizioni utilizzare
	
	for i = 1 to n do     // O(n^2)
		for j = i+1 to n do
			if (i not in B  and j not in B and A[i] + A[j] == somma_cercata) then
				gruppi_corretti++
				inserisci i e j in B
				break
	
	if (gruppi_corretti == gruppi) then
		return true
	else
		return false
```


#### Idea $n$
```c
Bagante(A)
	somma = 0
	n = lunghezza di A
	
	for i = 1 to n do    // O(n)
		somma += A[i]
	
	gruppi = n/2
	somma_cercata = somma / gruppi
	
	A = array ordinato tramite merge sort   // O(nlog(n))
	
	k = 1
	j = n
	while (k < j) do
		if(A[k] + A[j] != somma_cercata) then
			return false
		k++
		j--
	
	return true
```



