Perfetto.  
Faccio **la stessa identica cosa di prima**, ma **per Java / OOP**.  
Ti do **4 esercizi molto più fattibili**, ognuno ispirato a quelli che hai caricato, ma **ridotti all’osso**.  
Se sai fare questi, **non vai nel panico all’esame**.

---

## 🟢 ESERCIZIO 1 — Classi, attributi, metodi

**(base assoluta Java OOP)**

### Testo

Modella un **Dipendente**.

Attributi:

- nome
    
- cognome
    
- stipendio
    

Metodi:

- costruttore
    
- getter
    
- `aumentaStipendio(percentuale)`
    
- `toString()`
    

Scrivi una `main` che:

- crea 2 dipendenti
    
- aumenta lo stipendio a uno
    
- stampa entrambi
    

### Allena

- classi
    
- incapsulamento
    
- metodi
    
- `this`
    
- `main`
    

👉 È il minimo sindacale. Se sbagli qui, tutto il resto crolla.

---

## 🟢 ESERCIZIO 2 — Ereditarietà e polimorfismo

**(presente in biblioteca, ludoteca, persone, azienda)**

### Testo

Crea una gerarchia **Prodotto**.

Classe base:

```
Prodotto
- titolo
- anno
```

Sottoclassi:

```
Libro
- pagine

DVD
- durata
```

Metodo nella superclasse:

```
descrizione()
```

sovrascritto nelle sottoclassi.

Nella `main`:

- crea una `List<Prodotto>`
    
- inserisci libri e DVD
    
- stampa tutte le descrizioni
    

### Allena

- `extends`
    
- override
    
- polimorfismo
    
- liste di superclassi
    

👉 È il cuore degli esercizi grossi.

---

## 🟢 ESERCIZIO 3 — Collezioni + calcolo

**(versione facile di azienda, sport, fabbrica)**

### Testo

Gestisci una lista di **Studenti**.

Ogni studente ha:

- nome
    
- voto (int)
    

Scrivi una classe `Registro` con:

- `aggiungiStudente`
    
- `mediaVoti()`
    
- `studenteMigliore()`
    

### Allena

- `ArrayList`
    
- cicli
    
- confronto
    
- aggregazioni
    

👉 È lo stesso schema di:

- miglior giocatore
    
- miglior prodotto
    
- ranking
    

---

## 🟢 ESERCIZIO 4 — Factory semplice

**(versione soft di CardReader / PersonArchive)**

### Testo

Crea una **factory** per persone.

Classe base:

```
Persona (nome, cognome)
```

Sottoclassi:

```
Studente (matricola)
Lavoratore (azienda)
```

Classe `PersonaFactory` con metodo:

```
creaPersona(tipo, nome, cognome, info)
```

Esempio:

- tipo = "studente" → Studente
    
- tipo = "lavoratore" → Lavoratore
    

### Allena

- factory
    
- `switch` / `if`
    
- ritorno di superclassi
    
- astrazione
    

👉 Questo è l’esercizio “che fa paura”, ma così è gestibile.

---

## 📌 Come studiarli in 3 giorni

**Giorno 1**

- esercizio 1 + 2
    
- scrivili senza guardare soluzioni
    

**Giorno 2**

- esercizio 3
    
- attenzione ai confronti
    

**Giorno 3**

- esercizio 4
    
- capisci _perché_ serve una factory
    
