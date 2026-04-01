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

![[Pasted image 20260401115048.png]]


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
Il problema è che questa tecnica può produrre **falsi positivi**.

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


---


# Index Construction
L’obiettivo della **costruzione dell’indice** è trasformare una collezione di documenti in una struttura dati che permetta di eseguire le query in modo **veloce ed efficiente**.

Nei sistemi di **Information Retrieval** questa struttura dati è l’**inverted index**.

Il processo di costruzione dell’indice consiste quindi nel:
1. analizzare i documenti
2. estrarre i termini
3. costruire le **postings lists**
4. organizzare i dati in modo efficiente per la ricerca -> ORDINARLI.

Questo processo deve essere **molto scalabile**, perché i motori di ricerca devono indicizzare **collezioni enormi di documenti**.


---

# Dataset di esempio: Reuters RCV1
Nelle slide viene usata come esempio la collezione **Reuters RCV1**.
Si tratta di un dataset molto usato nella ricerca sull’Information Retrieval.


Caratteristiche principali:

| simbolo | significato                         | valore            |
| ------- | ----------------------------------- | ----------------- |
| N       | numero di documenti                 | circa **800.000** |
| L       | numero medio di token per documento | circa **200**     |
| M       | numero di termini distinti          | circa **400.000** |

Da questi dati possiamo stimare il numero totale di **token** nella collezione:
```
T ≈ N × L
```

Quindi:
```
T ≈ 800000 × 200 = 160 milioni di token
```

Questo numero mostra chiaramente che la costruzione dell’indice deve gestire **quantità enormi di dati**.

![[Pasted image 20260314125906.png]]

## Token vs Term
Nel processo di indicizzazione bisogna distinguere tra:
### Token
Un **token** è una parola che appare nel testo dei documenti.

Esempio:
```
the
caesar
war
```

Un token può comparire **molte volte** nella collezione.

### Term
Un **term** è una parola **distinta** che appare nel dictionary dell’indice.
Ogni termine compare **una sola volta nel dictionary**, anche se appare in molti documenti.

Esempio:
```
dictionary:
the
caesar
war
```

### Differenza di lunghezza media
Nella slide sopra si osserva che:
- i **token** hanno lunghezza media circa **4.5 byte**
- i **termini distinti** hanno lunghezza media circa **7.5 byte**

Questo succede perché i termini rari tendono ad essere **più lunghi**.

Esempio:
```
token comuni:
the
is
and
```

```
termini rari:
electroencephalography
photosynthesis
```


---

# Problema della costruzione dell’indice
Ci sono due problemi fondamentali:
1. **dimensione dei dati** 
2. **limitazioni dell’hardware**

Infatti la collezione può contenere **centinaia di milioni di token**.

Questo significa che:
- non sempre possiamo tenere tutti i dati **in memoria**
- spesso dobbiamo usare **il disco**.


---

# Hardware Basics
## 1. La memoria è molto più veloce del disco
Accesso alla RAM:
```
≈ 10⁻⁹ secondi
```

Accesso al disco:
```
≈ millisecondi
```

La differenza può essere **milioni di volte**.

## 2. Il problema principale del disco è il seek time
Quando il disco deve leggere dati da una posizione diversa deve **spostare la testina**.

Questo tempo di movimento si chiama:
```
seek time
```

Valore tipico:
```
≈ 5 ms
```

Questo è **molto più lento** rispetto alle operazioni della CPU.

## 3. Accessi sequenziali sono molto più veloci
Leggere dati **in sequenza** dal disco è molto più efficiente rispetto a fare molti accessi casuali.

Quindi gli algoritmi di indicizzazione cercano di:
- evitare accessi casuali
- leggere grandi blocchi di dati.


---

# Uso della memoria durante la costruzione dell’indice
Un algoritmo semplice di indicizzazione potrebbe essere:
1. leggere tutti i documenti
2. generare tutte le coppie `(term, docID)`
3. ordinarle
4. costruire le postings lists.

Questo approccio funziona solo se **tutti i dati entrano in memoria**.

Ma nelle collezioni reali questo **non è possibile**, e mettere tutto nel disco comporterebbe troppi seek time.


---

# Using Disk
Quando la collezione è troppo grande per la memoria principale, dobbiamo usare **algoritmi che sfruttano il disco**.

L’idea generale è:
1. processare **solo una parte dei dati alla volta** (in memoria)
2. salvare i risultati intermedi su disco
3. combinarli successivamente.

Questo tipo di tecniche prende il nome di:
```
external memory algorithms
```
cioè algoritmi progettati per lavorare con dati più grandi della memoria disponibile.

Questi algoritmi sono fondamentali per i motori di ricerca reali.

## Algoritmi  

### 1. Blocked Sort-Based Indexing (BSBI)
L’idea è semplice:
- dividere la collezione in **blocchi più piccoli** di dimensione fissa
- processare **un blocco alla volta**
- salvare i risultati intermedi su **disco**
- infine **unire tutti i blocchi** per ottenere l’indice finale.

#### PSEUDOCODICE
![[Pasted image 20260314160243.png]]

#### Come funziona BSBI
Il processo avviene in **quattro fasi principali**:
1. dividere i documenti in **blocchi di dimensione uguale**
2. per ogni blocco generare le coppie `(termID, docID)`
3. **ordinare** queste coppie in memoria
4. salvare su disco un **indice invertito del blocco**

Alla fine tutti i blocchi vengono **uniti (merge)** per creare l’indice finale.

#### Creazione delle coppie (termID, docID)
Durante il parsing dei documenti:
- ogni termine viene convertito in un **termID**
- ogni documento ha un **docID**

Quindi il sistema genera coppie del tipo:
```
(termID, docID)
```

Esempio:
```
war → termID 15
documento 23

→ (15, 23)
```

Queste coppie vengono accumulate in memoria finché il blocco non è pieno.

#### Ordinamento del blocco
Quando il blocco è pieno:
1. le coppie `(termID, docID)` vengono **ordinate**
2. si costruisce l’**inverted index del blocco**
3. il risultato viene scritto su **disco**

