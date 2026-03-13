# SPAZIO VETTORIALE
![[Screenshot 2026-02-03 103511.png]]
Quando parlo di $\mathscr{R}^{3}$ intendo TUTTE I POSSIBILI VETTORI DI 3 ELEMENTI APPARTENENTI AI NUMERI REALI.

# SOTTOSPAZIO VETTORIALE
![[Screenshot 2026-02-03 105011.png]]
Il sottospazio deve contenere lo `0`.
Il sottospazio ha tutte le proprietà dello spazio.



# COMBINAZIONI LINEARI 
![[Screenshot 2026-02-03 112113.png]]


### GENERATORI
![[Screenshot 2026-02-03 112055.png]]
Qui devo trovare le equazioni per `(a1, a2)` usando `x, y, z`.
>[!danger] ATTENZIONE -> se `y = 0` vuol dire che ho una restrizione E QUINDI NON GENERA $\mathscr{R}$ ma un sottospazio.



![[Screenshot 2026-02-03 113819.png]]
Dei vettori sono LINEARMENTE INDIPENDENTI se la loro combinazione lineare genera il vettore nullo E SE E SOLO SE gli scalari sono unicamente `= 0` 
- se trovo altre combinazioni che mi danno il vettore nullo si dicono LINEARMENTE DIPENDENTI

### BASE
![[Screenshot 2026-02-03 115346.png]]
Un insieme di vettori è UNA BASE dello spazio vettoriale `V` se
1) i vettori sono tra loro LINEARMENTE INDIPENDENTI
	- non posso avere il vettore nullo
	- nessun vettore deve essere multiplo dell'altro
	- nessun vettore deve essere combinazione degli altri
2) `V` è generato dai vettori dati ma scelto un qualsiasi vettore di `V` questo deve essere generato IN MODO UNICO dai vettori dati. 


# MATRICI
Esempio di matrice
![[Screenshot 2026-02-03 183250.png]]

#### DIAGONALE
![[Screenshot 2026-02-03 183324.png]]

#### Quando calcolare il determinante
Con le matrici quadrate possiamo calcolare il determinante.

Una matrice quadrata (con `n` righe e `n` colonne) possiamo dire MATRICE DI ORDINE `n`.

### MATRICE TRIANGOLARE (inferiore e superiore)
- INFERIORE: Prendi la diagonale, TUTTO CIÒ CHE C'È SOPRA È 0
	- possiamo dire che presa una riga `i`, dalla posizione `j` in poi (con $i < j$) ho tutti 0
- SUPERIORE: il complemento di quella inferiore
	![[Pasted image 20260203184049.png]]

### MATRICE DIAGONALE
Tutti gli elementi NULLI della matrice devono stare FUORI dalla diagonale principale.
Eventuali valori NON NULLI devono stare solo nella diagonale (però posso avere 0 anche lì).
	![[Pasted image 20260203184107.png]]

### MATRICE IDENTITÀ
È una matrice diagonale ma nella diagonale principale ho SOLO 1.
	![[Pasted image 20260203184135.png]]

### MATRICE TRASPOSTA
La trasposta di una matrice A nel campo $\mathscr{K}^{n,m}$, che identifichiamo con $^{T}A$, è una matrice nel campo $\mathscr{K}^{m,n}$.
- quindi è una matrice con le righe e le colonne invertite.
	![[Pasted image 20260203183940.png]]

### MATRICE SIMMETRICA
Se ho una matrice quadrata e faccio la trasposta, se ho che $$A \ =
 \ ^{T}A$$allora questa si chiama matrice simmetrica.
In pratica, se prendo la diagonale principale, gli elementi che stanno sopra e sotto sono simmetrici.
	![[Pasted image 20260203184011.png]]


### MATRICE ANTISIMMETRICA
Ha lo stesso ragionamento di quella simmetrica ma gli elementi sopra e sotto la diagonale devono essere uno il complemento dell'altro.
GLI ELEMENTI DELLA DIAGONALE DEVONO ESSERE TUTTI 0.
	![[Pasted image 20260203183906.png||400]]


### OPERAZIONI TRA LE MATRICI
- PRODOTTO TRA SCALARE A MATRICE
	![[Pasted image 20260203183833.png]]
	
- SOMMA/DIFFERENZA TRA MATRICI (della stessa dimensione)
	![[Pasted image 20260203183844.png]]

#### PRODOTTO
Date $A = n \times p$ e $B = p \times m$, POSSIAMO ESEGUIRE IL PRODOTTO E AVERE $$A \times B = C \rightarrow n \times m$$![[Screenshot 2026-02-03 184519.png]]

