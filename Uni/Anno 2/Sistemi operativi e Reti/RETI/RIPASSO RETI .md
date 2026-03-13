# LEZIONI INTRODUTTIVE
## Definizione internet
Infrastruttura composta da un insieme di reti interconnesse tra loro

## Host
Sono dispositivi presenti ai "bordi" di internet, i quali
- eseguono applicazioni di rete
- comunicano attraverso pacchetti di dati, inviati da altri dispositivi come router e switch

## ISP
Sono organizzazioni che forniscono accesso a internet agli utenti e aziende.
Sono interconnessi per garantire il corretto funzionamento della rete globale.

Abbiamo due tipi
- REGIONALI: si trovano ai bordi di internet e a loro sono connessi gli HOST
- NAZIONALI o GLOBALI: si trovano nel nucleo e a loro sono connessi i REGIONALI ![[Pasted image 20250311125712.png]]

## Differenza tra LAN e WAN
- LAN (Local Area Network): dispositivi connessi alla stessa rete 
- WAN (Wide Area Network): dispositivi connessi ad una rete più ampia


## Definizione di Nucleo della rete
È l'insieme di commutatori di pacchetti e link tra i vari host ed è collegato alle varie "periferie".

Le due funzionalità principali sono
1. **Inoltro** (*forwarding*), un'azione locale che avviene nei singoli router che, partendo da un'interfaccia di ingresso, permettono di scegliere un'interfaccia di uscita dove inoltrare quel pacchetto. Il tutto viene eseguito tramite l'utilizzo di una tabella di inoltro.
2. **Instradamento**, azione globale che riguarda l'intero percorso dalla sorgente alla radice e si occupa di determinare il percorso migliore tra i router (ritorna la tabella di inoltro)

## Commutazione di una rete
Tecniche che permettono l'invio o lo scambio di pacchetti secondo delle regole.

Si dividono in
- Commutazione di pacchetto (store-and-forward)
	- il singolo messaggio viene suddiviso in pacchetti di `L` bit 
- Commutazione di circuito
	- viene dedicato il singolo percorso tra un host mittente e destinatario e vengono inviati flussi di bit

## Sicurezza internet
- PACKET SNIFFING, una interfaccia di rete, quindi collegata alla rete, può vedere tutti i pacchetti che ci passano.
- IP SPOOFING, fingo di avere un altro indirizzo IP nella rete

## Definizione di protocollo
Insieme di regole che definiscono il metodo di comunicazione tra i dispositivi nella rete

PILA PROTOCOLLARE
1. LIVELLO DI APPLICAZIONE: fornisce servizi e supporto alle applicazioni di rete (con protocolli ad es. HTTP)
	- ==MESSAGGIO==
2. LIVELLO DI TRASPORTO: si occupa del trasferimento di dati tra processi (con protocolli come TCP e UDP)
	- HTTP usa TCP
	- ==SEGMENTO==
3. LIVELLO DI RETE: si occupa del trasporto dei ==DATAGRAMMI==. pacchetti di rete tra host con indirizzo IP (protocollo IP)
4. LIVELLO DI COLLEGAMENTO: si occupa del trasporto di ==FRAME== tra dispositivi vicini
5. LIVELLO FISICO: si occupa del trasferimento di bit veri e propri
![[Pasted image 20250314235435.png]]


---

# LIVELLO DI APPLICAZIONE
## Definizione
Il livello di applicazione è il livello più alto della pila protocollare e interagisce con l'utente o con le applicazioni di rete fornendo i servizi di rete.


## Tipi di architetture
Abbiamo due approcci principali
#### Client-Server
Un tipo di architettura in cui abbiamo due attori principali
- HOST SERVER, che deve essere costantememente attivo e avere un indirizzo IP noto, per poter essere identificato dagli host client per soddisfare le richieste
- HOST CLIENT, che interpella il server per ricevere messaggi, non ha bisogno di rendere noto il suo indirizzo IP e può 

#### Peer-to-Peer
Tipo di architettura che prevede un insieme di host che possono fare sia da client che da server.
Un peer può condividre i chunk che ha già scaricato con i peer più vicini.

Esistono varie tecniche che permettono lo scambio tra peer.
##### File torrent
Un file che ha tutti i tracker dei vari peer.

##### Client-Server VS Peer-to-Peer
Client server più lineare.
Peer-to-Peer dipende dal quantitativo di utenti che condividono 

##### Tit-for-Tat
Ogni tot secondi viene effettuato un controllo per esaminare quali peer sono più "collaborativi".
Chi non lo è viene messo tra i **choked**.
Questo spinge tutti a collaborare.


## Processi
Programma in esecuzione su un host.
I processi accedono alla rete tramite il livello di trasporto ma per comunicare con il livello di applicazione sfruttano le socket.

## Socket
Interfacce software che permetto la comunicazione con i processi.
Lavorano a livello di trasporto e fanno da tramite con il livello di applicazione.

Sono identificate con una coppia `IP + porta`
- IP identifica l'host
- Porta, identifica l'applicazione
	- alcune porte sono standardizzate per alcune applicazioni


## Protocolli
Si dividono in due tipologie
- proprietari, non sono noti e vengono usati da applicazioni private
- pubblici, sono noti e standardizzati

#### Servizi di trasporto richiesti
- Sicurezza
	- i livelli di trasporto non garantiscono piena sicurezza, ma quelli di applicazione la migliorano -> ES. TLS usato da TCP per la cifratura
- Throughput minimo garantito
- Controllo su perdita di messaggi
- Sensibilità al fattore tempo

#### Protocolli di trasporto usati dalle applicazioni
- HTTP -> TCP
- SMTP -> TCP
- Giochi interattivi -> UDP e TCP (ma con preferenza su UDP per maggiore velocità)
- VoIP (telefonia) -> UDP


## HTTP (e vari tipi)
Protocollo implementato a livello di applicazione che definisce la struttura dei messaggi e la modalità di scambio.

La sua porta è la 80

Si tratta di un protocollo ***stateless***, ossia non mantiene memoria tra le richieste degli utenti.

#### Due tipologie di connessioni
1. NON PERSISTENTI, in cui viene aperta una nuova connessione TCP per ogni oggetto richiesto e dopo la trasmissione viene chiusa.
	Passaggi effettivi
	- il client inizializza la connessione TCP
	- il server la accetta
	- inizia lo scambio di messaggi HTTP
	- la connessione TCP viene chiusa una volta conclusa la comunicazione
2. PERSISTENTI, in cui viene lasciata aperta una connessione per più oggetti -> più efficiente

##### RTT
È il tempo di risposta utilizzato nelle connessioni non persistenti e riguarda il tempo che un pacchetto impiega per andare dal client al server e tornare indietro.

Generalmente il tempo di risposta è dato da
- 1 RTT per inizializzare la connessione TCP
- 1 RTT per far tornare indietro la richiesta e iniziare a inviare i primi pacchetti
- il tempo di trasmissione effettivo dell'oggetto (o file)
Quindi $$2 \ \text{RTT} + \text{tempo di trasmissione del file}$$
>[!problem] Maggiore overhead di connessione

#### Struttura generale di una richiesta client HTTP
1. Riga di richiesta (request line)
	 - contiene il metodo HTTP (post, get, head o put), l'URL richiesto e la versione HTTP
2. Intestazione (header)
	- contiene informazioni sul client e le sue preferenze
3. Corpo del messaggio
	- presente solo in alcuni metodi, come POST e PUT
	- contiene i dati effettivi inviati al server

#### Versioni di HTTP
1. HTTP/1.0 -> Non persistente
2. HTTP/1.1 -> introduce il GET multiplo in pipeline su una singola connessione TCP
	- PROBLEMA: il server risponde in FCFS, quindi i pacchetti più piccoli che si trovano nel messi vengono bloccato da eventuali pacchetti più grandi che si trovano in testa
3. HTTP/2 -> ha una maggiore flessibilità nell'invio di oggetti al client, non viene utilizzato più il FCFS
	 - Vantaggi: minor overhead e miglior funzionamento del controllo della congestione
	 - Problema: si basa su una singola connessione TCP e quindi il recupero della perdita di pacchetti blocca tutta la trasmissione
4. HTTP/3 -> migliora la sicurezza, il controllo degli errori e utilizza UDP migliorato con il protocollo QUIC


| **Codice di stato**     | **Descrizione**                                                                  |
| ----------------------- | -------------------------------------------------------------------------------- |
| **1xx** (Informational) | Messaggi informativi, raramente usati.                                           |
| **2xx** (Success)       | La richiesta è andata a buon fine.                                               |
| **3xx** (Redirect)      | Il client deve fare un’altra richiesta perché la risorsa si è spostata.          |
| **4xx** (Client Error)  | La richiesta contiene un errore (es. risorsa non trovata, richiesta non valida). |
| **5xx** (Server Error)  | Errore lato server, il server non ha potuto soddisfare la richiesta.             |


