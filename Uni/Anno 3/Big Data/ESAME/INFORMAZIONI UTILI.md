# MITZ-UPFAL CH01
## Verifica identità polinomiale
Due approcci
- Deterministico -> trasformo `H(x)` nella sua forma canonica e verifico se sia uguale a `G(x)`
- Randomizzato -> scelgo randomicamente un intero `r` (variabile aleatoria) da un range di valori possibili
	- calcolo `H(r)` e `G(r)` e verifico
### Teorema 
![[Pasted image 20260323112055.png]]

Questo significa che 
- se l'istanza è corretta (sono simili) allora l'algoritmo darà sempre la risposta corretta
- se l'istanza non è corretta (sono diversi) l'algoritmo PUÒ dare delle soluzioni sbagliate nel caso in cui scegliamo una delle `d` radici
	- questo perché se sono diversi ma prendo una radice, allora entrambi daranno come risultato `0`

## SPAZIO DELLE PROBABILITÀ
Ha tre componenti
- uno spazio dei campioni $\Omega$ -> insieme di tutti i possibili risultati 
- un insieme di insiemi `F`  che rappresenta gli eventi -> ogni insieme è un sottoinsieme di $\Omega$
- una funzione di probabilità $Pr: F \rightarrow R$ 
	- $F = 2^{\Omega}$ 

### FUNZIONE DI PROBABILITÀ
La funzione di probabilità deve rispettare le seguenti condizioni
1. Per ogni evento **E**, la probabilità di tale evento deve essere compresa tra 0 e 1 $$0 \le Pr(E) \le 1$$
2. La probabilità dello spazio dei campioni deve essere esattamente 1 $$Pr(\Omega) = 1$$
3. Per ogni sequenza finita di coppia di eventi mutualmente distinti $E_{1}, E_{2}, E_{3}, ...$ -> la probabilità dell'unione di tutti gli eventi è uguale alla somma delle probabilità degli eventi 
	![[Pasted image 20260323112808.png]]
	The probability of an event is the sum of the probabilities of its simple events.


## Eventi 
Due eventi `E` e `F` sono indipendenti se e solo se la probabilità della loro intersezione è uguale al prodotto delle loro probabilità.
![[Pasted image 20260323113419.png]]

Più in generale
![[Pasted image 20260323113432.png]]

## Probabilità condizionata
La probabilità condizionata che un evento `E` capiti sapendo che un evento `F` è già accaduto è data dall'intersezione delle loro probabilità fratto la probabilità di `F`.
![[Pasted image 20260323113609.png]]

![[Pasted image 20260323113621.png]]


## INDIPENDENZA
![[Pasted image 20260323113644.png]]

## TEOREMA (legge della probabilità totale)
![[Pasted image 20260323113719.png]]![[Pasted image 20260323113727.png]]

## LEGGE DI BAYES
![[Pasted image 20260323113757.png]]

>[!tip]- Utili
>![[Pasted image 20260323113813.png]]![[Pasted image 20260323113822.png]]![[Pasted image 20260323113829.png]]

##### ESEMPIO UTILE
![[Pasted image 20260323120526.png]]
![[Pasted image 20260323120532.png]]

>[!tip] L'idea qui è che grazie al teorema di Bayes. ogni test positivo aumento la fiducia nella correttezza di ciò che stiamo ipotizzando



---

# MITZ-UPFAL CH02
## Variabili Aleatorie (R.V.)
Una **variabile aleatoria $X$** su uno spazio campionario $\Omega$ è una funzione a valori reali definita sugli esiti dello spazio: $X: \Omega \to \mathbb{R}$.
- **R.V. Discreta:** assume solo un numero finito o numerabile di valori.
- **Connessione con gli Algoritmi:** In ambito Big Data/Algoritmi, ogni volta che un algoritmo effettua una scelta randomizzata (es. scelta di un pivot, campionamento), sta implicitamente utilizzando variabili aleatorie.

## Indipendenza
Due variabili aleatorie $X$ e $Y$ si dicono **indipendenti** se e solo se per ogni coppia di valori $x, y$:
$$\Pr((X = x) \cap (Y = y)) = \Pr(X = x) \cdot \Pr(Y = y)$$
*Nota:* Sapere che è avvenuto $X$ non fornisce alcuna informazione sulla probabilità di $Y$.
- **Mutua Indipendenza:** Un insieme di variabili $X_1, X_2, \dots, X_k$ è mutuamente indipendente se per ogni sottoinsieme di indici $I \subseteq [1, k]$, la probabilità della loro intersezione è pari alla produttoria delle singole probabilità: $\Pr(\bigcap_{i \in I} X_i = x_i) = \prod_{i \in I} \Pr(X_i = x_i)$.

![[Pasted image 20260330104207.png]]

