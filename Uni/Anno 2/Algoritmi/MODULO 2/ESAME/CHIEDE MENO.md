# Matching bipartito
***DEFINIZIONE:*** matching
> Dato un grafo non orientato $G = (V,E)$, un sottoinsieme di archi $M \subseteq E$ è un `matching` se ogni nodo appare **al massimo una volta** in `M`

***DEFINIZIONE:*** max matching
> Dato un grafo, trovare il matching di cardinalità massima (che usa quindi il numero massimo di archi)

![[Pasted image 20250827120721.png]]


***DEFINIZIONE:*** Grafo bipartito
> Un grado $G$ è **bipartito** se i suoi nodo possono essere divisi in due gruppi disgiunti $L$ e $R$ tali che **ogni arco** collega sempre un vertile di $L$ con almeno uno di $R$ (ma mai $L-L$ o $R-R$)

***DEFINIZIONE:*** Matching bipartito
> Partendo da un grafo bipartito $G = (L \cup R, E)$, trovare un **matching di cardinalità massima** 

![[Pasted image 20250827121933.png|center|400]]


***DEFINIZIONE:*** Matching perfetto
> Dato un grafo $G = (V,E)$, un sottoinsieme di archi $M \subseteq E$ è un **matching perfetto** se <u>ogni nodo</u> appare in <u>esattamente un arco in M</u>

>[!tip] NB: nella foto del pentagono avevamo un matching perfetto, in quella del grafo bipartito no.

### PROBLEMA DEL MATCHING PERFETTO
Dato un grafo bipartito $G = (L \cup R, E)$, trovare un matching perfetto oppure segnalare correttamente che non esiste.
![[Pasted image 20250827121925.png]]

###### Formulazione
- Crea un grafo diretto $G^{'} = (L \cup R \cup \{s,t\}, E^{'})$
- Tutti gli archi di $L$ sono **uscenti** e vanno in $R$ e hanno capacità $+\infty$ (per convenzione)
- La sorgente `s` è collegata a tutti i nodi di $L$, con archi uscenti e di costo `1` 
- Tutti i nodi di $R$ sono collegati al pozzo `t`, con archi uscenti di costo `1`
![[Pasted image 20250827153005.png]]


>[!lemma] Teorema
>**Esiste una corrispondenza biunivoca (1–1) tra:**
>- i **matching** di cardinalità `k` in un grafo bipartito `G`, e
>- i **flussi integrali** di valore `k` in un grafo `G′` costruito da `G`.
>
>DIMOSTRAZIONE
>![[Pasted image 20250827153546.png]]![[Pasted image 20250827153552.png]]


>[!tip] Corollario
>È possibile risolvere il problema del matching bipartito con la formulazione `max flow`.
>
![[Obsidian_P0OyCt7x9T.png]]
Il primo teorema è quello che diceva "se passo un flusso con valori interi allora il flusso risultante è ancora un intero"
>
>###### RUNNING TIME
Usando Ford-Fulkerson abbiamo
>- $\le n$ augmentations => $O(m \cdot n)$ tempo 


---

# Cammini disgiunti
***DEFINIZIONE:*** Due cammini sono detti **edge-disjoint** se non hanno archi in comune

***DEFINIZIONE:*** Problema dei cammini con archi disgiunti
> Dato un grafo diretto $G = (V, E)$ e due nodi `s` e `t`, trovare il massimo numero di percorsi `s↝t` con archi disgiunti

![[Pasted image 20250827162205.png]]

###### Max flow formulation
Assegniamo ad ogni arco una capacità di `1`
![[Pasted image 20250827163532.png]]

>[!lemma] Esiste una corrispondenza biunivoca tra `k` percorsi `s↝t` con archi disgiunti in $G$ e flussi integrali con valore `k` in $G^{'}$
>Nel senso che
>- VALORE TOTALE DEL FLUSSO = NUMERO DI CAMMINI CON ARCHI DISGIUNTI 
>
>Dimostrazione
>![[Pasted image 20250827163759.png]]![[Pasted image 20250827163817.png]]


>[!tip] Corollario
>È possibile risolvere il problema con la formulazione `max flow`.
>
![[Pasted image 20250827163911.png]]
>
>###### RUNNING TIME
Usando Ford-Fulkerson abbiamo
>- $\le n$ augmentations => $O(m \cdot n)$ tempo 


### Esiste lo stesso problema ma anche con grafi non diretti
![[Pasted image 20250827163955.png]]
![[Pasted image 20250827164005.png]]