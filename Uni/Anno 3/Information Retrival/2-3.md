# Definizione di Information Retrival
L’Information Retrieval è il processo di trovare materiale (di solito documenti), di natura non strutturata (generalmente testo), che soddisfa un bisogno informativo dell’utente all’interno di grandi collezioni di dati, solitamente memorizzate su computer.

# ASSUNZIONI DI BASE
- Una **collezione** è un insieme di documenti -> nei modelli base si assume sia statica.
- L’obiettivo dell’Information Retrieval è **trovare i documenti rilevanti** rispetto a un certo **information need** (bisogno informativo dell’utente).

In pratica:  
	l’utente vuole un'informazione (INFORMATION NEED) -> formula una domanda (QUERY) → il sistema deve restituire i documenti più utili.

---

# MODELLO CLASSICO
Nei modelli classici di IR i documenti e le query vengono rappresentati in uno **spazio di termini**.

Ogni documento può essere visto come un **vettore di termini**.

---

# ORDINAMENTO (RANKING)
Un punto fondamentale nei sistemi di IR è **ordinare i documenti**.

Non basta trovare i documenti che contengono i termini della query ma bisogna anche **decidere quali sono i più rilevanti** e mostrarli per primi.

---

# MOTORE DI RICERCA
Un **motore di ricerca** è composto da una **catena di elaborazioni**.
![[Pasted image 20260306173602.png]]
La query dell’utente passa attraverso vari step fino a produrre una lista ordinata di documenti.

La prestazione del sistema di solito si misura **end-to-end**, cioè considerando tutta la catena e non i singoli step.

---

# VALUTAZIONE DI UN SISTEMA IR
Le due metriche principali sono:
- PRECISION  
	Conta **quanti documenti rilevanti hai recuperato rispetto a tutti i documenti che il sistema ha restituito**. $$\text{Presicion} = \frac {\text{documenti rilevanti recuperati}} {\text{documenti recuperati}}$$

- RECALL  
	Conta **quanti documenti rilevanti hai recuperato rispetto a tutti i documenti rilevanti che esistono nella collezione**. $$\text{Recall} = \frac {\text{documenti rilevanti recuperati}} {\text{documenti rilevanti totali}}$$


In generale:
- precision → qualità dei risultati
- recall → copertura dei risultati

Spesso si cerca di **massimizzare la recall**, soprattutto se si deve scegliere tra le due.

Anche queste metriche vengono normalmente valutate **end-to-end**.

---

## Problema di esempio (Shakespeare)
![[Pasted image 20260306174453.png]]

# Soluzione: INDICIZZAZIONE
Vari approcci.
## Term-Document Incidence Matrix
Un primo modello è la **matrice termine-documento**.

Struttura:
- righe -> termini
- colonne -> documenti

Valore:
- 1 -> il termine appare nel documento
- 0 -> non appare

### ESEMPIO
|term|doc1|doc2|doc3|
|---|---|---|---|
|Brutus|1|1|0|
|Caesar|1|1|1|
|Calpurnia|0|1|0|
Questa matrice permette di risolvere query logiche.

>[!example] ESEMPIO
>Brutus AND Caesar AND NOT Calpurnia
>-> riga brutus `110`
>-> `AND`
>-> riga caesar `111`
>-> `AND`
>-> `NOT` riga calpurnia `101`
>
>RISULTATO `100`

>[!problem] PROBLEMA DELLA MATRICE
>Se abbiamo tanti documenti e tanti termini distinti diventa troppo grande (e la maggior parte delle celle sono a 0) -> matrice sparsa


>[!question]- DOMANDA DA ESAME  
Differenza tra **notazione sparsa** e **notazione densa**
>
>Ci sono due aspetti da considerare:
>
>1. **la natura del fenomeno**
>2. **come lo rappresento**
>
>Notazione densa  
Si memorizzano solo i valori significativi.  
Gli **zeri non vengono salvati nella matrice**.
>
Notazione sparsa  
Si memorizzano **tutti i valori**, quindi anche gli **0 e gli 1**.

---

# STRUTTURA DATI UTILIZZATA: INDICE INVERSO
La struttura dati principale dei motori di ricerca è l’**indice inverso**.

Idea:
Per ogni termine si memorizza **la lista dei documenti che lo contengono**.