>[!question] Dire quali prodotti possono essere eseguiti e quali no.
![[Screenshot 2026-02-03 184453.png|center|400]]

>[!question]- In ordine
>- AB -> si
>- BA -> no
>- AC -> si
>- CA -> si
>- AD -> no
>- DA -> si
>- BC -> si
>- CB -> no
>- BD -> si
>- DB -> si

#### ESEMPI
![[Screenshot 2026-02-03 184545.png|center|400]]![[Screenshot 2026-02-03 184617.png|center|400]]![[Screenshot 2026-02-03 184605.png|center|400]]


### DETERMINANTE (valido solo per le matrici quadrata) -> METODO DI LAPLACE
![[Screenshot 2026-02-03 185131.png]]
**IL DETERMINANTE È UGUALE A 0 SE**
- UNA RIGA/COLONNA È TUTTA NULLA
- UNA RIGA/COLONNA È UN MULTIPLO DI UN ALTRA
- UNA COLONNA/RIGA È COMBINAZIONE LINEARE DI ALTRE RIGHE/COLONNE 
	- qui si intende tipo se una colonna è ottenuta dalla somma di altre colonne (ecc...)

#### ESEMPI
![[Screenshot 2026-02-03 185201.png|center|400]]
![[Screenshot 2026-02-03 185224.png|center|400]]

### PROPRIETÀ
1. Se una matrice è quadrata, il determinante della trasposta è lo stesso della matrice originale (non serve quindi scrivere la trasposta)
	![[Screenshot 2026-02-03 185630.png|center|400]]
2. Se una matrice è quadrata e triangolare (superiore o inferiore), allora il determinante sarà dato dal prodotto degli elementi nella diagonale (solo quelli).
	![[Screenshot 2026-02-03 185656.png|center|400]]
3. Se scambio due linee parallele (e formo $A_{1}$), allora $$|A_{1}| = -|A|$$
	![[Screenshot 2026-02-03 185721.png|center|400]]
	- questa cosa è utile perché scambiando righe posso magari trovare una matrice triangolare e applicare la proprietà su quella
	1. Se ho uno scalare $\beta$ e lo moltiplico per `n` righe, allora il determinante della matrice A sarà $$\beta^{n} \cdot |A|$$![[Screenshot 2026-02-03 185733.png|center|400]]
4. Se ho delle righe "ostili", posso prendere un'altra riga, moltiplicarla per uno scalare $\beta$, sottrarla/sommarla alla riga ostile e il determinante rimane invariato
5. Se ho due matrici quadrate dello stesso ordine, il determinante della matrice prodotto è dato DAL PRODOTTO DEI DUE DETERMINANTI DELLE MATRICI ORIGINALI.
	![[Screenshot 2026-02-03 185802.png|center|400]]
6. Se ho una matrice quadrata di questo tipo
	![[Pasted image 20260203181644.png|center]]
	Il determinante è dato dal prodotto dei determinanti delle due sottomatrici contenenti degli scalari NON NULLI.
	
7. NON SO DOVE VA
	![[Screenshot 2026-02-03 185825.png|center|500]]

# MATRICE INVERSA
![[Screenshot 2026-02-03 190824.png]]
-  Il prodotto tra matrice originale e matrice inversa DEVE DARE LA MATRICE IDENTITÀ.

Per farla 
- calcolo il determinante e deve avere il determinante diverso da 0
- calcolo i complementi di ciascun elemento della matrice (letteralmente fai il determinante per ogni riga/colonna possibile)
- PRENDO I RISULTATI DEI COMPLMENTI e li traspongo (riga = colonna e colonna = riga) -> matrice aggiunta
- Prendo ogni elemento della matrice aggiunta, lo divido per il determinante e lo inserisco in un'altra matrice -> matrice inversa


## RANGO DI UNA MATRICE
Corrisponde alla dimensione.
È un numero NATURALE (da 0 in poi) -> rango = 0 solo se la matrice è tutta nulla.

>[!tip] ELEMENTO SPECIALE -> un elemento NON NULLO sotto il quale ci sono TUTTI 0 (VALE ANCHE PER LE COLONNE).
>Ogni elemento non nullo nell'ultima riga è un elemento speciale

Il rango MASSIMO è dato dal minimo numero di righe/colonne.
![[Screenshot 2026-02-04 112308.png]]


