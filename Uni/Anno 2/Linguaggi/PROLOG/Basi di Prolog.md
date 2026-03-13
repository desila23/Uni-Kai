# 📘 Lezione 14 settembre – Basi di Prolog

## 1. Cos’è Prolog

- Prolog è un linguaggio **dichiarativo**: tu descrivi i **fatti** e le **regole** del problema, e Prolog trova le soluzioni tramite **unificazione** e **backtracking**.
    
- Non dici “come fare le cose” passo per passo (stile Python o C), ma **cosa è vero** nel tuo mondo.

---
## 2. Fatti
Un **fatto** rappresenta una verità del mondo che stai modellando.  
Esempio (famiglia):
	`padre(mario, gianni). 
	`padre(gianni, luca). 
	`padre(luca, anna).`

Qui stai dicendo:
- Mario è padre di Gianni.
- Gianni è padre di Luca.
- Luca è padre di Anna.

---
## 3. Regole
Una **regola** permette di definire relazioni complesse a partire dai fatti.  
La forma è:
	`testa :- corpo.`

Significa: **“testa è vera se corpo è vero”**.
Esempio: definire il predicato `nonno(X,Y)`:
	`nonno(X,Y) :- padre(X,Z), padre(Z,Y).`

Leggilo così:
> “X è nonno di Y se X è padre di Z e Z è padre di Y”.

---
## 4. Query
Le **query** (interrogazioni) si scrivono nel prompt Prolog con `?-`.  
Esempi:
	`?- padre(mario, gianni). true.  
	`?- padre(mario, X). X = gianni.`

Oppure:
	`?- nonno(mario, anna). true.`

Qui Prolog ha usato i fatti e la regola per rispondere.

---
## 5. Unificazione
L’unificazione è l’algoritmo con cui Prolog prova a **rendere uguali due termini**.
- Funziona con sostituzioni di variabili.
- È alla base della risoluzione dei predicati.

Esempi:
	`?- X = mario.
		`X = mario.  
	`?- padre(mario, X) = padre(mario, gianni). 
		`X = gianni.  
	`?- padre(mario, X) = padre(gianni, luca). 
		`false.`

---

## 6. Backtracking
Se ci sono più soluzioni, Prolog esplora tutte le possibilità.
Esempio:
	`colore(rosso). 
	`colore(verde). 
	`colore(blu).  
		`?- colore(X). 
			`X = rosso ; 
			`X = verde ; 
			`X = blu.`

Prolog restituisce **tutte le soluzioni possibili**, una alla volta.

---
## 7. Esercizi pratici
👉 Crea un file `famiglia.pl` con:
```prolog
padre(mario, gianni). 
padre(gianni, luca). 
padre(luca, anna).  
nonno(X,Y) :- padre(X,Z), padre(Z,Y).
```

Poi prova queste query:
1. `?- padre(mario, gianni).`
2. `?- padre(mario, X).`
3. `?- nonno(mario, anna).`
4. `?- nonno(gianni, anna).`

---
# 8. Riassunto veloce
- **Fatti** = cose vere.
- **Regole** = definizioni logiche.
- **Query** = domande a Prolog.
- **Unificazione** = rende uguali due termini con sostituzioni.
- **Backtracking** = esplora tutte le soluzioni possibili.

---

# 📘 Lezione 15 settembre – Liste e ricorsione

## 1. Liste in Prolog
Le liste sono strutture fondamentali, scritte tra **[ ]**.  
Esempi:
	`[]                % lista vuota 
	`[1,2,3]           % lista di numeri 
	`[a,b,c]           % lista di atomi 
	`[1, pippo, X]     % lista mista con variabile`

Si possono anche scrivere come **testa | coda**:
	`[H|T]`

- `H` = primo elemento (head).
- `T` = resto della lista (tail).

Esempi:
	`?- [H|T] = [1,2,3]. 
		`H = 1, T = [2,3].  
	`?- [H|T] = [a]. 
		`H = a, T = [].`

---

## 2. Predicati built-in per le liste
I principali che il prof ti lascia usare:
- `member(X,L)` → vero se `X` appartiene a `L`.
- `append(L1,L2,L3)` → unisce due liste.
- `length(L,N)` → vero se `N` è la lunghezza della lista `L`.
- `reverse(L,R)` → vero se `R` è la lista `L` al contrario.
- `atom(A)` → vero se A è un atomo (es. a, pippo). 
- `number(A)` → vero se A è un numero.
- `list(L)` → vero se L è una lista


Esempi:
```
?- member(b, [a,b,c]). 
	true.
?- append([1,2], [3,4], X). 
	X = [1,2,3,4].  
?- length([a,b,c], N). 
	N = 3.  
?- reverse([1,2,3], R). 
	R = [3,2,1].`
```

---

## 3. Ricorsione sulle liste
Molti predicati si implementano **ricorsivamente**:
- Caso base → lista vuota `[]`.
- Caso ricorsivo → lista `[H|T]`.

### Esempio: definire `my_length/2`
```
my_length([], 0).                     % Caso base 
my_length([_|T], N) :-                % Caso ricorsivo     
	my_length(T, N1),     
	N is N1 + 1.`
```

Prova:
`?- my_length([a,b,c], N). -> N = 3.`

---

### Esempio: definire `my_member/2`
```
my_member(X, [X|_]).                  % Caso 1: X è la testa 
my_member(X, [_|T]) :-                % Caso 2: cerca nella coda     
	my_member(X, T).
```

