# MITZ-UPFAL CH01
## Verifica moltiplicazioni tra matrici
### 1. Problema
- voglio verificare se una moltiplicazione tra matrici è corretta
- **input**: tre matrici ( A, B, C ) di dimensione $n \times n$ 
- **output**: dire se $A \cdot B = C$ 
- **contesto**:
    - moltiplicare costa $O(n^3)$
    - voglio verificare più velocemente (big data → meno tempo)

### 2. Parametri
- `n`: dimensione delle matrici

(non c’è ε esplicito, ma c’è probabilità di errore tipo ≤ 1/2)

### 3. Idea / come funziona
**intuizione:**  
invece di controllare tutta la matrice, controllo una “proiezione” casuale

**passi:**
1. genero un vettore random $r \in \{0,1\}^n$
2. calcolo:
    - `Br`
    - `A(Br)`
    - `Cr`
3. confronto:
    - se `A(Br) = Cr` → probabilmente corretto
    - se diversi → sicuramente sbagliato

**strutture usate:**
- vettore random
- moltiplicazioni matrice-vettore

👉 costo molto più basso: niente matrice × matrice

### 4. Analisi
#### tempo
- moltiplicazione matrice-vettore: $O(n^2)$
- totale: $O(n^2)$
    👉 molto meglio di $O(n^3)$
#### spazio
- $O(n^2)$ per le matrici
- $O(n)$ per il vettore
#### accuratezza
- se $AB = C$ → sempre corretto
- se $AB \neq C$ → può sbagliare
![[Pasted image 20260323145631.png]]
##### errore
- probabilità errore ≤ 1/2 (per un test)
##### probabilità
- ripetendo k volte → errore ≤ $(1/2)^k$
👉 quindi diventa affidabile velocemente

>[!tip] Frase da esame
>Controllo la correttezza della moltiplicazione usando un vettore random, riducendo il costo da $O(n^3)$ a $O(n^2)$ con errore probabilistico controllato.


---

## Min-Cut
### 1. Problema
- voglio trovare un **min-cut** di un grafo non orientato
- **input**: un grafo $G=(V,E)$ con (n) vertici
- **output**: un taglio di cardinalità minima, cioè il più piccolo insieme di archi la cui rimozione disconnette il grafo
- **contesto**: il problema serve, per esempio, in affidabilità di rete e clustering; l’algoritmo è randomizzato e non sempre restituisce il min-cut al primo tentativo

### 2. Parametri
- $n = |V|$: numero di vertici
- $m = |E|$: numero di archi
- $k$: dimensione del min-cut
- algoritmo randomizzato con **errore a una sola faccia**: se trova un taglio, quello è sempre un taglio valido, ma potrebbe non essere il minimo

### 3. Idea / come funziona
**Intuizione:**  
se non contraggo mai un arco che appartiene a un min-cut fissato (C), allora alla fine quel taglio sopravvive fino agli ultimi 2 nodi e lo ritrovo correttamente. Il punto è quindi evitare, durante le contrazioni, gli archi del min-cut.

**Passi principali:**
1. scelgo uniformemente a caso un arco tra quelli rimasti
2. lo **contraggo**: unisco i suoi due estremi in un solo super-nodo
3. elimino i self-loop, ma tengo eventuali archi paralleli
4. ripeto finché restano solo 2 vertici
5. restituisco gli archi tra questi 2 vertici: quello è il cut trovato

**Strutture usate:**
- grafo con contrazioni successive
- super-nodi
- archi paralleli ammessi, self-loop eliminati

### 4. Analisi
**Tempo**
- una singola esecuzione fa `n-2` contrazioni
    - **una run**: (n-2) passi di contrazione
    - il costo totale dipende da come rappresenti il grafo

**Spazio**
- devo mantenere il grafo corrente durante le contrazioni
- quindi spazio dell’ordine della rappresentazione del grafo

**Accuratezza**
- se durante tutta l’esecuzione non viene mai contratto un arco del min-cut (C), allora l’algoritmo restituisce proprio (C)

**Errore**
- la probabilità che una singola esecuzione trovi un min-cut è almeno  $$
    \frac{2}{n(n-1)}  
    $$  
- quindi la probabilità di errore in una sola run è al più  $$  
    1 - \frac{2}{n(n-1)}  
    $$

