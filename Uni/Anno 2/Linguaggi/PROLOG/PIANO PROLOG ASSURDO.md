## 🔥 1. COS’È PROLOG (30 min – teoria che serve davvero)

**Perché è fondamentale**  
Se non capisci questo → scrivi codice a caso.

### Devi capire (NON MEMORIZZARE):

- Prolog è **dichiarativo**
    
- Non dici _come_, dici _quando_
    
- Un programma = **fatti + regole**
    
- Una query = “è vero che…?”
    

👉 Frase da orale:

> “Prolog cerca di rendere vera la query usando unificazione e backtracking”

---

## 🔥 2. TERMINI, VARIABILI, UNIFICAZIONE (45 min)

**Questa è la base mentale di tutto**

### Devi capire:

- atomi vs variabili
    
- termini composti
    
- cosa significa `X = Y`
    
- **unificazione ≠ assegnazione**
    

Esempi da saper spiegare:

`X = 3. X = Y. f(X) = f(3).`

👉 Se capisci questo, **capisci Prolog**

---

## 🔥 3. BACKTRACKING (1 ORA – LA COSA PIÙ IMPORTANTE)

Se capisci il backtracking → **passi l’esame**

### Devi capire:

- Prolog prova una regola
    
- se fallisce → torna indietro
    
- se premi `;` → cerca un’altra soluzione
    

Esempio mentale OBBLIGATORIO:

`member(X, [1,2,3]).`

👉 Devi riuscire a “vedere” Prolog che cammina nella lista.

---

## 🔥 4. LISTE E RICORSIONE (2 ORE – CORE DELL’ESAME)

Qui si vince o si perde tutto.

### Devi padroneggiare:

- `[H|T]`
    
- lista vuota `[]`
    
- ricorsione su liste
    

### Predicati **OBBLIGATORI**:

`member/2 append/3 length/2 reverse/2`

Non copiarli:  
👉 **capisci il CASO BASE + PASSO RICORSIVO**

Se sai scrivere `member`, sai scrivere tutto.

---

## 🔥 5. ORDINE DELLE REGOLE (30 min – salva dal panico)

Perché questo codice:

`p(X):- q(X). p(X):- r(X).`

non è uguale se inverti le regole?

👉 Perché Prolog:

- legge **dall’alto verso il basso**
    
- esplora **da sinistra a destra**
    

Questo spiega:

- loop
    
- soluzioni sbagliate
    
- risposte multiple
    

---

## 🔥 6. CUT (!) E FAIL (1 ORA – DOMANDA CLASSICA)

Qui il prof gode.

### Devi capire:

- cos’è `!`
    
- cosa blocca
    
- quando usarlo (POCO)
    

Esempio fondamentale:

`min(X,Y,X):- X =< Y, !. min(_,Y,Y).`

👉 Devi saper dire:

> “Uso la cut per evitare soluzioni alternative non desiderate”

---

## 🔥 7. NEGATION AS FAILURE (30 min)

Serve per:

- `not/1`
    
- controlli logici
    
- esercizi tipo _not_member_
    

Esempio:

`not_member(X,L):- not(member(X,L)).`

---

## 🔥 8. FINDALL / BAGOF / SETOF (1 ORA – ESAME SICURO)

Negli esami **ci sono SEMPRE**

### Devi sapere:

- differenza concettuale
    
- quando usarli
    

Mini-mappa:

- `findall` → sempre una lista
    
- `bagof` → fallisce se vuota
    
- `setof` → ordina e rimuove duplicati
    


---

# 🔥 9. STRINGHE COME LISTE (Prolog)

## Idea fondamentale

In Prolog **le stringhe non sono speciali**.  
Vengono trattate come **liste di codici (numeri)**.

Esempio concettuale:

```text
"ciao" ↔ [99,105,97,111]
```

Questo è il motivo per cui:

- puoi usare `member`
    
- puoi usare `append`
    
- puoi usare ricorsione
    

## `string_codes/2` (OBBLIGATORIO)

Serve a convertire:

- stringa → lista di codici
    
- lista di codici → stringa
    

```prolog
string_codes("ciao", L).
% L = [99,105,97,111]

string_codes(S, [99,105,97,111]).
% S = "ciao"
```

Funziona **in entrambi i sensi**.


## Pattern tipico da esame

### Controllare se una stringa contiene una sottostringa

```prolog
contiene(Stringa, Sub) :-
    string_codes(Stringa, L),
    string_codes(Sub, S),
    append(_, S, L).
```


## Frase da orale

> In Prolog le stringhe sono rappresentate come liste di codici e possono essere manipolate con i predicati sulle liste.

---

# 🔥 10. DCG BASE (SOLO QUELLO CHE SERVE)

## Cos’è una DCG

Una **DCG** (Definite Clause Grammar):

- è un modo più leggibile di scrivere predicati
    
- che lavorano su **liste**
    
- tipicamente per riconoscere sequenze

## DCG minima da esame

```prolog
s --> nome, verbo.
nome --> [mario].
verbo --> [corre].
```

Test:

```prolog
?- phrase(s, [mario, corre]).
true.
```

## Frasi da orale (sicure)

> Una DCG è una sintassi più leggibile per predicati che lavorano su liste.

> Le DCG vengono eseguite tramite il predicato `phrase`.
