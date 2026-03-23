# MITZ-UPFAL CH01
## Verifica identità polinomiale
Due approcci
- Deterministico -> trasformo `H(x)` nella sua forma canonica e verifico se sia uguale a `G(x)`
- Randomizzato -> scelgo randomicamente un intero `r` (variabile aleatoria) da un range di valori possibili
	- calcolo `H(r)` e `G(r)` e verifico
### Teorema 
![[Pasted image 20260323112055.png]]

Questo significa che 
- se l'istanza è corretta (sono simili) allora l'algoritmo darà sempre la risposta corretta
- se l'istanza non è corretta (sono diversi) l'algoritmo PUÒ dare delle soluzioni sbagliate nel caso in cui scegliamo una delle `d` radici
	- questo perché se sono diversi ma prendo una radice, allora entrambi daranno come risultato `0`

## SPAZIO DELLE PROBABILITÀ
Ha tre componenti
- uno spazio dei campioni $\Omega$ -> insieme di tutti i possibili risultati 
- un insieme di insiemi `F`  che rappresenta gli eventi -> ogni insieme è un sottoinsieme di $\Omega$
- una funzione di probabilità $Pr: F \rightarrow R$ 
	- $F = 2^{\Omega}$ 

### FUNZIONE DI PROBABILITÀ
La funzione di probabilità deve rispettare le seguenti condizioni
1. Per ogni evento **E**, la probabilità di tale evento deve essere compresa tra 0 e 1 $$0 \le Pr(E) \le 1$$
2. La probabilità dello spazio dei campioni deve essere esattamente 1 $$Pr(\Omega) = 1$$
3. Per ogni sequenza finita di coppia di eventi mutualmente distinti $E_{1}, E_{2}, E_{3}, ...$ -> la probabilità dell'unione di tutti gli eventi è uguale alla somma delle probabilità degli eventi 
	![[Pasted image 20260323112808.png]]
	The probability of an event is the sum of the probabilities of its simple events.


## Eventi 
Due eventi `E` e `F` sono indipendenti se e solo se la probabilità della loro intersezione è uguale al prodotto delle loro probabilità.
![[Pasted image 20260323113419.png]]

Più in generale
![[Pasted image 20260323113432.png]]

## Probabilità condizionata
La probabilità condizionata che un evento `E` capiti sapendo che un evento `F` è già accaduto è data dall'intersezione delle loro probabilità fratto la probabilità di `F`.
![[Pasted image 20260323113609.png]]

![[Pasted image 20260323113621.png]]


## INDIPENDENZA
![[Pasted image 20260323113644.png]]

## TEOREMA (legge della probabilità totale)
![[Pasted image 20260323113719.png]]![[Pasted image 20260323113727.png]]

## LEGGE DI BAYES
![[Pasted image 20260323113757.png]]

>[!tip]- Utili
>![[Pasted image 20260323113813.png]]![[Pasted image 20260323113822.png]]![[Pasted image 20260323113829.png]]

##### ESEMPIO UTILE
![[Pasted image 20260323120526.png]]
![[Pasted image 20260323120532.png]]

>[!tip] L'idea qui è che grazie al teorema di Bayes. ogni test positivo aumento la fiducia nella correttezza di ciò che stiamo ipotizzando