**Probabilità**
- ripetendo l’algoritmo circa  $$
    n(n-1)\ln n  
    $$
    volte e prendendo il taglio più piccolo trovato, la probabilità di fallire diventa molto piccola, al più circa $1/n^2$    

>[!tip] Frase finale da appunti
L’algoritmo di min-cut contrae archi scelti uniformemente a caso fino a lasciare 2 super-nodi. È corretto se non contrae mai un arco del min-cut. Una singola esecuzione ha probabilità di successo almeno $2/[n(n-1)]$, quindi va ripetuto più volte per avere alta affidabilità.


---

# MITZ-UPFAL CH02
## Randomized QuickSort ($Q\_S$) 
A differenza della versione classica, il **Randomized QuickSort** effettua una scelta randomica interna per garantire l'efficienza indipendentemente dall'input.

**Procedura:**
1. **Input:** Un insieme $S$.
2. **Scelta del Pivot:** Si sceglie un elemento $y$ in modo **uniforme e casuale** da $S$.
3. **Partizionamento:** 
   - $S_1 = \{x \in S - \{y\} \mid x \leq y\}$
   - $S_2 = \{x \in S - \{y\} \mid x > y\}$
4. **Ricorsione:** Si applica $Q\_S$ a $S_1$ e $S_2$ finché gli insiemi non sono vuoti o unitari.
5. Vengono ritornate le liste $$Q_{S}(S_{1}), y, Q_{S}(S_{2})$$
> [!tip] Osservazione
> È un algoritmo di tipo **Las Vegas**: l'output è sempre corretto (l'array sarà sempre ordinato), ma il tempo di esecuzione è una variabile aleatoria.

## Analisi del Tempo Atteso (Dimostrazione)
![[Pasted image 20260330110412.png]]

L'obiettivo è dimostrare che il numero atteso di confronti $E[T]$ è $O(n \log n)$.
### A. Definizione delle Variabili Indicatore (Riferimento Teorico: Bernoulliane)
Per analizzare il tempo, ci concentriamo sul numero di **confronti**. 
Siano $s_1, s_2, \dots, s_n$ gli elementi di $S$ in ordine crescente.
Definiamo una variabile aleatoria indicatore $X_{i,j}$:
- $X_{i,j} = 1$ se $s_i$ viene confrontato con $s_j$.
- $X_{i,j} = 0$ altrimenti.

Il numero totale di confronti è $T = \sum_{i=1}^n \sum_{j>i} X_{i,j}$. Per la **linearità del valore atteso**, avremo:
$$E[T] = \sum_{i=1}^n \sum_{j>i} E[X_{i,j}] = \sum_{i=1}^n \sum_{j>i} \Pr(X_{i,j} = 1)$$
>[!tip] Le due sommatorie
>Le due sommatorie servono a **scorrere sistematicamente tutte le coppie distinte** di elementi $(s_i, s_j)$ dell'insieme. La prima fissa l'elemento $i$, la seconda scorre tutti gli elementi $j$ successivi ad $i$. In questo modo sommiamo la probabilità di confronto di ogni singola coppia possibile per ottenere il numero totale di confronti attesi.


### B. Probabilità di confronto
Quando vengono confrontati due elementi $s_i$ e $s_j$?
- Due elementi vengono confrontati **solo se** uno dei due viene scelto come pivot mentre fanno ancora parte dello stesso sotto-problema.
	- Se viene scelto come pivot un elemento $s_k$ tale che $i < k < j$ prima di $s_i$ o $s_j$, i due finirebbero in sotto-problemi diversi e **non verrebbero mai più confrontati**.
- **Logica:** Consideriamo l'insieme di elementi $\{s_i, s_{i+1}, \dots, s_j\}$. La dimensione di questo set è $j - i + 1$ Il confronto tra $s_i$ e $s_j$ avviene se e solo se il primo pivot scelto tra questi è o $s_i$ o $s_j$.

Dato che la scelta del pivot è uniforme, la probabilità che uno di questi due sia scelto per primo è:
$$\Pr(X_{i,j} = 1) = \frac{2}{j - i + 1}$$