Ogni documento è identificato da un **docID**, cioè un numero.

Quindi abbiamo:
- un **dizionario dei termini**
- per ogni termine una **posting list**
### Esempio pratico
```
Brutus → 1,2,4,11,31
Caesar → 1,2,4,5,6
Calpurnia → 2,31
```


---

### POSTING LIST
Una **posting list** è la lista dei documenti che contengono un certo termine.

Esempio concettuale:
```
termine → lista di docID
```
Per implementarla **non si usa un array** (perché ha lunghezza fissa).

Si usa una **linked list**, che può crescere dinamicamente.


---

# PIPELINE DI COSTRUZIONE DELL’INDICE
### Step 1 – Raccolta documenti
I documenti vengono raccolti in una **collection**.

Ogni documento riceve un **docID**, cioè un identificatore numerico unico.

Esempio:
```
Doc1  
Doc2  
Doc3
```


### Step 2 – TOKENIZZAZIONE
Il testo dei documenti viene trasformato in **token**, cioè unità di testo (di solito parole).
##### ESEMPIO
`Friends, Romans, countrymen`
Trasformato in token diventa
```
Friends
Romans
Countryman
```

Risultato: **token stream**.


### STEP 3 – MODULI LINGUISTICI
I token possono essere trasformati in una forma più standard.

Possibili operazioni:
- normalizzazione
- stemming
- lemmatizzazione
- rimozione stop words.

Risultato:
```
Friends → friend  
Romans → roman  
countrymen → countryman
```

>[!tip]- LEMMATIZZAZIONE
>La **lemmatizzazione** porta le parole alla **forma base (lemma)**.
>
Esempio:
mangiava → mangiare  
running → run
>
L’idea è ridurre le varianti della stessa parola.


### Step 4 – Creazione coppie (term, docID)
Dopo il preprocessing si crea una lista di coppie:
```
(termine, docID)
```

Esempio:
```
I 1
did 1
enact 1
julius 1
caesar 1
...
so 2
let 2
it 2
```


### PASSAGGIO CHIAVE Step 5 – Ordinamento
Il passo fondamentale dell’indicizzazione è **ordinare le coppie per termine**.

Dopo l’ordinamento, tutte le occorrenze dello stesso termine sono vicine.

```
brutus 1
brutus 2
caesar 1
caesar 2
caesar 2
...
```


### Step 6 – Creazione dictionary e postings
Ora le occorrenze dello stesso termine vengono **raggruppate**.
Le occorrenze duplicate nello stesso documento vengono **unificate**.

Risultato:
```
brutus → 1,2
caesar → 1,2
```
Il dictionary memorizza anche la **document frequency** cioè il numero di documenti che contengono il termine.


---

# Creazione di dictionary e postings
A questo punto la struttura viene separata in due parti.

### Dictionary
Contiene:
- il termine
- la **document frequency**

La **document frequency** indica **in quanti documenti compare il termine**.

Esempio:
```
brutus → df = 2  
caesar → df = 2
```

### Postings list
Per ogni termine abbiamo la lista dei documenti:
```
brutus → 1 → 2  
caesar → 1 → 2
```

Le liste sono **ordinate per docID**.

Questo è fondamentale perché permette di eseguire velocemente le query.

_inserisci immagine: schema completo dictionary + postings lists dopo il raggruppamento_

---

# Dove vengono salvati i dati
Nei sistemi reali:
- il **dictionary** è spesso mantenuto **in memoria**
- le **postings lists** sono salvate **su disco**

Motivo:
- il dictionary è relativamente piccolo
- le postings possono essere molto grandi


## Strutture dati per le posting list
![[Pasted image 20260306182613.png]]


---

# Query processing con un inverted index
Una volta costruito l’indice, il problema diventa:
	**come rispondere a una query dell’utente?**

Nel **Boolean Retrieval Model** una query è un’espressione logica con operatori:
- **AND**
- **OR**
- **NOT**

Il sistema deve restituire **i documenti che soddisfano la condizione logica**.


# Passi per processare una query AND
Consideriamo la query:
```
Brutus AND Calpurnia
```

Il motore di ricerca esegue questi passaggi.

### 1. Cerca il termine nel dictionary
Trova **Brutus** nel dictionary.

