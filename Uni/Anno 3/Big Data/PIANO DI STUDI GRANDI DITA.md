# BIG DATA — Lista argomenti + piano di studi


## Settimana 1
- [ ] Probabilità base, algoritmo polinomio, Bayes, algoritmo matrice, Min-Cut
## Settimana 2
- [ ] Random variables, valore atteso, binomiale, geometrica, QuickSort
## Settimana 3
- [ ] Markov, Chebyshev, weak law, Coupon Collector, union bound
## Settimana 4
- [ ] Contention Resolution, hashing universale
## Settimana 5
- [ ] Chernoff, Bloom Filter, Flajolet-Martin
## Settimana 6
- [ ] DGIM, exponential buckets a grandi linee, grafi fino a slide 18

## Modalità: 2 sessioni a settimana

## Obiettivo del piano
Questo piano è pensato per farti arrivare all’esame sapendo:
- distinguere bene **argomenti centrali** e **argomenti marginali**
- esporre gli algoritmi nel modo che vuole il prof
- concentrarti soprattutto su ciò che è **orale-friendly**
- evitare di perdere tempo su parti che hai già segnato come **da non fare**
# 0. Regole d’oro per studiare bene questo esame
## A. Come devi spiegare ogni algoritmo all’orale
Per ogni algoritmo prepara sempre questo schema:
### 1. Definizione del problema
Che problema risolve?  
Perché è difficile in ambito big data / randomized / stream?
### 2. Parametri
Quali grandezze compaiono?  
Ad esempio:
- ( n )
- ( m )
- ( p )
- ( \varepsilon )
- ( \delta )
- lunghezza stream
- numero elementi distinti
- spazio usato
### 3. Come funziona l’algoritmo
Passi logici, idea intuitiva, struttura.
### 4. Analisi
- costo in tempo
- costo in spazio
- probabilità di errore
- accuratezza / bound / successo
Questa è la tua griglia fissa.
## B. Cosa NON portare come argomento principale
Da quello che hai scritto, meglio **non puntare** su:
- Hashing puro
- Shingling
- roba generale introduttiva del Mitzenmacher
- funzione / spazio di probabilità come pezzo da esposizione principale
- esempi super accessori
- slide con dimostrazione di ( \Pr(A \mid B) )
Queste cose vanno sapute **quel tanto che serve**, ma non devono diventare il centro del tuo studio.
## C. Cosa invece è ideale da portare
I tuoi “pezzi forti” sono:
- **Flajolet-Martin**
- **DGIM**
- algoritmi un po’ più difficili con analisi chiara
- Min-Cut / Karger
- QuickSort randomizzato
- Coupon Collector con bound
- Bloom Filter come argomento secondario ben spendibile
# 1. Struttura del programma, ripulita bene
## BLOCCO 1 — Probabilità e randomized basics
### Mitzenmacher-Upfal CH-01, CH-02, CH-03
### CH-01
Da fare:
- Algoritmo del polinomio (**tutto**)
    - incluso come migliorarlo
- Eventi indipendenti
- Probabilità condizionale
- Identità utili
- Algoritmo matrice (**tutto**)
    - teorema
    - dimostrazione fino a slide 41-42
- Legge probabilità totali (**senza dimostrazione**)
- Legge di Bayes
    - applicazione all’algoritmo della matrice
    
- Min-Cut algorithm
    - dal libro + slide
    - salta il teorema one-side error, se confermato non richiesto


### CH-02

Da fare:

- Random variable
    
- Variabili aleatorie indipendenti
    
- Definizione di valore atteso
    
- Linearità del valore atteso (**senza dimostrazione**)
    
- Bernoulliane
    
- Distribuzione binomiale
    
- Valore atteso binomiale (**senza dimostrazione**)
    
- Randomized QuickSort (**tutto + dimostrazione**)
    
- Distribuzione geometrica
    
    - valore atteso
        
    - varianza
        
- Memoryless property (**no dimostrazione**)
    
- Coupon collector problem (**tutto**)
    

### CH-03

Da fare:

- Markov inequality (**no dimostrazione**)
    
- Varianza
    
- Chebyshev inequality (**no dimostrazione**)
    
- Slide 9: leggere, non dimostrare
    
- Varianza bernoulliane: sapere
    
    - ( \mathrm{Var}(X)=p(1-p) )
        
    - ( np(1-p) )
        
- Punto 3 slide 18: **non fare**
    
- Coupon collector + Chebyshev
    
- Direct bound = union bound + coupon collector
    
- Weak law of large numbers (**no dimostrazione**)
    

---

## BLOCCO 2 — Randomized algorithms / hashing base

### Tardos + Lucio/Andy

Da fare:

- Contention Resolution
    
- Global Min Cut / Karger
    
- Universal hashing
    
- Hash functions come base tecnica
    

Da non portare come focus:

- hashing puro come argomento principale
    

---

## BLOCCO 3 — Data streams e graph mining

### Prezza + MMDS + Andy

Da fare:

- Chernoff bound
    
- Bloom filter
    
- Flajolet-Martin
    
- Exponential buckets a grandi linee
    
- DGIM
    