### RANGO MATRICE QUADRATA
Calcolo il determinante
- SE VIENE $\neq 0$ allora il rango $$r(A) = n$$
- SE VIENE $= 0$ allora il rango è $< 3$
	- PRENDI TUTTE LE SOTTOMATRICI di grado `n-2` (fino a rango 2), calcola tutti i determinanti e ripeti i due punti sopracitati

![[Screenshot 2026-02-04 112322.png]]


### IL RANGO POSSO USARLO PER VEDERE SE DEI VETTORI SONO LINEARMENTE INDIPENDENTI
- Prendo i vettori
- Calcolo il rango
- IN BASE AL VALORE DEL RANGO `n` avrò `n` vettori indipendenti.
![[Screenshot 2026-02-04 114557.png]]
(le due cose in basso sono delle verifiche).


## COME TROVARE UNA BASE
Abbiamo innanzitutto la base canonica formata da `n` vettori che chiamiamo `e` (dove `n` è il grado).

Per trovare una base NON canonica, posso scrivere un numero `n` di vettori (inventati da me) ma che mi facciano avere degli elementi speciali nella matrice (vedi `v1, v2, v3`).
![[Pasted image 20260204120016.png]]

#### COME TROVARE LA BASE DI UN SOTTOSPAZIO
La dimensione (numero di vettori necessari) del sottospazio è data da DIMENSIONE DELLO SPAZIO - NUMERO DI EQUAZIONI DEL SOTTOSPAZIO.
![[Pasted image 20260204120309.png]]

Per trovare i vettori seleziono un numero di variabili indipendenti pari alla dimensione del sottospazio e le metto a sistema (NELLA FOTO SOTTO HO SCELTO `y` e `z`).
![[Pasted image 20260204120343.png]]
Poi mi scrivo `x` in funzione di `y` e `z` e guardo i coefficienti.


## ESTENSIONE DI UNA BASE
![[Screenshot 2026-02-04 122659.png]]
Calcoli la base del sottospazio come prima
Aggiungi `n` vettori per raggiungere la dimensione dello spazio vettoriale.


# GAUSS
![[Screenshot 2026-02-04 175120.png]]
![[Screenshot 2026-02-04 175133.png]]
![[Screenshot 2026-02-04 175144.png]]


# SISTEMI LINEARI
![[Screenshot 2026-02-04 181450.png]]
- SCRIVO MATRICE ESTESA
- TROVO IL RANGO
- RISCRIVO IL SISTEMA SULLA BASE DELLA MATRICE POST RANGO
![[Screenshot 2026-02-04 181416.png]]

### SISTEMI DETERMINATI, IMPOSSIBILI E INDETERMINATI
![[Screenshot 2026-02-04 181435.png]]



# SISTEMI INDETERMINATI
![[Screenshot 2026-02-04 183032.png]]

SCEGLI SEMPRE COME INCOGNITE LIBERE QUELLE "COMUNI" (in questo caso `y` e `z`)
![[Screenshot 2026-02-04 183049.png]]


# SISTEMI LINEARI CON PARAMETRO
![[Screenshot 2026-02-05 101312.png]]
- Scrivi sempre il numero di incognite
	- SE CI SONO PIÙ INCOGNITE CHE EQUAZIONI IL SISTEMA **NON PUÒ ESSERE POSSIBILE DETERMINATO**

Scrivo la matrice estesa e calcoli il rango della matrice normale e della matrice estesa
- studio quanto vale il rango di entrambe al variare del parametro
	- SE SONO UGUALI IN TUTTI I CASI -> possibile (determinato o non)
	- SE SONO DIVERSI -> impossibile

>[!tip]- Qui credo si trovi i valori di `x, y, z, t` con $a = 1$ (CREDO CHE VADA FATTO SOLO SE IL PROF LO CHIEDE)
>![[Screenshot 2026-02-05 101330.png]]

# CRAMER
POSSO CALCOLARLO SOLO SE IL DETERMINANTE È DIVERSO DA 0.
Lo uso per trovare i valori delle incognite (METODO ALTERNATIVO A GAUSS)
![[Screenshot 2026-02-05 103810.png]]

>[!tip]- DIMOSTRAZIONE DEL PERCHÈ LE `b` VANNO MESSE AL POSTO DELLA COLONNA 
>![[Screenshot 2026-02-05 103818.png]]

### Esempio su un sistema DETERMINATO
Avrò una sola n-upla di valori
![[Screenshot 2026-02-05 103827.png]]