## Cookie per stateless HTTP
Sono piccoli file di dati (codici identificativi) che vengono memorizzati nel browser dell'utente e inviati al server nelle richieste HTTP successive.
Servono per risolvere il problema dell'HTTP stateless.

Abbiamo quattro componenti principali
1) una riga di intestazione del messaggio di richiesta HTTP
2) una riga di intestazione del messaggio di risposta HTTP
3) un file cookie mantenuto sul sistema terminale dell'utente e gestito dal browser dell'utente
4) un database sul sito


## Web cache (cash -> Tommy)
È un intermediario tra il client e il server di origine e ha come scopo quello di prendere a carico la richiesta del client e, una volta ottenuta una risposta dal server, la invia al client e la salva per eventuali richieste future.

Ogni risorsa ha un TTL nella cache

##### Web cash proxy
Funge come da client perché invia preventivamente delle richieste al server e le salva, così quando un client richiede quei dati già può riceverli.


## Posta elettronica
Applicazione che simula lo scambio di mail attraverso tre componenti principali
1. User Agent: programma client che consente di scrivere e leggere mail
2. Mail Server: server di posta che gestisce la casella di posta dell'utente
3. SMTP: protocollo di tipo push usato per inviare mail
	- usa TCP

#### Processo
- L'user agent mittente deposita la mail nel proprio mail server
- Il mail server mittente utilizza SMTP per inviar la mail al server del destinatario
- Il destinatario usa il protocollo di recupero (di tipo pull) per leggerla
	- **HTTP** (es. Gmail via browser)
    - **IMAP** (usato da app client)
📌 _SMTP serve per inviare, HTTP/IMAP per ricevere_


## DNS
È un sistema che traduce i nomi di dominio (es. `www.google.com`) digitati dall'utente in indirizzi IP sfruttati dai router.

Ha una struttura NON centralizzata per
- evitare single point of failure
- gestire un traffico elevato
- garantire risposte veloci globalmente
- migliorare la facilità della manutenzione

Inoltre ha una struttura gerarchica formata da
- ***ROOT DNS SERVERS***: tutti quei server principali che contengono informazioni su tutti i Top-Level-Domain (TLD)
- ***TLD SERVERS***: gestiscono i domini di primo livello come `.com`, `.org`
- ***AUTHORITATIVE SERVERS***: ogni dominio di primo livello ha uno o più server che contengono l'IP effettivo per ogni dominio

##### DNSSEC
È un'estensione dell'DNS che garantisce autenticità e integrità dei dati

#### Server Locali e cache
Ogni client si appoggia ad un server locale e quando viene inviata una richiesta
- se la conosce -> risponde
- se non la conosce -> invia una richiesta alla gerarchia (interroga i vari livelli)

##### Interrogazioni (iterative e ricorsive)
- **ITERATIVA**: il DNS locale interroga **TUTTI i livelli** e quando riceve una risposta la salva nella sua cache locale
- **RICORSIVA**: il DNS locale "**chiede tutto**" **a un server DNS** che ricorsivamente si occupa della risoluzione


## Definizione streaming
Video: sequenza di immagini che vengono codificate per ottimizzare il peso generale.
Streaming: sequenza di dati che vengono riprodotte.
### Bit rate
Unità di misura che indica quanti bit vengono inviati al secondo
- Può essere fisso o variabile

Viene usato TCP per evitare perdite  
- con HTTP può essere scelta la qualità scegliendo la determinata risorsa
    
CDN
   - server sparsi nel mondo che hanno stessi contenuti video per rispondere alle eccessive richieste


---

# LIVELLO DI TRASPORTO
## Definizione
Si occupa di consentire la comunicazione tra processi che si trovano su host differenti, tramite protocolli e segmenti.

### Multiplexing e Demultiplexing (il "de" sia con UDP e TCP)
Sono due tecniche che vengono utilizzate per lo **smistamento dei dati** da un host mittente a uno destinatario.

- **MULTIPLEXING**: i messaggi vengono prelevati dai vari processi sull'host mittente e unite in un unico segmento - con delle intestazioni per identificare la provenienza di un dato messaggio
- **DEMULTIPLEXING**: sull'host destinatario il segmento viene ricevuto, vengono osservate le intestazioni e inviati correttamente i messaggi alle socket dei processi destinatari

### Socket passiva sul server
Il server ha una socket passiva su cui riceve le richieste e poi per ognuna crea una socket attiva (dedicata).


## UDP - definizione
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
- STOP-and-WAIT: viene inviato un segmento e il mittente si mette in attesa di una risposta da parte del destinatario
- PIPELINE: vengono inviati in sequenza i segmenti e poi vengono accumulati su una pipe i rispettivi `ACK` nel caso del mittente

### GBN (altro modello teorico)
Protocollo teorico che prevede l'utilizzo di finestre per permettere la gestione di
- segmenti confermati
- segmenti non confermati
- segmenti da inviare

Se, in una sequenza di `N` segmenti, un segmento non viene confermato, il mittente, dopo il timeout, dovrà inviare di nuovo tutti i segmenti a partire da quello che ha causato problemi.

### Ripetizione selettiva (altro modello teorico)
Migliora la limitazione di GBN, permettendo il reinvio del (o dei) pacchetto che ha causato problemi. 
I successivi ad esso verranno memorizzati in un buffer e, una volta colmato il buco, verranno inviati cumulativamente al livello applicativo.

## TCP - definizione
Protocollo di trasporto dati affidabile, basato su
- connessione tra i due host
- correzione di errori

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


### Congestione definizione
La **congestione** è un fenomeno che si verifica quando il **carico di risorse di rete**  **supera la capacità disponibile**, causando 
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


---

# LIVELLO DI RETE
#### Introduzione
Il livello di rete si occupa di trasportare datagrammi da un host mittente a un host destinatario, che possono trovarsi anche su reti differenti.

#### Descrizione protocollo IP
Protocollo fondamentale del livello di rete, che si occupa del vero e proprio instradamento dei datagrammi attraverso una rete di dispositivi.
- È BEST EFFORT -> non offre garanzie su i vari servizi richiesti MA ci prova 

###### Elenco di servizi offerti in generale dalla rete 
- SERVIZI PER SINGOLO DATAGRAMMA
	- consegna garantita
	- consegna con ritardo limitato
	
- SERVIZI PER FLUSSI DI DATAGRAMMI 
	- consegna in ordine
	- banda minima garantita
	- controllo della spaziatura -> i datagrammi arrivano ad intervalli regolari

##### DATAGRAMMA IP
- INTESTAZIONE
	- Indirizzi IP sorgente e destinazione
	- Lunghezza totale del datagramma
	- Protocollo del livello superiore (es. TCP o UDP)
	- Checksum per rilevare gli errori
- Corpo di dati effettivo 

###### FRAMMENTAZIONE DATAGRAMMI
Se il datagramma IP supera l'MTU prestabilita, viene frammentato.
Ogni frammento avrà
- stesso identificatore
- eventualmente un flag per indicare se è l'ultimo del suo datagramma
- offset per indicare dove si inserisce nel datagramma completo

###### RIASSEMBLAGGIO DATAGRAMMI
Viene effettuato nel destinatario e non nei router

###### Path MTU Discovery
L'obiettivo è trovare l'MTU ideale per far sì che un datagramma arrivi a destinazione.

