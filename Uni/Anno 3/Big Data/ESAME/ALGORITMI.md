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