Prova:
`?- my_member(2, [1,2,3]). -> true.`
1. Primo tentativo: `my_member(2, [2|_])` → non unifica perché la lista è `[1,2,3]`, la testa è `1`, non `2`.
2. Prova il caso ricorsivo: `my_member(2, [_|T])`. Qui `_` unifica con `1`, `T = [2,3]`.  
    Ora deve risolvere `my_member(2, [2,3])`.
	- Nuovo giro: controlla `my_member(2, [2|_])`. Stavolta la testa è `2`, perfetto → **true**.
	
`?- my_member(4, [1,2,3]). -> false.`

---

### Esempio: definire `my_append/3`
```
my_append([], L, L).                  % Caso base 
my_append([H|T], L2, [H|R]) :-        % Caso ricorsivo     
	my_append(T, L2, R).
```

Prova:\
`?- my_append([1,2], [3,4], X). 
	`X = [1,2,3,4].`

---

## 4. Esercizi pratici
👉 Prova a scrivere questi predicati da solo:
1. `somma_lista(Lista, Somma)` → somma tutti i numeri in una lista.
```
somma_lista([], 0).           % caso base
somma_lista([H|T], S) :-      % caso ricorsivo
    somma_lista(T, R),
    S is H + R.
```


2. `conta_occorrenze(X, Lista, N)` → conta quante volte X appare.
```
conta_occorrenze(_, [], 0).           % caso base
conta_occorrenze(X, [X|T], N) :-      % caso in cui la testa è X
    conta_occorrenze(X, T, N1),
    N is 1 + N1.
conta_occorrenze(X, [_|T], N) :-      % caso in cui X si cerca nella coda
    conta_occorrenze(X, T, N).
```


3. `maggiore_di(Lista, N, Filtrata)` → restituisce solo gli elementi > N.
```
maggiore_di([], _, []).            % caso base     
maggiore_di([H|T], N, [H|R]) :-    % caso in cui la testa è X
    H > N,
    maggiore_di(T, N, R).
maggiore_di([H|T], N, R) :-        % caso in cui X si cerca nella coda 
    H =< N,
    maggiore_di(T, N, R).
```


_(Sono gli scheletri che userai più avanti per gli esercizi sugli esami.)_

---

## 5. Riassunto veloce
- Le liste sono `[ ]` o `[H|T]`.
- `member/2`, `append/3`, `length/2`, `reverse/2` → strumenti fondamentali.
- Quasi tutto si fa con ricorsione:
    - Caso base: lista vuota.
    - Caso ricorsivo: `[H|T]`.

---
# 📘 Lezione 16 settembre – Strutture e termini complessi

## 1. Cosa sono le strutture in Prolog
In Prolog, una struttura (o **termine complesso**) è simile a un record o un oggetto:
	`funzione(arg1, arg2, ..., argN)`

Esempi:
```
mangia(cavallo, biada). 
colore(macchina(rossa), rosso). 
albero(nodo(1), nodo(2)).
```

📌 Le strutture sono **dati**, non “funzioni” come in altri linguaggi.

---
## 2. Atomi, numeri e termini
- **Atomo** → un nome “simbolico” (`pippo`, `rosso`, `cane`).
- **Numero** → `1`, `2.3`, ecc.
- **Termine complesso** → qualcosa con un funtore e argomenti (`padre(mario, gianni)`).

Predicati utili:
- `atom(X)   % vero se X è atomo 
- `number(X) % vero se X è numero`

Esempio:
- `?- atom(rosso).` 
	`true.`  
- `?- number(42).` 
	`true.`  
- `?- atom(padre(mario, gianni)).`
	- `false.   % è un termine complesso, non un atomo`

---

## 3. Unificazione su strutture
Prolog prova a “far combaciare” le strutture **se hanno lo stesso funtore e stessa arità**.
- un **funtore** → il “nome” del predicato o del costruttore,
- una **arità** → il **numero di argomenti** che prende.

Esempi:
`?- mangia(X, biada) = mangia(cavallo, Y).`
	`X = cavallo, Y = biada.`
`?- mangia(cavallo, biada) = mangia(ragno, rosmarino).`
	`false.`
- **Funtore**: entrambi `mangia`.   
- **Arity**: entrambi 2.
- Prolog confronta:
    - `cavallo` con `ragno` → non sono uguali.
    - `biada` con `rosmarino` → non sono uguali.  
        → Basta già il primo confronto per fallire → **false**.

---

## 4. Ricorsione sulle strutture
Puoi trattare le strutture come liste: confronta testa/coda con ricorsione.

### Esempio: stessa arità
```
stessa_arita(T1, T2) :-     
	functor(T1, _, A1),
	functor(T2, _, A2),
	A1 =:= A2.`
```

 >[!question]- Come funziona `functor`?
`functor(Term, F, A)`
>- `Term` = un termine qualunque (es. `mangia(cavallo, biada)`) 
>- `F` = il funtore (cioè il “nome”)
>- `A` = l’arità (numero di argomenti)

Uso:
- `?- stessa_arita(mangia(cavallo, biada), ama(romeo, giulietta)).`
	- `true.`  
- `?- stessa_arita(mangia(cavallo, biada), colore(rosso)).` 
	- `false.`

---

## 5. Strutture come alberi
Un termine complesso può rappresentare un **albero**.
Esempio: un albero binario
- `albero(nil). 
- `albero(nodo(Valore, Sinistra, Destra)).`

Esercizio: controllare se due alberi hanno la **stessa forma**:
```
stessa_struttura(nil, nil). 
stessa_struttura(nodo(_,SX1,DX1), 
nodo(_,SX2,DX2)) :-     
	stessa_struttura(SX1, SX2),     
	stessa_struttura(DX1, DX2).
```

