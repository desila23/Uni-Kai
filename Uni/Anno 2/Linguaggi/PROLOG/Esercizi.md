Livello 1 – Warm up (super facili)

Scrivi un predicato `ultimo(L, X)` che restituisce l’ultimo elemento di una lista.
👉 Esempio: `ultimo([a,b,c],X)`. deve dare X = c.
```
ultimo([H], H).
ultimo([_|T], X) :-
    ultimo(T, X).
```



Scrivi un predicato `lunghezza(L, N)` che conta il numero di elementi di una lista senza usare length/2.
```
lunghezza([], 0).
lunghezza([_|T], N) :-
    lunghezza(T, N1),
    N is 1 + N1.
```


Scrivi un predicato somma(L, S) che somma tutti i numeri in una lista.
```
somma([], 0).
somma([H|T], S) :-
    somma(T, S1),
    S is H + S1.
```


Livello 2 – Liste e ricorsione

Scrivi un predicato `inverti(L, R)` che inverte una lista.
👉 `inverti([1,2,3],X). → X = [3,2,1]`.
```
inverti([],[]).
inverti([H|T], R) :-
    inverti(T, R1),
	append(R1, [H], R).
```



Scrivi un predicato palindroma(L) che è vero se L è palindroma.
👉 palindroma([r,a,d,a,r]). → true.
```
inverti([],[]).
inverti([H|T], R) :-
    inverti(T, R1),
	append(R1, [H], R).


palindroma([]).
palindroma(L) :-
    inverti(L, R),
    L = R.
```



Scrivi un predicato concatena(A,B,R) che unisce due liste (senza usare append).
```
concatena([], [], []).
concatena([], B, B).
concatena([H|T], B, [H|R]) :-
	concatena(T, B, R).
```



Livello 3 – Stringhe e parole

(Ora iniziamo a prepararci per gli esami sulle codifiche di messaggi)

Scrivi un predicato dividiparole(Stringa, Lista) che divide una stringa in lista di parole.
👉 dividiparole("ciao mondo",X). → X = ["ciao","mondo"].
```
dividiparole([],[]).
dividiparole([32|T],L):-
    !,                       %questo in particolare serve a escludere parole vuote
	dividiparole(T,L).
dividiparole(L,[Word|Rest]):-
	prendiparole(L,Word,RestoLista),
	dividiparole(RestoLista,Rest).


prendiparole([],[],[]).
prendiparole([32|T],[],T):- !.
prendiparole([T|L],[T|L2],Rest):-
	prendiparole(L,L2,Rest).
```



Scrivi un predicato invertiparole(Lista, Ris) che inverte i caratteri di ogni parola.
👉 ["ciao","mondo"] → ["oaic","odnom"].

Scrivi un predicato ricostruisci(Lista, Stringa) che ricompone le parole in una stringa unica separata da spazi.
```
% ausiliario: prende una parola (lista di caratteri fino a spazio)
prendiparole([], [], []).
prendiparole([32|T], [], T) :- !.
prendiparole([C|T], [C|W], Rest) :-
    prendiparole(T, W, Rest).

% divide stringa (come lista di codici) in parole
dividiparole([], []).
dividiparole([32|T], L) :- !,
    dividiparole(T, L).
dividiparole(L, [W|R]) :-
    prendiparole(L, W, Rest),
    dividiparole(Rest, R).

% inverte ogni parola
invertiparole([], []).
invertiparole([H|T], [H1|T1]) :-
    reverse(H, H1),
    invertiparole(T, T1).

% ricostruisce frase dai codici
unisciparole([], []).
unisciparole([W], W).
unisciparole([W|R], L) :-
    unisciparole(R, L1),
    append(W, [32|L1], L).

ricostruisci(Lst, Stringa) :-
    unisciparole(Lst, Codes),
    string_codes(Stringa, Codes).

% ----------- CODIFICA1 -----------
codifica1(Frase, Codificata) :-
    string_codes(Frase, Codes),        % stringa → lista codici
    dividiparole(Codes, Parole),       % dividi in parole
    invertiparole(Parole, ParoleInv),  % inverti caratteri di ogni parola
    ricostruisci(ParoleInv, Codificata). % ricostruisci frase
```



Livello 4 – Mini-esami semplificati

Codifica base (simile a Esame 1)
Scrivi un predicato codifica1(Frase, Codificata) che prende una frase e inverte ogni parola mantenendo l’ordine delle parole.
👉 "ciao mondo" → "oaic odnom".

Codifica 2 (passo in più)
Dopo aver invertito le parole, inverti anche la prima e l’ultima lettera di ciascuna.
👉 "ciao mondo" → "aoic odnom".

Codifica 3 (livello esame)
Dopo la codifica 2, scambia la prima e l’ultima parola della frase.
👉 "ciao mondo bello" → "olleb odnom aoic".

(Questa è praticamente la traccia di uno degli esami!)

Livello 5 – Logica avanzata (per altri esami)

Scrivi un predicato mangia/2 e poi un predicato inquinato/2 che propaga la contaminazione lungo la catena alimentare fino a profondità N.
👉 Base per Esame 2.

Scrivi un predicato sicuro(Torre, Dardi) che dice se una torre è fuori dal raggio dei dardi (usando distanza).
👉 Base per Esame 4.

Scrivi un predicato percorsoeconomico(Partenza, Destinazione, Percorso, Costo) che trova il percorso più economico tra due città date delle tratte.
👉 Base per Esame 6.