### Esempio su un sistema INDETERMINATO
Avrò una n-upla contenente equazioni.
QUI DEVI SCEGLIERE BENE LE INCOGNITE LIBERE -> devi far sì che la matrice NON estesa abbia il determinante $\neq 0$.
![[Screenshot 2026-02-05 103834.png]]


# MATRICE INVERSA CALCOLO ALTERNATIVO
![[Screenshot 2026-02-05 110121.png]]
![[Screenshot 2026-02-05 110133.png]]
![[Screenshot 2026-02-05 110142.png]]
![[Screenshot 2026-02-05 110314.png]]


# MATRICE ASSOCIATA
![[Screenshot 2026-02-06 111018.png]]
Le varie $f(v_{i})$ sono I VETTORI IMMAGINE.

#### ESEMPIO IN CUI ABBIAMO DELLE EQUAZIONI
![[Screenshot 2026-02-06 111043.png]]
- Sostituisci i valori di A dentro la tua `f` e calcoli i vettori 
- Per trovare i valori della matrice associata devi
	- prendere i vettori trovati con la `f` e metterli in equazioni con i vettori della base `B` -> trova i vari $a_{i}$ e scrivili nella matrice IN COLONNA
>[!tip] NB: se le basi sono canoniche puoi anche scrivere direttamente i risultati delle `f` nella matrice 

#### Altro esempio 
![[Screenshot 2026-02-06 111033.png]]
- la matrice l'ha scritta dopo aver fatto tutti i passaggi nel mezzo

#### ESEMPI IN CUI NON ABBIAMO LE EQUAZIONI
Qui ti viene richiesto, date delle applicazioni lineari $\psi$ (QUELLE IN BLU), di trovare la matrice associata rispetto ad altre applicazioni lineari (in questo caso quelle canoniche). 
![[Screenshot 2026-02-06 112641.png]]
Per ogni appl. lineare scrivi le equazioni prendendo i valori dentro le parentesi e le moltiplichi per le appl. lineare che devi trovare -> le eguagli al vettore corrispondente a ciascuna appl. lineare

Metti tutto in forma matriciale e fai GAUSS
>[!tip] OGNI COLONNA CORRISPONDE A UNA DETERMINATA APPLICAZIONE LINEARE -> IL NOSTRO OBIETTIVO E TROVARLE (trattiamole come se fossero delle incognite)


![[Screenshot 2026-02-06 112709.png]]
Una volta fatto GAUSS puoi ricavarti le varie applicazioni lineari -> scrivi i vettori risultanti come colonna di una matrice.

![[Screenshot 2026-02-06 112720.png]]
Una volta trovata la matrice associata, scrivi le equazioni basandoti sulle righe (vedi cosa blu in alto).


#### DA MATRICE ASSOCIATA CON BASE CANONICA A MATRICE ASSOCIATA CON ALTRE BASI
La prima matrice è data dalle basi canoniche.
Ti vengono date altre basi  `A` e `B` e le equazioni della applicazione lineare -> ti trovi i vari valori e fai come abbiamo visto prima
![[Screenshot 2026-02-06 120026.png]]
##### E VICEVERSA
Sapendo che ogni colonna della matrice è un'applicazione lineare diversa ti scrivi le equazioni e trovi i vettori -> LI SCRIVI IN COLONNA NELLA MATRICE ALLA FINE
![[Screenshot 2026-02-06 120036.png]]
>[!tip] LUI QUI FA I CALCOLI STRANI MA TU FALLI COME SEMPRE (intendo le due cose prima della matrice).

# APPLICAZIONI LINEARI
$R^{n} \rightarrow R^{n}$ si dice ENDOMORFISMO

DEVONO RISPETTARE LE DUE CONDIZIONI che leggi sotto.
Per vedere se due vettori sono applicazioni lineari rispetto a una funzione allora basta sostituire i valori corrispondenti al vettore e verificare se rispettano le condizioni

#### ESEMPIO IN CUI LE RISPETTANO
![[Screenshot 2026-02-06 102649.png]]

#### ESEMPIO IN CUI NON LE RISPETTANO
![[Screenshot 2026-02-06 102701.png]]
>[!danger] VEDI IL +2 ALLA FINE non va bene

# NUCLEO e IMMAGINE
![[Screenshot 2026-02-06 122326.png]]
- NUCLEO = KER
- Immagine di f è un sottoinsieme di W

#### ESEMPIO
![[Screenshot 2026-02-06 122340.png]]
- DIMENSIONE IMMAGINE = RANGO
	- in base al rango scelgo `n` vettori da mettere nella mia base