L’inversione consiste nel trasformare:
```
(termID, docID)
```

in
```
termID → lista di docID
```
cioè la **posting list**.

Ogni blocco produce quindi **un indice invertito parziale**.

#### Merge dei blocchi
Dopo aver processato tutti i blocchi, abbiamo diversi **indici parziali** salvati su disco.

L’ultimo passo consiste nel **fonderli** in un unico indice.

Il merge funziona così:
1. si aprono **tutti i blocchi**
2. si leggono le postings list
3. si seleziona il **termID più piccolo**
4. si uniscono le postings list dello stesso termine
5. si scrive il risultato nell’indice finale.

Per farlo possiamo usare una struttura dati efficiente, ad esempio:
- **AVL tree**
- **priority queue**

Queste strutture permettono di trovare il prossimo termine con costo:
```
O(log n)
```
dove **n** è il numero di blocchi aperti.

#### Merge delle postings lists
Quando troviamo lo **stesso termine in più blocchi**, dobbiamo unire le loro postings lists.

Questo è semplice perché:
- le postings lists sono **già ordinate per docID**
- i blocchi sono stati costruiti in modo **incrementale**

Quindi per fare il merge basta concatenare le liste

Esempio:
```
blocco 1
brutus → d1, d3

blocco 2
brutus → d6, d7
```

Risultato finale:
```
brutus → d1, d3, d6, d7
```

Non serve riordinare perché i docID del secondo blocco sono **maggiori di quelli del primo**.


#### IMMAGINE EPLICATIVA
![[Pasted image 20260314160329.png]]

#### Complessità dell’algoritmo
- Divido il mio insieme di documenti in `b` blocchi
- Eseguo il merge per `b` volte su un blocco grande $\frac N b$ 

Quindi$$b \cdot \frac N b \cdot log\left(\frac N b\right) = N \cdot log\left(\frac N b\right)$$
#### Tempo reale di costruzione dell’indice
Nella pratica il tempo di indicizzazione è dominato da:
1. **parsing dei documenti**
2. **merge finale dei blocchi**
più che dall’ordinamento.


### 2. Single-pass In-Memory Indexing (SPIMI)
L’algoritmo **Blocked Sort-Based Indexing (BSBI)** scala bene, ma ha due problemi:
1. richiede una struttura per **mappare i termini in termID**
2. i blocchi sono di dimensione fissa, quindi potrebbe accadere che viene usato il 90% di memoria (perdendo un 10% importante)

Per questo si usa un algoritmo più scalabile chiamato:
```
Single-pass in-memory indexing (SPIMI)
```

### PSEUDOCODICE
![[Pasted image 20260314161152.png]]


#### Idea principale di SPIMI
La differenza principale rispetto a **BSBI** è che SPIMI:
- usa **direttamente i termini**
- non usa **termID**
- non costruisce prima le coppie `(termID, docID)`

Invece:
- ogni termine viene **inserito subito nel dictionary**
- la **postings list viene aggiornata immediatamente**

#### Come funziona SPIMI
L’algoritmo processa i documenti **token per token**.

Per ogni token:
1. si controlla se il termine è già nel **dictionary**
	- se non esiste → viene creato 
2. si crea una **postings list** (SE GIÀ NON È STATA CREATA)
3. il **docID viene aggiunto alla postings list**

Il dictionary è spesso implementato come:
```
hash table
```
per avere accesso veloce.

#### Postings list dinamiche
In SPIMI le postings list sono **dinamiche**.

Quando una postings list si riempie:
- viene allocata più memoria
- tipicamente si **raddoppia lo spazio disponibile**

Quindi:
```
dimensione nuova = 2 × dimensione precedente
```

Questo può sprecare un po’ di memoria, ma rende l’algoritmo **molto veloce**.

>[!TIP] Differenza principale con BSBI
Nel **BSBI**:
>1. si generano tutte le coppie `(termID, docID)`
>2. si ordinano
>3. poi si costruiscono le postings list
>
>Nel **SPIMI** invece:
>- le postings list vengono **costruite direttamente**
   > 
>- non serve il **sorting delle coppie** 
>
>Questo rende SPIMI:
>
>- **più veloce**
   > 
>- **più efficiente in memoria**

#### Scrittura su disco
Quando la memoria si esaurisce:
1. il dictionary e le postings list del blocco vengono scritti su **disco**
2. prima di scrivere, i **termini vengono ordinati**

Questo serve perché:
- i blocchi devono essere **ordinati lessicograficamente**
- così il **merge finale** diventa semplice.

#### Merge finale
Come in **BSBI**, anche SPIMI produce **più blocchi su disco**.

Alla fine:
- i blocchi vengono **fusi (merge)**
- si ottiene l’**inverted index finale**.

#### Compressione
SPIMI spesso utilizza anche **compressione** per:
- le **postings lists**
- il **dictionary**

Questo permette di:
- usare meno spazio su disco
- processare **blocchi più grandi in memoria**.

#### Complessità
La complessità temporale di SPIMI è:
```
Θ(T)
```

dove:
```
T = numero totale di token
```

Questo perché:
- non è necessario ordinare tutte le coppie `(termID, docID)`
- le operazioni sono **lineari** rispetto alla dimensione della collezione.

#### ESEMPIO VISIVO
![[Pasted image 20260314161448.png]]


---

# Distributed Indexing
Quando la collezione di documenti è **molto grande**, la costruzione dell’indice non può essere eseguita in modo efficiente su **una sola macchina**.

Questo è particolarmente vero per il **Web**, dove i motori di ricerca devono indicizzare quantità enormi di documenti.

Per questo motivo si usano sistemi di:
```
distributed indexing
```
cioè costruzione dell’indice **distribuita su più macchine**.


# Cluster
Il lavoro viene eseguito su un **cluster**.

Un cluster è:
```
un gruppo di computer che lavorano insieme
```

Queste macchine sono chiamate **nodes**.

I cluster permettono di risolvere problemi molto grandi utilizzando **molti computer economici** invece di un singolo supercomputer.


# Distributed Index
Il risultato della costruzione dell’indice è un **indice distribuito**, cioè un indice suddiviso tra più macchine.