Due modi
1. **ICMP**
	- Il mittente invia un pacchetto con il **bit DF (Don't Fragment)** impostato a **1**.
	- il router, se necessario, scarta il pacchetto e invia un messaggio **ICMP** al destinatario segnalandogli la necessità di reinviare il datagramma e specificando l'MTU massima che può gestire
>[!problem] PROBLEMA: alcuni firewall potrebbero bloccare i messaggi ICMP

2. **Mitigazioni**
	- in fase di handshake viene negoziato il valore del **MSS**

#### Funzioni chiave del livello di rete
##### Inoltro
È un'azione locale eseguita da ogni singolo router per inviare un datagramma da una porta di entrata ad una di uscita.

Due tipi di inoltro
- INOLTRO BASATO SULLA DESTINAZIONE -> usa l'IP e la tabella di inoltro per la porta di uscita
- INOLTRO GENERALIZZATO -> vengono osservati anche altri campi dell'intestazione come tipo servizio, protocollo, ecc.
	Usato su reti più complesse

##### Instradamento
Processo globale che decide quale percorso un singolo datagramma deve seguire nella rete
- vengono utilizzati algoritmi tipo 
	- Dijkstra
	- Distance vector

###### Approfondimento sull'inoltro basato sulla destinazione
>[!question] Come fa un router a trovare correttamente l'IP per selezionare la porta di inoltro?

Bisogna tenere in considerazione che un indirizzo IP è "diviso" in due parti
- Subnet
- Identificativo dell'host
>[!tip] Questo standard di formattazione è detto **CIDR** (es. `192.168.0.0/24`, CIDR usa `/24` per dire che i primi 24 bit sono dedicata alla Subnet, i restanti 8 all'host)
CIDR risolve il problema del classfull addressing, in cui la suddivisione degli indirizzi avveniva per classi (`A`, `B`, `C`, `D`), ma era talmente poco ottimizzato che molti indirizzi IP venivano sprecati 
>- pensa che classe `B` tipo poteva gestire 600 dispositivi -> classe `A` invece 1 milione
>	- capisci bene che se ho bisogno di 601 dispositivi sono costretto a passare alla classe `A` e ho una tabella di inoltro INUTILMENTE grande.

In questo contesto può accadere che più IP siano quasi del tutto simili in termini di bit
- viene effettuata una ricerca della tabella cercando l'indirizzo con la maggiore corrispondenza (più bit meno significativi)

###### TCAM + Priority Encoder
- TCAM è una memoria speciale che permette di trovare la riga con l'IP adeguato in un tempo essenzialmente costante.
	- le viene passato un IP a 32 bit e lei lo confronta per trovare il papabile
	
- Quando ci sono più indirizzi simili, entra in gioco il Priority Encoder che sceglierà quello con la priorità più alta.

#### Le due parti del livello di rete
##### Piano di dati
> È la parte operativa di ogni router

È una funzione locale che decide come inoltrare un datagramma.

##### Piano di controllo
> È la parte che si occupa della logica globale della rete

Decide quali percorsi devono esistere tra origine e destinazione.

#### SDN
Un'architettura dove il piano di controllo non è più nei router ma viene centralizzato in un unico server remoto.

La sua praticità sta nel fatto che
- i router diventano semplici dispositivi "esecutori"
- il controller remoto 
	- riceve le informazioni della rete
	- calcola le tabelle di inoltro e le installa nei router
###### Posizionamento della SDN
- PIANO DI CONTROLLO
- **SDN**
- ROUTER (che in realtà sono switch)

##### Controller SDN
Il controller è il cervello della rete, e ha molteplici funzioni
- Conosce lo stato della rete
- Parla con le app di rete tramite le **API northbound**
- Parta con gli switch SDN tramite le **API southbound**
- È **distribuito**, per migliorare le prestazioni
###### COMPONENTI
1. **Interfaccia verso le applicazioni (northbound API)** -> interfacce che permettono la comunicazione con le applicazioni di rete
2. **Gestione dello stato della rete** -> memoria centrale che funge da database distribuito
3. **Comunicazione con gli switch (southbound API)** -> insieme di protocolli (non vere e proprie API) usate per comunicare con gli switch
	- usa il protocollo OpenFlow

#### Router
Dispositivo della rete che ha il compito di instradare i datagrammi IP.

Si divide in
- Piano di controllo -> via software
- Piano dei dati -> via hardware

#### Struttura di commutazione
È quella componente che permette di instradare i datagrammi da una porta di ingresso a una di uscita

#### Porte di ingresso del router
Sono le interfacce fisiche o logiche mediante le quali i datagrammi arrivano ai router.

L'obiettivo è far sì che ogni porta possa ricevere e processare un datagramma in modo relativamente veloce.

Passi che una porta di ingresso deve seguire
1. **Terminazione di linea** -> riceve i bit "grezzi" che arrivano sul livello fisico
2. **Elaborazione a livello di collegamento** -> interpreta il frame e "decapsula" il datagramma, rimuovendo l'intestazione di livello 2
3. **Ricerca e inoltro** -> guarda i campi del datagramma, e decide la porta corretta inviarlo e quindi lo passa alla struttura di commutazione
4. **Accodamento** -> se i datagrammi arrivano troppo in fretta o se la struttura di commutazione è occupata/lenta, questi vengono messi in coda

#### Porte di uscita
Prendono il datagramma dalla struttura di commutazione e vengono eseguiti i passi inversi alle porte di ingresso.

#### Commutazione centralizzata
Il calcolo della porta di uscita a cui inviare un datagramma viene demandata a una CPU unica del router
#### Commutazione decentralizzata
Ogni porta di ingresso ha una propria CPU.

#### Tre tipi di commutazione
1. **Commutazione in memoria** -> si ha una memoria condivisa tra tutte le porte
	- una porta di ingresso copia il datagramma in memoria e poi questo viene spostato sulla porta di uscita
		- PROBLEMA: lento
2. **Commutazione tramite bus** -> si sfrutta un bus per far spostare il datagramma
	- PROBLEMA: saturazione del bus per trasmissioni parallele
3. **Commutazione tramite rete di interconnessione** -> introduce il parallelismo
	Due approcci
	- MATRICE DI COMMUTAZIONE: letteralmente una matrice (veloce ma costosa e complessa)
	- MULTISTAGE: si usano dei piccoli switch ed è più scalabile

#### Tipologie di accodamento
##### Entrata
Abbiamo un problema di **HOL**
##### Uscita
Potremmo avere dei problemi di buffer pieno e conseguenti scarti 
- gli scarti vengono gestiti tramite delle politiche

Inoltre in uscita sono importanti tutti gli algoritmi di scheduling per la trasmissione di pacchetti.

>[!problem] ATTENZIONE: troppo buffering può essere un problema.
>Potremmo avere il problema del bufferbloat, ossia troppa memoria allocata e quindi un accumulo dei datagrammi -> aumenta l'RTT

#### Gestione del buffer
##### Politica di scarto (drop policy)
1. Tail drop (classico):
	 - viene scartato l'ultimo pacchetto arrivato
	 - È semplice ma non adattivo
2. Priorità:
	- vengono assegnate delle priorità ai pacchetti e viene scartato il meno prioritario
3. Marcatura:
	- prima che il buffer sia pieno, il router segna dei pacchetti per avvisare il mittente di rallentare
	- usa protocolli come **ECN**

##### Algoritmi di schedulazione
1. FCFS:
	- i datagrammi vengono trasmessi nell'ordine di arrivo
>[!problem] PROBLEMA: semplice ma se abbiamo priorità diverse è poco efficiente

2. Con priorità:
	- i datagrammi vengono classificati per classi di priorità
	- viene sempre servita per prima la coda con priorità più alta
>[!problem] PROBLEMA: starvation, i pacchetti a bassa priorità potrebbero non uscire mai

3. Round Robin
	- abbiamo sempre delle priorità
	- vengono servite a turno tutte le code (una per volta)
>[!problem] PROBLEMA: se una classe ha più pacchetti di un'altra, la banda non viene sfruttata al meglio

4. WFQ
	- la banda viene condivisa equamente da ciascuna classe (in base alla capienza delle singole code).


#### Definizione sottorete
Una sottorete è un gruppo di dispositivi che possono comunicare tra loro direttamente senza dover passare per un router (comunicano solo fino al livello di collegamento, non serve livello di rete).

#### DHCP
Protocollo dinamico per assegnare un indirizzo IP ad un host.
È un'alternativa all'assegnazione manuale (statica).

Ogni volta che un host entra in una sottorete, gli viene assegnato un indirizzo IP che può sia tenere che abbandonare (e in questo caso verrà assegnato ad un altro host)
==Il DHCP è collocato nel router e serve tutte le sottoreti a cui è collegato==

##### I quattro step
1. DISCOVER -> Un host invia un messaggio in broadcast a tutti i server della rete
2. OFFER -> Un server DHCP risponde con un IP disponibile
3. REQUEST -> L'host accetta quell'IP informando gli altri server che non hanno più bisogno di rispondere
4. ACK -> Il server conferma a sua volta
##### Opzioni aggiuntive
- Restituisce l'indirizzo del router gateway (first-hop) -> è il dispositivo a cui l'host invia i datagrammi destinati alla rete fuori da quella locale
- Restituisce nome e indirizzo IP del server DNS da usare
- Restituisce la maschera di rete

#### Come ottenere IP pubblici/privati da condividere con la tua rete
L'ISP assegna una porzione del suo spazio IP alla rete.
In pratica
- i primi `/x` bit sono fissi (*CIDR*)
- i restanti possono essere usati per creare
	- sottoreti
	- host

Quindi viene preso il blocco di `n` bit tra quelli "liberi"
- con `n` bit si possono creare $2^{n}$ gruppi di sottoreti
In questo caso, i bit fissi saranno $$x + n$$e i restanti dedicati agli host delle varie sottoreti.

#### Route aggregation
È una tecnica di aggregazione degli indirizzi IP per alleggerire la tabella di instradamento condivisa tra i vari ISP/grandi router

Ogni ISP scrive nella tabella solo il blocco di indirizzi che gestisce (senza specificare ogni singolo indirizzo).

Se un host cambia ISP, i router si ricorderanno la "rotta" vecchia.
In questo caso il nuovo ISP è incaricato di fornire più dettagli per far sì che i router scelgano il nuovo percorso.

#### ICANN (solo per una possibile crocetta)
È un'organizzazione centrale che gestisce gli indirizzi IP a livello mondiale, dividendo in 5 grandi regioni, ognuna con un proprio Registro Regionale (RR).
Ogni RR poi distribuirà personalmente i blocchi IP ai proprio ISP.

#### NAT
>[!tip] CONTESTO: IPv4 ha indirizzi limitati
>C'è bisogno di una soluzione che permetta di poterli sfruttare al meglio

Il NAT una tecnica utilizzata nei router per tradurre gli indirizzi IP privati (usati nella sottorete) in indirizzi IP pubblici (utilizzati in internet), e viceversa.

In questo modo più dispositivi di una rete privata possono condividere un solo indirizzo IP pubblico, così da risparmiare indirizzi IPv4.
###### Router NAT
Sono quei router incaricati della traduzione, e si trovano ai bordi sottorete collegandola con la rete globale.

Quando un datagramma esce dalla rete locale, il router
- sostituisce l'indirizzo IP locale e numeri di porta in quelli pubblici
- salva questa sostituzione in una tabella NAT
Quando arriva una risposta 
- esegue gli stessi passi ma al contrario
	In questo modo la risposta arriverà all'host corretto

#### IPv6
Evoluzione di IPv4, che nasce a causa dell'esaurirsi degli indirizzi IPv4.
Qui gli IP sono lunghi **128 bit** (e non 32).

Cosa manca in IPv6 rispetto a IPv4? 
- **No checkCUM**, meno controllo ma router più veloci 
- **No frammentazione/riassemblaggio**, se il pacchetto è troppo grande, il mittente viene avvisato e lo rimanda più piccolo (*ICMP*)

#### Tunneling e incapsulamento
>[!tip] CONTESTO: non si possono sostituire tutti i vecchi indirizzi IPv4 in IPv6
Si utilizzano quindi delle **reti miste**

Per comunicare in una rete mista si usa il tunneling, ossia
- prendere il datagramma IPv6, **incapsularlo** in un datagramma IPv4 -> in questo modo diventa il payload del datagramma inviato
- una volta superata la rete IPv64, viene **decapsulato** -> ritorna IPv6

#### Tabella dei flussi (o inoltro)
È un insieme di regole che un router usa per decidere cosa fare con un datagramma in base ai valori presenti nei campi dell'intestazione.

Quando si parla di inoltro GENERALIZZATO, viene sfruttato il concetto di ***Match+Action***
- MATCH -> il router guarda l'intestazione del pacchetto alla ricerca di valori specifici
	ricorda che vengono cercati altri valori, non solo l'IP
- ACTION -> esegui un'azione
	- inoltra
	- scarta
	- modifica
	- invia al controller (se si usa SDN)

>[!problem] ATTENZIONE: ci potrebbero essere casi in cui si hanno
>- MATCH identici
>- ACTION differenti

>[!example] SOLUZIONE: viene aggiunto un campo priorità assegnata a ogni singola riga della tabella

#### OpenFlow
È uno standard usato nelle reti **SDN**.
È un protocollo che serve per far comunicare i router/switch al controller centrale, implementato ovviamente in tutti e 3.

Nel contesto di OpenFLow, la tabella di inoltro ha 4 righe principali:
- MATCH
	I campi sono divisi per livello
	- Collegamento -> per decidere cosa fare dentro una rete locale
	- Rete -> per muoversi su diverse reti, serve ai router per inoltrare verso la destinazione corretta
	- Trasporto -> per capire quale applicazione ha generato il messaggio
- ACTION
- PRIORITÀ
- CONTATORI -> contano quanti pacchetti/byte hanno usato una certa regola, con timestamp;

#### Load Balancing
Il **load balancing** è una tecnica di **inoltro avanzato** che permette di **distribuire il carico di traffico in uscita su più porte**, anziché usare sempre la stessa.

📌 Questo è utile **quando molti datagrammi hanno la stessa destinazione IP**: invece di inoltrarli tutti sulla **stessa interfaccia**, il router può **bilanciarli su più uscite** per ottimizzare l’utilizzo delle risorse di rete.

#### Middlebox
Tutti i dispositivi che si trovano sulla rete MA che non sono router/switch.
E sono
- Firewall
- Server DHCP
- Server DNS
- ecc...


#### Algoritmi di instradamento
Sono algoritmi utilizzati per trovare il percorso migliore che un datagramma deve percorrere per arrivare da una sorgente a una destinazione.
	Questo percorso viene poi suddiviso per essere inserito nelle tabelle di inoltro.

Vengono classificati in base a due criteri
1. Informazione usata
	- Globali: il calcolo è centralizzato e ogni router ha una mappa completa della rete
	- Decentralizzati: ogni router inizialmente so solo i costi verso i suoi vicini e con le varie iterazioni scopre i costi globali
	
2. Quanto spesso cambiano i percorsi
	- Statici: cambiano raramente
	- Dinamici: cambiano spesso

Ci sono poi due tipologie di algoritmi
- FLESSIBILI AL CARICO: cambiano a seconda dello stato della rete
- INSENSIBILI AL CARICO: non cambiano

##### Algoritmo link-state: Dijkstra
È un algoritmo per trovare il cammino minimo dal nodo `u` verso tutti gli altri nodi della rete. 

Ogni router conosce 
- tutti gli altri router e i collegamenti tra loro 
- e sa anche il costo di ogni collegamento. 

##### Algoritmo distance vector
Si basa sull’equazione di **Bellman-Ford** e funziona così:
> ogni router sa quanto costa raggiungere le **reti vicine**, e **scambia informazioni con i router vicini** per scoprire nuovi percorsi.

Nel tempo, ogni router costruisce una tabella che indica:
- la **distanza** verso ogni rete
- e **da quale router passare** per raggiungerla nel modo più economico.


#### Definizione AS
Strategia adottata per gestire in modo scalabile l'instradamento su internet, consiste nel suddividere l'intera rete in **sistemi autonomi** (*AS*).

Un sistema autonomo è un insieme di router che appartengono alla stessa amministrazione e sono sotto il controllo di un'unica entità.

##### Inter e Intra AS
Sono le due tipologie di instradamento.
1) ***INTRA AS***, routing dentro un singolo AS -> riguarda il protocollo che tutti i router dello stesso AS usano per comunicare tra di loro.
	NOTA: AS diversi possono utilizzare protocolli diversi e per questo esistono i **router gateway**, ossia router che si trovano ai **confini dell'AS** e che permettono la comunicazione tra AS diversi.
	
2) ***INTER (merda) AS***, routing tra AS diversi -> riguarda la comunicazione tra AS differenti ed è gestito dai router gateway