Uso:
`?- stessa_struttura(nodo(1,nil,nil), nodo(a,nil,nil)).` 
- `true.`  
`?- stessa_struttura(nodo(1,nil,nil), nodo(a,nil,nodo(b,nil,nil))).`
- `false.`

---

## 6. Esercizi pratici
👉 Prova a scrivere:
1. `stessa_funzione(T1, T2)` → vero se i due termini hanno lo stesso funtore (es. `mangia/2` e `mangia/2`).
```
stessa_funzione(T1, T2) :-
    functor(T1, F, A),
    functor(T2, F, A).
```


2. `conta_nodi(T, N)` → conta quanti nodi ci sono in un albero rappresentato come `nodo(_,SX,DX)`.
```
conta_nodi(nil, 0).
conta_nodi(nodo(_, SX, DX), N) :- 
    conta_nodi(SX, N1),    
    conta_nodi(DX, N2),
    N is 1 + N1 + N2.
```


3. `foglia(T)` → vero se T è una foglia (nodo senza figli).
```
foglia(nodo(_, nil, nil)).
```


---

## 7. Riassunto veloce
- Le strutture sono **dati complessi** in Prolog.
- Unificazione funziona solo se funtore e arità coincidono.
- Puoi trattare le strutture come alberi → ricorsione.
- Predicati utili: `atom/1`, `number/1`, `functor/3`.

---

# 📘 Lezione 17 settembre – `fail`, `cut` e il `not`

## 1. Backtracking in Prolog (ripasso veloce)
- Quando fai una query, Prolog cerca soluzioni.
- Se trova una soluzione, la propone.
- Se chiedi altre (`;`), Prolog **torna indietro (backtracking)** e cerca altre strade.

Esempio:
```
colore(rosso). 
colore(verde). 
colore(blu).  

?- colore(X). 
	X = rosso ; X = verde ; X = blu.
```

---

## 2. Il predicato `fail`
- `fail/0` è un predicato che **fallisce sempre**.
- Serve per forzare Prolog a cercare altre soluzioni.

Esempio:
```
stampa_colore :-     
	colore(X),     
	write(X), 
	nl,     
	fail.     % forza backtracking
```

Uso:
`?- stampa_colore. rosso verde blu false.`

📌 Qui `fail` obbliga Prolog a continuare a cercare altri `colore(X)`.  
Quando non ne trova più → `false`.  
👉 `fail` viene spesso usato per “fare tutte le soluzioni” (es. stampa, conteggio).

---

## 3. Il predicato `cut (!)`
- `!` è chiamato **cut** (taglio).
- Serve per **bloccare il backtracking** oltre un certo punto.

Esempio:
```
massimo(X,Y,X) :- 
	X >= Y, !. 

massimo(X,Y,Y).
```

Cosa succede:
- Se `X >= Y`, allora la prima regola è vera e il `!` impedisce a Prolog di provare la seconda regola.
- Se `X < Y`, la prima regola fallisce e Prolog passa alla seconda.

Uso:
`?- massimo(5,3,R). R = 5.`  
`?- massimo(2,7,R). R = 7.`
Senza cut, Prolog proverebbe comunque entrambe le regole e magari darebbe più soluzioni inutili.

---

## 4. Il `not` in Prolog
Prolog non ha un `not` nativo (logica classica ≠ logica di Prolog).  
Però si può **simulare** con `cut` e `fail`:
```
not(P) :- 
	P, 
	!, 
	fail.      % se P è vero → fallisci 

not(_).        % se P è falso → questa regola va in porto
```

Esempi:
`?- not(rosso = verde). true.`  
`?- not(rosso = rosso). false.`

📌 Attenzione: questo `not` è il cosiddetto **negation as failure**:  
“qualcosa è falso se non si può dimostrare che è vero”.

---

## 5. Cut rosso vs cut verde
In teoria si distinguono due tipi di cut:
- **Cut rosso** → cambia il significato logico del programma (forza una scelta, può eliminare soluzioni corrette).
- **Cut verde** → serve solo a rendere più efficiente il programma (non cambia il significato).

Esempio cut verde (ottimizzazione):
```
pari(X) :- 
	X mod 2 =:= 0, 
	!. 

pari(_).
```

Qui il cut evita di controllare altre regole inutili.

---

## 6. Esercizi pratici
1. Definisci `massimo/3` con cut (già visto).
```scss
massimo(X, Y, X) :-
    X >= Y,
    !.
massimo(_, Y, Y).
```


2. Definisci `assoluto(X,Y)` che calcola il valore assoluto usando cut.
```scss
assoluto(X,X) :- 
    X >= 0, 
    !. 

assoluto(X,Y) :- 
    Y is -X.
```

3. Usa `fail` per scrivere `stampa_lista/1` che stampa tutti gli elementi di una lista uno per riga.
```scss
stampa_lista([H|_]) :-
    write(H),
    nl,
    fail.
	
stampa_lista([_|T]) :-
    stampa_lista(T).
    
stampa_lista([]).
```

4. Definisci `segno/2` che dice se un numero è positivo, negativo o zero, usando `cut` per evitare soluzioni multiple.
```scss
segno(X, positivo) :-
    X >= 0,
  	!.
  	
segno(_, negativo).
```

5. Definisci `non_membro/2` che è vero se un elemento **non** appartiene a una lista.  
	Puoi sfruttare `not/1` costruito con `cut` e `fail`.