La suddivisione può avvenire in due modi:
### Term-partitioned index
Ogni macchina gestisce **un insieme di termini**.

Esempio:
```
node 1 → termini A–F
node 2 → termini G–M
node 3 → termini N–Z
```

### Document-partitioned index
Ogni macchina gestisce **un insieme di documenti**.

Esempio:
```
node 1 → documenti 1–1M
node 2 → documenti 1M–2M
node 3 → documenti 2M–3M
```
I grandi motori di ricerca preferiscono **document partitioning**.


# MapReduce
Per costruire l’indice distribuito si usa spesso il modello:
```
MapReduce
```

MapReduce è un’architettura progettata per:
```
distributed computing
```
cioè per eseguire calcoli su **grandi cluster di macchine**.

### Come funziona MapReduce
Il lavoro viene diviso in **piccoli task** che possono essere eseguiti in parallelo.

Il processo ha due fasi principali:
### Map
- i documenti vengono processati
- si generano coppie
```
(term, docID)
```
### Reduce
- le coppie con lo **stesso termine** vengono raggruppate
- si costruiscono le **postings lists**

### Master Node
Nell'architettura MapReduce esiste un nodo speciale chiamato:
```
master node
```

Il master node ha il compito di:
- dividere il lavoro in **task**
- assegnare i task ai **worker nodes**
- riassegnare il lavoro se una macchina fallisce.

Questo è importante perché nei cluster con **centinaia o migliaia di macchine** alcuni nodi possono guastarsi.


# Vantaggi del distributed indexing
I vantaggi principali sono:
- permette di indicizzare **collezioni enormi**
- sfrutta **molte macchine in parallelo**
- è **scalabile**
- è **robusto ai guasti** (fault tolerance).



# Distributed Indexing (approfondimento)
Quando la collezione è troppo grande, non basta una sola macchina.

Serve un sistema distribuito su più nodi:
```
cluster
```

Un problema importante è che:
- le macchine possono **fallire**
- possono essere **lente**
- il lavoro deve continuare comunque

Per questo il sistema deve essere progettato per lavorare in modo **parallelo e robusto**.


## Task paralleli
L’idea è dividere il lavoro in **task indipendenti**.

La collezione viene suddivisa in:
```
splits (o slice)
```
Ogni split è un sottoinsieme di documenti.

Il master assegna gli split alle macchine disponibili:
- se una macchina finisce → prende un nuovo task
- se una macchina fallisce → il task viene riassegnato

Questo garantisce:
- **bilanciamento del carico**
- **fault tolerance**


---

## Data flow (costruzione dell’indice distribuito)
![[Pasted image 20260317193923.png]]
Il flusso è diviso in due fasi principali:
### 1. Parser (Map phase)
- ogni parser prende uno split
- legge i documenti
- produce coppie:

```
(term, docID)
```

Queste coppie vengono salvate in **segment files**, divisi per intervalli di termini (es: a–f, g–p, q–z)

### 2. Inverter (Reduce phase)
- ogni inverter prende tutte le coppie relative a un insieme di termini
- raggruppa i dati
- costruisce le **postings lists**

Quindi:
```
(term → lista di docID)
```


## Idea chiave del data flow
- parser = genera dati
- inverter = li organizza

Se una macchina si ferma:
- il master riassegna il lavoro

Sistema quindi:
- **dinamico**
- **resistente ai guasti**


---

## Tre proprietà importanti
In un sistema distribuito vogliamo:

### 1. Partition tolerance
Il sistema continua a funzionare anche se:
- alcune macchine non comunicano

### 2. Availability
Il sistema risponde sempre alle richieste

### 3. Consistency
I dati sono coerenti su tutte le macchine


>[!danger] ⚠️ Nella pratica non si possono avere tutte e tre perfettamente (CAP theorem)


---

# MapReduce
È il modello usato per implementare tutto questo.

Schema generale:
```
map: input → lista(k, v)
reduce: (k, lista(v)) → output
```

Nel nostro caso:
### Map
```
documenti → (term, docID)
```

### Reduce
```
(term, lista(docID)) → postings list
```

È importante perché:
- divide il lavoro automaticamente
- scala su cluster molto grandi


---

# Dynamic Indexing
Finora abbiamo assunto:
```
collezione statica
```

Nella realtà:
- documenti vengono aggiunti
- modificati
- eliminati

Quindi l’indice deve essere aggiornato.

## Approccio base
Si usano due strutture:
### 1. Main index
- indice grande
- su disco
### 2. Auxiliary index
- piccolo
- in memoria
- contiene i nuovi documenti

Le query cercano su entrambi e poi uniscono i risultati

## Problema
Se faccio merge troppo spesso:
- costo alto
- rallentamenti

## Logarithmic Merge
![[Pasted image 20260317193954.png]]
Soluzione più efficiente.

Si mantengono più indici:
```
I0, I1, I2, ...
```

Ogni indice ha dimensione:
```
2^k * n
```


# Struttura
Hai:
- `Z0` → in memoria (piccolo)  -> sarebbe l'Auxiliary index
- `I0, I1, I2, ...` → su disco -> sarebbero i Main index

Dimensioni:
```
Z0 ≈ n 
I0 ≈ n
I1 ≈ 2n
I2 ≈ 4n
I3 ≈ 8n
...
```

Ogni livello è il doppio del precedente.


# Come funziona (passo passo)
### 1. Arriva un nuovo dato
Lo metti in:
```
Z0
```

### 2. Z0 si riempie (raggiunge n)
Hai due casi:
#### Caso A: I0 NON esiste
→ scrivi Z0 su disco come:
```
I0
```
e svuoti Z0

#### Caso B: I0 esiste
→ fai merge:
```
Z0 + I0 → Z1 (dimensione 2n)
```
poi:
- cancelli I0 -> puoi riutilizzarlo dopo 
- svuoti Z0

### 3. Ora hai Z1 (2n)
Stessa logica:
#### Se I1 NON esiste
→ Z1 diventa I1
#### Se I1 esiste
→ merge:
```
Z1 + I1 → Z2 (4n)
```
e così via...