### 2. Recupera la postings list
Ottiene la lista dei documenti dove appare:
```
Brutus → 1, 2, 4, 11, 31, 45, 173, 174
```

### 3. Cerca il secondo termine
Trova **Caesar** nel dictionary.

### 4. Recupera la seconda postings list
```
Calpurnia → 2, 31, 54, 101
```


### 5. Interseca le due liste
Ora bisogna trovare i documenti che contengono **entrambi i termini**.

Quindi si fa l’**intersezione** delle postings lists.
![[Pasted image 20260311101911.png#center]]
Questi sono i documenti che contengono **sia Brutus che Caesar**.




>[!question] Perché le postings sono ordinate?
>Le postings lists sono **ordinate per docID**.
>
>Questo è fondamentale perché permette di fare l’intersezione in modo **molto efficiente**.
>
>Se le liste non fossero ordinate:
>
>- dovremmo confrontare ogni elemento con tutti gli altri
>    
>- costo molto alto.
>
>Con liste ordinate invece possiamo **scorrerle in parallelo**.


# Idea per l'intersezione: algoritmo di merge
Per calcolare l’intersezione si usa il **merge**.

L’idea è questa:
1. metti un puntatore all’inizio di ogni lista
2. confronta i docID
3. avanza nella lista con il docID più piccolo
4. quando i docID sono uguali → è un risultato
5. continui finché una delle due liste è finita

##### PseudoCodice
![[Pasted image 20260311102614.png]]

Esempio:
```
Brutus → 1 2 4 11 31
Caesar → 2 4 8 16
```

Confronti progressivi:
```
1 vs 2 → avanza Brutus
2 vs 2 → match
4 vs 4 → match
11 vs 8 → avanza Caesar
```

Risultato:
```
2, 4
```

# Complessità
Se una lista ha lunghezza **x** e l’altra **y**, il costo dell’intersezione è: $$O(x + y)$$cioè **lineare nella lunghezza delle liste**.

Questo è molto efficiente anche per collezioni molto grandi.


---

# Boolean Queries (Boolean Retrieval Model)
Nel **Boolean Retrieval Model** una query è un’espressione logica costruita con AND, OR, NOT.

Il modello Booleano è uno dei più semplici per costruire un sistema di Information Retrieval.
Vantaggi:
- è **preciso**
- il comportamento è **chiaro**
- l’utente controlla esattamente cosa cerca
Per questo è stato il **principale sistema di ricerca commerciale per molti anni**.

>[!tip]- Ancora oggi è usato in:
>- ricerca nelle **email**
>- cataloghi di **biblioteche**
>- ricerca nei **file locali**
>- alcuni database professionali (es. legali).

>[!example]- Esempio reale: sistemi legali (Westlaw)
Molti sistemi professionali usano ancora ricerche booleane.
Esempio di query legale:
`LIMIT! /3 STATUTE ACTION /S FEDERAL /2 TORT /3 CLAIM`
Significato degli operatori:
>- **/3** → entro 3 parole
>- **/S** → stessa frase
>- **!** → wildcard
Queste query sono:
>- lunghe 
>- molto precise
>- costruite manualmente dagli esperti.


>[!tip]- ESERCIZIO DA FARE
>![[Pasted image 20260311103536.png]]


# Ritornando al merging
Se avessimo una formula booleana arbitraria del tipo 
![[Pasted image 20260311103642.png]]
Potremmo ancora eseguire il merge in **tempo lineare**?
Possiamo fare meglio?

# Query optimization
Quando una query contiene **più termini con AND**, l’ordine con cui facciamo le intersezioni è molto importante.

Esempio di query:
```
Brutus AND Calpurnia AND Caesar
```

Per rispondere alla query dobbiamo:
1. recuperare le **postings lists**
2. fare le **intersezioni**

Ma la domanda è:
	**in quale ordine conviene farle?**


# Strategia ottimale
Supponiamo di avere queste postings lists:
```
Brutus      → 1 2 3 5 8 16 21 34
Caesar      → 2 4 8 16 32 64 128
Calpurnia   → 13 16
```

La regola usata nei motori di ricerca è:
	**intersecare prima le postings lists più piccole.**

Questo perché:
- l’intersezione può solo **ridurre il numero di documenti**
- quindi i risultati intermedi restano piccoli.


# Document Frequency
Nel dictionary l’indice memorizza anche la **document frequency**.

Document frequency = numero di documenti in cui compare il termine.

Esempio:
```
Calpurnia → df = 2  
Brutus → df = 8  
Caesar → df = 7
```

Grazie alla **df** possiamo sapere subito quale lista è più piccola **senza leggere le postings dal disco**.


# Algoritmo generale per le query `AND`
Per una query con più termini:
```
t1 AND t2 AND t3 ... tn
```

Il sistema fa:
1. ordina i termini per **document frequency crescente**
2. prende la postings list più piccola
3. la interseca con la successiva
4. continua fino alla fine.

Questo riduce il numero totale di confronti.


---

# Phrase Queries
Una **phrase query** è una query in cui l’utente cerca **una sequenza precisa di parole**.

Esempio:
```
"stanford university"
```

In questo caso il sistema deve trovare **solo i documenti in cui le parole compaiono nello stesso ordine e consecutive**.

Esempio:
Documento:
```
I went to university at Stanford
```

Questo **non è un match**, perché le parole non sono consecutive.

Le phrase queries sono molto importanti perché:
- sono intuitive per gli utenti
- molte query sono in realtà **frasi implicite**

# Problema delle phrase queries
Un inverted index base memorizza solo:
```
term → lista documenti
```

Esempio:
```
stanford → 1, 3, 8
university → 1, 2, 8
```

Questo dice **in quali documenti appare ogni parola**, ma **non dice dove appare nel documento**.

Per questo servono **strutture più avanzate**.


## Primo tentativo: Biword Indexes
Una possibile soluzione è creare un indice di **biword**, cioè **coppie consecutive di parole**.

Esempio testo:
```
Friends, Romans, countrymen
```

Diventa:
```
friends romans
romans countrymen
```

Ogni coppia viene trattata come **un termine del dictionary**.

Quindi nell’indice avremo:
```
friends romans → docID
romans countrymen → docID
```


### Come si risolve una phrase query con biword
Esempio query:
```
"stanford university"
```

Se esiste il biword:
```
stanford university
```
nel dictionary, basta recuperare la sua postings list.

Quindi la ricerca diventa immediata.

### Frasi più lunghe
Se la frase ha più parole:
```
stanford university palo alto
```

si può spezzare in più biword:
```
stanford university
university palo
palo alto
```

La query diventa:
```
(stanford university) AND
(university palo) AND
(palo alto)
```

Quindi si fa una **query booleana tra biword**.

### Problema dei biword
#### 1. Falsi positivi
Il problema è che questa tecnica può produrre **false positives**.

Esempio:
Un documento contiene:
```
stanford university press in palo alto
```

Le coppie sono:
```
stanford university
university press
press in
in palo
palo alto
```

Ma il documento **non contiene la frase completa**:
```
stanford university palo alto
```

Quindi il sistema potrebbe restituire risultati **errati**.

#### 2. Crescita enorme dell’indice
Indicizzare tutte le coppie di parole fa crescere molto il dictionary.
Se un documento ha:
```
n parole
```

i biword sono:
```
n − 1
```

Quindi il numero di termini cresce molto.

#### 3. Non scalabile per frasi lunghe
Per frasi più lunghe di due parole il sistema diventa:
- complesso
- inefficiente
- poco preciso.


Per questi motivi **i biword indexes non sono la soluzione standard** ma vengono a volte usati come **tecnica complementare**.


## Secondo tentativo: Positional Index
Nel positional index, per ogni termine memorizziamo:
- il **numero di documenti che contengono il termine**
- per ogni documento, **le posizioni in cui il termine appare**

Struttura:
```
term → doc1: pos1, pos2, pos3 ...
       doc2: pos1, pos2 ...
```

Esempio:
```
< be: 993427 → 
1: 7, 18, 33, 72
2: 3, 149
4: 17, 191, 291,... >
```

Questo significa:
- be compare in 993427 documenti
- nel documento 1 la parola appare nelle posizioni 7, 18, 33, 72
- nel documento 2 nelle posizioni 3 e 149
- ecc.

### Perché serve
Con le posizioni possiamo verificare se una frase esiste davvero.

Esempio query:
```
"to be or not to be"
```

Il sistema:
1. recupera le postings dei termini
	![[Pasted image 20260311111132.png]]
2. confronta le **posizioni nei documenti**
3. verifica se le parole appaiono **in sequenza**.

### Come funziona la ricerca di una frase
Il sistema usa ancora un **algoritmo di merge**, ma ora deve confrontare anche le **posizioni**.

Esempio:
```
to → 2:1,17,74
be → 2:2,18
```

Nel documento 2:
```
to posizione 1
be posizione 2
```

Quindi esiste la frase **to be**.


### Proximity Queries
Con il positional index possiamo fare anche **proximity queries**.

Queste richiedono che due parole siano **vicine** ma non necessariamente consecutive.

Esempio:
```
word1 /3 word2
```

significa:
le due parole devono essere entro **3 parole di distanza**.

Esempio reale (sistemi legali):
```
LIMIT! /3 STATUTE /3 FEDERAL /2 TORT
```

Questo tipo di query è possibile **solo se conosciamo le posizioni delle parole**.


### Dimensione del Positional Index
Il positional index occupa più spazio rispetto a un indice normale, perché chiaramente qui memorizziamo anche le posizioni.

### Quanto spazio occupa
Regole pratiche:
- un positional index è circa **2–4 volte più grande** di un inverted index semplice
- la dimensione dell’indice è circa **35–50% del testo originale**

Questo dipende anche dalla lunghezza dei documenti.

>[!tip]- Pippone gigantesco (ma utile) del croce DA LEGGERE (forse anche da accorcaire)
>Quando si analizza il costo di un **positional index**, nelle slide viene fatto un ragionamento approssimato sulla quantità di bit necessari per rappresentare le informazioni che dobbiamo salvare. Si parte da una stima della dimensione di un documento. In molti esempi di Information Retrieval si assume che **un documento medio contenga circa 1000 parole**. Una parola nel testo occupa circa **6 byte**, includendo lettere, spazi e punteggiatura. Poiché **1 byte = 8 bit**, una parola occupa quindi circa **48 bit**. Se un documento contiene 1000 parole, la dimensione approssimativa del documento è **1000 × 6 byte = 6000 byte**, cioè circa **6 KB**.
Nel caso di un **positional index**, però, non salviamo il testo completo ma solo alcune informazioni strutturate. Per ogni termine nell’indice memorizziamo infatti la lista dei documenti in cui compare e, per ogni documento, **le posizioni in cui il termine appare**. Queste posizioni corrispondono al numero del token all’interno del documento. Ad esempio, se un documento è tokenizzato parola per parola, la prima parola avrà posizione 1, la seconda posizione 2, e così via.
>
Dato che un documento contiene circa **1000 parole**, le possibili posizioni di una parola nel documento vanno da **1 a 1000**. Per rappresentare questi valori dobbiamo capire quanti bit servono. In generale, per rappresentare **N valori distinti** servono circa **log₂(N) bit**. Nel nostro caso quindi dobbiamo calcolare **log₂(1000)**. Poiché **2¹⁰ = 1024**, circa **10 bit sono sufficienti per rappresentare qualsiasi posizione tra 1 e 1000**. Questo significa che, per salvare la posizione di una parola nel documento nel positional index, bastano circa **10 bit**.
>
Il ragionamento del professore serve a mostrare che salvare le posizioni delle parole nell’indice non è eccessivamente costoso in termini di memoria. Anche se il testo originale di una parola occupa circa **48 bit**, la sua **posizione nel documento può essere rappresentata con circa 10 bit**. Di conseguenza, l’indice posizionale aggiunge informazione utile (necessaria per rispondere a phrase queries o proximity queries) con un costo relativamente contenuto rispetto alla dimensione complessiva del testo.


# Combination Schemes: Positional index + Biword index
Nella pratica alcuni sistemi combinano più tecniche.

Per esempio:
- positional index
- biword index per alcune frasi molto comuni

Per queste frasi è più veloce avere **un termine diretto nel dictionary** invece di fare ogni volta il merge delle posizioni.

Usando questa combinazione 
- le query possono essere eseguite circa **4 volte più velocemente**
- ma l’indice occupa circa **26% di spazio in più**.