- Graphs1 fino a slide 18
    
- PDF Valerio con quadrupla da sapere
    

Da saltare:

- ultima slide di FM
    
- slide 46-48 di streams2
    
- Hashing/Shingling come topic da esposizione principale
    

---

# 2. Piano di studio ottimizzato — 6 settimane, 2 volte a settimana

Questo secondo me è il compromesso migliore:  
abbastanza compatto, ma senza correre troppo.

---

# SETTIMANA 1 — Fondamenti di probabilità + primi algoritmi

## Obiettivo

Mettere le basi del blocco probabilistico senza perderti nei dettagli inutili.

## Sessione 1

### Probabilità base + algoritmo del polinomio

Studia
- probabilità condizionale
- eventi indipendenti
- identità utili
- legge delle probabilità totali (**solo enunciato**)
- algoritmo del polinomio (**tutto**)
- come migliorare l’algoritmo del polinomio

### Risultato atteso
Alla fine devi saper dire:
- quando un algoritmo randomizzato può sbagliare
- come si controlla la probabilità di errore
- perché l’algoritmo del polinomio è comodo rispetto a quello deterministico


---

## Sessione 2
### Bayes + algoritmo della matrice + Min-Cut

Studia:
- legge di Bayes
- algoritmo matrice (**tutto**)
- teorema
- dimostrazione fino a slide 41-42
- applicazione di Bayes all’algoritmo matrice
- Min-Cut dal libro + slide

### Risultato atteso
Devi saper spiegare:
- il senso della probabilità a posteriori
- come Bayes entra nell’analisi dell’algoritmo matrice
- struttura generale del Min-Cut randomizzato


---

# SETTIMANA 2 — Variabili aleatorie e valore atteso

## Obiettivo

Passare dal linguaggio degli eventi a quello delle random variables.

## Sessione 3

### Random variables + valore atteso + distribuzioni base

Studia:

- random variable
    
- variabili indipendenti
    
- definizione di valore atteso
    
- linearità del valore atteso (**senza dimostrazione**)
    
- bernoulliane
    
- binomiale
    
- valore atteso binomiale (**no dimostrazione**)
    
- varianza bernoulliana
    
- formula ( p(1-p) )
    
- formula ( np(1-p) )
    

### Risultato atteso

Devi saper usare bene gli indicatori e il valore atteso.

---

## Sessione 4

### Geometrica + memoryless + QuickSort randomizzato

Studia:

- distribuzione geometrica
    
- valore atteso geometrica
    
- varianza geometrica
    
- memoryless property (**senza dimostrazione**)
    
- Randomized QuickSort (**tutto**)
    
- dimostrazione dalle slide
    

### Risultato atteso

Qui devi arrivare a saper esporre bene **QuickSort randomizzato**, perché è molto orale-friendly:

- problema
    
- scelta pivot casuale
    
- numero atteso di confronti
    
- perché viene ( O(n \log n) ) in atteso
    

---

# SETTIMANA 3 — Disequazioni probabilistiche e Coupon Collector

## Obiettivo

Imparare gli strumenti per l’analisi dell’errore.

## Sessione 5

### Markov, Chebyshev, varianza, weak law

Studia:

- Markov inequality (**no dimostrazione**)
    
- varianza
    
- Chebyshev inequality (**no dimostrazione**)
    
- slide 9, senza dimostrazione
    
- weak law of large numbers (**no dimostrazione**)
    

### Risultato atteso

Devi saper distinguere:

- **Markov**: per variabili non negative
    
- **Chebyshev**: quando conosci la varianza
    
- **Chernoff**: quando hai somme di indipendenti e vuoi bound più stretti
    

---

## Sessione 6

### Coupon Collector completo

Studia:

- Coupon Collector problem (**tutto**)
    
- valore atteso
    
- applicazione con Chebyshev
    
- direct bound / union bound + coupon collector
    

### Risultato atteso

Questo è un altro argomento ottimo per l’orale, perché mescola:

- random variables
    
- valore atteso
    
- harmonic series
    
- bound probabilistici
    

---

# SETTIMANA 4 — Randomized algorithms applicativi

## Obiettivo

Entrare negli algoritmi più “da esame” della seconda parte.

## Sessione 7

### Contention Resolution + union bound

Studia:

- contention resolution
    
- protocollo randomizzato
    
- probabilità di successo di un processo
    
- analisi su più round
    
- union bound applicato
    

Dal materiale Tardos/Kleinberg-Wayne si vede bene la struttura del protocollo: ogni processo tenta con probabilità (1/n), e l’analisi usa indipendenza e union bound.

### Risultato atteso

Saper spiegare bene:

- il problema del conflitto
    
- perché serve la randomizzazione
    
- come si arriva ad alta probabilità di successo
    

---

## Sessione 8

### Hash functions / universal hashing

Studia:

- dictionary problem
    
- idea hash table
    
- collisioni
    
- universal hashing
    
- teorema della famiglia universale
    
- costruzione della famiglia hash
    

Le slide su universal hashing mostrano bene sia la definizione sia il teorema della costruzione con vettori/mod primo.

### Nota importante

Questa sessione va fatta **come base tecnica**, non come argomento forte da portare.