#### OSPF (protocollo INTRA AS)
È un **protocollo di routing interno** (IGP) basato su **link-state**, che permette ai router di **scambiarsi informazioni sulla rete** e di calcolare i percorsi più brevi usando l’**algoritmo di Dijkstra**.

OSPF ha una gerarchia a due livelli
![[GetImage - 2025-05-02T143722.424.png]]
- **AREA LOCALE** -> un sottoinsieme dell'AS
	L'AS viene suddiviso in aree, autonome
- **BACKBONE (dorsale)** -> abbiamo due componenti principali
	- Router di dorsale -> collega tutte le aree tra di loro
	- Router di confine -> collega l'intero AS ad altri AS

###### Estensioni associate a OSPF
Per reti senza SDN viene usato OSPF, permettendo di scambiare informazioni utili per effettuare instradamenti corretti senza uso di SDN
- MPLS-TE protocollo che consente di evitare congestione

#### BGP (protocollo INTER AS)
È il **protocollo standard per l'instradamento inter-domain**, e permette ai vari AS di comunicare tra loro.

BGP fornisce a ciascun AS un mezzo per
- eBGP -> Ricevere info dagli AS vicini per conoscere quali reti sono raggiungibili attraverso loro
- Policy e decisioni -> scegliere quali rotte usare per raggiungere altre reti
- iBGP -> Diffondere le informazioni ricevute da eBGP ai propri router
- Annunci -> Informare gli altri AS su quali reti sono raggiungibili attraverso questo AS

>[!tip]- Breve parentesi sugli annunci  
>Un annuncio è l'azione che ogni AS può eseguire per segnalare nuove rotte (tramite un messaggio UPDATE).
Nel mondo reale, gli AS cercano di **minimizzare il traffico all’interno della propria rete** e **non vogliono fungere da "ponte" tra altri AS**.  
Per questo motivo, **spesso non annunciano a tutti gli altri AS tutte le rotte che conoscono**. In particolare:
>- **Non sempre annunciano** che tramite loro è possibile raggiungere una certa destinazione;
>- **Limitano le informazioni** per evitare che il traffico passi da loro solo per "transito".
>
👉 In pratica, **un AS preferisce non farsi carico del traffico altrui**, soprattutto se non ne trae vantaggi economici o strategici.

##### Sessione BGP
È una **connessione TCP** tra **due router gateway BGP** (detti ***peers***) e serve per scambiarsi informazioni sui percorsi. 
###### Messaggi del protocollo BGP scambiati dai peers
- OPEN -> serve per iniziare una connessione tra due peer
- UPDATE (il più importante) -> serve per annunciare o ritirare dei percorsi
- KEEPALIVE -> serve per mantenere viva una connessione quando non ci sono UPDATE da inviare
- NOTIFICATION -> indica che c'è stato un errore

