### DBMS
Un sistema che permette di gestire una grande quantità di dati che sono
- grandi
- consistenti
- e condivisi

Deve essere 
- efficiente, sfrutta al meglio le risorse di tempo e spazio
- efficacia, rende produttive le funzionalità dei suoi utilizzatori

### TRANSAZIONI
Una **transazione** è un’unità logica di elaborazione in un database, composta da una sequenza di operazioni che devono essere eseguite tutte insieme (oppure nessuna).

Prevedono
- un `begin transaction` che è l'inizio
- una serie di operazioni come
	- `update`
	- `insert` 
	- `select `
	- `delete`
- una terminazione, che può essere di due tipi 
	- `commit work` se tutto va bene
	- `rollback work` se qualcosa va storto si possono fare operazioni di

Abbiamo poi due operazioni che vengono eseguite a seguito di un crash
- **UNDO**: ripristina i dati che si avevano prima dell'errore.
- **REDO**: ripete un’operazione persa dopo un crash.
(QUESTE LE VEDREMO MEGLIO DOPO)

##### Esempio
```sql
START TRANSACTION;
UPDATE ContoCorrente SET Saldo = Saldo - 100 WHERE NumConto = 1001;
UPDATE ContoCorrente SET Saldo = Saldo + 100 WHERE NumConto = 2002;
COMMIT;
```

### ACID delle transazioni
le transazioni devono garantire 4 proprietà fondamentali

| Proprietà       | Significato                                                    |
| --------------- | -------------------------------------------------------------- |
| **A**tomicità   | Garantisce che il blocco di operazioni venga eseguito tutto    |
| **C**onsistenza | Rispetta i vincoli del DB                                      |
| **I**solamento  | Nessuna interferenza tra transazioni                           |
| **D**urabilità  | Una volta fatto commit, le modifiche restano in memoria fisica |
##### Garanzia delle proprietà
Per garantire tali proprietà occorre effettuare controlli su 
- affidabilità (per atomicità e durabilità), 
- concorrenza (per isolamento),
- esecuzione delle operazioni (consistenza)

Questi controlli vengono fatti dal gestore delle transazioni
- il controllo sull'affidabilità viene facilitato da un file di `log`, che contiene vari checkpoint dei dati che sono già stati salvati nel database 
	- molto spesso le modifiche vengono messe prima sul `log` e dopo in memoria fisica (modalità differita)
- il DBMS ha una copia del database detta `dump`
### Gestione dei guasti
Il gestore delle transazioni è affiancato dal recovery manager
- si tratta di colui che ha il compito di gestire il ripristino dai vari errori 

Ci sono 2 tipi di guasti
- **SOFT**
	- abbiamo una differenza di informazioni tra memoria principale (RAM) e secondaria (HDD)
		- quella principale ha una perdita ma quella secondaria no
- **HARD**
	- Sia in primaria che secondaria abbiamo una perdita, ma il contenuto e salvato nella memoria stabile (`log` e `dump`)

Le operazioni di ripresa si dividono in 2 tipi
- A CALDO (4 fasi), usata per un guasto **"soft"**
	- cerca ultimo checkpoint nel log
	- costruisce due insiemi di operazioni
		- `undo`, operazioni da disfare 
		- `redo`, operazioni da rifare
	- `UNDO` = nel log cancella tutte le operazioni che sono state inserite andando a ritroso
	- `REDO` = parte dal punto in cui si ferma l'`UNDO` e avanza nuovamente nel log rifacendo le operazioni
- A FREDDO, usata per un guasto **"hard"**
	- ripristini da un dump
	- successivamente riprendi il log e rifai tutte le operazioni fino al crash
	- appena avviene il crash fai una ripresa a caldo

### Gestione della concorrenza
tra più transazioni potrebbero esserci problemi di concorrenza, quest'ultima è gestita da degli scheduler che dirigono le varie transazioni


---

### Normalizzazione
Le forme normali nelle basi di dati (o normalizzazione dei database) sono una serie di linee guida progettate per organizzare i dati in una base di dati relazionale, per minimizzare la ridondanza e migliorare l'integrità dei dati.
#### 1NF
- atomicità
	- no ripetizioni
	- no attributi multivalore
