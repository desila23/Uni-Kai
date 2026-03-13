# LIVELLO DI TRASPORTO
## Definizione
Si occupa di consentire la comunicazione tra processi che si trovano su host differenti, tramite protocolli e segmenti.

### Multiplexing e Demultiplexing (il "de" sia con UDP e TCP)
Sono due tecniche che vengono utilizzate per lo **smistamento dei dati** da un host mittente a uno destinatario.

- **MULTIPLEXING**: i messaggi vengono prelevati dai vari processi sull'host mittente e unite in un unico segmento - con delle intestazioni per identificare la provenienza di un dato messaggio
- **DEMULTIPLEXING**: sull'host destinatario il segmento viene ricevuto, vengono osservate le intestazioni e inviati correttamente i messaggi alle socket dei processi destinatari


## UDP - definizione
![[Pasted image 20250406191720.png|center]]
Protocollo di trasporto che garantisce una **trasmissione veloce** **senza** bisogno di stabilire **connessione** tra i due host e basato sulla ritrasmissione (in caso di errori).

### Struttura segmenti UDP
- **Intestazione**: contiene informazioni sul servizio
	- Porta di origine -> *serve eventualmente se è prevista una risposta*  
	- Porta di destinazione
	- Lunghezza -> indica quanti byte sono presenti in totale nel segmento
	- Checksum -> serve per il controllo degli errori
- **Dati**: il contenuto vero e proprio

##### Approfondimento sul checksum
Spazio di dati usato da UDP per rilevare eventuali errori e permettere la ritrasmissione del segmento.
- **LATO MITTENTE**: vengono presi i bit del segmento, vengono divisi in gruppi e sommati, successivamente viene effettuato il complemento a uno del risultato e poi inserito nell'intestazione
- **LATO RICEVENTE**: viene ricalcolato di nuovo
	- se il risultato contiene tutti `1` -> nessun errore
	- se c'è anche solo uno `0` -> errore e ritrasmissione


### RDT
RDT è un modello astratto che indica come gestire un canale inaffidabile, per garantire la corretta ritrasmissione dei dati.
==Venne usato come modello di TCP==
È diviso in diverse versioni.
##### RDT 1.0
Si da per scontato che il canale sia affidabile e quindi mittente e destinatario devono solo aspettare di essere interpellati per inviare o ricevere dati.

##### RDT 2.0
Si ipotizza che possano avvenire degli errori e vengono introdotte due tipologie di pacchetti da parte del destinatario `ACK` e `NAK`.
- LATO MITTENTE: invia il segmento e si mette in attesa di una risposta da parte del destinatario
- LATO DESTINATARIO: in base alla ricezione, invia
	- **ACK** -> per confermare la ricezione corretta di un segmento
	- **NAK** -> per informare il mittente di un errore e quindi di un bisogno di ritrasmissione
>[!problem] ANCHE GLI `ACK` E I `NAK` POSSONO ESSERE CORROTTI

##### RDT 2.1
Viene introdotto il **numero di sequenza** (`0` o `1`) per
- evitare duplicazioni
- identificare eventuali errori o perdite di pacchetti

IDEA: il mittente invia un pacchetto con un numero di sequenza (es. `1`) e di conseguenza di aspetta una risposta con lo stesso numero.
	Se non coincidono (sia nel caso del  `ACK` o del `NAK`), allora agisce di conseguenza.

##### RDT 2.2
Vengono rimossi i `NAK` e quindi se viene ricevuto un `ACK` non corrispondente avviene una ritrasmissione.

##### RDT 3.0
Aggiunge gli `RTT`, ossia una soglia di tempo per attendere un segnale, necessaria per effettuare una ritrasmissione.
Questa soluzione viene introdotta per gestire eventuali perdite, non solo errori.

