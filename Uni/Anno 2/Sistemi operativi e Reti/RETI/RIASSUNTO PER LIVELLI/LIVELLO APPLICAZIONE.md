# LEZIONI INTRODUTTIVE
## Definizione internet
Infrastruttura composta da un insieme di reti interconnesse tra loro

## Host
Sono i dispositivi periferici presenti al confine di internet, i quali
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
- **Commutazione di pacchetto** (store-and-forward)
	- il singolo messaggio viene suddiviso in pacchetti di `L` bit.
	![[Pasted image 20250311110811.png]]
- **Commutazione di circuito**
	- viene dedicato il singolo percorso tra un host mittente e destinatario e vengono inviati flussi di bit.
	MULTIPLEXING A DIVISIONE DI FREQUENZA![[Pasted image 20250311120205.png|center]]
	
	MULTIPLEXING A DIVISIONE DI TEMPO![[Pasted image 20250311120717.png|center]]

## Sicurezza internet
- PACKET SNIFFING, una interfaccia di rete, quindi collegata alla rete, può vedere tutti i pacchetti che ci passano.
- IP SPOOFING, fingo di avere un altro indirizzo IP nella rete

## Definizione di protocollo
Insieme di regole che definiscono il metodo di comunicazione tra i dispositivi nella rete.

PILA PROTOCOLLARE permette di separare le funzioni della rete, semplificando la gestione e consentendo ai protocolli di comunicare in modo organizzato e indipendente.
1. **LIVELLO DI APPLICAZIONE**: fornisce servizi e supporto alle applicazioni di rete (con protocolli ad es. HTTP)
	- ==MESSAGGIO==
2. **LIVELLO DI TRASPORTO**: si occupa del trasferimento di dati tra processi (con protocolli come TCP e UDP)
	- HTTP usa TCP
	- ==SEGMENTO==
3. **LIVELLO DI RETE**: si occupa del trasporto dei ==DATAGRAMMI==, pacchetti di rete tra host con indirizzo IP (protocollo IP)
4. **LIVELLO DI COLLEGAMENTO**: si occupa del trasporto di ==FRAME== tra dispositivi vicini
5. **LIVELLO FISICO**: si occupa del trasferimento di bit veri e propri
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
- HOST CLIENT, che interpella il server per ricevere messaggi, non ha bisogno di rendere noto il suo indirizzo IP

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


## Due tipologie di connessioni
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


## HTTP (e vari tipi)
Protocollo implementato a livello di applicazione che definisce la struttura dei messaggi e la modalità di scambio.

La sua porta è la 80.

Si tratta di un protocollo ***stateless***, ossia non mantiene memoria tra le richieste degli utenti.

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
![[Pasted image 20250318193034.png|center]]
Ogni risorsa ha un TTL nella cache

##### Web cash proxy
Funge come da client perché invia preventivamente delle richieste al server e le salva, così quando un client richiede quei dati già può riceverli.
###### GET CONDIZIONALE
Serve per mantenere coerenza con i dati del proxy.


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
È un sistema gerarchico e distribuito che si occupa di tradurre i nomi di dominio (es. `www.google.com`) digitati dall'utente nei corrispettivi indirizzi IP necessari ai dispositivi di rete per instradare correttamente i pacchetti.
![[Pasted image 20250321190053.png]]
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
	![[Pasted image 20250703121621.png]]
	
- **RICORSIVA**: il DNS locale "**chiede tutto**" **a un server DNS** che ricorsivamente si occupa della risoluzione
	![[Pasted image 20250321194553.png|center]]