# Perché è meglio
## Senza logarithmic merge
Ogni posting viene toccato:
```
T / n volte
```
→ pessimo

## Con logarithmic merge
Ogni posting sale di livello poche volte:
```
log(T / n)
```

Quindi:
```
tempo = O(T log(T/n))
```

👉 molto più efficiente

# Svantaggio
Quando fai una query:
- devi cercare in più indici (`I0, I1, I2...`)

→ quindi:
```
query più lente
```


---

# Dynamic Indexing nei motori di ricerca
Due strategie reali:
1. aggiornamenti incrementali (come sopra)
2. ricostruzione completa periodica dell’indice

# Caso reale: Twitter (Earlybird)
Twitter ha esigenze particolari:
- dati in tempo reale
- risultati recenti più importanti

## Struttura
L’indice è diviso in:
```
segmenti
```

Ogni segmento:
- è piccolo
- sta in memoria
- contiene tweet recenti

## Funzionamento
- nuovi dati → aggiunti in coda
- query → leggono prima i dati più recenti

Le postings list sono:
```
ordinate temporalmente (più recenti prima)
```

Questo è diverso dal classico:
```
ordinamento per docID
```


---

### Domande fatta sulla parte appena conclusa (che saranno utili per capire quella dopo)
>[!question] Complessità di recupero di parole in un dizionario? 
>Generalmente è logaritmico rispetto a un valore che non conosciamo a priori (la grandezza della dimensione dei documenti)

>[!question] Mi conviene utilizzare un indice posizionale o biword? 
>Noi preferiamo il posizionale
>- lo svantaggio del biword è che da un lato rendo troppo sballata la statistica, dall'altro tipo creo dei falsi positivi (forse sono la stessa cosa non ho capito io)


---


# Index Compression
Obiettivo:
```
ridurre lo spazio occupato dall’indice (RAM + disco)
```

Perché è importante:
- le **postings lists** sono la parte più grande dell’indice
- il **dictionary** deve stare (quasi sempre) in memoria
- meno dati → meno I/O → sistema più veloce

👉 quindi la compressione non è solo spazio, ma anche **performance**

---

# Lossy vs Lossless Compression
## Lossless
Non perdi informazione.
Puoi ricostruire esattamente i dati originali.

Esempi:
- compressione dictionary
- compressione postings (gap, encoding)

👉 è la **vera compressione**

## Lossy
Perdi informazione.
Esempi:
- stopword removal
- stemming

👉 qui non stai comprimendo  
👉 stai **modificando ciò che indicizzi**

#### Tabella vista a lezione
![[Pasted image 20260320172028.png]]
Leggila, fa vedere come a seconda di cosa scegliamo di fare 
- rimuovere numeri
- rimuovere `n` stopwords, 
- fare lemmatizzazione
Abbiamo un miglioramento di un tot di %.

>[!tip]- Piccole spiegaizoni su alcuni punti
>- Togliere le stopword in un NON POSITIONAL INDEX vuol dire togliere le righe più lunghe dalla matrice sparsa (credo valga anche per i positional index)
>
>- Fare stemming 
>	- sul non positional index ti fa risparmiare il 4% perché `dog` e `dogs` le faccio collassare in un'unica parola
>	- sul positional index non risparmio nulla perché `dog` e `dogs` le faccio collassare MA devo salvarmi comunque la posizione di entrambe


La tabella è **lossy**:
- cambia il contenuto dell’indice
- non è più possibile tornare indietro

---

# Statistiche della collezione
Prima di comprimere dobbiamo capire:
```
come sono distribuiti i termini
```

Perché:
- la compressione dipende dai dati
	- termini
	- docID
	- postings
	questi dati hanno proprietà particolari.


# Heaps’ Law
Descrive **come cresce il numero di parole distinte (vocabolario)** al crescere del numero totale di parole nella collezione.

Formula:
```
M = kT^b
```

dove:
- `M` = numero di termini distinti (vocabolario)
- `T` = numero totale di token
- `k` ≈ 30–100
- `b` ≈ 0.5–1

## Interpretazione
Se aumentano i documenti:
- i token crescono molto
- il vocabolario cresce **più lentamente**

👉 crescita **sublineare**

#### Esempio su RCV1
![[Pasted image 20260320173318.png]]
- asse x → `log10 T` → numero di token
- asse y → `log10 M` → dimensione vocabolario
```
stai guardando come cresce il vocabolario al crescere dei token
```

👉 questo grafico mostra che:
```
il numero di termini distinti cresce con i token, ma in modo sublineare
```

## Perché è importante
- il dictionary cresce lentamente → bene per la memoria
- ma non smette mai di crescere

👉 quindi serve comunque comprimere


# Zipf’s Law
Descrive **come sono distribuite le frequenze delle parole** in una collezione.

Se ordini i termini per frequenza:
```
frequenza ∝ 1 / rank
```

Significa:
- il termine più frequente compare tantissimo
- il secondo circa la metà
- il terzo ancora meno
- ecc…

## Conseguenze
- poche parole → frequenza altissima
- tantissime parole → frequenza bassissima

👉 distribuzione molto sbilanciata

## Impatto sull’indice
- alcune postings list sono **lunghissime**
- molte sono **piccolissime**

👉 la compressione deve funzionare bene su numeri piccoli  
(perché i gap saranno piccoli)


---

# Compressione del Dictionary
La ricerca inizia dal dizionario, e noi vogliamo tenerlo in memoria.

Il dictionary contiene:
- termini (stringhe)
- puntatori alle postings

Problema:
- le stringhe occupano spazio
- i puntatori occupano spazio


## Approccio pigro -> senza ottimizzazione
![[Pasted image 20260320172550.png]]
Completamente inutile perché sprechiamo troppo spazio
- anche per una lettera tipo `a` noi allochiamo 20 bytes di spazio


## Soluzione 1: Dictionary as a String
Invece di salvare ogni termine separato:
```
[term1][term2][term3]
```

salvo:
```
un’unica stringa lunga
```