### Differenze tra stop-and-wait e pipeline
![[Pasted image 20250406195008.png]]
- STOP-and-WAIT: viene inviato un segmento e il mittente si mette in attesa di una risposta da parte del destinatario
- PIPELINE: vengono inviati in sequenza i segmenti e poi vengono accumulati su una pipe i rispettivi `ACK` nel caso del mittente

### GBN (altro modello teorico)
![[Pasted image 20250406200108.png]]
Protocollo teorico che prevede l'utilizzo di finestre per permettere la gestione di
- segmenti confermati
- segmenti non confermati
- segmenti da inviare

Se, in una sequenza di `N` segmenti, un segmento non viene confermato, il mittente, dopo il timeout, dovrà inviare di nuovo tutti i segmenti a partire da quello che ha causato problemi.

>[!tip] GBN USA UNA SOLO TIMER PER FINESTRA (corrisponde al primo segmento inviato).


### Ripetizione selettiva (altro modello teorico)
![[Pasted image 20250406204507.png]]![[Pasted image 20250406205436.png]]
Migliora la limitazione di GBN, permettendo il reinvio del (o dei) pacchetto che ha causato problemi. 
I successivi ad esso verranno memorizzati in un buffer e, una volta colmato il buco, verranno inviati cumulativamente al livello applicativo.

>[!tip] QUI SI USA UN TIMER PER OGNI SEGMENTO

La finestra del mittente si muova quando ha ricevuto l'`ack` di base.
Il destinatario può inviare pacchetti quando ha ricevuto una sequenza corretta a partire dalla `base`
## TCP - definizione
TCP è un protocollo di trasporto affidabile detto orientato alla connessione (connection-oriented) in quanto, prima di effettuare scambi di dati, i processi devono effettuare l'handshake
	ossia inviarsi reciprocamente alcuni segmenti preliminari per stabilire i parametri del successivo trasferimento.
![[Pasted image 20250407182229.png]]

### Handshake
Procedura volta ad instaurare una connessione sicura tra due host.
Malgrado un aumento dell'overhead, diminuisce notevolmente la perdita di dati attraverso segnali `ACK` scambiati tra le due parti.
##### A DUE VIE
Il mittente invia una richiesta TCP al destinatario
Il destinatario invia un `ACK` di conferma ed eventualmente i primi byte.
La connessione in questo caso è stabilita e i due possono iniziare ad inviare dati fino alla chiusura.
>[!problem] Problema in caso di un segnale di `ACK` o di `Richiesta`
##### A TRE VIE
Identico a quello a due vie ma il mittente deve inviare a sua volta un `ACK`dell'`ACK` ricevuto.
Per iniziare la sincronizzazione viene usato un `SynBit` che deve essere uguale tra i due.

Abbiamo
- `ACKbit` -> è un semplice `ACK` ma 
	- `0` = `ACK`
	- `1` = `NAK`
- `ACKNUM` -> indica fino a quale sequenza di byte ha ricevuto correttamente

#### Bit di reset
In caso di errori, è possibile terminare repentinamente la connessione stabilita tramite **bit di reset**

### Chiusura di una connessione TCP
- Viene inviato un `FINbit` al destinatario 
- Questo risponde con un `ACK` e invia anche lo stesso `Finbit`
- Il mittente invia a sua volta un `ACK`
La connessione è chiusa.


#### Attacco Syn Flood
Quando vengono inviate molteplici richiesta ad un server, questo alloca memoria.
Per risolvere questo problema, nel caso di un attacco, il server risponde "assegnando" un cookie ad un mittente
- se il mittente risponde con il cookie -> lascia lo spazio allocato
- se non lo usa -> rimuove lo spazio allocato