```scss
non_membro(X, [X|_]) :-
    !,                      % se lo trovo, non serve controllare altro
    fail.                   % fallisco
non_membro(X, [_|T]) :-
    non_membro(X, T).
non_membro(_, []).
```

6. Dato questo programma utile per contare le volte che un numero compare in una lista, rendilo deterministico con `cut`.
```scss
n_counter(_, [], 0).
n_counter(N, [N|L], C) :-
    n_counter(N, L, C1),
    C is C1 + 1.
n_counter(N, [_|L], C) :-
    n_counter(N, L, C).
```
	
devo mettere il `!` all'inizio della seconda clausula
```scss
n_counter(_, [], 0).
n_counter(N, [N|L], C) :-
    !,                      % qui
    n_counter(N, L, C1),
    C is C1 + 1.
n_counter(N, [_|L], C) :-
    n_counter(N, L, C).
```

---

## 7. Riassunto
- **`fail`** → fallisce sempre, utile per forzare il backtracking.
- **`cut`** → blocca il backtracking, serve per ottimizzare o per forzare scelte.
- **`not`** → si implementa con cut + fail (`negation as failure`).
- Usare cut e fail richiede attenzione: possono cambiare la logica del programma.

---

# 📘 Lezione 18 settembre – `assert`, `retract` e `univ`

## 1. La base di conoscenza in Prolog
Quando scrivi un programma Prolog, definisci una **base di conoscenza (KB)** con:
- **Fatti** → cose sempre vere.
- **Regole** → relazioni dedotte dai fatti.

Ma Prolog permette anche di **aggiungere o rimuovere** fatti e regole **durante l’esecuzione**.

---

## 2. `assert/1` – aggiungere fatti o regole
- `assert(X)` aggiunge il fatto/regola `X` alla base di conoscenza.
- `asserta(X)` lo aggiunge in testa, `assertz(X)` in coda (di solito non importa).

Esempio:
`?- assert(padre(pippo, pluto)). true.`  
`?- padre(pippo, Y). Y = pluto.`

📌 Dopo la query, la base di conoscenza ha un fatto in più.

---

## 3. `retract/1` – rimuovere fatti o regole
- `retract(X)` rimuove la prima clausola che unifica con `X`.
- Se ci sono più fatti uguali, puoi richiamare `;` per rimuoverne altri.

Esempio:
`?- assert(padre(topolino, minnie)). true.`  
`?- retract(padre(topolino, minnie)). true.`  
`?- padre(topolino, minnie). false.`

---

## 4. Uso insieme di `assert` e `retract`
Puoi aggiornare la KB “al volo”.  
Esempio: contatore che si incrementa:
```
:- dynamic contatore/1. 
contatore(0).  
incrementa :-     
	retract(contatore(N)),     
	N1 is N + 1,     
	assert(contatore(N1)).
```


Uso:
`?- incrementa. true.` 
`?- incrementa. true.`  
`?- contatore(X). X = 2.`

📌 `:- dynamic nome/Arity.` serve a dire a Prolog che quel predicato può essere modificato.

---

## 5. L’operatore =.. (univ)
"=.." permette di convertire un termine in una **lista** con il funtore e gli argomenti.

Sintassi:
`Term =.. Lista`
- Da termine a lista:
    `?- mangia(cavallo, biada) =.. L.` 
	    `L = [mangia, cavallo, biada].`
    
- Da lista a termine:
    `?- T =.. [ama, romeo, giulietta].` 
	    `T = ama(romeo, giulietta).`

📌 È utile quando vuoi “manipolare” i predicati come dati.

---

## 6. `listing/1` (solo per curiosità)
`listing/1` stampa tutte le definizioni di un predicato.  
Esempio:
`?- listing(padre/2). padre(mario, gianni). padre(gianni, luca). true.`

Non è fondamentale per l’esame, ma utile per il debug.

---

## 7. Esercizi pratici
1. Aggiungi un fatto dinamico con `assert` e verifica che sia interrogabile.
```scss
:- dynamic padre/2.

?- assertz(padre(pippo, pluto)).
?- padre(pippo, X).
	X = pluto.
```


2. Rimuovi un fatto con `retract`.
```scss
:- dynamic padre/2.

?- assertz(padre(gianni, samuele)).
?- retractz(padre(gianni, samuele)).
?- padre(gianni, X).
	false

```


3. Scrivi un predicato `aggiungi_amico(X,Y)` che fa `assert(amico(X,Y))`.'
```scss
:- dynamic amico/2.

aggiungi_amico(X,Y) :-
    assertz(amico(X,Y)).
    

?- aggiungi_amico(luca, samuele).
?- amico(luca, X). 
	X = samuele.
```


4. Scrivi un predicato `toglie_amico(X,Y)` che fa `retract(amico(X,Y))`.
```scss
:- dynamic amico/2.

aggiungi_amico(X,Y) :-
    assert(amico(X,Y)).

togli_amico(X, Y) :-
    retract(amico(X, Y)).
```


5. Usa =.. per trasformare `somma(2,3,5)` in `[somma,2,3,5]`.
```scss
?- T =.. [somma, 2, 3, 5].
	T = somma(2,3,5)
```


6. Usa = .. per costruire dinamicamente un fatto tipo `studente(pippo,30)` a partire da una lista.
```scss
?- studente(pippo,30) =.. L.
	L = [studente, pippo, 30
```


