### Lezione 14 settembre – Basi di Prolog
- **E1.** Esempio (famiglia):
	`padre(mario, gianni). 
	`padre(gianni, luca). 
	`padre(luca, anna).`.
	Aggiungi altri fatti alla famiglia, ad esempio: `madre(anna, marco).`, e verifica con query chi sono i nonni di `marco`.
```scss
padre(mario, gianni). 
padre(gianni, luca). 
padre(luca, anna).
padre(giuseppe, marco).
padre(marco, luigi).

madre(anna, marco).

nonno(X,Y) :-
    padre(X,Z),
    (padre(Z,Y); madre(Z,Y)).   // il `;` indica OR 
    
nonna(X,Y) :-
    madre(X,Z),
    (padre(Z,Y); madre(Z,Y)).
    
    
// QUERY
?- nonno(luca,marco).   %true
?- nonno(mario,luigi).  %false
?- nonno(mario,luca).   %true
?- nonna(anna,luigi).   %true
```

- **E3.** Query: trova tutti i padri, e tutti i figli di `gianni`.
```scss
?- padre(X,_).   % [mario, gianni, luca, giuseppe, marco]
```

- **E4.** Prova a chiedere a Prolog: `?- padre(X, anna).` → chi è X?
```scss
padre(X, anna).   % X = luca
```


**Medio-facile**  
1) Definisci `genitore/2` e `figlio/2` (inversa). Verifica con query che `figlio(X,Y)` sia vero quando `genitore(Y,X)`.
```scss
padre(mario, gianni).
padre(mario, luca).
madre(anna, paolo).


figlio(Y, X) :-
    (padre(X, Y) ; madre(X, Y)).

genitore(X, Y) :- 
    figlio(Y, X).
    

?- figlio(gianni, mario).
	true.

?- genitore(mario, gianni).
	true.

?- genitore(anna, paolo).
	true.

?- figlio(luca, anna).
	false.

```

---

### 📘 Lezione 15 settembre – Liste e ricorsione

- **E5.** Scrivi un predicato `my_length/2` e testalo con:  
    `?- my_length([1,2,3,4], N).`
```SCSS
my_length([], 0).
my_length([_|T], N) :-
    my_length(T, N1),
    N is 1 + N1.
```


- **E6.** Scrivi un predicato `my_member/2` e verifica se `c` è membro di `[a,b,c,d]`.
```scss
my_member(X, [X|_]).
my_member(X, [_|T]) :-
    my_member(X, T).
    
    
ALTRA VERSIONE MA CON 'OR' (le parentesi sono fondamentali)
my_member(X, [H|T]) :- 
	( H = X ; my_member(X, T) )
```


- **E7.** Implementa `somma_lista/2` e prova con `?- somma_lista([5,7,2], S).`.
    
- **E8.** Implementa `conta_occorrenze/3` e trova quante volte `a` appare in `[a,b,a,c,a]`.