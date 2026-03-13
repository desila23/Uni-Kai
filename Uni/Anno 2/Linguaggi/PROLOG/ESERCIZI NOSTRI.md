## PARTE 1
- member
- append/concat
- lunghezza
- reverse

```scss
member(X, [X|_]).
member(X, [_|T]) :-
    member(X, T).


concat([], L2, L2).
concat([H1|T1], L2, [H1|T3]) :-
    concat(T1, L2, T3).


append([], X, [X]).
append([H|T], X, [H|T1]) :-
    append(T, X, T1).


lunghezza([], 0).
lunghezza([_|T], N) :-
    lunghezza(T, N1),
    N is N1 + 1.


reverse([], []).
reverse([H|T], R) :-
    reverse(T, RT),
    append(RT, H, R).
```

# SECONDA PARTE
#### 🟢 ESERCIZIO 1 – CUT come scelta definitiva
Definisci un predicato prezzo/2.

Regole:
- se il cliente è vip, il prezzo è scontato
- per tutti gli altri, il prezzo è normale

Vincolo:
- quando riconosci vip, non devono esserci altre soluzioni

Query da testare:
- prezzo(vip, P).
- prezzo(standard, P).

👉 Qui capisci a cosa serve la cut.
```scss
cliente(mario, vip).
cliente(luca, standard).
cliente(anna, standard).

% fatto che senza cut mi fa avere risposte sbagliate
cliente(mario, standard).


prezzo(standard, 100).
prezzo(vip, 50).


prezzo(Nome, Prezzo) :-
    cliente(Nome, vip),
    prezzo(vip, Prezzo),
    !.

prezzo(Nome, Prezzo)  :-
    cliente(Nome, standard),
    prezzo(standard, Prezzo).
```


### 🟢 ESERCIZIO 2 – CUT come if–else
Definisci esito_esame/2.

Regole:
- voto ≥ 18 → promosso
- voto < 18 → bocciato

Vincolo:
- se il primo caso vale, il secondo non deve essere provato

```scss
voto(marco, 28).
voto(luisa, 18).
voto(paolo, 12).


esito(Nome, Esito) :-
    voto(Nome, X),
    X >= 18,
    Esito = promosso,
    !.
    
esito(_, Esito) :-
    Esito = bocciato.
```


### PROBLEMA 3

### Testo

Scrivi il predicato:

`massimo(X,Y,M)`

che restituisce in `M` il maggiore tra `X` e `Y`.

### Vincoli

- usa **una sola cut**
    
- evita soluzioni alternative
    

### Esempi

`?- massimo(3,5,M). M = 5.  ?- massimo(7,2,M). M = 7.`

### Perché è importante

Qui impari:

- **cut deterministica**
    
- come evitare backtracking inutile
    

👉 Devi saper dire:

> “La cut serve a bloccare il secondo caso quando il primo è vero”




## PROBLEMA 4
```scss
:- dynamic visto/2.


dipendente(mario, marketing).
dipendente(luigi, sviluppo).
dipendente(anna, marketing).
dipendente(luca, marketing).
dipendente(paolo, risorse_umane).

    
stesso_dipartimento(X, Y) :- 
    dipendente(X, Dipartimento),
    dipendente(Y, Dipartimento),
    X \= Y,
    not(visto(X, Y)),
    assert(visto(X, Y)),
    assert(visto(Y, X)),
    write(X), write("-"), writeln(Y),
    fail.
```

##### VERSIONE CON SETOF
```scss
:- dynamic visto/2.

dipendente(mario, marketing).
dipendente(luigi, sviluppo).
dipendente(valerio, sviluppo).
dipendente(anna, marketing).
dipendente(luca, marketing).
dipendente(paolo, risorse_umane).


stesso_dipartimento(X, Y, Coppie) :-
    setof([X,Y], 
          (dipendente(X, Z), dipendente(Y, Z), X\=Y, not(visto(X, Y)), assert(visto(X, Y)), assert(visto(Y, X))), 
          Coppie).   
```