7. Definisci un predicato `aggiungi_numero(Nome, Numero)` che aggiunge un fatto `telefono(Nome,Numero)` alla base di conoscenza.
```scss
:- dynamic telefono/2.

aggiungi_numero(Nome, Numero) :-
    assertz(telefono(Nome, Numero)).

rimuovi_numero(Nome, Numero) :-
    retract(telefono(Nome, Numero)).
    

?-  aggiungi_numero(anna, 123),
	aggiungi_numero(anna, 456),
	telefono(Anna, X).
		X = 123
		X = 456
		
	rimuovi_numero(anna, 456),
	telefono(Anna, X).
		X = 123
```

---

## 8. Riassunto
- **`assert/1`** → aggiunge fatti o regole alla KB.
- **`retract/1`** → rimuove fatti o regole.
- = .. univ → converte un termine ↔ lista `[funtore, arg1, arg2,…]`.
- **`listing/1`** → stampa i predicati (solo di supporto).


---

# 📘 Lezione 19 settembre – Definite Clause Grammars (DCG)

## 1. Perché servono le DCG
- Senza DCG, analizzare frasi significa lavorare manualmente con liste di simboli: `[il,cavallo,mangia,la,biada]`.
- Con DCG puoi scrivere regole grammaticali più **leggibili** e lasciare a Prolog il lavoro di gestire le liste.
- Sono molto usate per parsing, linguaggio naturale, compilatori, trasformazioni di testo.

---

## 2. Sintassi base
Una regola DCG si scrive con `-->` invece di `:-`.  
Esempio:
```scss
frase --> soggetto, predicato.  
soggetto --> [cavallo]. 
soggetto --> [ragno].  
predicato --> [mangia, biada]. 
predicato --> [mangia, rosmarino].
```

Uso:
```scss
?- frase([cavallo,mangia,biada], []). 
	true.  

?- frase([ragno,mangia,rosmarino], []). 
	true.
```
IL `[]` alla fine è standard

📌 Una regola `p --> q,r.` equivale a:
```scss
p(L0,L2) :- 
	q(L0,L1), 
	r(L1,L2).
```


Quindi le DCG sono solo **zucchero sintattico** per gestire liste di simboli.

---

## 3. Esempio: grammatica semplice
Costruiamo una grammatica che riconosce frasi del tipo _“il cavallo mangia la biada”_.

```scss
frase --> articolo, nome, verbo, articolo, nome.  
articolo --> [il]. 
articolo --> [la].  
nome --> [cavallo]. 
nome --> [biada]. 
nome --> [ragno]. 
nome --> [rosmarino].  
verbo --> [mangia].
```


Uso:
```scss
?- frase([il,cavallo,mangia,la,biada], []). 
	true.  
	
?- frase([il,ragno,mangia,rosmarino], []). 
	true.
```

---

## 4. DCG con variabili (estrazione di significato)
Possiamo “estrarre” la struttura logica da una frase.
```scss
frase(mangia(Soggetto, Oggetto)) -->      
	articolo, 
	nome(Soggetto), 
	verbo, 
	articolo, 
	nome(Oggetto).  

articolo --> [il]. 
articolo --> [la].  
nome(cavallo) --> [cavallo]. 
nome(biada) --> [biada]. 
nome(ragno) --> [ragno]. 
nome(rosmarino) --> [rosmarino].  
verbo --> [mangia].
```


Uso:
```scss
?- frase(X, [il,cavallo,mangia,la,biada], []). 
	X = mangia(cavallo, biada).  

?- frase(X, [il,ragno,mangia,rosmarino], []). 
	X = mangia(ragno, rosmarino).
```

📌 Qui DCG non solo controlla la frase, ma costruisce direttamente il fatto logico.

---

## 5. DCG con ricorsione
Le DCG gestiscono anche frasi composte.  
Esempio: più nomi di fila → lista:
```scss
nomi([N|Ns]) --> 
	nome(N), 
	nomi(Ns). 

nomi([]) --> [].  

nome(cavallo) --> [cavallo]. 
nome(biada) --> [biada].
```

Uso:
```scss
?- nomi(L, [cavallo,biada,cavallo], []). 
	L = [cavallo, biada, cavallo].
```

---

## 6. Dove servono per l’esame
- Esercizio **rete alimentare (09/07)**: frasi tipo _“Il cavallo si nutre di biada”_ → `mangia(cavallo,biada)`.
- Con DCG puoi definire più regole per catturare tutte le varianti (mangia, si nutre di, il cibo è…).

Esempio:
```scss
frase(mangia(Soggetto, Oggetto)) -->      
	[il], 
	nome(Soggetto), 
	[mangia], 
	[la], 
	nome(Oggetto).  

frase(mangia(Soggetto, Oggetto)) -->      
	[il], 
	nome(Soggetto), 
	[si, nutre, di], 
	nome(Oggetto).
```

---

## 7. Esercizi pratici
1. Scrivi una DCG che riconosce frasi tipo:
    - “il cane ama il gatto” → `ama(cane,gatto)`
```scss
frase(ama(Soggetto, Oggetto)) --> 
    articolo,
    nome(Soggetto),
    verbo,
    articolo,
    nome(Oggetto).

articolo --> [il].
nome(cane) --> [cane].
nome(gatto) --> [gatto].
verbo --> [ama].


?- frase(X, [il, cane, ama, il, gatto], []).
	X = ama(cane,gatto).
```