##### Rotte in BGP
Una rotta è un'informazione che un router BGP invia per comunicare la raggiungibilità di una certa rete.

La rotta consiste in
1. PREFISSO  -> rappresenta la rete di destinazione
2. ATTRIBUTI -> che descrivono le caratteristiche del percorso (es. costo, provenienza, priorità)

Quando un router riceve una rotta, applica delle politiche interne per decidere cosa farne
- IMPORT POLICY -> decide se accettare o rifiutare una rotta ricevuta
- EXPORT POLICY -> decide quali rotte annunciare ai vicini

##### Annunci di percorso
1. Un router di confine annuncia a un AS esterno che può raggiungere un certo prefisso, includendo 
	- il NEXT-HOP -> IP da usare per raggiungerlo
	- AS-PATH -> lista di AS attraversati
2. Questa rotta viene diffusa a tutti i router dell'AS
3. Eventualmente il router può riannunciare la rotta a un altro AS vicino
	- modificando l'AS-PATH
	- indicando sé stesso come NEXT-HOP

>[!tip] ANNUNCI CON PERCORSI MULTIPLI
>Quando un router riceve più rotte per la stessa destinazione, utilizza le policy locali per scegliere la migliore (non per forza la più breve).

#### Tipologie di instradamento
##### 🚫 Next-hop non modificato (default)
Se il router **non modifica il next-hop**, l’annuncio mantiene l’indirizzo del router esterno da cui è arrivato.  
In questo caso, i router interni devono **sapere come raggiungere direttamente quel next-hop esterno**, rendendo la configurazione **più complessa e meno robusta**.

##### 🔁 Next-hop modificato (next-hop-self)
Quando un router di confine riceve un annuncio BGP da un AS esterno, **sostituisce il next-hop con il proprio indirizzo** prima di inoltrarlo ai router interni.  
Questo semplifica l'instradamento: i router interni devono solo sapere **come raggiungere il router di confine**, senza preoccuparsi di indirizzi esterni.

##### Instradamento a patata bollente
È una strategia di instradamento INTRA-AS in cui ogni router cerca di liberarsi il prima possibile del traffico, passandolo al primo gateway disponibile verso un altro AS (anche se non è il percorso più corto)

In questa strategia, un router interno, una volta ottenuto un datagramma destinato a un AS esterno, cerca il router gateway più vicino (non quello che porterebbe al percorso migliore).

>[!example] PRO: viene ridotto il traffico interno al singolo AS -> viene minimizzato l'uso della singola rete

>[!problem] CONTRO: Il datagramma potrebbe eseguire un percorso più lungo -> aumento della latenza globale
>

##### IP ANYCAST
IP Anycast è una tecnica in cui **più server condividono lo stesso indirizzo IP**, e il traffico viene instradato automaticamente verso il server più vicino secondo le regole di routing, senza che il client sappia quale server lo sta effettivamente servendo.
	ES. io mi collego a YT automaticamente scegliendo il server più vicino

##### Ingegneria del traffico
L’ingegneria del traffico è l’insieme di tecniche per controllare e ottimizzare il flusso dei dati in rete, evitando congestioni, bilanciando il carico e sfruttando al meglio le risorse — soprattutto grazie alla flessibilità introdotta dalle reti SDN.


#### IBN
È un sistema dichiarativo che funziona attraverso "**intenti**" per modificare la struttura della rete in modo automatizzato.
	ES. voglio ridurre la latenza tra due router -> spiego l'intento e questi verranno configurati.

Queste cose vengono modificate dal controller SDN, in particolare dal controller ***ONOS***.


#### ICMP
È un protocollo incapsulato in IP, utilizzato per la comunicazione all'interno del livello di rete.
##### Struttura messaggio ICMP
- INTESTAZIONE
	- TIPO
	- CODICE
	- CHECKSUM
- DATI

##### Messaggi più importanti
1. **Echo Request + Echo Reply (Tipo 8/0 e 0/0)** -> permette di sapere se un host è raggiungibile e misurare l'RTT
2. **Destination Unreachable (Tipo 3)** -> utilizzato per identificare host non raggiungibili
3. **Source Quench (Tipo 4)** -> permetteva di segnalare congestione (ora deprecato)
4. **TTL Expired (Tipo 11)** -> usato per il traceroute, usato per segnalare quando il TTL arriva a 0
	Generalmente il TTL viene decrementato di 1 ad ogni hop (router)
##### Traceroute
È uno strumento diagnostico che usa pacchetti con **TTL crescente** e risposte **ICMP** per determinare il percorso e i tempi di attraversamento dei router tra una sorgente e una destinazione.  
Con **IPv6**, utilizza **ICMPv6**, che ridefinisce alcuni messaggi di errore.

#### Componenti che gestiscono la rete
Per gestire adeguatamente una rete, si ha bisogno di
- **SERVER DI GESTIONE** -> raccoglie, elabora e analizza le informazioni inviati dai dispositivi
- **DISPOSITIVI** -> switch, router, server, ecc.
- **DATI** -> rappresentano gli "stati" del dispositivo
- **AGENTE DI GESTIONE** -> software installato nel dispositivo
- **PROTOCOLLO DI GESTIONE DI RETE**  -> serve a scambiare informazioni tra i server e i dispositivi gestiti

#### Metodi per gestire una rete
Abbiamo diversi modi:
1. **CLI (Command Line Interface)** 
	È il metodo diretto e classico, in cui un operatore si collega al dispositivo e scrive i comandi che questo deve eseguire.
	
	È un metodo diretto ma non scalabile, anche se prevede uso di eventuali script automatizzati.

2. **SNMP / MIB** 
	SNMP -> protocollo per gestire e monitorare i dispositivi della rete (funziona anche su connessioni SSH)
	MIB -> un database di oggetti gestibili (si  trova nei singoli router)
	
	Si ha un'astrazione maggiore e quindi non bisogna occuparsi singolarmente di ogni router, MA l'operatore deve comunque scrivere dei comandi e non è automatizzato.
	

3. **NETCONF / YANG** 
	NETCONF -> protocollo per comunicare azioni/dati compatibili con YANG a dispositivi remoti
	YAML -> linguaggio di modellazione dati
	
	È un approccio più moderno e astratto, usato per configurare i dispositivi in modo centralizzato.
	Posso usare NETCONF



---

# LIVELLO DI COLLEGAMENTO
### Definizione
Livello che si occupa di trasferire i datagrammi incapsulati in un **frame** da un *nodo* a quello fisico più adiacente lungo un collegamento diretto
> Il livello di collegamento non si occupa di tratte lunghe, ma solo del **tratto locale tra due dispositivi fisicamente vicini**.

>[!tip] NODO = qualsiasi entità connessa alla rete: host, router, switch, ecc.

##### Collegamenti multipli = Protocolli diversi
I link fisici attraversati da un frame possono essere di diverse tipologie, come
- **Wi-Fi** 
- **Ethernet**
- **Fibra**
E questo implica che i **protocolli utilizzati** e i **servizi offerti** siano anch'essi **differenti**

### Servizi offerti dal livello di collegamento
1. **FRAMING** -> incapsulamento del datagramma (proveniente dal livello di rete) in un'unità di trasmissione a livello 2.
	Ogni frame ha
	- **intestazione (header)** -> contiene, ad esempio, indirizzi MAC
	- **coda (trailer)** -> può includere un checksum o un codice CRC per controllo di errori
	
2. **ACCESSO AL COLLEGAMENTO** -> serve a controllare **chi può utilizzare il mezzo trasmissivo** in un dato momento.
	Viene utilizzato un **protocollo MAC** che  viene gestito tramite **indirizzi MAC**, i quali indentificano **mittente e destinatario locali**
	SONO STATICI RISPETTO AGLI INDIRIZZI IP DEL LIVELLO DI RETE.
	
3. **CONSEGNA AFFIDABILE TRA NODI ADIACENTI** -> il livello di collegamento può **rilevare o correggere errori**
	L'idea è correggere gli errori tra nodi vicini e non lasciare tutto il lavoro (magari anche accumulato) al livello di trasporto.
	
4. **CONTROLLO DI FLUSSO** -> serve per **coordinare la velocità di trasmissione** tra mittente e ricevente adiacenti
	Se uno lavora più velocemente dell'altro, non va bene.
	
5. **RILEVAZIONE E CORREZIONE DI ERRORI** -> I dati su un collegamento possono essere alterati in vario modo e quindi si dà la possibilità al ricevente di **rilevare e/o correggere** questi errori
	Due strategie principali:
	1. **ARQ (Automatic Repeat reQuest)** -> se rivela l'errore chiede **la ritrasmissione**
	2. **FEC (Forward Error Correction)** -> tramite dei bit extra può **correggere** gli errori
	
6. **HALF-DUPLEX vs FULL-DUPLEX**
	![[Pasted image 20250508223000.png]]


## NIC (Scheda di rete)
Componente hardware in cui è presente il livello di collegamento in un host.

La scheda di rete implementa
1. **Livello fisico** -> converte i bit in segnali elettrici o radio
2. Livello di collegamento -> costruisce e interpreta **frame**, applica MAC, rileva errori...