## PROBLEMA 5
```scss
:- dynamic visto/2.


assunto(mario, marketing, 2024, 12).
assunto(anna,  marketing, 2024, 12).
assunto(luca,  marketing, 2024, 11).
assunto(paolo, sviluppo,  2024, 12).
assunto(giulia, sviluppo,  2024, 12).
assunto(gay, sviluppo,  2024, 12).
assunto(sbubbolo, sviluppo,  2024, 12).
assunto(rita,  sviluppo,  2023, 12).


stessa_assunzione(Dip, Anno, Mese, X, Y) :-
    assunto(X, Dip, Anno, Mese),
    assunto(Y, Dip, Anno, Mese),
    X \= Y,
    not(visto(X, Y)),
    assert(visto(X, Y)),
    assert(visto(Y, X)).
    

stampa_coppie(Dip, Anno, Mese) :-
    stessa_assunzione(Dip, Anno, Mese, X, Y),
    write(X), write("-"), writeln(Y),
    fail.


```



## PROBLEMA ESAME NOSTRO  SEMPLIFICATO
```scss
prestazione_val(Nome, Valore) :-
    giocatore(Nome, Punti, Falli),
    Valore is Punti - 3*Falli.

% massimo di una lista di numeri
max_list([X], X).
max_list([H|T], Max) :-
    max_list(T, MaxT),
    ( H > MaxT -> Max = H ; Max = MaxT ).

% miglior giocatore (se ci sono pari merito, li dà tutti col ;)
miglior_giocatore(Nome) :-
    findall(Val, prestazione_val(_, Val), Vals),
    max_list(Vals, Max),
    prestazione_val(Nome, Max).

```



```% --- DATI ----------------------------------------------------

% insegnamento(Corso, Anno)
insegnamento(fiu, 1).
insegnamento(fit, 1).
insegnamento(bu,  2).
insegnamento(nno, 3).

% una lezione: lez(Corso, Giorno, Ora, Aula)
% esempio di orario (puoi cambiarlo)
orario([
  lez(fiu, lun, 1, aula1),
  lez(bu,  lun, 1, aula2),
  lez(fit, lun, 2, aula1)
]).


% VINCOLO BASE:
% nello stesso giorno+ora, due corsi dello stesso anno NON possono esserci
conflitto_anno(lez(C1,G,O,_), lez(C2,G,O,_)) :-
    C1 \= C2,
    insegnamento(C1, Anno),
    insegnamento(C2, Anno).



% orario_valido(ListaLezioni) è vero se NON ci sono conflitti di anno
orario_valido(L) :-
    \+ ( member(X, L),
         member(Y, L),
         conflitto_anno(X, Y)
       ).
```



## ESAME NOSTRO SEMPLIFICATO
```
% esempio di dati minimi
punti(mario, 20).
falli(mario, 2).

punti(luca, 15).
falli(luca, 1).

punti(anna, 18).
falli(anna, 3).

% prestazione singola (formula semplice)
prestazione_giocatore(Giocatore, Score) :-
    punti(Giocatore, P),
    falli(Giocatore, F),
    Score is P - F.

prestazione(G1, G2, G3, Valore) :-
    prestazione_giocatore(G1, S1),
    prestazione_giocatore(G2, S2),
    prestazione_giocatore(G3, S3),
    Valore is S1 + S2 + S3.


% massimo di una lista di numeri
max_list([X], X).
max_list([H|T], Max) :-
    max_list(T, MaxT),
    ( H > MaxT -> Max = H ; Max = MaxT ).

% miglior giocatore (se ci sono pari merito, li dà tutti col ;)
miglior_giocatore(Nome) :-
    findall(Score, prestazione(_, Score), Scores),
    max_list(Scores, Max),
    prestazione(Nome1, Nome2, Nome3, Max).   

```