2. Scrivi una DCG e fai in modo che costruisca una frase.
```scss
frase(succhia(Soggetto, Oggetto1, Oggetto2)) -->
    nome(Soggetto),
    verbo,
    articolo,
    nome(Oggetto1),
    proposizione,
    nome(Oggetto2).
    
nome(samuele) --> [samuele].
nome(pisello) --> [pisello].
nome(luca) --> [luca].
verbo --> [succhia].
articolo --> [il].
proposizione --> [a].


?- frase(succhia(samuele, pisello, luca), L, []).
	L = [samuele, succhia, il, pisello, a, luca].
```


3. Scrivi una DCG che riconosce una lista di numeri `[1,2,3]` e la traduce in `somma(6)`.
```scss
lista(somma(S)) --> numeri(S).

numeri(0) --> [].
numeri(S) --> 
    [N], 
    numeri(S1),
    {S is N + S1}.
    
    
?- lista(S, somma[1,2,3], []).
	X = somma(6)
	
IN SWISH DEVI SCRIVERE QUESTO
?- phrase(lista(X), [1,2,3]).
```


4. Estendi la DCG dell’esercizio alimentare per riconoscere almeno **3 modi diversi** di esprimere la stessa relazione.

---

## 8. Riassunto
- DCG = notazione più leggibile per analizzare stringhe/lista di simboli.
- Sintassi: `-->`.
- Dietro le quinte: `p(L0,L2) :- q(L0,L1), r(L1,L2).`
- Con le variabili puoi trasformare frasi in **strutture logiche**.


---

# 📘 Lezione 20 settembre – Definire operatori e precedenza in Prolog

## 1. Perché gli operatori?
In Prolog, sotto il cofano, anche le espressioni più semplici sono **termini**.  
Per esempio l’espressione aritmetica `1 + 2 * 3` non è “un calcolo”, ma un termine annidato, equivalente a:
`+(1, *(2,3))`

Chiaramente nessuno vuole scrivere sempre così. Per questo Prolog permette di dichiarare **operatori**, in modo da rendere più leggibile il codice e decidere **chi lega più forte** e **in che ordine** interpretare una sequenza di simboli.

---

## 2. Come si dichiara un operatore
Si usa il predicato:
```
op(Precedenza, Tipo, Nome).
```

- **Precedenza**: è un numero da 1 a 1200.  
    Più il numero è **piccolo**, più l’operatore “lega forte” (cioè viene valutato prima).
    
- **Tipo**: indica se l’operatore è infisso, prefisso o postfisso, e come si comporta con altri operatori della stessa precedenza.
    
- **Nome**: è l’atomo che diventa l’operatore (es. `and`, `or`, `++`).
    

Esempio semplice:
```
:- op(500, yfx, plus).
```

Dichiara `plus` come operatore **infix** (in mezzo) con precedenza 500.

---

## 3. Cosa significano x e y
Questa è la parte che spesso sembra misteriosa.  
Le lettere `x` e `y` dicono se **l’argomento può avere la stessa precedenza dell’operatore**:
- `x` → l’argomento deve avere precedenza **più alta** (numero più basso).
- `y` → l’argomento può avere precedenza **uguale o più alta**.

Questo serve a decidere se puoi scrivere catene senza parentesi, e in che direzione si associano.

---

## 4. Infix: associatività
Se definisci un operatore **infix** (tra due argomenti), hai tre possibilità:
- `yfx` → associativo a sinistra  
    Esempio: con `plus/2` dichiarato `yfx`, Prolog interpreta:
  ```
    1 plus 2 plus 3   ⇒   plus(plus(1,2), 3)
    ```
    
- `xfy` → associativo a destra  
    Utile per potenze:
    ```
    2 pow 3 pow 2   ⇒   pow(2, pow(3,2))
    ```
    
- `xfx` → non associativo  
    Vietate le catene:
    ```
    a eq b eq c   ⇒   ERRORE senza parentesi
    ```


---

## 5. Prefix e Postfix
Gli operatori possono stare anche **prima** o **dopo** dell’argomento:
- **Prefisso (fx/fy)**: esempio `not a`.
    - `fx`: l’argomento deve avere precedenza più alta.
    - `fy`: l’argomento può avere stessa precedenza → permette catene tipo `not not a`.
    
- **Postfisso (xf/yf)**: meno usati, ma possibili.
    - `xf`: l’argomento a sinistra deve avere precedenza più alta.
    - `yf`: può avere la stessa → puoi scrivere cose tipo `a !!` (se definito).


---

## 6. Precedenza nella pratica
Una regola utile da ricordare è: **numeri più piccoli = operatori più forti**.  
Quindi, se vuoi simulare un po’ di algebra di merda:
- `*` intorno a 400
- `+` intorno a 500
- comparazioni (<, =, …) intorno a 700
- logica (`and`, `or`) intorno a 800–900
- `:-` e `,` molto esterni (intorno a 1000–1200)

Esempio:
```
:- op(300, fy, not). :- op(800, yfx, and). :- op(850, yfx, or).
```

Così Prolog interpreta in modo naturale le operazioni:
```
not a and b or c   ⇒   or(and(not(a), b), c)
```

---

## 7. Esempi concreti

### Somma left-associativa

`:- op(500, yfx, plus).`

Uso:

`?- 1 plus 2 plus 3. plus(plus(1,2), 3).`

### Potenza right-associativa

`:- op(400, xfy, pow).`

Uso:

`?- 2 pow 3 pow 2. pow(2, pow(3,2)).`

### Operatore prefisso

`:- op(300, fy, not).`

Uso:

`?- not not a. not(not(a)).`

---