### Lato mittente e ricevente nel livello di collegamento
- **MITTENTE**
	- Riceve il **datagramma IP**
	- Lo incapsula in un **frame** aggiungendo
		- header
		- bit di controllo (per gli errori)
	- Passa il frame al **livello fisico** 
	
- **RICEVENTE**
	- Riceve il **segnale fisico**
	- Lo converte in **frame**
		- Verifica se ci sono errori -> se abilitato ritrasmette/corregge
	- Decapsula il **datagramma**
	- Lo consegna al livello di rete


## Rilevamento errori
Per rilevare gli errori si usano tecniche come l'utilizzo di un codice **EDC**.
Questo codice viene aggiunto ai dati `D` che vogliamo inviare ed è generato tramite una funzione applicata sui dati `D`.
	Una volta generato viene inviato al destinatario.

Il destinatario riceve tutte queste informazioni e applica di nuovo la funzione
- se EDC corrisponde -> no errori
- se EDC non corrisponde -> errori

>[!problem] PROBLEMI: Non affidabile al 100% e Overhead.

### Tecniche di rilevamento degli errori
##### Bit di parità
OBIETTIVO: prendere i dati in bit e viene aggiunto un bit (a `1`) per rendere il numero di bit TOTALI pari
	Se sono dispari = errore

>[!problem] PROBLEMA: se ottengo un numero pari MA HO PERSO DEI DATI non vengono rilevati errori.

##### Checksum
Tecnica usata per **rilevare errori nei frame** trasmessi su un collegamento.
📌 A livello di collegamento (es. Ethernet), il checksum viene:
- **calcolato dal mittente** sui dati del frame
- **inserito nell’intestazione**
- **ricontrollato dal destinatario** al ricevimento

>[!tip]- Approfondimento sul checksum
>- LATO MITTENTE: vengono presi i bit del segmento, vengono divisi in gruppi e sommati, successivamente viene effettuato il complemento a uno del risultato e poi inserito nell'intestazione
>- LATO RICEVENTE: viene ricalcolato di nuovo
>	- se il risultato contiene tutti `1` -> nessun errore
>	- se c'è anche solo uno `0` -> errore e ritrasmissione

##### CRC
Il **CRC** è un metodo avanzato per **rilevare errori nei dati** trasmessi su un collegamento fisico.

📌 Funziona così:
- Il **mittente** tratta i dati come una lunga sequenza di bit e li **divide per un polinomio binario predefinito**.
- Il **resto della divisione** (detto CRC) viene **allegato al frame**.
- Il **destinatario** rifà la stessa divisione:
    - Se il resto è **zero**, i dati sono **probabilmente corretti**.
    - Altrimenti, c’è stato un **errore** nella trasmissione.


## Tipologie di collegamento
- **PUNTO A PUNTO** -> un mittente e un ricevente
- **BROADCAST** -> più nodi e ciascuno di questa riceve il frame condiviso

Quando abbiamo più dispositivi che usano lo stesso canale per trasmettere c'è il rischio di **collisione**, e c'è bisogno di un **protocollo di accesso multiplo** che possa gestirla

Il protocollo ideale sarebbe il *MAC*, ossia
- se un solo nodo deve trasmettere -> usa tutta la banda
- se più nodi trasmettono -> la banda viene suddivisa
- non ci sono nodi speciali che coordinano il tutto
- il meccanismo di base sia semplice

#### Classificazione dei PAM
1. **A suddivisione del canale** -> il canale viene suddiviso in "pezzi" più piccoli e ogni nodo ottiene un suo "pezzo" per trasmettere
2. **Accesso casuale** -> il canale non è diviso e ognuno accede in qualsiasi momento
	Ci possono essere **collisioni** che vanno gestite
3. **A rotazione** -> ogni nodo trasmette in un dato turno

## Protocolli a suddivisione del canale
#### TDMA (a tempo)
L'obiettivo è **eliminare le collisioni** e garantire che ciascun nodo abbia un **accesso regolare** e prevedibile al canale.

FUNZIONAMENTO
1. Il tempo è diviso in "frame temporali"
2. Ogni frame è suddiviso in `N` slot temporali 
	- `N` = numero nodi
3. In ogni slot, solo il nodo a cui è stato assegnato può trasmettere

>[!problem] PROBLEMA: Se un nodo non usa il suo slot, quello rimane inutilizzato.

#### FDMA (a frequenza)
L'obiettivo è consentire **trasmissioni simultanee**

FUNZIONAMENTO
1. Ogni nodo ha la sua **banda dedicata** 
2. I nodi possono trasmettere in **qualsiasi momento** MA SOLO NELLA PROPRIA BANDA

>[!problem] PROBLEMA: Se un nodo non ha dati da inviare, la sua banda resta sprecata


>[!tip] NOTA: in entrambi i casi la velocità è $\frac N R$ 


## Protocolli ad accesso casuale
Ogni nodo può inviare un pacchetto in qualunque istante -> c'è bisogno di un modo per rilevare e correggere le collisioni.

#### SLOTTED ALOHA
Il tempo è **suddiviso in slot regolari**
- Se un nodo ha un frame da inviare -> deve aspettare il prossimo slot

- Se più nodi trasmettono nello stesso slot -> collisione -> i pacchetti vengono persi
- Se non c'è collisione -> il pacchetto arriva correttamente.

Dopo una collisione, i nodi **non ritrasmettono subito** ma ritrasmettono con una certa probabilità `p` in uno degli slot successivi.

#### UNSLOTTED ALOHA
Non abbiamo una suddivisione del tempo in slot ma
- Il nodo trasmette non appena ha un frame disponibile
- Se c'è **collisione** -> **aspetta un tempo casuale** e ritrasmette con una probabilità `p`


## Accesso multiplo con rilevamento della portante
#### CSMA
Ogni nodo prima di trasmettere, "**ascolta**" il canale per vedere se qualcun altro sta già trasmettendo
- Se il canale è libero -> trasmette
- Se non è libero -> aspetta e riprova dopo

#### CSMA/CD
È un''estensione di CSMA che aggiunge ad ogni nodo la **capacità di rilevare collisioni**

In pratica
- un nodo trasmette ma **continua ad ascoltare**
- se si accorge che un altro nodo ha iniziato a trasmettere in contemporanea -> si accorge della collisione 
	- invia un messaggio broadcast per segnalare la collisione
- TUTTI i nodi coinvolti interrompono la trasmissione
	- aspettano un **tempo casuale** e poi riprovano a trasmettere


>[!warning] ATTENZIONE: le collisioni con CSMA sono ancora possibili a causa del **ritardo di propagazone**.


## Protocolli a rotazione
Cercano di prendere il meglio di **CSMA** E **TDMA**
- **efficienza di CSMA** a basso traffico
- **ordine e equità di TDMA** ad alto traffico

#### POLLING
Un **controllore centrale** (master) gestisce l'accesso al canale.
I nodi non trasmettono autonomamente ma **aspettano di essere invitati**.

Il controllore invia un **segnale di "poll"** al nodo client per permettergli di trasmettere
- e questo segnale poi viene trasmesso agli altri nodi a "rotazione".

>[!example] VANTAGGI: Nessuna collisione e accesso ordinato

>[!problem] PROBLEMI: Overhead e ritardo del segnale di poll + punto singolo di guasto

#### TOKEN PASSING
I nodi della rete si passano un **gettone virtuale (token)** e solo chi lo ha può trasmettere.

>[!example] VANTAGGI: Nessuna collisione e accesso ordinato

>[!problem] PROBLEMI: Overhead del token, latenza generale,  punto singolo di rottura (il token)


## Rete di accesso via cavo
- **DOWNSTREAM** -> viene utilizzato **FDM** in broadcast
- **UPSTREAM** -> viene utilizzato **accesso casuale**

##### DOCSIS
È lo standard che regola la trasmissione dei dati su rete via cavo.


## LAN
Una LAN è una **rete locale**, ossia una rete che copre un'area geografica limitata (es. casa, scuola, ufficio).

Le due tecnologie principali sono 
- **Ethernet**
- **WiFi**

## Indirizzi IP vs MAC
Gli **indirizzi IP sono indirizzi logici**, usati a livello di rete e servono per instradare un datagramma da una rete all'altra. 

Gli **indirizzi MAC sono usati a livello locale**, cioè dentro una LAN, e vengono usati SOLO se i dispositivi sono sulla **stessa sottorete**.

>[!tip] Nota importante
>Il MAC **non cambia mai**: è scritto direttamente nell'hardware della scheda di rete (NIC).

Struttura:
- Hanno una lunghezza di **48 bit**
- Di solito sono rappresentati in **esadecimale** e divisi in 6 gruppi (ognuno da due lettere).

