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
- TCAM è una memoria speciale per rappresentare le tabelle di inoltro, che permette di trovare la riga con l'IP adeguato in un tempo essenzialmente costante.
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
>- router IPv6
>- router IPv4
>- router **dual stack** (retrocompatibili)

Per comunicare in una rete mista si usa il tunneling, ossia
- prendere il datagramma IPv6, **incapsularlo** in un datagramma IPv4 -> in questo modo diventa il payload del datagramma inviato
- una volta superata la rete IPv4, viene **decapsulato** -> ritorna IPv6

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


#### Algoritmi di instradamento
Sono algoritmi utilizzati per trovare il percorso migliore che un datagramma deve percorrere per arrivare da una sorgente a una destinazione.
	Questo percorso viene poi suddiviso per essere inserito nelle tabelle di inoltro.

Vengono classificati in base a due criteri
1. Informazione usata
	- Globali: il calcolo è centralizzato e ogni router ha una mappa completa della rete
	- Decentralizzati: ogni router inizialmente sa solo i costi verso i suoi vicini e con le varie iterazioni scopre i costi globali
	
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
##### 🔁 Next-hop modificato (next-hop-self)
Quando un router di confine riceve un annuncio BGP da un AS esterno, **sostituisce il next-hop con il proprio indirizzo** prima di inoltrarlo ai router interni.  
Questo semplifica l'instradamento: i router interni devono solo sapere **come raggiungere il router di confine**, senza preoccuparsi di indirizzi esterni.

##### 🚫 Next-hop non modificato (default)
Se il router **non modifica il next-hop**, l’annuncio mantiene l’indirizzo del router esterno da cui è arrivato.  
In questo caso, i router interni devono **sapere come raggiungere direttamente quel next-hop esterno**, rendendo la configurazione **più complessa e meno robusta**.

##### Instradamento a patata bollente
È una strategia di instradamento INTRA-AS in cui ogni router cerca di liberarsi il prima possibile del traffico, passandolo al primo gateway disponibile verso un altro AS (anche se non è il percorso più corto)

In questa strategia, un router interno, una volta ottenuto un datagramma destinato a un AS esterno, cerca il router gateway più vicino (non quello che porterebbe al percorso migliore).

>[!example] PRO: viene ridotto il traffico interno al singolo AS -> viene minimizzato l'uso della singola rete

>[!problem] CONTRO: Il datagramma potrebbe seguire un percorso più lungo -> aumento della latenza globale
>

##### IP ANYCAST
IP Anycast è una tecnica in cui **più server condividono lo stesso indirizzo IP**, e il traffico viene instradato automaticamente verso il server più vicino secondo le regole di routing, senza che il client sappia quale server lo sta effettivamente servendo.
	ES. io mi collego a YT automaticamente scegliendo il server più vicino

##### Ingegneria del traffico
L’ingegneria del traffico è l’insieme di tecniche per controllare e ottimizzare il flusso dei dati in rete, evitando congestioni, bilanciando il carico e sfruttando al meglio le risorse — soprattutto grazie alla flessibilità introdotta dalle reti SDN.


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
È uno strumento di diagnostica che usa pacchetti con **TTL crescente** e risposte **ICMP** per determinare il percorso e i tempi di attraversamento dei router tra una sorgente e una destinazione.  


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