e per ogni termine memorizzo:
- un puntatore (offset)

![[Pasted image 20260320172608.png]]

>[!question] Vedi come si calcola 22 byte. 

### Vantaggio
- elimino overhead delle singole stringhe
- struttura più compatta

### Spazio
![[Pasted image 20260320172630.png]]


## Soluzione 2: Blocking
Idea:
- non salvo un puntatore per ogni termine
- ma uno ogni `k` termini
- di fianco a ogni termine scrivo la sua lunghezza

Esempio:
```
k = 4
```
→ un puntatore ogni 4 parole

![[Pasted image 20260320172728.png]]


### Come funziona
Per cercare un termine:
1. salto al blocco giusto
2. cerco sequenzialmente dentro il blocco

### Trade-off
- meno puntatori → meno spazio
- ma:
    - ricerca leggermente più lenta 

![[Pasted image 20260320180208.png]]

👉 Per questo è meglio avere un `k` non troppo alto, altrimenti
- lo spazio occupato sarebbe minimo
- ma il tempo impiegato nella ricerca sarebbe lineare


### Differenza di ricerca
##### SENZA BLOCKING
![[Pasted image 20260320180512.png]]
##### CON BLOCKING
![[Pasted image 20260320180452.png]]



## Soluzione 3: Front Coding
Sfrutta il fatto che:
```
i termini sono ordinati lessicograficamente
```
E quindi spesso condividono prefissi.

### Esempio
![[Pasted image 20260320172827.png]]
### Vantaggio
- non ripeto il prefisso
- riduco molto lo spazio



>[!tip]- Riassunto visivo sullo spazio occupato in MB delle varie tecniche
>![[Pasted image 20260320180552.png]]


---

# Compressione delle Postings
Le postings list contengono:
```
liste di docID
```
e sono molto di più grandi dei dizionari.


Problema:
- numeri grandi → tanti bit
![[Pasted image 20260320180831.png]]


## Gap Encoding
Invece di salvare i docID:
```
173, 174, 180
```

salvo:
```
173, 1, 6
```

## Perché funziona
- le liste sono ordinate
- quindi le differenze sono piccole

👉 numeri piccoli → meno bit


---

# Variable Length Encoding
Dopo il Gap Encoding abbiamo tanti numeri piccoli, e se usassimo 32 bit per ogni numero sprecheremmo spazio.

Obiettivo:
```
usare meno bit per numeri piccoli
```


Problema:
```
se uso lunghezza variabile → non so dove finisce un numero
```

Serve un encoding che:
- sia compatto
- sia decodificabile


# Unary Code
Codifica un numero `n` come:
```
n volte 1 + 0 finale
```

Esempio:
```
3 → 1110
```

## Pro e contro
✔ semplice  
❌ inefficiente per numeri grandi

👉 utile solo quando i numeri sono molto piccoli


# Gamma Code
Idea:
- non codifico direttamente il numero
- codifico:
    1. la lunghezza
    2. il valore

## Struttura
```
unary(lunghezza) + parte binaria
```

## 🔸 Passaggi (fondamentale)
Prendiamo 13:
#### 1. scrivo in binario
- 13 → 1101
#### 2. prendo la lunghezza
- lunghezza = 4
#### 3. codifico la lunghezza in unary (MA -1)
- lunghezza - 1 = 3
	3 → 1110
#### 4. tolgo il primo bit del numero
- 1101 → 101
#### 5. unisco
- 1110 + 101 = 1110101
👉 questo è il gamma code di 13


>[!tip]- Esempi di numeri codificati
>![[Pasted image 20260320181714.png]]


## Perché è migliore
- numeri piccoli → pochissimi bit
- più efficiente dell'unario classico

## Problema
- più complesso
- più lento da decodificare

👉 quindi:
- teoricamente ottimo
- nella pratica spesso sostituito da encoding più veloci


### Proprietà del Gamma code
![[Pasted image 20260320182003.png]]


---

# VARIABLE BYTE ENCODING (VB)
## Problema
Dopo il **gap encoding**, le postings list diventano:
- sequenze di **interi piccoli**
- ma se li salvo con 32 bit → **spreco spazio**

👉 serve una rappresentazione:
- compatta
- decodificabile velocemente

## Idea
Usare un numero **variabile di byte** per rappresentare un intero.
- numeri piccoli → pochi byte
- numeri grandi → più byte

## Struttura
Ogni byte ha 8 bit:
- **1 bit di controllo (continuation bit)**
- **7 bit di informazione**

Schema:
```
[c | xxxxxxx]
```
- c = 1 → ultimo byte del numero
- c = 0 → il numero continua nel byte successivo

## Codifica
Dato un numero `n`:
1. si rappresenta in base 128
2. si divide in gruppi di 7 bit
3. si costruiscono i byte:
    - tutti con c = 0
    - tranne l’ultimo con c = 1

## Esempi
### Numero piccolo: 5
- 5 < 128 → basta 1 byte
```
10000101
```

### Numero: 130
- 130 = 1 * 128 + 2
→ due blocchi:
- 0000001
- 0000010

→ encoding:
```
00000001   (c = 0)
10000010   (c = 1)
```

## Decodifica
Si leggono i byte in sequenza:
1. si prendono i 7 bit utili
2. si concatenano
3. si continua finché:
    - c = 0 → continua
    - c = 1 → fine numero

## Proprietà
- **self-delimiting** → non serve separatore
- **byte-aligned** → veloce da leggere
- **semplice da implementare**

## Efficienza
Funziona bene perché:
- dopo gap encoding → molti numeri piccoli
- quindi:
    - spesso 1 byte
    - raramente più byte

👉 buona compressione + alta velocità

## Limiti
- non è ottimale in termini di bit
- spreca spazio -> usa byte interi anche per numeri piccoli

👉 esistono metodi migliori:
- γ encoding
- δ encoding

## Collegamento con teoria IR
VB funziona perché:
- le postings sono ordinate
- i gap sono piccoli
- la distribuzione segue Zipf

👉 molti numeri piccoli → compressione efficace


### RCV1 compression
![[Pasted image 20260325101101.png]]