## Valore Atteso e Mediana
### Valore Atteso (Expectation)
Il valore atteso $E[X]$ di una variabile aleatoria discreta $X$ è la **media ponderata** di tutti i possibili valori che $X$ può assumere, pesati con la loro probabilità:
$$E[X] = \sum_{i} i \cdot \Pr(X = i)$$
- Esiste (è finito) solo se la serie $\sum_{i} |i| \Pr(X = i)$ converge.
- Rappresenta il "baricentro" della distribuzione.

### Mediana vs Media
- **Media (Valore Atteso):** Misura del valore medio/atteso (es. nel lancio di un dado è $3.5$).
- **Mediana ($m$):** È il valore che divide a metà la distribuzione. Formalmente, un valore $m$ tale che:$$\Pr(X < m) \leq 1/2 \quad \text{e} \quad \Pr(X > m) < 1/2$$
*Differenza chiave:* La media è influenzata dai valori estremi (outlier), la mediana è una misura di posizione più robusta.

## Linearità del Valore Atteso 
È una delle proprietà più potenti nell'analisi degli algoritmi probabilistici. 
>[!lemma] **Teorema** 
>Per **qualsiasi** coppia di variabili aleatorie $X$ e $Y$ (anche se dipendenti!):
$$E[X + Y] = E[X] + E[Y]$$
- **Estensione:** Vale anche per costanti $E[cX] = cE[X]$.
- **Importanza pratica:** Permette di calcolare il valore atteso di somme complesse spezzandole in componenti più semplici (es. somma di lanci di dadi o indicatori di successo).

## Distribuzioni Notevoli
### Variabile Aleatoria Bernoulliana (Indicator Variable)
Modella un esperimento con due soli esiti: "Successo" ($1$) o "Insuccesso" ($0$).
- $Y = 1$ con probabilità $p$; $Y = 0$ con probabilità $1-p$.
- **Valore Atteso:** $E[Y] = p$.
*Nota:* In informatica è spesso usata come **variabile indicatore** per segnalare se un evento si è verificato.

### Distribuzione Binomiale
Rappresenta il numero di successi in $n$ prove indipendenti (Bernoulliane) con probabilità $p$.
- **Formula:** $\Pr(X = j) = \binom{n}{j} p^j (1 - p)^{n-j}$.
	- $\binom{n}{j}$ -> modi diversi per ottenere `j` su `n` prove
	- $p^{j}$ -> successi
	- $(1-p)^{n-j}$ -> fallimenti
- **Valore Atteso:** $E[X] = np$.
*Dimostrazione rapida:* Grazie alla linearità del valore atteso, essendo $X$ la somma di $n$ Bernoulliane indipendenti $X_i$, allora $E[X] = \sum_{i=1}^n E[X_i] = \sum p = np$.

### Distribuzione Geometrica
Descrive il numero di tentativi indipendenti necessari per ottenere il **primo successo**.
- **Formula:** $\Pr(X = n) = (1 - p)^{n-1} p$    (ovvero $n-1$ fallimenti seguiti da un successo).
	- moltiplichiamo perché sono indipendenti
- **Valore Atteso:** $E[X] = \frac{1}{p}$.
- **Memoryless Property (Assenza di memoria):** Sapere che i primi $k$ tentativi sono falliti non cambia la probabilità del numero di tentativi rimanenti. È come se il processo ripartisse da zero:$$\Pr(X = n+k \mid X > k) = \Pr(X = n)$$
## 6. Coupon Collector's Problem
Un problema classico per stimare il tempo di completamento di una collezione (o la saturazione di una tabella hash).
- **Problema:** Ci sono $n$ tipi di coupon. Quante scatole devo comprare per averli tutti almeno una volta?
- **Modellazione:** Sia $X$ il numero totale di scatole e $X_i$ il numero di scatole comprate per trovare l' $i$-esimo coupon nuovo (mentre ne avevamo già $i-1$).
- $X_i$ segue una **distribuzione geometrica** con probabilità di successo $p_i = \frac{n - (i-1)}{n}$.
- Il valore atteso per ogni fase è $E[X_i] = \frac{1}{p_i} = \frac{n}{n-i+1}$.
- **Risultato Finale:** Per linearità, il tempo atteso totale è:$$E[X] = \sum_{i=1}^n E[X_i] = n \sum_{i=1}^n \frac{1}{i}$$
  Poiché $\sum \frac{1}{i}$ è la serie armonica che approssima $\ln n$, il valore atteso è circa **$n \ln n + \Theta(n)$**.

![[Pasted image 20260330104800.png]]


>[!tip] *Suggerimento per l'orale:* 
>Ricorda bene che la **linearità del valore atteso** non richiede l'indipendenza: è una domanda tipica dei professori per trabocchetto!


---