## 8. Buone pratiche
- Non ridefinire operatori già esistenti (=, is, :- …).
- Usa gli operatori solo se rendono il codice più leggibile.
- Quando hai dubbi, **metti sempre le parentesi**: hanno precedenza massima.


---

## 9. Esercizi consigliati

1. Definisci `and` e `or` con precedenze tali che `not` leghi più di `and` e `and` più di `or`. Verifica il parse di `not a or b and not c`.
    
2. Definisci un operatore `**` right-associativo e prova `2 ** 3 ** 2`.
    
3. Definisci un operatore `eq` non associativo e verifica che `a eq b eq c` dia errore.
    

---

## 10. Riassunto finale

- In Prolog tutto è un termine.
    
- `op/3` ti permette di dichiarare operatori con precedenza e associatività.
    
- `x` e `y` regolano se gli argomenti possono avere stessa precedenza (influenza le catene).
    
- Numeri più bassi = legano più forte.
    
- Usare operatori è comodo, ma va fatto con giudizio.

---

# 📘 Lezione 21 settembre – `findall`, `bagof`, `setof`

## 1. Il problema di fondo
Di solito, Prolog ti dà **una soluzione alla volta**.  
Esempio:
```scss
colore(rosso). 
colore(verde). 
colore(blu).  

?- colore(X). 
	X = rosso ; X = verde ; X = blu.
```

Se vuoi **una lista con tutte le soluzioni** (`[rosso, verde, blu]`), hai bisogno di strumenti appositi: `findall`, `bagof` e `setof`.

---

## 2. `findall/3`
### Sintassi
`findall(Termine, Goal, Lista).`
- `Termine` → cosa raccogliere.
- `Goal` → la query da eseguire.
- `Lista` → la lista di tutte le istanze del cazzo trovate.

### Esempio semplice
```scss
?- findall(X, colore(X), L). 
	L = [rosso, verde, blu].
```

### Se non ci sono soluzioni
`findall` restituisce sempre una lista, anche se vuota:
```scss
?- findall(X, animale(X), L). 
	L = [].
```

📌 **Importante**: `findall` ignora variabili libere nel `Goal`. Quindi se ci sono variabili non vincolate, non separa i risultati per valori diversi → mette tutto insieme.

---

## 3. `bagof/3`

### Sintassi
```scss
bagof(Termine, Goal, Lista).
```

Simile a `findall`, ma **tratta le variabili libere come parametri**.  
Cosa significa? Che separa i risultati in base alle variabili non legate.

### Esempio
```scss
padre(mario, gianni). 
padre(mario, luca). 
padre(gianni, anna).  

?- bagof(Figlio, padre(Padre, Figlio), L). 
	Padre = mario,  L = [gianni, luca] ; 
	Padre = gianni, L = [anna].
```

Qui `Padre` è **variabile libera**: quindi `bagof` ti dà un risultato **per ogni valore di Padre**.

### Se vuoi ignorare una variabile libera
Puoi usare l’operatore `^` per “bloccare” una variabile:
```scss
?- bagof(Figlio, Padre^padre(Padre, Figlio), L). 
	L = [gianni, luca, anna].
```

---

## 4. `setof/3`

### Sintassi
```scss
setof(Term, Goal, Lista).
```

È identico a `bagof`, ma in più fa queste cose:
- Ordina la lista in ordine crescente.
- Elimina i duplicati.

### Esempio
```scss
colore(rosso). 
colore(verde). 
colore(rosso).  

?- setof(X, colore(X), L). 
	L = [rosso, verde].
```

---

## 5. Differenze riassunte
- **findall** → piglia tutto, sempre in una lista (anche vuota). Non distingue variabili libere.
- **bagof** → raggruppa i risultati per ogni combinazione di variabili libere.
- **setof** → come `bagof`, ma i risultati sono ordinati e senza duplicati.

---

## 6. Esempi comparativi

### Database
```scss
padre(mario, gianni). 
padre(mario, luca). 
padre(gianni, anna). 
padre(gianni, luca).   % duplicato intenzionale
```

### findall
```scss
?- findall(F, padre(P, F), L). 
	L = [gianni, luca, anna, luca].
```
→ tutto in una lista unica, duplicati inclusi.

### bagof
```scss
?- bagof(F, padre(P, F), L). 
	P = gianni, L = [anna, luca] ; 
	P = mario,  L = [gianni, luca].
```
→ risultati separati per `P`.

### setof
```scss
?- setof(F, padre(P, F), L). 
	P = gianni, L = [anna, luca] ; 
	P = mario,  L = [gianni, luca].
```
→ come `bagof`, ma liste ordinate e senza duplicati.

---

## 7. Esercizi pratici
1. Usa `findall` per raccogliere tutti i colori in una lista.
2. Usa `bagof` per ottenere i figli di ciascun padre separatamente.
3. Usa `setof` per ottenere tutti i padri distinti ordinati alfabeticamente.
4. Crea un predicato `figli(Padre, ListaFigli)` che usa `bagof`.

---

## 8. Riassunto
- `findall/3`: raccoglie tutto in una lista (anche vuota).
- `bagof/3`: separa i risultati in base alle variabili libere.
- `setof/3`: come `bagof`, ma ordina e rimuove duplicati.
- `^` serve a bloccare una variabile quando non vuoi che venga considerata “libera”.


# 📘 Lezione 22 settembre – Ripasso generale di Prolog (teoria + esempi minimi)

---

## 1. Basi del Prolog

- **Fatti** → verità assolute:
    

`padre(mario, gianni).`

- **Regole** → “se… allora…”:
    

`nonno(X,Y) :- padre(X,Z), padre(Z,Y).`