---

# SIMPLE-9 (Anh & Moffat, 2004)

## Problema
Con **Variable Byte**:
- semplice
- veloce  
    ❌ ma non usa bene i bit

👉 spreca spazio perché lavora a **byte (8 bit)**

## Idea di Simple-9
Usare **word da 32 bit** invece di byte.

👉 in 32 bit voglio mettere:
- **più numeri possibile**
- scegliendo come comprimerli

## Struttura generale
Ogni blocco = **32 bit (4 byte)**

Diviso in:
```id="e4qk2o"
[ 4 bit | 28 bit ]
```
- **4 bit → selector (layout)**
- **28 bit → dati compressi**

## Concetto chiave (fondamentale)
👉 non salvo un numero per volta  
👉 salvo **più numeri nello stesso blocco**

Come?
- se numeri piccoli → ne metto tanti
- se numeri grandi → ne metto pochi

👉 il selector dice **come interpretarli**

# 5. Layout 
I 4 bit iniziali scelgono il formato:

|Selector|Significato|
|---|---|
|0|1 numero da 28 bit|
|1|2 numeri da 14 bit|
|2|3 numeri da 9 bit|
|3|4 numeri da 7 bit|
|4|5 numeri da 5 bit|
|5|7 numeri da 4 bit|
|6|9 numeri da 3 bit|
|7|14 numeri da 2 bit|
|8|28 numeri da 1 bit|

👉 sempre:
```id="m6n2rj"
n * b ≤ 28
```

# Esempio intuitivo
Hai questi gap:
```id="x3bq7k"
1, 2, 1, 1, 3, 2, 1
```
👉 numeri piccoli → bastano 3 bit
→ uso selector = 6
✔ metto **9 numeri da 3 bit** in un solo blocco

Altro caso:
```id="q9y4zt"
100000
```
👉 numero grande → serve più spazio
→ selector = 0
✔ uso tutto il blocco per 1 numero

# Come funziona (processo)
### Encoding
1. prendi i gap
2. guarda quanti ne puoi mettere in 28 bit
3. scegli il **layout migliore**
4. scrivi:
    - selector (4 bit)
    - numeri compressi

### Decoding
1. leggi i primi 4 bit
2. capisci il formato
3. dividi i 28 bit
4. ricostruisci i numeri


---



# Dictionaries and Tolerant Retrieval
Il compito principale in questa fase è il **vocabulary lookup**: determinare se un termine di una query esiste nel vocabolario e identificare il puntatore alle relative *postings lists*.


## Wildcard Queries (Query con Caratteri Jolly)
Le query con carattere `*` (che indica una stringa di lunghezza ≥ 0) si dividono in diverse tipologie di complessità crescente:

### Trailing e Leading Wildcards
* **Trailing (es. `mon*`):** Facilmente gestibili con un B-tree standard cercando tutti i termini nell'intervallo lessicografico.
* **Leading (es. `*mon`):** Richiedono un **Reverse B-tree**, ovvero un albero in cui i termini del dizionario sono memorizzati al contrario (es. `lemon` → `nomel`).
* **Infix (es. `se*mon`):** Si risolvono intersecando i risultati di un B-tree (per `se*`) e di un Reverse B-tree (per `*mon`). Tuttavia, l'operazione è costosa.

### Permuterm Index
Per gestire query generiche (es. `m*n*o`), si introduce il **Permuterm Index**. 
1.  Si aggiunge un simbolo speciale `$` alla fine del termine (es. `hello$`).
2.  Si memorizzano tutte le **rotazioni** del termine: `hello$`, `ello$h`, `llo$he`, `lo$hel`, `o$hell`, `$hello`.
3.  **Processamento:** La query viene ruotata in modo che il `*` appaia quasi sempre alla fine.![[Pasted image 20260325103629.png]]
>[!problem] *Svantaggio:* La dimensione del dizionario esplode (empiricamente quadruplica).

### k-gram Index
Più efficiente in termini di spazio rispetto al permuterm. 
Un **k-gram** è una sequenza di $k$ caratteri.
*   Si costruisce un indice invertito dove le "chiavi" sono i k-grammi e le "postings" sono i termini del vocabolario che li contengono.
*   **Esempio (bigrammi per `castle`):** `$c, ca, as, st, tl, le, e$`.
*   **Processamento:** Una query `re*ve` viene scomposta in `$r, re` AND `ve, e$`.
*   **Post-filtering:** Poiché l'AND dei k-grammi può restituire falsi positivi (es. `red*` potrebbe restituire `retired` perché contiene i k-grammi richiesti ma non è un match testuale), è necessario un passaggio di verifica booleana sul set di candidati.


## Spelling Correction
Qui viene analizzato il modo in cui vengono corretti errori di battitura.

>[!quote] Lucata
>Quando vuoi scrivere "query" ma sbagli e scrivi "porcoddio".


La correzione può essere 
- **Isolated-term** (corregge il singolo termine senza guardare il contesto) 
- **Context-sensitive** (usa le parole circostanti).

### Non-word ERROR
Quando viene digitata una parola che non esiste.
Generalmente questo errore si verifica quando la parola scritta non appartiene al nostro dizionario.
Per correggerla
- generiamo dei candidati -> parole reali che sono simile a quella scritta per errore
	- il candidato migliore è quello che
		- ha il peso minore rispetto all'edit distance -> ossia richiede il minor numero di cambiamenti
		- ha la probabilità più alta di *noisy channel*

>[!tip] GENERALMENTE l'80% degli errori sono a edit distance 1, AL PIÙ 2.

#### Testing dei candidati: edit distance
Gli edit generalmente sono
- Inserzione 
- Cancellazione
- Sostituzione 
- Trasposizione di due lettere adiacenti
![[Pasted image 20260325105509.png]]


### Noisy Channel Model (Modello del Canale Rumoroso)
È l'approccio probabilistico standard basato sulla **Regola di Bayes**. 
Data una parola osservata $x$ (potenzialmente errata), vogliamo trovare la parola corretta $\hat{w}$ che massimizza:
$$\hat{w} = \text{argmax}_{w \in V} P(w|x) = \text{argmax}_{w \in V} P(x|w)P(w)$$