---

# SETTIMANA 5 — Stream algorithms: cuore del corso

## Obiettivo

Arrivare ai contenuti più forti e più “big data”.

## Sessione 9

### Chernoff + Bloom Filter

Studia:

- Chernoff Bound dalle note di Prezza
    
- guarda soprattutto la versione che poi usi davvero
    
- Bloom Filter:
    
    - struttura
        
    - false positives
        
    - no false negatives
        
    - dipendenza da memoria e numero di hash
        

Nelle slide Bloom Filter il punto chiave è proprio: nessun falso negativo, ma possibili falsi positivi; inoltre la probabilità di falso positivo dipende da (m,n,k).

### Risultato atteso

Devi saper spiegare Bloom Filter come:

- problema di filtering
    
- struttura compatta
    
- compromesso memoria/errore
    

---

## Sessione 10

### Flajolet-Martin 🌟

Studia:

- problema: contare elementi distinti
    
- idea dell’hashing
    
- trailing zeros
    
- stima di (F_0)
    
- analisi intuitiva dell’errore
    
- eventuale miglioramento con medie/mediane se richiesto dal corso
    
- **non fare l’ultima slide**
    

Dalle note di Prezza, Flajolet-Martin compare in 5.4.2 come algoritmo per stimare (F_0), cioè il numero di distinti in stream.

### Risultato atteso

Questo deve diventare uno dei tuoi **cavalli di battaglia**.

---

# SETTIMANA 6 — DGIM + grafi

## Obiettivo

Chiudere il programma con l’altro grande argomento da portare.

## Sessione 11

### Exponential Buckets + DGIM 🌟

Studia:

- Exponential buckets: solo idea generale
    
- problema della finestra scorrevole
    
- DGIM da Prezza
    
- struttura a bucket
    
- aggiornamento
    
- query
    
- analisi spazio/errore
    

Le note di Prezza trattano DGIM nella sezione sul conteggio degli 1 in finestra.

### Attenzione

- salta le slide 46-48 di streams2
    
- exponential bucket solo a grandi linee
    

### Risultato atteso

DGIM deve essere preparato **molto bene**, quasi quanto FM.

---

## Sessione 12

### Grafi

Studia:

- ch10-graphs1 fino a slide 18
    
- PDF Valerio
    
- quadrupla da sapere
    

Dalle slide graphs1 si vedono due blocchi:

- clustering su grafi metrici
    
- community detection / Girvan-Newman nelle reti non pesate
    

### Risultato atteso

Su grafi devi avere una preparazione buona ma più compatta rispetto a FM e DGIM.

---

# 3. Dopo queste 6 settimane: fase ripasso intelligente

Qui non studi argomenti nuovi.  
Qui alleni l’esposizione.

## Ripasso 1 — Probabilità e basi

Ripassa:

- Bayes
    
- linearità del valore atteso
    
- Markov
    
- Chebyshev
    
- union bound
    
- weak law
    
- Bernoulli / Binomiale / Geometrica
    

## Ripasso 2 — Algoritmi randomizzati

Ripassa:

- algoritmo del polinomio
    
- algoritmo matrice
    
- QuickSort randomizzato
    
- Min-Cut / Karger
    
- contention resolution
    
- coupon collector
    

## Ripasso 3 — Stream e big data

Ripassa:

- Bloom filter
    
- FM
    
- DGIM
    
- Chernoff
    
- parte graph fino a slide 18
    

---

# 4. Ordine di importanza degli argomenti

Se a un certo punto sei corto con il tempo, studia in questo ordine.

## Priorità massima

- Flajolet-Martin
    
- DGIM
    
- QuickSort randomizzato
    
- Coupon Collector
    
- Min-Cut / Karger
    
- Bayes
    
- Markov / Chebyshev / Union bound
    

## Priorità media

- Bloom Filter
    
- Contention Resolution
    
- Geometrica / Memoryless
    
- Algoritmo matrice
    
- Algoritmo del polinomio
    

## Priorità più bassa

- hashing puro
    
- introduzioni generali
    
- shingling
    
- dettagli non richiesti delle slide da saltare
    

---

# 5. Strategia pratica per ogni settimana

Per ogni sessione da 2–3 ore ti consiglio questa struttura:

## Prima ora

Capisci teoria e definizioni.

## Seconda ora

Rifai l’algoritmo con la scaletta:

- problema
    
- parametri
    
- funzionamento
    
- analisi
    

## Ultimi 20–30 minuti

Ripetizione ad alta voce senza guardare gli appunti.

Questo esame si vince tantissimo sulla **esposizione parlata**.

---

# 6. I due argomenti da preparare “da 30”

Se vuoi fare una preparazione furba, i due argomenti da curare in modo quasi perfetto sono:

## Flajolet-Martin

Perché:

- è molto “big data”
    
- è tecnico ma spiegabile
    
- fa fare bella figura
    
- mostra uso intelligente di hash e probabilità
    

## DGIM

Perché:

- è tipicamente da stream
    
- ha una struttura elegante
    
- mostra bene spazio ridotto + errore controllato
    
- si espone molto bene all’orale
    
