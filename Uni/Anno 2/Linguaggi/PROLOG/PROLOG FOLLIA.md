Ok, andiamo **dritti al punto**.  
Ti propongo **3 esercizi molto più semplici**, ma pensati **apposta** per coprire **tutte le basi di Prolog** che servono per esercizi come quelli che hai mostrato.

Ogni esercizio allena **un’idea chiave**.  
Se sai fare questi, **non sei spiazzato all’esame**.

---

## 🟢 ESERCIZIO 1 — Fatti, regole, unificazione, query

**(base assoluta di Prolog)**

### Testo

Rappresenta una piccola famiglia.

Fatti:

- genitore(mario, luigi)
    
- genitore(maria, luigi)
    
- genitore(luigi, anna)
    

Scrivi i predicati:

1. `nonno(X,Y)` → X è nonno di Y
    
2. `fratello(X,Y)` → X e Y hanno almeno un genitore in comune e X ≠ Y
    

### Cosa devi saper usare

- fatti
    
- regole
    
- variabili
    
- più obiettivi nella stessa regola
    
- `\=`
    

### Perché è importante

Qui impari:

- come Prolog **deduce**
    
- come funziona **l’unificazione**
    
- come si fanno le query
    

👉 È la base di **qualsiasi esercizio**.

---

## 🟢 ESERCIZIO 2 — Liste e ricorsione

**(fondamentale, sempre presente)**

### Testo

Lavora su liste di numeri.

Scrivi i predicati:

1. `lunghezza(Lista, N)`
    
2. `somma(Lista, S)`
    
3. `contiene(Lista, X)` → X è un elemento della lista
    

Esempi:

- `lunghezza([1,2,3],3)`
    
- `somma([1,2,3],6)`
    
- `contiene([a,b,c],b)`
    

### Cosa devi saper usare

- pattern `[H|T]`
    
- caso base
    
- ricorsione
    
- aritmetica con `is`
    

### Perché è importante

Qui impari:

- **pensiero ricorsivo**
    
- come Prolog scorre strutture
    
- quello che serve per esercizi su stringhe, messaggi nascosti, parsing
    

👉 Senza questo, il resto è impossibile.

---

## 🟢 ESERCIZIO 3 — Strutture e confronto di forma

**(prepara direttamente esercizi tipo “stessa struttura”)**

### Testo

Definiamo termini Prolog come:

- `f(a,b)`
    
- `f(X,Y)`
    
- `g(a,b,c)`
    

Scrivi il predicato:

```
stessa_struttura(T1,T2)
```

che è vero se:

- T1 e T2 hanno **lo stesso nome**
    
- hanno **lo stesso numero di argomenti**
    
- NON importa il nome delle variabili
    

Esempi:

- `stessa_struttura(f(a,b), f(X,Y))` → vero
    
- `stessa_struttura(f(a,b), g(a,b))` → falso
    
- `stessa_struttura(f(a), f(a,b))` → falso
    

### Suggerimento

Usa:

- `functor/3`
    
- confronto sul nome e sull’arità
    

### Cosa impari

- strutture
    
- ispezione dei termini
    
- astrazione dalla semantica
    

👉 È la versione **semplificata** degli esercizi più tosti che hai visto.



## ESERCIZIO NUOVO (stesso spunto, molto più fattibile)

### Testo

Hai **5 studenti** con un voto.

Fatti:

```
studente(mario, 24).
studente(luigi, 28).
studente(anna, 30).
studente(paolo, 26).
studente(laura, 29).
```

Una **coppia di studio** è formata da **2 studenti diversi**.

### Obiettivi

1. Definisci:
    

```
media_coppia(S1, S2, Media)
```

vero se `Media` è la media dei voti di `S1` e `S2`.

2. Definisci:
    

```
migliore_coppia(S1, S2)
```

vero se `(S1,S2)` è una coppia con **media massima**.

---

### Cosa allena (importante)

- uso dei fatti
    
- calcolo con `is`
    
- confronto numerico
    
- ricerca della soluzione migliore
    
- schema **generate & test**
    