### C. Calcolo Finale (Riferimento Teorico: Serie Armonica)
Sostituendo la probabilità nella sommatoria:
$$E[T] = \sum_{i=1}^n \sum_{j=i+1}^n \frac{2}{j - i + 1}$$
Cambiando l'indice della sommatoria ($k = j - i + 1$):
$$E[T] \leq \sum_{i=1}^n \sum_{k=1}^n \frac{2}{k} = 2n \sum_{k=1}^n \frac{1}{k}$$
Poiché $\sum_{k=1}^n \frac{1}{k}$ è la **Serie Armonica ($H_n$)** che approssima $\ln n$:
$$E[T] = 2n H_n = O(n \log n)$$


## QuickSort Deterministico ($DQ\_S$)
Nella versione deterministica, il pivot non è scelto a caso ma è, ad esempio, sempre il **primo elemento** dell'insieme.
- **Problema:** Se l'input è già ordinato (o quasi ordinato), il tempo di esecuzione degrada a $O(n^2)$ perché il partizionamento è sbilanciato.

### Analisi Probabilistica del QuickSort Deterministico 
Sebbene l'algoritmo sia deterministico, possiamo farne un'**analisi probabilistica** assumendo che l'input sia "buono".

>[!lemma] **Teorema** 
>Se l'input è una **permutazione casuale** uniforme degli elementi, allora il tempo atteso di $DQ\_S$ è $O(n \log n)$.

### Differenza Fondamentale (Domanda d'esame!):
- **Randomized Algorithm ($Q\_S$):** L'algoritmo usa una sorgente interna di casualità. Le ottime prestazioni valgono per **qualsiasi** input (non esistono "bad input", solo "bad choices" del pivot molto improbabili).
- **Probabilistic Analysis of Deterministic Algorithm ($DQ\_S$):** L'algoritmo è fisso. Le ottime prestazioni valgono solo se assumiamo che la distribuzione dell'**input** sia casuale. Se l'input è strutturato male, l'algoritmo fallisce sistematicamente.

>[!tip] Riassunto Classificazione
>- **Monte Carlo:** Può produrre un risultato errato (con bassa probabilità). Il tempo di esecuzione è spesso fisso.
>- **Las Vegas:** Produce **sempre** il risultato corretto. Il tempo di esecuzione è la variabile aleatoria (es. QuickSort probabilistico).


---

# MITZ-UPFAL CH-03
## Algoritmo per il Calcolo della Mediana
### Il Problema
La **mediana** di un insieme $X$ di $n$ elementi è l'elemento in posizione $\lceil n/2 \rceil$ una volta ordinato l'insieme.

**Approccio Deterministico:** Ordinare l'intero set costa $O(n \log n)$. 
- Esiste un algoritmo deterministico $O(n)$ (il *Median-of-Medians*), ma è estremamente complesso e ha costanti molto alte, rendendolo poco pratico per i Big Data.

**Approccio Randomizzato:** L'obiettivo è trovare la mediana con un tempo di calcolo **lineare** $O(n)$ e un'alta probabilità di successo, usando solo una piccola porzione dei dati.

### Randomized Median Algorithm
L'idea è creare un "piccolo" sotto-insieme $C$ (candidati) che contenga con certezza la mediana e che sia abbastanza piccolo da essere ordinato velocemente.
#### Step dell'algoritmo:
1. **Campionamento:** Si estraggono $s = n^{3/4}$ elementi da $S$ in modo casuale (con reinserimento) e si mettono in un multi-set $R$.
2. **Ordinamento del campione:** Si ordina $R$. Essendo $|R| = n^{3/4}$, il costo è $O(n^{3/4} \log n)$, che è **sub-lineare** rispetto a $n$.
3. **Scelta dei Pivot ($d$ e $u$):** Si scelgono due elementi da $R$ che facciano da pivots per delimitare la mediana:
    - $d$ (down): l'elemento in posizione $(\frac{1}{2} n^{3/4} - \sqrt{n})$ in $R$.
    - $u$ (up): l'elemento in posizione $(\frac{1}{2} n^{3/4} + \sqrt{n})$ in $R$.
4. **Filtraggio:** Si confrontano tutti gli elementi di $S$ con $d$ e $u$ per trovare l'insieme $C = \{x \in S : d \leq x \leq u\}$. Durante questo passaggio si contano anche quanti elementi sono più piccoli di $d$ ($\ell_d$) e quanti più grandi di $u$ ($\ell_u$).
	- se $\ell_{d} > \frac n 2$ oppure $\ell_{u} > \frac n 2$ -> FALLISCI
		- se più della metà degli elementi sono più piccoli di `d` o più grandi di `u` vuol dire che `C` è troppo piccolo e la mediana sta fuori 
