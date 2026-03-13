
## ESERCIZIO 1 ESAME
Quando chiede schema relazionale (a mo' dì funzioni) ricorda che
- <font color="#ff0000">CARDINALITÀ 1,1</font> -> nell'entità devi mettere le **chiavi secondarie**
- <font color="#4f81bd">CARDINALITÀ N,N</font> (che sullo schema scrivi come 1,N - 1,N) -> devi creare una **tabella di associazione** (tabella con `[FK]` delle due entità come `[PK]`)

## 🧠 Strategia pratica da usare in esame
1. Trova **le chiavi candidate**
2. Trova tutte le **FD**
3. Per ogni forma normale:
    - 1NF: valori atomici?
    - 2NF: ci sono FD su **parte della chiave**?
    - 3NF: ci sono FD **transitive**?
    - BCNF: posso trovare un attributo chiave (o superchiave) da un attributo non chiave?
	    - tipo da un numero di telefono -> <u>CF</u>, ma numero telefono non è una chiave primaria


---

## 🧩 Riepilogo visivo

| Forma Normale | Criterio                                                            | Obiettivo                              |
| ------------- | ------------------------------------------------------------------- | -------------------------------------- |
| **1NF**       | Nessun attributo multivalore                                        | Tabelle leggibili e gestibili          |
| **2NF**       | Nessuna dipendenza **parziale**                                     | Elimina ripetizioni legate alla chiave |
| **3NF**       | Nessuna dipendenza **transitiva**                                   | Elimina duplicazione di dati derivati  |
| **BCNF**      | Nessun attributo non chiave permette di trovare una chiave primaria |                                        |