>[!tip] ALTRA DIFFERENZA IMPORTANTE TRA **IP** E **MAC**
>Un indirizzo MAC è **piatto**, ossia **non ha una struttura gerarchica**
>- puoi spostare la scheda da una rete all'altra ma il suo MAC non cambia
>
Un indiritto IP è **gerarchico**, cioè **dipende dalla sotterete**
>- se cambio rete, devo cambiare anche IP, altrimenti non sarei raggiungibile o compatibile con la rete.

#### Come vengono assegnati i MAC
L'allocazione è gestita dall'IEEE
- l'IEEE assegna blocchi di indirizzi MAC ai produttori di schede di rete 
- e ogni produttore assegna MAC non duplicati alle proprie interfacce

## ARP
Protocollo che permette di trovare, da un indirizzo IP, l'indirizzo MAC associato.

FUNZIONAMENTO
- ogni host sulla rete ha una **tabella ARP**, che contiene **associazioni IP -> MAC** (una riga della tabella)
- ogni riga ha poi anche un **TTL**, che una volta scaduto fa rimuovere la riga
	- questo è utile per non avere tabelle troppo grandi

>[!tip]- ESERCIZIO SU ARP utile per la teoria
>![[Pasted image 20250710194208.png]]
>1. Cerchia tutti i dispositivi (in gruppo) tranne router e host 
>	- se hai un router collegato ad un host cerchia il collegamento tra i due
>	![[Pasted image 20250710194553.png]]
>2. Vengono scambiati 
>	- `ARP request` da H1 -> in broadcast, tutti gli altri host della sottorete la ricevono
>		- i commutatori della sottorete ricevono il messaggio e poi inviano di nuovo in broadcast (tranne verso il collegamento da cui è arrivato il frame)
>	- `ARP reply` da H3
>	- le informazioni vengono salvate in tutti di dispositivi della sottorete
>3. No, perché appartiene a una sottorete diversa
>	- il router non inoltra il frame broadcast (di livello 2) perché è un commutatore di pacchetti di livello 3.


#### ARP SPOOGING
Il problema del protocollo ARP è il fatto che sia **stateless**, ossia accetta qualsiasi **ARP reply** anche senza aver fatto prima una **ARP request**.

Questo lo rende particolarmente vulnerabile ad attacchi quali
- **Dos** - Denial of Service
- **MITM** - Man in the Middle

## Come inviare un datagramma a un nodo esterno alla rete
1. **Verifica della destinazione** -> se il destinatario si trova in un'altra sottorete, il frame va instradato tramite un router gateway
2. **Creazione del datagramma IP + Incapsulamento in un frame** -> i vari IP (sorgente e destinatario), i vari MAC (sorgente e destinatario) e il MAC del router si ottiene tramite ARP
3. **Ricezione e analisi da parte del router** -> il router riceve il frame, estrare il datagramma e si accorge che l'IP di destinazione non è il suo
4. **Instradamento verso la rete di destinazione** -> il router incapsula di nuovo il datagramma e spedisce il frame alla giusta interfaccia (porta che si collega ad un altro switch) e quindi poi al giusto destinatario

## Ethernet
**Ethernet** è uno standard di comunicazione a livello **fisico**, utilizzato per collegare dispositivi in una **rete locale (LAN)**.
#### Struttura frame
Un frame Ethernet è l'**unità base di trasmissione** a livello 2 e il suo compito è trasportare un datagramma IP (incapsulato in un frame) da una macchina all'altra entro la stessa rete locale.

COMPOSIZIONE
- **PREAMBOLO**
- **INDIRIZZO SORGENTE**
- **INDIRIZZO DESTINAZIONE**
- **TIPO**
- **DATI/PAYLOAD**
- **CRC**
#### Inaffidabilità
Ethernet è inaffidabile perché 
- è un modello **connectionless** come UDP (no handshake)
- il ricevente non invia né **ACK** né **NAK**
#### Gestire le collisioni
Il dominio di collisione è l'area di rete dove i frame inviati da due o più dispositivi possono collidere (quindi un area condivisa).

Ethernet usa il protocollo **CSMA/CD** per gestire le collisioni.

#### Switch Ethernet
È un **commutatore di pacchetti** che lavora a livello di collegamento e gestisce i frame Ethernet.
Utilizza la tecnica dello `store-and-forward`, ossia
- riceve il frame
- lo memorizza temporaneamente
- lo analizza
- lo inoltra sulla porta corretta in base al MAC di destinazione
###### Tabella di commutazione degli switch
Ogni switch mantiene una **tabella di commutazione**, che contiene per ogni voce
- **indirizzo MAC** di destinazione
- **interfaccia** dello switch da cui quel MAC è raggiungibile
- un **timestamp** per tenere aggiornate le informazioni

Questa tabella è costruita in modo AUTOMATICO grazie alla capacità di **autoapprendimento** degli switch
- Quando riceve un frame Ethernet da un host, legge il **MAC sorgente** e la **porta di ingresso**
- Aggiunge una voce nella tabella: “MAC X → è raggiungibile da porta Y”
- Quando riceve un frame **destinato a quel MAC**, lo inoltra **solo sulla porta giusta**
⏱️ Il **timestamp** serve a eliminare le voci vecchie dopo un po' di tempo di inattività.
#### Differenza tra router e switch
- **Switch**: collega dispositivi **nella stessa rete locale (LAN)**. Lavora a **livello 2 (collegamento dati)** e inoltra i dati in base agli **indirizzi MAC**.
- **Router**: collega **reti diverse** (es. LAN e Internet). Lavora a **livello 3 (rete)** e instrada i pacchetti in base agli **indirizzi IP**.

👉 In breve: **lo switch unisce dispositivi nella stessa rete**, il **router collega reti diverse tra loro**.

## Virtual LAN (VLAN)
È una rete di area locale virtuale che permette di suddividere **una rete fisica in più reti logiche**, garantendo performance elevate e sicurezza.

È utile per evitare che una rete locale cresca troppo e rendere complicato gestire messaggi in broadcast.
#### Tipologie
1. **VLAN basate sulle porte** -> ogni porta dello switch è assegnata a una VLAN
	I dispositivi di VLAN diverse non possono comunicare direttamente -> più sicurezza e isolamento
	
2. **VLAN su più switch** -> viene utilizzata una **porta trunk**, ossia un unico collegamento tra due switch che può trasportare frame **di tutte le VLAN**

#### Formato 802.1Q
Le VLAN hanno un loro ID per comunicare e riconoscersi
- quest'ultimo é definito dallo standard 802.1Q