- **Query** → domande:
    

`?- padre(mario, gianni).   % true ?- padre(mario, X).        % X = gianni`

👉 **Unificazione**: Prolog prova a rendere due termini uguali sostituendo variabili.  
👉 **Backtracking**: Prolog cerca più soluzioni esplorando alternative.

---

## 2. Liste e ricorsione

- Sintassi: `[a,b,c]` oppure `[H|T]`.
    
- Predicati built-in:
    

`member(X,L).      % vero se X è in L append(L1,L2,L3). % L3 = L1+L2 length(L,N).      % N = lunghezza di L reverse(L,R).     % R = L al contrario`

- Ricorsione tipica:
    

`my_length([],0). my_length([_|T],N) :- my_length(T,N1), N is N1+1.`

---

## 3. Strutture e alberi

- **Termine complesso** = `funtore(arg1,...,argN)`.
    
- **Funtore** = nome, **Arity** = numero di argomenti.
    

Esempio:

`mangia(cavallo, biada).   % funtore = mangia, arità = 2`

- Ricorsione su alberi:
    

`stessa_struttura(nil,nil). stessa_struttura(nodo(_,SX1,DX1), nodo(_,SX2,DX2)) :-     stessa_struttura(SX1,SX2),     stessa_struttura(DX1,DX2).`

---

## 4. Cut e Fail

- `fail` → fallisce sempre → forza backtracking.
    

`stampa_colore :- colore(X), write(X), nl, fail.`

- `cut (!)` → blocca backtracking.
    

`massimo(X,Y,X) :- X >= Y, !. massimo(_,Y,Y).`

- `not` simulato:
    

`not(P) :- P, !, fail. not(_).`

---

## 5. Assert, Retract, Univ

- Modifica dinamica della KB:
    

`:- dynamic padre/2. ?- assert(padre(gianni, anna)). ?- retract(padre(gianni, anna)).`

- =.. (univ): converte tra termine e lista.
    

`?- mangia(cavallo,biada) =.. L. L = [mangia,cavallo,biada].  ?- T =.. [ama,romeo,giulietta]. T = ama(romeo,giulietta).`

---

## 6. DCG (Definite Clause Grammars)

- Usate per riconoscere/parlare frasi → `-->`.
    

`frase(mangia(S,O)) --> [il], nome(S), [mangia], [la], nome(O).  nome(cavallo) --> [cavallo]. nome(biada)   --> [biada].`

Uso:

`?- frase(X,[il,cavallo,mangia,la,biada],[]). X = mangia(cavallo, biada).`

---

## 7. Operatori

- Dichiarazione:
    

`:- op(500, yfx, plus).`

- **Precedenza**: 1–1200 (numero più piccolo = più forte).
    
- **x/y** → se l’argomento può avere stessa precedenza.
    
    - `yfx` → associativo a sinistra.
        
    - `xfy` → associativo a destra.
        
    - `xfx` → non associativo.
        

Esempio potenza:

`:- op(400, xfy, pow). ?- 2 pow 3 pow 2. pow(2, pow(3,2)).`

---

## 8. Raccolta soluzioni: findall, bagof, setof

- `findall(T,Goal,L)` → raccoglie tutte le soluzioni (anche se 0 → `[]`).
    
- `bagof(T,Goal,L)` → separa per variabili libere.
    
- `setof(T,Goal,L)` → come `bagof`, ma lista ordinata senza duplicati.
    

Esempio:

`padre(mario, gianni). padre(mario, luca). padre(gianni, anna).  ?- findall(F,padre(P,F),L). L = [gianni,luca,anna].  ?- bagof(F,padre(P,F),L). P = gianni, L = [anna] ; P = mario,  L = [gianni,luca].  ?- setof(F,padre(P,F),L). P = gianni, L = [anna] ; P = mario,  L = [gianni,luca].`

---

## 9. Schema pratico da esame

👉 Quando leggi un esercizio, chiediti:

- Devo **navigare liste/alberi**? → ricorsione + `append/member`.
    
- Devo **stampare o forzare più soluzioni**? → `fail`.
    
- Devo **scegliere un’unica regola**? → `cut`.
    
- Devo **aggiungere/rimuovere fatti**? → `assert/retract`.
    
- Devo **riconoscere frasi**? → DCG.
    
- Devo **raccogliere tutte le soluzioni**? → `findall/bagof/setof`.
    
- Devo **scrivere elegante**? → magari definire operatori con `op/3`.
    

---

## 10. Esercizi di ripasso veloce

1. Definisci `conta_occorrenze(X,L,N)` con ricorsione.
    
2. Usa `not/1` per definire `diverso(X,Y)`.
    
3. Scrivi una DCG che traduce `[il,ragno,mangia,rosmarino]` in `mangia(ragno,rosmarino)`.
    
4. Con `bagof`, trova i figli di ogni padre in una KB familiare.
    
5. Definisci `**` come operatore infix right-associativo per potenze.
    

---

# ✅ Riassunto finale

In 8 giorni abbiamo visto:

- Fatti, regole, query, unificazione e backtracking.
    
- Liste e ricorsione.
    
- Strutture e alberi.
    
- Cut, fail e `not`.
    
- Assert, retract e =...
    
- DCG per parsing.
    
- Operatori personalizzati.
    
- Raccolta soluzioni con findall/bagof/setof.
    

Con questo zoccolo teorico puoi affrontare gli esercizi d’esame. Da domani si passa ai **casi pratici** (Language Model, rete alimentare, campo di battaglia).