valore atomico = valore indivisibile se lo dividi non va bene
#### 2NF
- deve essere già in 1NF
- non devono esserci dipendenze parziali
- `A,B -> C` con solo però `A -> C` e non `B -> C` -> così è parziale
#### 3NF
- deve essere già in 2NF
- non devono esserci dipendenze transitive
- `A -> C` ma ho solo `A -> B` e `B -> C` -> `C` non deriva direttamente da `A`
#### BCNF Boyce-Codd
È una forma più ristretta della 3NF
È in BCNF se
- per ogni dipendenza funzionale non banale `A-> B`, `A` risulta una superchiave
- Una dipendenza funzionale A→B è **non banale se B non è un sottoinsieme di A**.

![[Pasted image 20250614191814.png]]

#### TIPOLOGIE DI DIPENDENZE FUNZIONALI
>[!definizione] Una dipendenza funzionale (DF) è una relazione in cui un insieme di attributi determina un altro insieme di attributi 

Abbiamo
- **TRANSITIVA**
	- se ho `A -> B -> C` ma non ho `A -> C`
		- nel senso, esiste un attributo non chiave `B` che dipende da `A` e (solo lui) mi permette di arrivare a `C` 
- **PARZIALE**
	- `A,C-> X` con `X` che dipende funzionalmente solo o da `A` o da `C`
- **COMPLETA**
	- da `A` posso derivare tutti (è una superchiave)
- **BANALE**
	- Se ho una dipendenza `A -> B` e `B` è sottoinsieme di `A` 
		- Tipo `{Matricola, Nome} -> Nome` è banale
###### Sono usate per
- Normalizzazione dei dati 
	- Aiutano a identificare le anomalie di aggiornamento e a eliminare le ridondanze nei dati.
- Integrità dei dati
	- Garantiscono che la struttura del database sia ottimale per mantenere l'integrità e l'efficienza dei dati
- Struttura del database solida
	- Assicurano che le relazioni tra i dati siano mantenute correttamente, prevenendo inconsistenze.


---

## Modi per rappresentare le query in maniera formale
### ALGEBRA RELAZIONALE
L' algebra relazionale è un insieme di operazioni utilizzate per manipolare e interrogare i dati nelle basi di dati relazionali in un modo formale
#### TIPI DI OPERAZIONI
- SELEZIONE σ -> seleziona le tuple che rispettano delle condizioni su alcuni attributi
	
- PROIEZIONE π -> seleziona determinati attributi di una relazione (senza condizioni)
	
- RINOMINAZIONE ρ -> rinomina attributi/la relazione stessa
	
- UNIONE ∪ -> unisce due relazioni eliminando eventuali duplicazioni
	
- DIFFERENZA − -> restituisce tutte le tuple di una relazione che non sono nell'altra (NON LE DIFFERENZE TOTALI)
	
- PRODOTTO CARTESIANO × -> restituisce una relazione con tutte le combinazioni tra due relazioni

Esistono poi anche una serie di operazioni che derivano da queste elementari
- INTERSEZIONE ∩ -> restituisce una relazione con gli elementi in comune tra due tabelle
	
- JOIN NATURALE ⋈ -> unisce due relazioni in base a un attributo in comune
	
- LEFT JOIN =⋈ -> lascia intatta la prima relazione in caso di non corrispondenze
	
- RIGHT JOIN ⋈= -> lascia intatta la seconda relazione in caso di non corrispondenze
	
- THETA JOIN ⋈_ROBA -> combina le tuple di due relazioni basandosi su **una qualsiasi condizione**
	
- DIVISIONE ÷ -> restituisce le tuple della prima relazione che sono associate a **tutti gli elementi** della seconda

### CALCOLO RELAZIONALE
Approccio che sfrutta la logica del primo ordine per esprimere le query
- diverso dall'algebra relazionale
- usa formule per indicare le condizioni che le tuple devono soddisfare per essere prese nelle query

#### DUE VARIANTI
#### TRC
Il calcolo relazionale sui tuple (TRC) utilizza variabili che rappresentano tuple in una relazione

Sintassi Generale: $$\{t \ | \ \varphi (t)\}$$
Dove: 
- t è una variabile che rappresenta una tuple. 
- $\varphi (t)$ è una formula logica (che specifica le condizioni che t deve soddisfare)