### MSS e MTU
La MSS rappresenta la massima dimensione di un segmento, ossia la massima quantità di dati posizionabili nello stesso (tolta l'intestazione).

MTU rappresenta la massima dimensione di un datagramma di un protocollo IP che racchiude anche il segmento

### Struttura segmenti TCP
- **Intestazione**
	- numeri di porta di origine e destinazione -> qui la porta di origine viene controllata
	- checksum
	- numero di sequenza e di ACK
	- finestra di ricezione
	- lunghezza intestazione
	- e vari flag
- **Corpo** -> contenente i dati effettivi

### Numeri di sequenza
TCP vede i dati come un flusso di byte ordinati.
Ogni byte è ordinato sequenzialmente.
Il numero di sequenza del singolo segmento corrisponde al primo byte presente nella sequenza (es. se ho i byte da 0 a 3, `numero di sequenza = 0`)
### Numeri di Acknowledgment
Il numero nell'intestazione corrisponde all'ultimo byte confermato.

### Timeout e stima RTT
Il timeout identifica il tempo massimo che un mittente può aspettare prima di ritrasmettere i segmenti persi.

L'RTT viene calcolato prendendo vari segmenti, calcolando per ciascuno quanto è intercorso tra invio e conferma (`sample-RTT`) e poi viene effettuata una media.
Ovviamente questa media può variare nel tempo in base ai successivi `sample-RTT` ottenuti.

### Controllo di Flusso
TCP offre questo servizio alle applicazioni del mittente per gestire il flusso di dati che può inviare per evitare saturazioni del buffer nel destinatario.

TCP usa il campo dell'intestazione "finestra di ricezione" (`rwnd`) per fornire al mittente una panoramica di quanti byte può ricevere il destinatario.


### Congestione definizione
La **congestione** è un fenomeno che si verifica quando il **carico di risorse di rete** **supera la capacità disponibile**, causando 
- ritardi crescenti
- perdita di pacchetti 
- e degrado delle prestazioni complessive della rete.

#### Tre scenari principali 
1. **Router con buffer illimitato** -> non ci sono perdite ma al massimo accodamenti se più host inviano ad una velocità ($\lambda_{in}$) superiore a quella che il router può gestire ($R$).
	Problematiche: se i pacchetti si accodano, il **ritardo medio diventa altissimo** (tende all'infinito)

2. **Router con buffer limitato** -> i pacchetti possono essere scartati e le ritrasmissioni avvengono a livello di trasporto
	Si divide in 3 sotto-scenari
	1. **CASO IDEALE**: buffer vuoto e conoscenza perfetta sulla condizione del buffer 
		-> i pacchetti non vengono persi e non ci sono ritrasmissioni
	2. **CASO REALISTICO**: buffer pieno e conoscenza meno perfetta 
		-> i pacchetti vengono persi e avviene una ritrasmissione
	3. **CASO PEGGIORE**: timeout prematuro 
		-> scatta un timeout troppo presto e il mittente ritrasmette un duplicato

3. **Buffer limitati e multihop** -> in un caso in cui abbiamo molti host e molti router, un segmento deve passare per più router per arrivare dal mittente al destinatario
	PROBLEMATICHE: se un host `B` è adiacente ad un router e un altro `A` invece sfrutta quel router come "passaggio", c'è il rischio che `B` intasi il router e i segmenti di `A` vengano scartati


#### Due approcci ai controlli della congestione
##### Approccio end-to-end
Il controllo sulla congestione è demandata completamente al mittente, che sfrutta una finestra di ricezione per verificare se un pacchetto è andato perso o meno.
	Se non riceve un **ACK** allora suppone ci sia congestione
📌APPROCCIO USATO DA TCP

##### Approccio con assistenza dalla rete
I router aiutano il mittente a capire se c'è congestione, marcando i pacchetti (**choke**) una volta raggiunto il limite consentito.
In questo approccio
- il router marca il pacchetto e lo spedisce al destinatario
- il destinatario, leggendo il pacchetto marcato, invia un **ACK** al mittente informandolo della congestione.

#### Gestione tassi di invio in TCP: AI/MD
L'idea è quella di 
- iniziare con un tasso di invio basso, aumentarlo di **1 MSS ogni RTT** (*Incremento Additivo*)
	- questa viene definita finestra di congestione `cwnd`, ossia la quantità di segmenti che TCP può inviare senza ricevere un `ACK`
- quando il mittente si accorge che c'è congestione, allora decrementa il tasso di invio dimezzando ogni volta `cwnd` $$\text{cwnd} \rightarrow \frac {\text{cwnd}} 2$$
###### a) **`rwnd`** = _receive window_
- È la **quantità di spazio libero** nel **buffer del destinatario**.
- Viene comunicata **dentro ogni ACK**.
- Serve per il **controllo di flusso** → evita che il mittente invii più dati di quanti il destinatario può gestire.
###### b) **`cwnd`** = _congestion window_
- È un limite **gestito dal mittente**.
- Serve per il **controllo di congestione** → evita che il mittente invii troppi dati nella rete, saturandola.


#### Fasi di gestione del tasso di invio
##### Slow Start 
L'idea è iniziare piano e poi ad ogni `RTT` raddoppiare il valore di `cwnd`.
Viene poi sfruttata una variabile chiamata `sstresh` che indica quando smettere di crescere esponenzialmente e passare a una crescita lineare (`congestion avoidance`)
##### Gestione degli errori
Diversi casi
1. Se non si ricevono `ACK`
	- scade il timeout
	 - viene resettato `cwnd` a 1
	 - si riparte con la **slow start**

2. Se riceve 1 `ACK` duplicato
	- prova semplicemente a ritrasmetterli

3. Se riceve 3 `ACK` duplicati
	 - entra in **fast recovery** 
		 - dura 1 `RTT` per attendere l'`ACK` del pacchetto perso
		 - dimezza `cwnd` rispetto a `cwnd` del round precedente + 3
		 - entra in congestion avoidance

#### Elenco evoluzioni TCP
##### RENO
Implementazione di TCP che utilizza un algoritmo per gestire al meglio le idee di **AI/MD**
##### CUBIC
Si parte dall'idea classica di **AI/MD** ma
- si setta una variabile $W_{max}$ che indica il limite massimo della finestra prima della perdita di pacchetti
- viene utilizzata una variabile $K$ che indica l'istante in cui la finestra raggiungerà di nuovo $W_{max}$
- più ci si allontana da $K$ e più la finestra cresce, quando ci si avvicina a $K$ si inizia a rallentare
- una volta raggiunto $K$ si gestisce in modo classico

>[!problem] PROBLEMA: sia RENO che CUBIC causano perdita di pacchetti
##### VEGAS
Usa l'**RTT** minimo calcolato fino a quel momento per anticipare la congestione e quindi evitare la perdita di pacchetti.
- con questo RTT calcola il throughput massimo teorico $$\text{throughput massimo} = \frac {\text{cwnd}} {\text{RTT}_{min}}$$
- misura poi il throughput reale
	- se i throughputs sono simili, aumenta `cwnd`
	- se il throughput reale è più piccolo -> si sta congestionando la rete -> viene ridotto `cwnd`
##### ECN
È presente in alcune implementazioni di TCP e vengono utilizzate due variabili
- `ECN` -> inviate dal router al destinatario per informare della congestione
	- `11`indica che il pacchetto ha attraversato un router congestionato
- `ECE` -> inviata dal destinatario al mittente per informarlo concretamente della congestione

#### Fairness in TCP
TCP è **fair** perché suddivide il throughput in base a quante connessioni attive sono presenti $$T = \frac R K$$
>[!problem]- Problema dei TCP paralleli
> Se uno stesso host fa più socket con più richiesta TCP allora non è più fair

>[!tip] OSS: UDP non è fair perché non ha controllo sulla congestione

#### Evoluzione del livello di trasporto (QUIC)
Quic utilizza UDP a livello di applicazione e implementa le varie sicurezze e migliorie

>[!example] PRO: QUIC non ha **HOL**  (TCP si)

>[!problem] CONTRO: essendo molto recente è meno supportato

