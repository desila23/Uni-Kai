## Definizione generale
Prolog è un linguaggio **dichiarativo**: viene descritto con i **fatti** e le **regole** che definiscono un dominio.  
La risoluzione delle query avviene tramite due meccanismi principali: **unificazione** e **backtracking**.
- Una **query** in Prolog è una domanda: chiede se un certo obiettivo può essere dedotto dalla base di conoscenza da noi scelta (fatti e regole).
	- Un **fatto** rappresenta una verità semplice del dominio.
	- Una **regola** ha la forma: `Testa :- Corpo.`
	    Dove la **Testa** è il predicato da dimostrare e il **Corpo** sono le condizioni che devono essere soddisfatte perché la regola sia vera.


## Unificazione
L’unificazione è il processo con cui Prolog confronta due termini e prova a renderli uguali trovando una sostituzione per le variabili.  
- Una **variabile** può assumere il valore di una costante, di un termine composto o di un’altra variabile. Dopo l’unificazione, la variabile diventa un alias di quel valore.
- Due **costanti** unificano solo se sono identiche.
	- `?- mario = mario.    -> TRUE`
	- `?- mario = gianni.    -> FALSE`
- Due **termini composti** unificano se hanno lo stesso **funtore** (nome del predicato) e la stessa **arità** (numero di argomenti). In quel caso, anche i loro argomenti vengono unificati ricorsivamente.


## Backtracking
Il **backtracking** è una tecnica di esplorazione sistematica dello spazio delle soluzioni che permette a Prolog di cercare soluzioni ripercorrendo le scelte non deterministiche quando un ramo fallisce. In pratica, il sistema torna indietro allo stato logico precedente e prova un’alternativa.

In Prolog questo avviene **automaticamente**, senza bisogno di istruzioni esplicite del programmatore.
- Ogni chiamata che può avere più soluzioni crea un **punto di scelta**: il sistema conserva le alternative possibili.
	- Se un goal fallisce, Prolog fa un **redo**: torna all’ultimo punto di scelta, annulla le sostituzioni fatte dopo di esso e prova la successiva alternativa.
- I punti di scelta nascono quando ci sono più clausole per lo stesso predicato, disgiunzioni, predicati non deterministici o più unificazioni possibili.

**Nota:**
- Il predicato `fail` forza il fallimento e quindi il backtracking.
- L’operatore `cut (!)`, invece, limita lo spazio di ricerca tagliando tutte le alternative successive.


## Termini e variabili
In Prolog tutto è un **termine**: atomi, numeri, variabili e termini composti.  
Su questi elementi si costruiscono fatti, regole e strutture tramite unificazione e risoluzione.

### Il termine
Il **termine** è l’unità sintattica di base e può essere:
- una **costante** (atomo o numero),
	- Gli **atomi** sono nomi senza significato intrinseco, es. `sole`, `x`, `taco`.
	- I **numeri** possono essere interi o decimali.
- una **variabile**,
	- Le **variabili** iniziano con lettera maiuscola o con underscore `_`, secondo la convenzione sintattica di Prolog.
- un **termine composto**.

### Termine composto
I **termini composti** sono formati da un **funtore** (nome del predicato) e da una lista di argomenti tra parentesi, separati da virgole.
	Il **numero di argomenti** è detto **arità**.


## Strutture dati
In Prolog, una **struttura** è un termine composto usato per raggruppare più informazioni sotto un unico **funtore**.  
La sintassi è:
```scss
funtore(arg1, arg2, ..., argN)
```
- Gli argomenti sono separati da virgole e racchiusi tra parentesi.
- Servono per rappresentare insiemi di dati omogenei o logicamente collegati.
- Sono molto usate per modellare record e oggetti del dominio, mantenendo una sintassi semplice e regolare.

**Esempi:**
- `persona(mario, 30, roma)`
- `punto(2, 5)`
- `colore(rgb, 255, 0, 0)`


## Modellare la base di conoscenza
La **base di conoscenza** in Prolog può essere aggiornata dinamicamente tramite predicati speciali:
- `assert` → aggiunge un nuovo fatto o regola.
- `retract` → rimuove un fatto o regola già presente.
- `univ (=..)` → permette di scomporre o costruire termini in modo dinamico.

Questi strumenti consentono di creare nuove strutture o modificare quelle esistenti, rendendo il programma più flessibile.


## DCG (Definite Clause Grammar)
Le **DCG** sono una notazione dichiarativa per descrivere **grammatiche** in Prolog.  
Vengono automaticamente tradotte in clausole con due argomenti “nascosti” che rappresentano la parte di input ancora da analizzare.
Sono molto usate per:
- analizzare stringhe,
- riconoscere linguaggi,
- costruire semplici parser.

**Esempio base:**
```
frase --> soggetto, predicato. 

soggetto --> [mario]. 
predicato --> [corre].
```

Query:  
`?- frase([mario, corre], []).` → **true**


## Raggruppamenti
In Prolog, i predicati `findall/3`, `bagof/3` e `setof/3` servono a raccogliere tutte le soluzioni di un **Goal** in una lista.  
La forma generale è:
```
Predicato(Template, Goal, Lista)
```
- **Template** → cosa raccogliere
- **Goal** → obiettivo da soddisfare
- **Lista** → lista delle istanze del Template generate dal Goal

Le variabili che compaiono in `Goal` ma non in `Template` sono dette **libere** e vengono trattate in modo diverso dai tre predicati.

##### **`findall/3`**
- Sintassi: `findall(Template, Goal, Lista).`
- Raccoglie **tutte** le soluzioni, mantenendo ordine e duplicati.
- Se non ci sono soluzioni → `Lista = []`.
- Le variabili libere in `Goal` vengono considerate **esistenziali**.

##### **`bagof/3`**
- Sintassi: `bagof(Template, Goal, Lista).`
- Come `findall/3`, ma fallisce se non ci sono soluzioni.
- Le variabili libere in `Goal` causano un **raggruppamento**:  
    → viene generata una lista per ciascuna diversa istanziazione delle variabili libere.

##### **`setof/3`**
- Sintassi: `setof(Template, Goal, Insieme).`
- Come `bagof/3`, ma restituisce una lista **ordinata** e **senza duplicati**.
- L’ordinamento segue quello di `sort/2` (prima numeri, poi atomi, poi strutture).