Dove:
*   **$P(w)$ (Language Model):** La probabilità a priori della parola nel linguaggio (quanto è comune $w$ nel corpus). 
	* Si calcola tramite conteggi di unigrammi: $P(w) = \frac{C(w)}{T}$.
		* $C(w)$ -> quante volte appare `w` nel documento
		* $T$ -> numero totale di tokens
		![[Pasted image 20260325105527.png]]
*   **$P(x|w)$ (Error Model / Likelihood):** La probabilità che scrivendo $w$ l'utente digiti $x$. 
	* Si basa su una **Confusion Matrix** (es. probabilità di scambiare 'a' con 's' perché vicine sulla tastiera).

### Error model $P(x|w)$
Possiamo usare delle matrici 	![[Pasted image 20260325105611.png]]

E su queste matrici fare dei calcoli
![[Pasted image 20260325105838.png]]

#### Smoothing
Per evitare divisioni per 0, aggiungiamo `1` a tutti i conteggi nella matrice e se abbiamo un alfabeto lungo `|A|`, normalizziamo correttamente.
![[Pasted image 20260325110008.png]]

![[Pasted image 20260325110017.png]]


## Correzione Ortografica Context-Sensitive
Fino ad ora abbiamo trattato la correzione di **non-word errors** (parole che non esistono nel dizionario). Tuttavia, circa il **25-40% degli errori di spelling** consiste in parole reali utilizzate nel contesto sbagliato (*real-word errors*).

### Il Problema dei Real-Word Errors
Si verificano quando l'utente digita una parola esistente nel dizionario, ma diversa da quella intesa.
*   **Necessità del contesto:** Per rilevare e correggere questi errori, non basta consultare il dizionario; è indispensabile analizzare le parole circostanti tramite un **Language Model**.


## Il Modello del Canale Rumoroso (Noisy Channel)
Per la correzione basata sul contesto, estendiamo il modello probabilistico di Bayes applicandolo all'intera frase. 
Data una sequenza di parole osservate $X = (x_1, x_2, ..., x_n)$, vogliamo trovare la sequenza di parole intese $W = (w_1, w_2, ..., w_n)$ che massimizza la probabilità a posteriori:
$$\hat{W} = \text{argmax}_{W \in V} P(W|X) = \text{argmax}_{W \in V} P(X|W)P(W)$$

### 1. Generazione dei Candidati
Per ogni parola $x_i$ della frase, generiamo un set di candidati $Candidate(x_i)$ che include:
*   La parola stessa ($x_i$).
*   Tutte le parole nel dizionario a **edit distance 1** (o 2).
*   Eventuali omofoni (parole con pronuncia simile).

### 2. Language Model: Incorporare il Contesto
Il termine $P(W)$ rappresenta la probabilità della sequenza di parole. Per calcolarla in modo efficiente senza "esplodere" computazionalmente, si utilizza un **modello a bigrammi** (Catena di Markov):
$$P(w_1, ..., w_n) = P(w_1)P(w_2|w_1)P(w_3|w_2)...P(w_n|w_{n-1})$$
- $P(w_{i}|w_{i-1})$ -> probabilità che IN GENERALE la parola $w_{i}$ venga scritta dopo la parola $w_{i-1}$ 

ESEMPIO
![[Pasted image 20260329170616.png]]

#### Smoothing per Interpolazione
In molti casi, una coppia di parole (bigramma) potrebbe non essere presente nel corpus di addestramento, portando la probabilità a zero. Si risolve interpolando la probabilità del bigramma con quella dell'unigramma:
$$P_{li}(w_k|w_{k-1}) = \lambda P_{uni}(w_k) + (1-\lambda)P_{bi}(w_k|w_{k-1})$$
* **$\lambda$ (Peso):** Determina quanto "fidarsi" della parola singola rispetto alla coppia.
* **Log-Probabilities:** Per evitare il *floating point underflow* (numeri troppo piccoli derivanti da molte moltiplicazioni), si lavora nel dominio dei logaritmi, trasformando i prodotti in somme: $$\log P(w_1...w_n) = \log P(w_1) + \sum \log P(w_i|w_{i-1})$$
### 3. Channel Model: Probabilità di Errore
Il termine $P(X|W)$ stima la probabilità che la parola $w$ venga digitata come $x$. 
* Se l'errore è una *non-word*, si usano le matrici di confusione già viste.
* **Novità per Real-Words:** Dobbiamo definire la probabilità che una parola sia stata scritta correttamente (**No Error**), ovvero $P(w|w)$.
    * Questa probabilità varia in base all'applicazione (es. 0.90 per testi informali, 0.99 per testi curati).


## Strategie di Semplificazione e Ottimizzazione
Calcolare la combinazione migliore tra tutti i candidati di ogni parola della frase è complesso.

Per rendere il sistema trattabile, si adottano spesso delle semplificazioni:
1. **Assunzione dell'Errore Singolo:** Si assume che in ogni frase ci sia **al massimo un errore** di spelling. Si generano quindi diverse varianti della frase originale modificando una sola parola alla volta e si sceglie la sequenza $W$ con $P(W)$ maggiore.
2. **Peso del Prior ($\lambda$):** Si introduce un parametro di peso $\lambda$ per bilanciare il peso del modello linguistico rispetto al modello di errore:$$\hat{w} = \text{argmax}_{w \in V} P(x|w)P(w)^\lambda$$

## Hidden Markov Model (HMM) - Concetti Base
Il problema della correzione può essere visto come un HMM dove:
*   **Osservazioni:** Le parole scritte dall'utente (ciò che vediamo).
*   **Stati Hidden:** Le parole effettivamente intese (ciò che vogliamo scoprire).
*   **Probabilità di Transizione:** La probabilità che una parola segua l'altra (Bigramma).
*   **Probabilità di Osservazione:** La probabilità che lo stato "nascosto" $w$ produca l'output $x$ (Channel Model).

![[Pasted image 20260329170701.png]]

