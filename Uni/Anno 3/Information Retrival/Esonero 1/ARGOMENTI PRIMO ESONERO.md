## 1. Fondamenti di Information Retrieval (IR)
*   **Definizione e Obiettivi**:
    *   Ricerca di materiale non strutturato (testo) in grandi collezioni.
    *   Soddisfacimento dell'**Information Need** tramite **Query**.
*   **Modello Classico**:
    *   Rappresentazione in uno spazio di termini.
    *   Documento come vettore di termini.
*   **Valutazione del Sistema (End-to-End)**:
    *   **Precision**: Qualità (rilevanti recuperati / totali recuperati).
    *   **Recall**: Copertura (rilevanti recuperati / totali rilevanti nella collezione).
*   **L'Indicizzazione**:
    *   **Term-Document Incidence Matrix**: Righe (termini) e Colonne (documenti).
    *   Differenza tra notazione **Densa** (tutti i valori) e **Sparsa** (solo valori significativi).
    *   **Indice Inverso**: Struttura standard (Dizionario + Posting List).
*   **Pipeline di Costruzione**:
    1. Raccolta documenti (docID).
    2. Tokenizzazione (Token stream).
    3. Moduli linguistici (Normalizzazione, Stemming, Lemmatizzazione, Stop words).
    4. Creazione coppie (term, docID).
    5. Ordinamento (Sorting).
    6. Creazione Dictionary e Postings (Document Frequency).
*   **Query Booleane**:
    *   Operatori logici: AND, OR, NOT.
    *   Algoritmo di **Merge** (intersezione) con complessità lineare $O(x+y)$.
    *   **Ottimizzazione**: Intersecare prima le posting list più corte (DF minore).
*   **Phrase Queries e Prossimità**:
    *   **Biword Index**: Indice di coppie di parole (problema dei falsi positivi).
    *   **Positional Index**: Memorizzazione delle posizioni dei termini nel documento (permette proximity queries).

---

## 2. Index Construction (Costruzione dell'Indice)
*   **Analisi dei dati (Esempio Reuters RCV1)**:
    *   Differenza tra **Token** (occorrenze totali) e **Term** (parole distinte nel dizionario).
*   **Vincoli Hardware**:
    *   Velocità RAM vs Lentezza Disco (Seek time come collo di bottiglia).
    *   Necessità di algoritmi per memoria esterna.
*   **Algoritmi di Indicizzazione**:
    *   **BSBI (Blocked Sort-Based Indexing)**: Divisione in blocchi, ordinamento delle coppie `termID - docID` locale, salvataggio su disco e merge finale.
	    * costo $O(N \cdot log(b))$
    *   **SPIMI (Single-pass In-Memory Indexing)**: Nessun `termID`, creazione dinamica delle posting list in memoria, ordinamento solo prima della scrittura su disco (più veloce di BSBI).
	    * costo $\Theta(T)$ 
*   **Indicizzazione Distribuita**:
    *   Utilizzo di **Cluster** e architettura **MapReduce**.
    *   **Map Phase** (Parser): produce coppie (term, docID).
    *   **Reduce Phase** (Inverter): raggruppa le liste e crea l'indice.
    *   Partitioning: Term-partitioned vs Document-partitioned.
*   **Indicizzazione Dinamica**:
    *   Main Index (disco) + Auxiliary Index (memoria).
    *   **Logarithmic Merge**: Gestione di più indici di dimensioni crescenti ($2^k$) per abbassare il costo di merge a $O(T \log(T/n))$.
    *   Cancellazioni tramite bit vector di invalidazione.

---

## 3. Index Compression (Compressione dell'Indice)
*   **Tipologie di Compressione**:
    *   **Lossy**: Rimozione stop words, stemming, case folding (si perde informazione).
	    * fase di PRE-PROCESSING
    *   **Lossless**: Compressione in cui si mantiene tutto (non si perde informazioni).
	    * DIZIONARIO
	    * POSTING LIST
	    * POSITIONAL INDEX
