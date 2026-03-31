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
La probabilità condizionata che un evento `E` capiti sapendo che un evento `F` è già accaduto è data dall'intersezione delle loro probabilità fratto la probabilità di `F`
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


# MITZ-UPFAL CH-03
## Disuguaglianza di Markov
È lo strumento più semplice per porre un limite superiore (upper bound) alla probabilità che una variabile aleatoria superi una certa soglia.
>[!lemma] Teorema 
>Per ogni variabile aleatoria **non negativa** $X$ e per ogni $a > 0$:$$\Pr(X \geq a) \leq \frac{E[X]}{a} \ \ \ \ \frac{\rightarrow \text{valor medio}}{\rightarrow \text{soglia}}$$
* **Caratteristiche:**
    * Non richiede l'indipendenza.
    * È un "bound" debole perché usa solo il valore atteso (poca informazione).
    * è utile se il risultato è $< 1$, ossia se `a` è molto grande
* **Esempio (Coin Flips):** Qual è la probabilità di ottenere più di $3N/4$ teste in $N$ lanci?
    *   $E[X] = N/2$. Applicando Markov: $\Pr(X \geq 3N/4) \leq \frac{N/2}{3N/4} = \frac{2}{3}$.
    *   *Nota:* Questo limite è molto pessimistico, la probabilità reale è molto più bassa.
![[Pasted image 20260331154817.png]]


## Varianza e Deviazione Standard 
Mentre il valore atteso indica il "centro", la **varianza** misura quanto i valori sono dispersi attorno ad esso.
* **Definizione:** $Var[X] = E[(X - E[X])^2] = E[X^2] - (E[X])^2$.
* **Deviazione Standard ($\sigma$):** $\sigma(X) = \sqrt{Var[X]}$. Ha la stessa unità di misura di $X$.
*   **Intuizione grafica:**
    ![[Pasted image 20260331154927.png|550]]


## Disuguaglianza di Chebyshev 
È più potente di Markov perché sfrutta la varianza per limitare la deviazione in entrambe le direzioni (troppo grande o troppo piccolo).
>[!lemma] Teorema 
>Per ogni variabile aleatoria $X$: $$\Pr(|X - E[X]| \geq a) \leq \frac{Var[X]}{a^2}$$
* **Logica:** La probabilità che la r.v. $X$ si discosti dal suo valore medio per un fattore additivo $a$ è limitata dal rapporto tra varianza e $a^2$.
>[!tip]- Dimostrazione (usando Markov)
>![[Pasted image 20260331155703.png]]


>[!lemma] Teorema
>Per ogni variabile aleatoria $$Pr(|X - E[X]| \ge a\sigma[X]) \le \frac 1 {a^{2}}$$



>[!lemma] Teorema dell'Indipendenza 
>Se $X$ e $Y$ sono **indipendenti**:
>    1.  $E[XY] = E[X] \cdot E[Y]$
>    2.  $Var[X + Y] = Var[X] + Var[Y]$ (La varianza della somma è la somma delle varianze).


## Analisi dei Coin Flips con Chebyshev
Riprendendo l'esempio di $N$ lanci di moneta (Bernoulli trial):
* Per una singola moneta (Bernoulli $p=1/2$): $E[X_i] = 1/2$ e $Var[X_i] = p(1-p) = 1/4$.
* Per $N$ lanci indipendenti (Binomiale): $E[X] = N/2$ e $Var[X] = N/4$.
* **Bound di Chebyshev:** La probabilità di avere $X \geq 3N/4$ (ovvero una deviazione $\geq N/4$ dalla media) è: $$\Pr(|X - N/2| \geq N/4) \leq \frac{N/4}{(N/4)^2} = \frac{4}{N}$$
* **Conclusione:** Rispetto al $2/3$ di Markov, il limite di Chebyshev ($4/N$) è **significativamente migliore** perché diminuisce all'aumentare di $N$.

![[Pasted image 20260331160407.png]]


## Distribuzioni e Varianze Notevoli (Slide 15, 29-36)

### Variabile Binomiale ($B(n, p)$)
*   Somma di $n$ prove di Bernoulli indipendenti.
![[Pasted image 20260331160509.png]]

### Variabile Geometrica (Primo successo al tentativo $n$)
- **Definizione:** una variabile aleatoria geometrica `X` con un parametro `p` è data da $$Pr(X=n) = (1-p)^{n-1}p$$con `n = 1, 2,...` 
* **Valore Atteso:** $E[X] = 1/p$.
* **Varianza:** $Var[X] = \frac{1-p}{p^2}$.
* **Memoryless Property:** Il processo "dimentica" i fallimenti passati. $\Pr(X = n+k | X > k) = \Pr(X = n)$.

## 6. Coupon Collector's Problem: Bound Avanzati
Abbiamo già visto che il tempo atteso è $E[X] = nH_n \approx n \ln n$. 

>[!question] Come varia questo tempo?
* **Con Markov:** $\Pr(X \geq 2nH_n) \leq 1/2$. (Poco utile).
* **Con Chebyshev:** Si dimostra che $Var[X] \leq \frac{\pi^2 n^2}{6}$. 
	* Applicando Chebyshev, la probabilità di deviazione decresce come $O(\frac 1 {\ln^2 n})$. (Molto meglio)
* **Direct Bound & Union Bound:**
    * **Union Bound:** La probabilità che si verifichi almeno uno tra più eventi è $\leq$ alla somma delle singole probabilità: $$\Pr(\cup A_i) \leq \sum \Pr(A_i)$$
    ![[Pasted image 20260331161401.png]]![[Pasted image 20260331161452.png]]
    * Per l'**Union Bound**, la probabilità che *almeno un* coupon manchi è $\leq n \cdot e^{-(n \ln n + cn)/n} = e^{-c}$.
    *   Se scegliamo $c = \ln n$ (ovvero $t = 2n \ln n$), la probabilità di fallimento è solo $\frac 1 n$.
	    ![[Pasted image 20260331161606.png]]

## Legge dei Grandi Numeri
Spiega perché campionare più volte un fenomeno ci dà una stima precisa.
* **Vantaggio dei campioni multipli:** Se prendiamo la media di $n$ variabili indipendenti $\bar{X} = \frac{1}{n}\sum X_i$, la varianza della media è: $$Var[\bar{X}] = \frac{1}{n^2} \sum Var[X_i] = \frac{Var[X]}{n}$$    *La varianza diminuisce linearmente col numero di campioni!*
* **Legge Debole dei Grandi Numeri:** Al crescere del numero di campioni $n$, la media campionaria $\bar{X}_n$ converge quasi certamente al valore atteso reale $E[X]$. $$\lim_{n \to \infty} \Pr(|\bar{X}_n - E[X]| \leq \epsilon) = 1$$*In Big Data, questo giustifica l'uso del campionamento (sampling) per approssimare proprietà di dataset enormi.*
