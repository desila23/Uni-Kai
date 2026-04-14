# 🧠 Laboratorio 1.1 – Introduction to Information Retrieval

**Corso:** Information Retrieval – Laurea Magistrale in Informatica  
**Università:** Roma “Tor Vergata”  
**Docente:** Danilo Croce

---

## 🎯 Obiettivo del laboratorio

In questo notebook costruiremo passo dopo passo una versione semplificata di un sistema di **Information Retrieval (IR)**, cioè un sistema capace di trovare documenti rilevanti rispetto a un bisogno informativo espresso da un utente.

L’idea del laboratorio è alternare:
- brevi spiegazioni teoriche
- esempi concreti
- codice Python eseguibile
- piccoli esercizi di osservazione

L’obiettivo non è costruire subito un motore di ricerca realistico, ma comprendere con chiarezza le **strutture dati** e i **meccanismi di base** che rendono possibile la ricerca documentale.

---

## 📖 Che cos’è l’Information Retrieval?

L’**Information Retrieval** si occupa di trovare materiale rilevante, di solito documenti testuali non strutturati, all’interno di una collezione di grandi dimensioni.

Oggi il primo esempio che viene in mente è spesso il **web search**, ma i casi d’uso sono molto più ampi. Alcuni esempi tipici sono:
- motori di ricerca sul Web
- ricerca nelle email
- ricerca nei file del proprio computer
- ricerca in archivi aziendali
- ricerca in basi documentali giuridiche o tecniche

L’Information Retrieval è quindi lo studio di come rappresentare, indicizzare e recuperare documenti in modo efficace rispetto a una richiesta dell’utente.

---

## 🧩 Concetti chiave

Nel laboratorio useremo alcuni concetti fondamentali:

- **Collection**: insieme dei documenti su cui effettuiamo la ricerca
- **Document**: una singola unità testuale della collezione
- **Information need**: ciò che l’utente vuole davvero sapere
- **Query**: la formulazione testuale con cui l’utente esprime il proprio bisogno informativo
- **Relevance**: quanto un documento è utile rispetto al bisogno informativo dell’utente

Questi concetti sono centrali perché un sistema di IR non lavora direttamente sul “vero intento” dell’utente, ma solo sulla **query** che l’utente riesce a formulare.

---

## 💡 Esempio: information need vs query

Un utente potrebbe avere questo bisogno informativo:

> “Voglio trovare un modo per catturare un topo senza ucciderlo.”

Ma potrebbe formulare la query come:

> `how to trap a mouse alive`

Notiamo subito che **information need** e **query** non coincidono sempre perfettamente.

La query è solo una rappresentazione parziale, spesso incompleta o imperfetta, del bisogno informativo reale.  
Questa differenza è uno dei motivi per cui l’Information Retrieval è un problema interessante: il sistema deve cercare documenti utili partendo da una formulazione linguistica che può essere ambigua, incompleta o poco precisa.

---

## 🧪 Obiettivo pratico

Per rendere il laboratorio concreto, lavoreremo su una piccola collezione di documenti e costruiremo progressivamente:

1. una rappresentazione dei documenti
2. una **term-document incidence matrix**
3. un **inverted index**
4. semplici operazioni di **query processing**
5. una prima gestione delle **phrase query** tramite **positional index**

Questo approccio ci permetterà di capire bene la logica dei sistemi di retrieval prima di passare, nei laboratori successivi, a collezioni più grandi e realistiche.

---

## 🎓 Risultati di apprendimento attesi

Al termine del laboratorio lo studente dovrebbe essere in grado di:

- descrivere il problema affrontato dall’Information Retrieval
- distinguere tra **information need** e **query**
- rappresentare una collezione testuale tramite termini e documenti
- comprendere il funzionamento di una **term-document incidence matrix**
- costruire un semplice **inverted index**
- eseguire query booleane di base
- capire perché le phrase query richiedono un **positional index**

---

## ▶️ Struttura del notebook

Il laboratorio segue un percorso progressivo:

1. introduzione ai concetti di base dell’Information Retrieval  
2. costruzione di una piccola collezione di documenti  
3. tokenizzazione e costruzione del vocabolario  
4. term-document incidence matrix  
5. inverted index  
6. query processing con merge di postings lists  
7. phrase query e positional index  
8. esercizi finali

---