*   **Leggi Statistiche**:
    *   **Heaps’ Law**: Crescita del vocabolario $M = kT^b$ (sublineare).
    *   **Zipf’s Law**: Distribuzione della frequenza dei termini (pochi termini frequentissimi, molti rari).
*   **Compressione del Dictionary**:
    *   Dictionary as a string (unica stringa + puntatori).
    *   **Blocking**: Un puntatore ogni $k$ termini (risparmio spazio vs tempo di ricerca lineare nel blocco).
    *   **Front Coding**: Memorizzazione solo delle differenze nei prefissi comuni.
*   **Compressione delle Postings**:
    *   **Gap Encoding**: Memorizzazione delle differenze tra docID (numeri più piccoli).
    *   **Variable Length Encoding**:
        *   **Unary code**: Inefficiente per numeri grandi.
        *   **Gamma ($\gamma$) code**: Codifica lunghezza + valore (ottimo teorico).
        *   **Variable Byte (VB)**: Codifica a byte con bit di continuazione `[c | xxxxxxx]` (veloce, byte-aligned).
        *   **Simple-9**: Codifica di più numeri in una word da 32 bit tramite selettori di layout.

---

## 4. Dictionaries and Tolerant Retrieval
*   **Wildcard Queries**:
    *   **Trailing** (mon\*) vs **Leading** (\*mon).
    *   **Permuterm Index**: Rotazione dei termini con simbolo $ (esplosione del dizionario).
    *   **k-gram Index**: Indice basato su sequenze di $k$ caratteri (richiede post-filtering).
*   **Spelling Correction**:
    *   **Isolated-term**: Correzione della singola parola (Edit Distance).
    *   **Context-sensitive**: Correzione basata sulle parole circostanti (es. "flew form" -> "flew from").
*   **Tecniche di Correzione**:
    *   **Edit Distance (Levenshtein)**: Operazioni di inserimento, cancellazione, sostituzione.
    *   **Noisy Channel Model**: Approccio probabilistico (Bayes). $\hat{w} = \text{argmax } P(x|w)P(w)$.
        *   $P(w)$ (Language Model): Probabilità della parola nel linguaggio.
        *   $P(x|w)$ (Error Model): Probabilità di errore (Confusion Matrix).
	        * deletion
	        * insertion
	        * substitution
	        * transposition
	    * SMOOTHING CON ADD 1
	    * SMOOTHING PER INTERPOLAZIONE ($\lambda$)
    *   **Modelli a Bigrammi**: Calcolo della probabilità di una sequenza di parole (Catena di Markov).
    *   **HMM (Hidden Markov Model)**: Parole scritte (osservate) vs parole intese (stati nascosti).

---

## 5. Scoring, Term Weighting e Modello Spaziale
*   **Limiti del Modello Booleano**: Problema "Feast or Famine" (troppi o zero risultati), manca il ranking.
*   **Coefficiente di Jaccard**: Misura di sovrapposizione tra set (limite: non considera le frequenze).
*   **Term Frequency (tf)**:
    *   Log-frequency weighting: $1 + \log(\text{tf})$ per smorzare l'impatto di troppe ripetizioni.
*   **Inverse Document Frequency (idf)**:
    *   $\log(N/\text{df})$. Penalizza i termini comuni (es. "il") e premia i termini rari e discriminanti.
*   **Peso TF-IDF**: Combinazione dei due valori per pesare ogni termine nel documento.
*   **Vector Space Model (Modello Spaziale)**:
    *   Documenti e Query come vettori in uno spazio a $|V|$ dimensioni.
    *   **Similarità del Coseno**: Calcolo dell'angolo tra vettore query e vettore documento.
    *   **Normalizzazione L2 (Euclidea)**: Necessaria per non favorire ingiustamente i documenti lunghi.
*   **Algoritmo CosineScore**: Calcolo dello score tramite prodotto scalare tra vettori normalizzati.
*   **Varianti di Pesatura**: Diverse funzioni per tf (es. BM25, Boolean, Log) e idf in base al contesto applicativo.