5. **Verifica e Output:** L'algoritmo fallisce se la mediana non è in $C$ (già visto prima) o se $C$ è troppo grande. Altrimenti, si ordina $C$ e si estrae la mediana.
	- per ordinarlo dobbiamo avere $|C| \le 4n^{\frac 3 4}$ 

![[Pasted image 20260331164617.png]]

### Intuizioni
![[Pasted image 20260331171614.png]]

### Condizioni di Fallimento
Sia $Y_{1}$ il numero di campioni sotto la mediana.
Sia $Y_{2}$ il numero di campioni sopra la mediana.

L'algoritmo fallisce se accade uno dei seguenti eventi:
- **$E_1$:** Ci sono troppi pochi campioni piccoli in $R$ ($Y_1 < \frac{1}{2} n^{3/4} - \sqrt{n}$), il che porta $R$ a essere troppo spostato a `sx`
- **$E_2$:** Ci sono troppi pochi campioni grandi in $R$,  il che porta $R$ a essere troppo spostato a `dx`
- **$E_3$:** L'insieme dei candidati $C$ è troppo grande ($|C| > 4n^{3/4}$), rendendo l'ordinamento finale troppo costoso.

## Analisi Probabilistica
Per dimostrare che l'algoritmo funziona "quasi sempre", usiamo la **Disuguaglianza di Chebyshev**.

### Analisi di $E_1$ (per $E_{2}$ è identica) (Varianza e Chebyshev):
- Ogni estrazione in $R$ è una **Bernoulliana** con $p=1/2$ (metà elementi sono $\leq$ mediana).
- $Y_1$ segue quindi una **Binomiale** con $n^{3/4}$ prove.
- **Valore Atteso:** $E[Y_1] = \frac{1}{2} n^{3/4}$.
- **Varianza:** $Var[Y_1] = n^{3/4} \cdot \frac{1}{2} \cdot \frac{1}{2} = \frac{1}{4} n^{3/4}$.

Applichiamo **Chebyshev** per vedere quanto è probabile che $Y_1$ si allontani dalla media di un fattore $\sqrt{n}$ (che è la distanza fissata per il pivot $d$):
$$\Pr(E_1) \leq \Pr(|Y_1 - E[Y_1]| \geq \sqrt{n}) \leq \frac{Var[Y_1]}{(\sqrt{n})^2} = \frac{\frac{1}{4} n^{3/4}}{n} = \frac{1}{4} n^{-1/4}$$

Lo stesso vale per $Pr(E_{2})$.


### Analisi di $E_{3}$
L'evento $E_3$ si verifica se l'insieme dei candidati $C$ è troppo grande ($|C| > 4n^{3/4}$). Se $C$ è troppo grande, l'ordinamento finale non sarebbe più efficiente. 

**Logica della dimostrazione:**
Perché $|C|$ sia maggiore di $4n^{3/4}$, deve accadere che i pivot $d$ e $u$ siano finiti "troppo lontano" dalla mediana reale. In particolare, definiamo due sotto-eventi:
1.  **$\mathcal{E}_{3,1}$**: Almeno $2n^{3/4}$ elementi di $C$ sono più grandi della mediana (ovvero $u$ è troppo a destra).
2.  **$\mathcal{E}_{3,2}$**: Almeno $2n^{3/4}$ elementi di $C$ sono più piccoli della mediana (ovvero $d$ è troppo a sinistra).

Se $|C| > 4n^{3/4}$, allora almeno uno di questi due eventi deve essersi verificato.

La probabilità che si verifichi $\mathcal{E}_{3,1}$ (vale lo stesso per $\mathcal{E}_{3,2}$) è $$\Pr(\mathcal{E}_{3,1}) \leq \frac{Var[X]}{(\sqrt{n})^2} = \frac{\frac{1}{4}n^{3/4}}{n} = \frac{1}{4}n^{-1/4}$$
Quindi $$Pr(E_{3}) \le \frac 1 2 n^{-1/4}$$

### Conclusione:
- Sommando le probabilità di fallimento (Union Bound), si dimostra che la probabilità di successo è:$$P(Successo) \geq 1 - \frac{1}{n^{1/4}}$$
- **Risultato:** L'algoritmo trova la mediana in tempo **$O(n)$** con probabilità che tende a $1$ per $n$ molto grande (**With High Probability**).