## Ulteriori Miglioramenti
Queste sono migliorie estreme
* **Edits Ricchi:** Considerare errori più complessi della singola lettera (es. *ent* $\to$ *ant*, *ph* $\to$ *f*).
* **Pronuncia:** Integrare modelli fonetici per pesare maggiormente candidati che suonano simili all'errore.
* **Device-Specific:** Adattare il channel model al dispositivo (es. gli errori su una tastiera Android sono diversi da quelli su PC a causa della vicinanza dei tasti).


---

# Scoring, Term Weighting e il Modello Spaziale

### 1. Limiti del Recupero Booleano (Ranked Retrieval)
Il sistema booleano classico presenta diverse criticità per l'utente comune:
* **Feast or Famine:** Le query booleane tendono a restituire o troppi risultati (difficili da esaminare) o zero risultati (se troppo specifiche).
* **Assenza di Sfumature:** Un documento o soddisfa la query (match) o non la soddisfa. Non esiste una scala di rilevanza.

***Soluzione:*** Implementare il **Ranked Retrieval**, ordinando i documenti in base a un punteggio di "bontà" (*score*) rispetto alla query, agendo come un "soft AND".

### 2. Il Punteggio di Matching (Scoring)
Per ordinare i documenti, assegniamo un punteggio in un intervallo $[0, 1]$ a ogni coppia query-documento. Le premesse fondamentali sono:
1.  Se nessun termine della query appare nel documento, lo score è 0.
2.  Più un termine della query è frequente nel documento, maggiore deve essere lo score.
3.  Più termini della query compaiono nel documento, maggiore deve essere lo score.

### 3. Il Coefficiente di Jaccard
Un metodo statistico comune per misurare la sovrapposizione tra due insiemi (query $A$ e documento $B$):
$$\text{JACCARD}(A, B) = \frac{|A \cap B|}{|A \cup B|}$$
*   **Proprietà:** Restituisce 1 se gli insiemi sono identici, 0 se sono disgiunti.
*   **Limiti per l'IR:**
    *   Non considera la **Term Frequency** (quante volte un termine appare).
    *   Non considera l'informatività dei termini rari (tratta tutte le parole allo stesso modo).
    *   La normalizzazione della lunghezza non è ottimale (il coseno è generalmente preferito).

>[!tip]- Il limite enorme 
>Se nel documento la parola "Virus" appare 100 volte, Jaccard la conta come **una sola volta**. Non gli importa se ne parli tanto o poco, gli importa solo che la parola "esista" nel set. Inoltre, tratta la parola "il" (comunissima) con la stessa importanza della parola "Criptovaluta" (rara e specifica).

### 4. Rappresentazione dei Documenti
* **Binary Incidence Matrix:** Rappresenta i documenti come vettori binari $\{0, 1\}^{|V|}$. Indica solo la presenza/assenza del termine.
* **Count Matrix:** Rappresenta i documenti come vettori di conteggi in $\mathbb{N}^{|V|}$.
* **Bag of Words Model:** Questo modello ignora l'ordine delle parole. "John è più veloce di Mary" e "Mary è più veloce di John" hanno la stessa rappresentazione. Nonostante la perdita di informazione, è una semplificazione efficace per il ranking.

### 5. Term Frequency (tf)
La frequenza grezza (*raw tf*) non è ideale perché la rilevanza non aumenta proporzionalmente alla frequenza (un documento con 10 occorrenze non è 10 volte più rilevante di uno con 1 sola).

* **Log-frequency Weighting:** Si applica una trasformazione logaritmica per "smorzare" (*dampen*) l'effetto:$$w_{t,d} = \begin{cases} 1 + \log_{10} \text{tf}_{t,d} & \text{se } \text{tf}_{t,d} > 0 \\ 0 & \text{altrimenti} \end{cases}$$
	* metto `1 + log` perché se la `tf` è $1$ il `log` restituisce 0.

* **Score query-documento (tf-matching):** Somma dei pesi logaritmici per tutti i termini $t$ presenti sia nella query $q$ che nel documento $d$:$$\text{score}(q, d) = \sum_{t \in q \cap d} (1 + \log \text{tf}_{t,d})$$
>[!tip] Il trucco del Logaritmo 
>Usiamo il logaritmo per "schiacciare" i numeri grandi. Il logaritmo trasforma i grandi incrementi in piccoli passi. In questo modo, un documento con tantissime occorrenze avrà un punteggio più alto, ma non distruggerà gli altri documenti nel ranking solo perché è più lungo o ripetitivo.

### 6. Inverse Document Frequency (idf)
Non tutti i termini hanno lo stesso potere discriminante. I termini rari sono più informativi dei termini frequenti (es. *Feniletilamina* vs *andare*).
* **Document Frequency ($\text{df}_t$):** Numero di documenti nella collezione che contengono il termine $t$.
* **Peso idf:** Misura l'informatività di un termine.$$\text{idf}_t = \log_{10} \frac{N}{\text{df}_t}$$
    dove $N$ è il numero totale di documenti nella collezione.
* **Effetto sul ranking:** L'idf influenza il ranking solo per query con almeno due termini (es. in "arachnocentric line", aumenta il peso del termine raro e diminuisce quello del termine comune).

>[!example]- Spiegazione e esempio
>**L'idea:** Più una parola è diffusa in **tutta la collezione** di documenti, meno è utile per distinguere un documento dall'altro.
>
>**Esempio:** 
>- La parola "il" appare in 1.000.000 di documenti su 1.000.000. Il suo $idf$ sarà $\log(1/1) = 0$. Peso zero.
>- La parola "Pitagora" appare in 100 documenti su 1.000.000. Il suo $idf$ sarà molto alto.
>
>**In sintesi:** L'idf è un "filtro" che abbassa il volume alle parole comuni e alza il volume alle parole rare e specifiche.


>[!tip]- Nota su cf vs df 
>La **Collection Frequency** ($\text{cf}_t$) conta il numero totale di token del termine nella collezione. 
>La $\text{df}_t$ è preferibile perché distingue meglio i termini che appaiono molte volte ma in pochi documenti (spesso termini tecnici molto rilevanti).