#### EPVN
Le VLAN tradizionali si basano sulla connessione diretta tra switch,  EVPN permette di collegare logicamente gli switch di livello 2 attraverso una rete di livello 3 (una rete IP, l'internet, una WAN) definita come **underlay**. 
Si avvale della funzione di tunneling con la quale i frame Ethernet vengono incapsulati e inviati attraverso una rete IP, ignorando la complessità intermedia.


## Rete wireless
Una **rete wireless** è un tipo di rete di comunicazione che permette la connessione tra dispositivi senza l’uso di cavi, sfruttando segnali radio o a infrarossi.

#### Componenti di una rete wireless
1. **HOST WIRELESS** -> host che si collegano alla rete senza fili (Laptop, Smartphone, ecc.)
2. **COLLEGAMENTO WIRELESS** -> il mezzo di comunicazione tra un host e una stazione base, oppure tra due host
	Prevede un **protocollo di accesso multiplo** per evitare collisioni
3. **STAZIONE BASE** -> l'elemento chiave dell'infrastruttura wireless, funziona come **ripetitore (relay)**, riceve i pacchetti e li inoltra
	Un esempio è l'**Access point (AP)**

Quando un host si sposta **da una stazione base a un'altra**, entra in gioco il meccanismo di **handoff**ossia il punto di connessione cambia, ma la connessione resta attiva.

>[!tip] Esistono anche le **Reti ad Hoc**, caratterizzate dall'assenza di stazioni base (il tutto è demandato ai singoli host).


#### Caratteristiche dei collegamenti wireless
1. **ATTENUAZIONE** -> perdita di potenza del segnale
	Due cause principali
	1. Attenuazione per ostacoli 
	2. Attenuazione nello spazio libero -> a causa della dispersione del segnale.

2. **PROPAGAZIONE SU PIÙ CAMMINI** -> un segnale che viaggia tra un trasmettitore a un ricevitore non prende un percorso diretto
	Parte del segnale
	- arriva in linea retta
	- altra invece si riflette su edifici, oggetti in generale e arriva con un percorso più lungo
	Il ricevitore riceve quindi più versioni dello stesso segnale e usa il **tempo di coerenza**, ossia l'<u>intervallo di tempo</u> entro cui un bit trasmesso è considerato "valido".

3. **SNR e BER** -> due parametri che servono per valutare l'affidabilità e la qualità di un collegamento wireless
	- **SNR - Signal-to-Noise Ratio** -> indica il rapporto tra **potenza del segnale utile** e il **rumore di fondo**
		- SNR alto = comunicazione più affidabile
	- **BER - Bit Error Rate** -> indica il **tasso di errore sui bit**, ossia la probabilità che un bit venga **ricevuto in modo errato**. 

>[!tip] Bilanciamento di SNR e BER
>**Aumentare la potenza di trasmissione** migliora l’SNR (rapporto segnale/rumore), riducendo gli errori (BER). Tuttavia, consuma più energia e può causare interferenze.  
Schemi di modulazione più veloci (come QAM256) trasmettono più dati ma sono più sensibili agli errori.  
Per questo, si usa **modulazione adattiva**: il dispositivo cambia schema in base allo SNR, migliorando efficienza e affidabilità.

4. **TERMINALI NASCOSTI** -> sono nodi che non riescono a rilevare le trasmissioni di altri nodi perché si trovano fuori dalla loro portata, tuttavia possono comunque interferire con la comunicazione inviando dati nello stesso momento, causando collisioni.


## Accesso multiplo a divisione di colore (CDMA)
Protocollo che permette **a più utenti di accedere e utilizzare lo stesso mezzo di comunicazione** senza causare collisioni.
Ogni utente ha dei codici univoci che servono per codificare i dati inviati e evitare che si "mescolino" con gli altri.


## Standard 802.11 (WiFi)
Rappresenta un insieme di protocolli che consente la comunicazione wireless tra più dispositivi.

Un **BSS (Basic Service Set)** è l'unità di base della rete WiFi in modalità infrastruttura e comprende
- un gruppo di **host wireless**
- un **access point**

#### 802.11: Canali
Lo **spettro di frequenze** usato dal WiFi è diviso in **canali**, ciascuno centrato su una frequenza.
Molti di questi canali però si sovrappongono e quindi l'**amministratore di rete** deve scegliere quale canale usare per il punto di accesso (AP).

#### 802.11: associazione
Un host per associarsi a un AP deve
- scansionare gli AP vicini prendendo i vari **frame beacon**, ossia quei frame che mandano periodicamente gli AP per farsi rilevare
- l'host ne sceglie uno e vi accede
- una volta associato, l'host invia un messaggio **DHCP discover** per ottenere un indirizzo IP.
	- l'AP inoltra questo messaggio nella sottorete.
###### Due tipi di scansione
- PASSIVA: gli AP inviano i frame beacon per rintracciare i dispositivi
- ATTIVA: il tuo dispositivo invia un frame sonda in broadcast per rintracciare i possibili AP.

#### Evitare collisioni
Nel WiFi non si possono **rilevare collisioni**, si usa quindi una tecnica **per evitarle**, chiamata **CSMA/CA (*congestion avoidance*)**.
Funziona così
1. L'host **ascolta il canale** -> se è libero per un certo tempo (***DIFS***), trasmette
2. Se il canale è occupato -> parte un **backoff casuale** 
3. Il backoff scende solo quando il canale è **libero** -> quando arriva a 0, trasmette
4. Se dopo una trasmissione riceve l'**ACK** (dopo un tempo chiamato ***SIFS***)-> tutto ok
	- se non lo riceve -> ripete con un backoff più lungo

#### Meccanismo di prenotazione
Per prenotare il canale, un host invia un **RTS** all'AP e successivamente l'AP invia un segnale di tipo **CTS** a tutti i nodi per far rimandare eventuali trasmissioni.


## Bluetooth
È una tecnologia pensata per collegamenti a **breve raggio** (tipicamente 10 metri).

La rete Bluetooth prende il nome di **piconet** ed è composta da
- un dispositivo **master** -> controlla la comunicazione
- fino a **7 dispositivi attivi**
- a questi si aggiungono fino a **255 dispositivi in modalità "parked'**, ossia connessi ma temporaneamente inattivi.
	I dispositivi "parked" non trasmettono né ricevono dati ma **rimangono conosciuti** alla "piconet".
	Il master può "svegliarli" quando serve.

#### Accesso al mezzo radio
Per coordinare le trasmissioni, Bluetooth usa due tecniche
- **TDM** -> ogni dispositivo trasmette a turni, in slot temporali
- **FHSS** -> vengono sfruttati **79 canali diversi** con una sequenza pseudo-casuale condivisa

#### Struttura ad hoc
La rete Bluetooth è **ad hoc**, ovvero senza infrastrutture fisse.
Tutto è gestito dal **master**.

#### Bootstrapping: come nasce la piconet
Il processo inizia con il **Neighbor Discovery**, durante il quale il master invia messaggi "inquiry" in broadcast. I dispositivi che li ricevono rispondono dopo un breve ritardo casuale, evitando collisioni.

Segue il **Paging**: il master contatta direttamente ciascun dispositivo scoperto per completare la configurazione della rete.


## 4G/5G
Le reti mobili 4G/5G hanno una struttura simile a internet cablato: usano gli stessi protocolli (IP, TCP, DNS...) e sono reti globali, ma usano tecnologie radio specifiche.

La grande differenza è che **supportano la mobilità**: un utente può spostarsi tra celle senza perdere connessione.

Ogni utente è identificato tramite la **SIM card**, e la rete è divisa tra
- **home network** -> del proprio operatore
- **visited network** -> quando si è in roaming

#### Componenti principali dell'architettura 4G
- **USER EQUIPMENT (UE)** -> il dispositivo dell'utente
- **e-Node-B** -> la base station
- **HSS** -> contiene i dati dell'utente e serve per l'autenticazione
- **S-GW / P-GW** -> instradano i dati e collegano la rete a internet
- **MME** -> gestisce la mobilità


## LTE: divisione tra piano di dati e di controllo
Standard di comunicazione wireless in cui il piano di dati e piano di controllo sono separati.
È un principio moderno che migliore l'efficienza e la flessibilità.
- **PIANO DI CONTROLLO** -> gestisce aspetti come l'**autenticazione**, **mobilità** e **sicurezza**
- **PIANO DI DATI** -> trasporta il **traffico IP reale** con un percorso diretto 
	- `UE → eNode-B → S-GW → P-GW → Internet`

#### Tunneling nel core LTE
Tecnica che permette di mantenere attiva la comunicazione anche durante uno spostamento e di lasciare invariato l'indirizzo IP del dispositivo, anche se cambia rete fisica

Nel cuore della rete LTE, i dati viaggiano **incapsulati** in tunnel **GTP-U**:
- Il pacchetto parte dalla base station e raggiunge l'**S-GW**
- Viene re-incapsulato e inoltrato al **P-GW**
- Questo processo è **trasparente per l'utente**

#### Associazione tra dispositivo mobile e stazione base
- Il dispositivo riceve segnali dalle varie stazioni base (ogni 5ms)
- Scegli quella con il segnale migliore (o dell'operatore preferito)
- Si autentica con la SIM e ottiene l'accesso alla rete.

#### LTE - modalità risparmio energetico
Per ridurre il consumo della batteria nei momenti di inattività, LTE prevede due modalità di "sleep"
- **LIGHT SLEEP** -> dopo qualche centinaio di millisecondi, il dispositivo spegne la radio ma si riattiva periodicamente per controllare se ci sono dati in arrivo
- **DEEP SLEEP** -> dopo 5-10 secondi, il dispositivo entra in uno stato in cui **non riceve più nulla**
	La connessione è sospesa e c'è bisogno di una nuova associazione alla rete
	PRO: più energia risparmiata
	CONTRO: più tempo per richiedere la comunicazione


## Mobilità
È la capacità di un dispositivo di muoversi tra le reti mantenendo attive le comunicazioni in corso, senza perdere la connessione.

Il passaggio da una rete ad un'altra si chiama **handover**.

#### Due approcci
1. **MOBILITÀ GESTITA DALLA RETE** -> i router si aggiornano ogni volta che un dispositivo cambia rete, aggiornando quindi le tabelle di instradamento.
>[!problem] PROBLEMA: NON È SCALABILE

2. **MOBILITÀ GESTITA DAI DISPOSITIVI** -> i dispositivi *end-to-end* si occupano della mobilità
	Due sotto-approcci (***routing***)
	- <u>Routing indiretto</u> -> il dispositivo ha un home agent che
		- riceve i pacchetti destinati al dispositivo
		- rintraccia la *rete visitata* 
		- invia i pacchetti alla rete visitata
		- e poi raggiungeranno il dispositivo
		✔️ Vantaggio: il corrispondente non si accorge dello spostamento.  
		❌ Svantaggio: i pacchetti fanno un **giro più lungo** (routing triangolare).
		
	- <u>Routing diretto</u> -> il corrispondente scopre l'indirizzo attuale del dispositivo e invia i pacchetti direttamente
		✔️ Vantaggio: i pacchetti fanno un **giro più corto**  
		❌ Svantaggio: rete più complessa


## Rete domestica e rete visitata
- **Nel 4G/5G**, ogni utente ha una **rete domestica** (quella del proprio operatore) che gestisce autenticazione e identità tramite **SIM e HSS**. Quando si è in roaming, ci si collega a una **rete visitata**, ma tutto passa comunque dalla rete domestica.

- **Nel Wi-Fi/ISP**, ogni rete è indipendente: l’utente si autentica localmente, senza passare da una rete centrale. Non esiste un concetto di “rete di casa”.

