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
	Viene utilizzato un **protocollo MAC** (o **PAM**) che viene gestito tramite **indirizzi MAC**, i quali indentificano **mittente e destinatario locali**
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

Dopo una collisione, i nodi **non ritrasmettono subito** ma ritrasmettono con una certa probabilità `p` (calcolata all'inizio) in uno degli slot successivi.
![[Pasted image 20250512165012.png]]

#### UNSLOTTED ALOHA
Non abbiamo una suddivisione del tempo in slot ma
- Il nodo trasmette non appena ha un frame disponibile
- Se c'è **collisione** -> **aspetta un tempo casuale** e ritrasmette con una probabilità `p` (calcolata all'inizio)


## Accesso multiplo con rilevamento della portante
#### CSMA
Ogni nodo prima di trasmettere, "**ascolta**" il canale per vedere se qualcun altro sta già trasmettendo
- Se il canale è libero -> trasmette
- Se non è libero -> aspetta e riprova dopo

>[!warning] ATTENZIONE: le collisioni con CSMA sono ancora possibili a causa del **ritardo di propagazone**.
#### CSMA/CD
È un'estensione di CSMA che aggiunge ad ogni nodo la **capacità di rilevare collisioni**

In pratica
- un nodo trasmette ma **continua ad ascoltare**
- se si accorge che un altro nodo ha iniziato a trasmettere in contemporanea -> si accorge della collisione 
	- invia un messaggio broadcast per segnalare la collisione
- TUTTI i nodi coinvolti interrompono la trasmissione
	- aspettano un **tempo casuale** e poi riprovano a trasmettere


## Protocolli a rotazione
Cercano di prendere il meglio di **CSMA** E **TDMA**
- **efficienza di CSMA** a basso traffico
- **ordine e equità di TDMA** ad alto traffico

#### POLLING
Un **controllore centrale** (master) gestisce l'accesso al canale.
I nodi non trasmettono autonomamente ma **aspettano di essere invitati**.
![[Pasted image 20250512175747.png|center|500]]
Il controllore invia un **segnale di "poll"** al nodo client per permettergli di trasmettere
- e questo segnale poi viene trasmesso agli altri nodi a "rotazione".

>[!example] VANTAGGI: Nessuna collisione e accesso ordinato

>[!problem] PROBLEMI: Overhead e ritardo del segnale di poll + punto singolo di guasto

#### TOKEN PASSING
I nodi della rete si passano un **gettone virtuale (token)** e solo chi lo ha può trasmettere.
![[Pasted image 20250512175831.png|center|300]]

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
	I dispositivi di VLAN diverse non possono comunicare direttamente -> più sicurezza e isolamento![[Pasted image 20250522173710.png|center]]
	
2. **VLAN su più switch** -> viene utilizzata una **porta trunk**, ossia un unico collegamento tra due switch che può trasportare frame **di tutte le VLAN**![[Pasted image 20250522174552.png]]

#### Formato 802.1Q
Le VLAN hanno un loro ID per comunicare e riconoscersi
- quest'ultimo é definito dallo standard 802.1Q

#### EPVN
Serve per creare una LAN tra due reti diverse, avvalendoci di switch e router specifici.
EVPN permette di collegare logicamente gli switch di livello 2 attraverso una rete di livello definita come **underlay**. 
Si avvale della funzione di tunneling con la quale i frame Ethernet vengono incapsulati e inviati attraverso una rete IP, ignorando la complessità intermedia.
![[GetImage - 2025-05-22T174903.317.png]]


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
	- altra invece si riflette su edifici, oggetti in generale e arriva con un percorso più lungo![[Pasted image 20250528113556.png]]
	Il ricevitore riceve quindi più versioni dello stesso segnale e usa il **tempo di coerenza**, ossia l'<u>intervallo di tempo</u> entro cui un bit trasmesso è considerato "valido".

3. **SNR e BER** -> due parametri che servono per valutare l'affidabilità e la qualità di un collegamento wireless
	- **SNR - Signal-to-Noise Ratio** -> indica il rapporto tra **potenza del segnale utile** e il **rumore di fondo**
		- SNR alto = comunicazione più affidabile
	- **BER - Bit Error Rate** -> indica il **tasso di errore sui bit**, ossia la probabilità che un bit venga **ricevuto in modo errato**. 

>[!tip] Bilanciamento di SNR e BER
>**Aumentare la potenza di trasmissione** migliora l’SNR (rapporto segnale/rumore), riducendo gli errori (BER). Tuttavia, consuma più energia e può causare interferenze.  
Schemi di modulazione più veloci (come QAM256) trasmettono più dati ma sono più sensibili agli errori.  
Per questo, si usa **modulazione adattiva**: il dispositivo cambia schema in base allo SNR, migliorando efficienza e affidabilità.

4. **TERMINALI NASCOSTI** -> sono nodi che non riescono a rilevare le trasmissioni di altri nodi perché si trovano fuori dalla loro portata, tuttavia possono comunque interferire con la comunicazione inviando dati nello stesso momento, causando collisioni.![[Pasted image 20250528120210.png]]


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
La rete Bluetooth è **ad hoc**, ovvero senza infrastrutture fisse.

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
È un principio moderno che migliora l'efficienza e la flessibilità.
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

