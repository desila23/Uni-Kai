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

Ma nelle collezioni reali questo **non è possibile**, e mettere tutto nel disco comporterebbe troppi sekk time.


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

Quindi per fare il merge basta:
```
concatenare le liste
```

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