Esempio: Consideriamo una relazione Dipendenti con attributi (DID, Nome, Salario). 
Trova i nomi e i salari dei dipendenti che guadagnano più di 50000. 
$$\{t. Nome,t. Salario ∣ t ∈ Dipendenti ∧ t. Salario > 50000\}$$
#### DRC
Il calcolo relazionale sui domini (DRC) utilizza variabili che rappresentano valori singoli, piuttosto che tuple. Le query in DRC specificano le proprietà che i valori di dominio devono soddisfare.\

Sintassi Generale: $${(x1, x2,…, xn) ∣ φ(x1, x2,…, xn)}$$ dove:
- `x1, x2,…, xn` sono variabili che rappresentano valori singoli. 
- $φ(x1, x2,…, xn)$ è una formula logica che specica le condizioni che questi valori devono soddisfare.

Esempio: Consideriamo la stessa relazione Dipendenti(DID,Nome,Salario). 
Trova i nomi e i salari dei dipendenti che guadagnano più di 50000. $$\{(N, S) ∣ ∃DID (Dipendenti(DID, N, S) ∧ S > 50000)\}$$che tradotto sarebbe
> "Restituisci tutte le coppie (Nome, Salario) tali che esiste un DID per cui esiste una riga nella tabella Dipendenti con quel DID, quel Nome e quel Salario, e in cui il Salario è maggiore di 50000"

#### Sicurezza delle Query
Voglio
- risultati concreti
- tempo costante

#### Potenza espressiva
Tutto ciò che posso fare con algebra relazionale posso farlo anche con il calcolo.
Tuttavia il calcolo tende ad essere più dichiarativo.


---

### Trigger
Un **trigger** è un oggetto del database che:
- **si attiva automaticamente** al verificarsi di un certo evento su una tabella.
	- `INSERT`
	- `DELETE`
	- `UPDATE`
- esegue una serie di istruzioni SQL in risposta a quell'evento.

Abbiamo due tipi di TRIGGER
- `BEFORE` -> che si attiva prima dell'esecuzione dell'operazione
- `AFTER` -> che si attiva dopo

SINTASSI
```sql
CREATE TRIGGER nome_trigger
{BEFORE | AFTER} {INSERT | UPDATE | DELETE}
ON nome_tabella
FOR EACH ROW
BEGIN
   -- istruzioni SQL da eseguire
END;
```

ESEMPIO
Immagina una tabella `Ordini` e vogliamo registrare un log ogni volta che viene inserito un nuovo ordine:
```sql
CREATE TRIGGER verifica_eta_cliente 
BEFORE INSERT ON CLIENTE 
FOR EACH ROW  
BEGIN 
     IF NEW.data_nascita > CURDATE() - INTERVAL 18 YEAR THEN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Il cliente deve essere maggiorenne (almeno 18 anni)';  
	END IF;  
END; 
```


---

### Sulle query nello specifico
#### `ALTER TABLE`
Serve per modificare la struttura di una tabella già esistente (tipo, aggiungere colonne, modificare tipologia di attributo, rinominare, ecc.).

#### `INDEX`
È una struttura dati usata per avere accesso in tempo costante a determinati dati nel database.

Quando fai spesso query del tipo:
```sql
SELECT * FROM Studenti WHERE matricola = 12345;
```
👉 Se la tabella ha 10 milioni di righe, senza indice il DB deve scorrere tutte le righe.
👉 Con un indice su `matricola`, il DB va a cercare come in un dizionario: sa subito dove guardare.

SINTASSI
```sql
CREATE INDEX nome_indice 
ON nome_tabella (colonna);
```

Esempio pratico:
```sql
CREATE INDEX idx_matricola 
ON Studenti (matricola);
```

#### `HAVING`
Serve per filtrare i **gruppi** dopo che hai fatto un `GROUP BY`.
Viene utilizzato perché dopo un `GROUP BY` non puoi usare `WHERE` per filtrare su funzioni aggregate (`COUNT()`, `SUM()`, ecc.), ma serve l'`having`

ESEMPIO
```sql
SELECT Cliente, SUM(Importo) AS TotaleOrdini
FROM Ordini
GROUP BY Cliente
HAVING SUM(Importo) > 200;
```

#### `WHERE`
Serve per **filtrare le righe** di una tabella, selezionando solo quelle che rispettano una certa condizione.

ESEMPIO
```sql
SELECT *
FROM Studenti
WHERE Corso = 'Informatica';
```