- DIMENSIONE KER = DIMENSIONE SPAZIO ORIGINALE - DIMENISONE IMMAGINE
	- prendi `n` righe della matrice e le metti a sistema
		- trovi i valori di `x`, `y`, `z` -> AVRAI SEMPRE ALMENO UN'INCOGNITA LIBERA
		- scrivi `m` (dove `m` è la dimensione del KER) vettori in base ai valori trovati (i valori delle incognite libere li scelgo io).



# AUTOVALORI E AUTOVETTORI
Posso calcolarli solo se ho degli ENDOMORFISMI.

### AUTOVALORI
- Mi calcolo `n` vettori in base alla funzione e li scrivo nella matrice associata (IN COLONNA).
- Calcolo H mettendo $-\lambda$ nella diagonale
- CALCOLO IL DETERMINANTE E LO PONGO = 0
	- trovo gli `n` autovalori
![[Screenshot 2026-02-06 152958.png]]


### AUTOVETTORI
Da qui mi trovo tutti gli autovettori corrispondenti a quei determinati autovalori.
- Per ogni autovalore faccio il sistema ponendo ogni riga = 0 e risolvo
![[Screenshot 2026-02-06 153010.png]]



# AUTOSPAZIO
È un sottospazio di R
![[Screenshot 2026-02-06 155907.png]]

Molteplicità geometrica = DIM(matrice) - RANGO(matrice)

>[!lemma] 1 $\le$ MOLTEPLICITÀ GEOMETRICA $\le$ MOLTEPLICITÀ ALGEBRICA

![[Screenshot 2026-02-06 155947.png]]


# MATRICI DIAGONALIZZABILI
Ci rifacciamo ai concetti di matrici simili.
Due matrici sono simili se esiste una matrice invertibile `P` tale che: 
![[Screenshot 2026-02-06 161937.png]]

### DETERMINARE PER QUALI VALORI DI `h` la matrice è diagonalizzabile
- CALCOLO GLI AUTOVALORI
![[Screenshot 2026-02-06 162006.png]]
>[!tip] se h è diversa dai valori scritti in rosso ALLORA SIAMO SICURI che è un endomorfismo semplice.


- qui sostituisco i vari valori di `h` e vedo se è diaognalizzabile OSSIA SE MG = MA
![[Screenshot 2026-02-06 162021.png]]
Qui SI

![[Screenshot 2026-02-06 162032.png]]
Qui NO

![[Screenshot 2026-02-06 162046.png]]
Qui NO



# DIAGONALIZZARE UNA MATRICE
![[Screenshot 2026-02-06 163625.png]]






# RETTE E PIANI
![[Screenshot 2026-02-07 085630 1.png]]
![[Screenshot 2026-02-07 085646 1.png]]

![[Screenshot 2026-02-07 085721 1.png]]
![[Screenshot 2026-02-07 085738 1.png]]

# RETTA
![[Screenshot 2026-02-07 085755 1.png]]
![[Screenshot 2026-02-07 085812 1.png]]
![[Screenshot 2026-02-07 085839 1.png]]
![[Screenshot 2026-02-07 085850 1.png]]

# RETTE PARALLELE E ORTOGONALI NELLO SPAZIO
![[Screenshot 2026-02-07 085924 1.png]]
![[Screenshot 2026-02-07 085935 1.png]]
![[Screenshot 2026-02-07 090033 1.png]]
![[Screenshot 2026-02-07 090048 1.png]]
![[Screenshot 2026-02-07 090057 1.png]]

# EQUAZIONE DI UN PIANO
![[Screenshot 2026-02-07 090116 1.png]]
![[Screenshot 2026-02-07 090136 1.png]]
![[Screenshot 2026-02-07 090230 1.png]]

# RETTE IN FORMA CARTESIANA
![[Screenshot 2026-02-07 090249 1.png]]
![[Screenshot 2026-02-07 090306 1.png]]
![[Screenshot 2026-02-07 090332 1.png]]
![[Screenshot 2026-02-07 090345 1.png]]

# ESERCIZI
![[Screenshot 2026-02-07 090411 1.png]]
![[Screenshot 2026-02-07 090422 1.png]]
![[Screenshot 2026-02-07 090441 1.png]]
- INCIDENTI -> se il sistema di equazioni cartesiane da UNA SOLA SOLUZIONE (il caso della foto)
- PARALLELE/SGHEMBE -> se il sistema è impossibile
- COINCIDENTI -> se il sistema da infinite soluzioni (incognite libere)


![[Screenshot 2026-02-07 090655 1.png]]