### Chiusure
> La chiusura di un insieme di attributi `X` rispetto a un insieme di dipendenze funzionali `F` è l’insieme di tutti gli attributi che `X` determina tramite `F`.

Si indica come: $$X^+_F \quad \text{oppure semplicemente} \quad X^+$$
>[!example] ESEMPIO
Immagina di avere le seguenti DF
>- $KL \rightarrow M$
>- $M \rightarrow N$
>- $B \rightarrow P$
>- $V \rightarrow O$
>- $C \rightarrow S$
>
Vogliamo calcolare $(KL)^+$
🛠 Passo 1 — inizializzazione: $$(KL)^+ = \{ K, L \}$$
🛠 Passo 2 — applichiamo le DF:
>- **KL → M** ⇒ possiamo aggiungere `M`: $$(KL)^+ = \{ K, L, M \}$$
>- **M → N** ⇒ `M` c'è → aggiungiamo `N`: $$(KL)^+ = \{ K, L, M, N \}$$

### Chiave minimale (chiave candidata)
Una chiave minimale è un insieme minimo di attributi che riesce a determinare tutta la relazione. Se togli un qualsiasi attributo da essa, gli altri da soli non determinano più tutto.

Nel senso che, se io tolgo una chiave qualsiasi dalla chiusura, dentro l'insieme non ho più tutti gli attributi presenti nella DF.

>[!example] Per esempio
>- $KL \rightarrow M$
>- $M \rightarrow N$
>- $L \rightarrow P$
>- $P \rightarrow O$
>
Da questo deriva che $$(KL)^+ = \{ K, L, M, N, P, O \}$$
Questa è sia una superchiave (perché determina tutti gli attributi) sia una chiave minimale (non ci sono ridondanze).
Se tolgo `L` da `KL`, ottengo solo `K`, ma con `K` da solo, non riesco più a determinare `P` e `O`.  
Quindi `KL` è minimale: ogni suo attributo è necessario per determinare tutta la relazione.

### Insieme minimale di DF
Un insieme minimale di DF è un insieme di dipendenze funzionali equivalente all'originale, che permette di derivare tutti gli attributi senza ridondanze.

ESEMPIO
Insieme base delle DF
```
1️⃣ `A → B`  
2️⃣ `B → C`  
3️⃣ `A → C`  
4️⃣ `C → D`
```
Vari passi da seguire
1. Eliminare, se possibile, attributi doppi a destra (es. `A -> CB`, vedi se puoi eliminarne uno)
2. Eliminare, se possibile, attributi doppi a sinistra
3. Eliminare DF ridondanti (in questo caso `A -> C`)

QUINDI COME RISULTATO ABBIAMO
```
1️⃣ `A → B`  
2️⃣ `B → C`  
3️⃣ `C → D`
```

## 🟠 **Schema E-R (Entity-Relationship)**
Lo schema E-R è un modello concettuale che descrive i dati e le relazioni tra essi in modo astratto, indipendente dal database fisico. Utilizza entità, attributi e associazioni per rappresentare le informazioni e i legami tra i dati.
> Serve per progettare il database partendo dai concetti reali, prima di tradurlo in uno schema relazionale.

CONCETTI DA SPIEGARE
- Entità
- Relazioni
- Attributi
- Chiavi primarie
- Cardinalità
- Come si gestiscono le relazioni `N,N`

## 🟢 **Schema relazionale**
Lo schema relazionale rappresenta il modello logico del database. Descrive le tabelle (relazioni), specificando gli attributi e i vincoli (come chiavi primarie e chiavi esterne), e viene ottenuto a partire dallo schema E-R."
> È il modello direttamente implementabile nei DBMS relazionali.


### TABELLA PER RICORDARTI LE COSE
|Fase|Cosa definisco|Esempio|
|---|---|---|
|**Progettazione concettuale**|Schema E-R: entità, associazioni, attributi|`Studente(Nome, Matricola, Corso)` come entità|
|**Progettazione logica**|Schema relazionale: relazioni, attributi, chiavi, vincoli|`STUDENTI(Matricola PK, Nome, Cognome)`|
|**Progettazione fisica**|Dettagli DBMS: tipi dato, indici, auto-incremento, engine|`Matricola INT AUTO_INCREMENT PRIMARY KEY`|



