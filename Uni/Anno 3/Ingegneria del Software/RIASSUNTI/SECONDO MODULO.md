# PROGETTAZIONE DEL SOFTWARE

## 1. Significato e Fasi della Progettazione
La **progettazione** è la fase del processo software in cui si decide **come** realizzare il sistema.  
Prende in input il **documento di specifica dei requisiti** (prodotto nell’analisi) e produce il **Documento di Progetto** .


Si divide in due sottofasi principali:
### ● Progetto Architetturale (o preliminare)
Si definisce la struttura generale del sistema, suddividendolo in **componenti**.
### ● Progetto Dettagliato
Ogni componente viene progettata nel dettaglio, scegliendo:
- algoritmi
- strutture dati

L’idea è passare gradualmente da una visione globale a una visione sempre più specifica.

---

## 2. Principi Fondamentali di Progettazione
### 2.1 Stepwise Refinement
È una strategia **top-down**: si parte da una descrizione astratta e si aggiungono dettagli progressivamente .

Ogni passo:
- riduce il livello di astrazione
- aumenta il dettaglio

È collegato alla **Legge di Miller**: una persona riesce a gestire mentalmente circa 7±2 elementi alla volta.  
Quindi si lavora su parti piccole e controllabili.

**Concetto chiave:**  
Raffinare significa rendere più dettagliata una descrizione inizialmente astratta.

---

### 2.2 Astrazione
Introdotta da Dijkstra.  
Consiste nel concentrarsi solo sugli aspetti essenziali ignorando i dettagli secondari .

Ogni fase del progetto rappresenta un passaggio verso un livello di astrazione più basso.
#### Tipi principali di astrazione
1. **Astrazione procedurale**  
    Uso di funzioni senza conoscere l’implementazione interna  
    (es. `printf`: so che stampa, non mi interessa come lo fa)
    
2. **Astrazione dei dati**  
    Uso di una struttura dati senza conoscere i dettagli interni  
    (concetto di **incapsulamento**)

**Definizione – Incapsulamento:**  
Tecnica che nasconde i dettagli interni di una struttura dati, permettendo di accedervi solo tramite operazioni definite.

---

## 3. Decomposizione Modulare e Modularità
### 3.1 Perché dividere in moduli?
Si divide il sistema in parti più piccole per:
- migliorare la comprensibilità
- facilitare la manutenzione
- aumentare la riusabilità

Secondo IEEE 610-12:
**Definizione – Modularità:**  
Grado in cui un sistema è composto da componenti discrete tali che una modifica a un modulo abbia impatto minimo sugli altri.

Il criterio guida è quindi:
> identificare moduli il più possibile indipendenti tra loro.

---

### 3.2 Cos’è un modulo?
Un modulo:
- contiene istruzioni, logica e strutture dati
- può essere compilato separatamente
- può essere incluso in altri programmi
- può essere invocato tramite nome e parametri
- può usare altri moduli

Esempi: funzioni, classi.

---

### 3.3 Divide et Impera
La decomposizione si basa su questo principio:
- risolvere due problemi separatamente è più semplice
- riaggregare ha un costo, ma minore rispetto alla gestione globale

Il risultato finale è l’**architettura dei moduli**.
![[Pasted image 20260303191758.png]]

---

# COESIONE E ACCOPPIAMENTO
Una buona progettazione mira a:
- **Massima coesione interna**
- **Minimo accoppiamento esterno**

---

## 4. Coesione
### Cos’è la coesione?
Misura quanto le parti interne di un modulo sono correlate tra loro. 
Un modulo è coeso se le sue azioni contribuiscono tutte alla stessa funzione.

Si misura su una scala a 7 livelli (dal peggiore al migliore):
1. **Coincidentale**  
    Azioni senza relazione tra loro.  
    → Modulo inutilmente aggregato.
    
2. **Logica**  
    Il modulo contiene più funzioni alternative, ma se ne usa solo una per volta.  
    Problemi di manutenibilità.
    ![[Pasted image 20260303191927.png]]
3. **Temporale**  
    Azioni correlate nel tempo  
    (es. apertura file all’inizio del programma).
    
4. **Procedurale**  
    Azioni correlate in sequenza.
    
5. **Communicational**  
    Azioni sulla stessa struttura dati.
    
6. **Informational**  
    Più operazioni indipendenti su una stessa struttura dati  
    (tipico paradigma OO).
    ![[Pasted image 20260303191952.png]]
    
7. **Funzionale**  
    Tutte le parti collaborano per svolgere una singola funzione.  
    → livello migliore
    

![[Pasted image 20260303192033.png]]

---

### Osservazione importante
- Programmazione strutturata → obiettivo: coesione funzionale
- Paradigma OO → obiettivo: coesione informational

---

## 5. Accoppiamento (Coupling)
### Cos’è il coupling?
Misura il grado di dipendenza tra moduli.
Scala a 5 livelli (dal peggiore al migliore):
1. **Content Coupling**  
    Un modulo accede o modifica direttamente il contenuto interno di un altro.  
    → fortissima dipendenza.
    
2. **Common Coupling**  
    Due moduli condividono variabili globali.
    
3. **Control Coupling**  
    Un modulo controlla il flusso di esecuzione dell’altro  
    (es. tramite flag).
    
4. **Stamp Coupling**  
    Si scambiano strutture dati ma ne usano solo una parte.
    
5. **Data Coupling**  
    Si scambiano solo i dati necessari tramite interfacce ben definite .
    

---

### Fattori che influenzano il coupling
![[Pasted image 20260303192156.png]]
- quantità di dati condivisi
- numero di riferimenti tra moduli
- complessità dell’interfaccia
- livello di controllo esercitato


---

# INFORMATION HIDING
## 6. Information Hiding
Principio secondo cui un modulo deve mostrare solo ciò che serve, nascondendo i dettagli interni .

Vantaggi:
- facilita modifiche
- migliora testing e manutenzione

In OO si realizza tramite:
- `private`
- getter/setter


---

# RIUSABILITÀ
## 7. Riusabilità
Consiste nel riutilizzare componenti già sviluppate in altri sistemi .

Può riguardare:
- moduli
- framework
- design pattern
- architetture software

**Vantaggi:**
- riduzione costi e tempi
- maggiore affidabilità (componenti già testati)

![[Pasted image 20260303192241.png]]

---

# OBJECT ORIENTED DESIGN (OOD)
## 8. Fasi dell’OOD
1. **System Design (architetturale)**  
    Definizione dell’architettura generale.
    
2. **Object Design (dettagliato)**  
    Definizione algoritmi e strutture dati .


OOD è:
- iterativo
- incrementale
- basato sui risultati dell’analisi OO (OOA)


---

# ARCHITETTURE DI SISTEMA
## 9. Architetture Centralizzate
### 1. Mainframe-based
- Un unico mainframe potente
- Terminali solo I/O
- Esecuzione centralizzata  
    Ancora usate in ambito bancario .

### 2. File Sharing
PC collegati in rete ma esecuzione su un nodo singolo.

---

## 10. Architetture Distribuite
L’esecuzione è distribuita su più nodi interconnessi .
La distribuzione è trasparente all’utente.

### Middleware
Strato software che gestisce la comunicazione tra nodi.

Esempi:
- RPC (Remote Procedure Call)
- MOM
- ORB


---

### Vantaggi sistemi distribuiti
- Condivisione risorse
- Openness (eterogeneità)
- Concurrency
- Scalability
- Load Balancing
- Fault Tolerance
- Trasparenza

### Problemi
- qualità del servizio
- interoperabilità
- sicurezza


---

## 11. Architettura Client/Server
Ruoli distinti:
- **Client** → interagisce con utente
- **Server** → elabora richieste

### BCE (Boundary-Control-Entity)
- **Boundary (Presentation)** → interfaccia utente
- **Control (Application Processing)** → logica
- **Entity (Data Management)** → dati


---

### Two-Tier
- Thin Client → solo presentazione sul client
- Fat Client → logica sul client

### Three-Tier
- Presentation (client)
- Application Processing (server intermedio)
- Data Management (backend)

### N-Tier
Estensione con più livelli (es. autenticazione).

---

# ARCHITETTURE AVANZATE
## 12. Oggetti Distribuiti
Ogni oggetto può essere:
- client
- server

Si usa un middleware chiamato **ORB (Object Request Broker)** .

### CORBA
Standard OMG per definire interfacce ORB.
Problema iniziale: mancata interoperabilità.
Soluzione: protocollo **IIOP**.

---

## 13. Component-Based Architecture
Software costruito assemblando componenti riusabili.

Caratteristiche:
- separazione interfaccia/implementazione
- riuso black box
- adattabilità


---

### Differenze Oggetto vs Componente

| Oggetto                           | Componente                       |
| --------------------------------- | -------------------------------- |
| Incapsula servizi                 | Astrazione per costruire sistemi |
| Granularità fissa                 | Granularità variabile            |
| Ha identità, stato, comportamento | Entità software statica          |

---

## 14. Component Framework
Fornisce:
- librerie di componenti
- architetture generiche
- supporto a domini applicativi


---

# CONCETTI CHIAVE RIASSUNTIVI
- Progettazione = decidere come realizzare il sistema.
- Stepwise refinement = raffinamenti successivi.
- Astrazione = concentrarsi sugli aspetti essenziali.
- Modularità = indipendenza dei moduli.
- Coesione alta = modulo ben progettato.
- Coupling basso = dipendenze ridotte.
- Information Hiding = nascondere implementazione.
- Architetture centralizzate vs distribuite.
- Client/Server, Three-tier, N-tier.
- Oggetti distribuiti e ORB.
- Component-based e framework.

---

# ARCHITETTURE SERVICE ORIENTED, WEB SERVICES E TRANSACTION PATTERNS

# 1. Framework e Componenti UML
## 1.1 Component Framework
Un **component framework** permette di costruire applicazioni riusando componenti predefinite e integrando quelle mancanti per soddisfare requisiti specifici .
L’idea è:
- esistono componenti generiche
- se non sono sufficienti, si implementano quelle mancanti
- il framework può essere aggiornato per utilizzi futuri

Tuttavia, nella pratica industriale, non ha avuto grande successo la costruzione di framework realmente completi.

![[Pasted image 20260303192629.png]]

Questa immagine mostra come:
- dai requisiti specifici
- si parte da un framework generico
- e si ottiene un’applicazione specifica.


---

## 1.2 Componenti in UML
### UML 1
Il componente era visto come **entità fisica** (eseguibile, documento, artefatto allocato su una piattaforma).

Problema: non si vedeva il collegamento tra progettazione (classi) e componente finale.

---
### UML 2
Il componente diventa un elemento già presente a livello di progetto.
Viene rappresentato come:
- una classe con stereotipo `<<component>>`
- che realizza un’interfaccia
- con freccia tratteggiata a triangolo vuoto (realizzazione black-box)


Inoltre, UML 2 introduce il concetto di **classe strutturata**, per colmare il divario tra:
- livello di progetto
- livello di esecuzione

![[Pasted image 20260303192708.png]]
Serve per visualizzare la realizzazione black-box dell’interfaccia.

---

# 2. Architetture Service Oriented (SOA)
## 2.1 Definizione
Una **SOA (Service Oriented Architecture)** è un’architettura distribuita composta da servizi autonomi:
- eseguiti su nodi diversi
- implementati in linguaggi diversi
- comunicano tramite protocolli standard Internet .

Ogni servizio possiede una **descrizione** che specifica:
- nome
- posizione
- dati richiesti
- modalità di invocazione


---

## 2.2 Principi fondamentali SOA
### • Loose Coupling
Servizi indipendenti tra loro.

### • Service Contract
Accordo formale tra provider e consumer.

### • Autonomia
Servizio indipendente da altri.

### • Astrazione
Il consumer conosce solo ciò che serve.

### • Riusabilità e Composability
Servizi combinabili.

### • Statelessness
Non conservano stato tra richieste.

### • Discoverability
Servizio facilmente individuabile.

---

# 3. Broker Pattern nelle SOA
In SOA esistono tre ruoli:
- Service Provider
- Service Consumer
- Service Broker

Il broker permette la comunicazione e garantisce trasparenza.

---

## 3.1 Tipi di Trasparenza
### Platform Transparency
Il servizio è utilizzabile indipendentemente dalla piattaforma.

### Location Transparency
Il servizio può cambiare posizione senza che il consumer lo sappia.

---

# 4. Service Registration Pattern
Il provider registra il servizio presso il broker.
Messaggio di registrazione contiene:
- nome servizio
- descrizione
- interfaccia di rete

Dopo ACK del broker, il servizio è disponibile.

---

# 5. Broker Forwarding Pattern
Il broker inoltra tutte le richieste tra consumer e provider.

Garantisce:
- massima trasparenza di localizzazione

![[Pasted image 20260303192849.png]]

Mostra il forwarding completo tramite broker.

---

# 6. Broker Handle Pattern
Il broker fornisce al consumer l’indirizzo del provider.  
Da quel momento la comunicazione è diretta.

Vantaggio:
- meno messaggi
- maggiore efficienza

Svantaggio:
- meno trasparenza di localizzazione

![[Pasted image 20260303193021.png]]
Serve per confrontarlo col forwarding pattern.

---

# 7. Service Discovery Pattern
Il consumer non conosce il servizio specifico ma solo la tipologia.
1. queryServices al broker
2. broker restituisce lista
3. consumer seleziona servizio

Scelta basata anche su:
- QoS (Quality of Service)

![[Pasted image 20260303193056.png]]
Rappresenta il processo di discovery (“pagine gialle”).

---

# 8. Web Services
Le SOA usano spesso Web Services.
Un Web Service:
- usa protocolli Internet
- scambia dati in XML .


---

## 8.1 SOAP
Protocollo per scambio messaggi.

Struttura:
- Envelope (busta)
- regole codifica dati
- rappresentazione RPC

Usa HTTP (porta 80).

---

## 8.2 WSDL
Linguaggio XML che descrive:
- cosa fa il servizio
- dove si trova
- come invocarlo

![[Pasted image 20260303193957.png]]

Contiene:
- operazioni
- endpoint
- portType (insieme operazioni su URI)

![[Pasted image 20260303193150.png]]

Mostra l’intero flusso:
1. query registry
2. accesso WSDL
3. invio SOAP
4. risposta SOAP

![[Pasted image 20260303193216.png]]
Mostra allocazione su nodi fisici.

![[Pasted image 20260303193238.png]]
Mostra Web Service con broker remoto.

---

## 8.3 UDDI
Framework che implementa il service registry.

Realizza le funzioni base del broker.

---

# 9. REST
REST non è tecnologia ma stile architetturale.

Usa HTTP per:
- trasporto
- gestione interazione


---

## 9.1 Caratteristiche REST
- Client/Server
- Stateless
- Cache
- Interfaccia uniforme
- Identificazione risorse tramite URI


Operazioni CRUD:

| Metodo | Uso           |
| ------ | ------------- |
| GET    | lettura       |
| POST   | creazione     |
| PUT    | aggiornamento |
| DELETE | eliminazione  |

Differenza chiave:
- approccio convenzionale → un solo URL
- REST → più URL (niente collo di bottiglia)

![[Pasted image 20260303193402.png]]
Mostra differenza tra singolo endpoint e REST multi-endpoint.

---

# 10. Software Architectural Transaction Patterns
## 10.1 Transazione
Richiesta composta da più operazioni che realizzano una singola funzione logica.

Deve essere:
- completata interamente
- oppure annullata


---

## 10.2 Proprietà ACID
### Atomicità
Tutto o niente.

### Consistenza
Sistema sempre in stato valido.

### Isolation
Transazioni isolate tra loro.

### Durability
Effetti permanenti.

---

## 10.3 Two Phase Commit Protocol
Coinvolge un coordinatore.

### Fase 1 – Prepare
- invio prepare
- lock risorse
- readyToCommit

### Fase 2 – Commit
- invio commit
- conferma operazioni
- unlock

![[Pasted image 20260303193445.png]]
Mostra le due fasi del protocollo.

---

# 11. Compound Transaction Pattern
Transazione composta da sottotransazioni.

In caso di errore:
- rollback parziale


Esempio:
- prenotazione volo
- prenotazione hotel
- noleggio auto

Non è necessario annullare tutto se solo una parte fallisce.

---

# CONCETTI CHIAVE
- SOA = servizi autonomi e loosely coupled
- Broker = mediazione e trasparenza
- Web Services = SOAP + WSDL + UDDI
- REST = stile architetturale basato su risorse
- ACID = proprietà delle transazioni
- Two Phase Commit = coordinamento distribuito
- Compound Transaction = rollback parziale

---

# Service Coordination, OOD Dettagliato e Deployment in UML

## 1. Long Living Transaction
### Spiegazione
Le **Long Living Transaction** sono transazioni di lunga durata in cui è presente un _human in the loop_, cioè un intervento umano che introduce ritardi imprevedibili nel flusso dell’operazione.

A differenza delle transazioni classiche (che si completano in tempi brevi e senza interruzioni esterne), qui l’esecuzione può essere sospesa in attesa di una decisione umana. Questo comporta problemi di consistenza dei dati.

### Struttura del pattern
La soluzione consiste nel:
- suddividere la transazione in **più sottotransazioni**
- separare le sottotransazioni nei punti in cui interviene l’elemento umano
- introdurre un **recheck** prima della conferma finale

### Esempio (prenotazione aerea)
Flusso:
1. L’utente cerca i posti disponibili.
    
2. Sceglie un posto.
    
3. Impiega tempo prima di confermare.
    
4. Nel frattempo il posto può essere stato prenotato da altri.
    
5. Prima della conferma definitiva si effettua un **recheck**.

Se il posto non è più disponibile → transazione fallisce.  
Se è ancora disponibile → transazione confermata.

Nel diagramma (pag. 2) il _TravelAgent_ interroga più compagnie.  
Se la prima scelta fallisce al recheck, si prova con un’altra.

### Concetti chiave
- **Human in the loop**: presenza di un intervento umano che introduce ritardi.
- **Recheck**: controllo finale di consistenza prima della conferma.
- Separazione in sottotransazioni per gestire eventuali fallimenti parziali.

### Definizioni
- **Transazione lunga (Long Living Transaction)**: transazione che non si completa in modo atomico e immediato, ma può essere interrotta o sospesa.
- **Recheck**: verifica finale dello stato delle risorse prima della conferma definitiva.

![[Pasted image 20260303194730.png]]

---

## 2. Negotiation Pattern (Agent-Based Negotiation)
### Spiegazione
Il **Negotiation Pattern** introduce un agente software che agisce per conto dell’utente.

Si distinguono due agenti:
- **Client Agent** → rappresenta l’utente
- **Service Agent** → rappresenta il fornitore del servizio

Il meccanismo si basa su uno scambio di proposte e richieste.

### Tipi di messaggi
#### Dal Client Agent:
1. **Proposta** (negoziabile)
2. **Richiesta** (non negoziabile)
3. **Rifiuto**

#### Dal Service Agent:
1. Offerta
2. Accettazione
3. Rifiuto

### Differenza tra proposta e richiesta
- **Proposta** → negoziabile (es. “meno di 700€, ma posso valutare 750”)
- **Richiesta** → vincolante, imperativa

### Esempio
1. Il client agent propone viaggio < 700€.
2. Il service agent interroga più compagnie.
3. Risponde con offerte (750€, 775€).
4. Il client fa una richiesta vincolante.
5. Se nel frattempo il biglietto non è più disponibile → reject.
6. Si tenta con l’alternativa.

### Concetti chiave
- Separazione tra utente e servizio tramite agenti.
- Presenza di negoziazione.
- Interazioni concorrenti verso più servizi.
- Possibilità di rifiuto e ripetizione del processo.

### Definizioni
- **Agent**: entità software autonoma che agisce per conto di un soggetto.
- **Proposta negoziabile**: richiesta con margini di flessibilità.
- **Richiesta imperativa**: vincolante, senza possibilità di modifica.

![[Pasted image 20260303194940.png]]

---

## 3. Service Interface Design
I servizi comunicano tramite **scambio di messaggi**.

La progettazione avviene su due livelli:
1. **Strutturale**
2. **Comportamentale**

Si utilizza **UML 2** e il concetto di **classe strutturata**.

Un servizio viene modellato come:
- una classe con interfaccia
- eventualmente composta da altri servizi interni

La parte comportamentale descrive:
- come i servizi interagiscono
- come vengono coordinati


---

## 4. Service Coordination
Esistono due modelli principali.
### Orchestrazione
- Coordinamento centralizzato.
- Un elemento controlla il flusso.
- Simile al Two-Phase Commit.

### Coreografia
- Coordinamento distribuito.
- Non esiste un controllore centrale.
- Ogni servizio conosce il proprio ruolo.

Nelle architetture reali si usano entrambi.

### Definizioni
- **Orchestrazione**: controllo centralizzato del flusso di esecuzione.
- **Coreografia**: coordinamento distribuito senza controller centrale.


---

## 5. Detailed OOD (Object-Oriented Design)
È una fase che raffina l’OOA (Object-Oriented Analysis).

Obiettivo: definire come gli oggetti collaborano per realizzare i casi d’uso.

### Collaboration
Ha due componenti:
1. **Comportamentale**
    - descritta con communication diagrams
    
2. **Strutturale**
    - descritta con class diagram o composite structure diagram


---

## 6. Control Management e BCE
Stratificazione corretta delle classi:
- **Boundary** → interfaccia con l’utente
- **Control** → logica applicativa
- **Entity** → dati e informazioni

Le entity non devono gestire controllo.

### Esempio: iscrizione a un corso
Oggetti coinvolti:
- Student
- Course
- CourseOffering

Problema: dove mettere la logica di controllo?

Soluzioni viste (pag. 5):
1. Controllo nel Course → policy maker
2. Controllo nello Student
3. Controllo nel CourseOffering → classe “God”

Queste soluzioni violano la separazione BCE.

Soluzione corretta:  
→ introdurre una classe di **Control** separata.

Vantaggi:
- Maggiore manutenibilità
- Riduzione dell’accoppiamento
- Rispetto della stratificazione

### Concetti chiave
- Evitare classi “God”.
- Separare logica e dati.
- Introdurre oggetti Control.

![[Pasted image 20260303195101.png]]![[Pasted image 20260303195110.png]]
![[Pasted image 20260303195117.png]]
![[Pasted image 20260303195143.png]]

---

## 7. Coupling e Legge di Demeter
### Coupling
- **Intra-layer coupling** → interazioni nello stesso layer (preferibile)
- **Inter-layer coupling** → tra layer diversi (da minimizzare)

### Legge di Demeter (“Don’t talk to strangers”)
Un metodo può invocare metodi solo su:
1. Se stesso
2. Oggetti passati come parametri
3. Attributi propri
4. Oggetti creati nel metodo
5. Variabili globali

Obiettivo:
- Ridurre dipendenze
- Migliorare manutenibilità


---

## 8. UML Structured Class (UML 2)
In UML 2 la classe diventa **classe strutturata**.

Caratteristiche:
- Contiene **ruoli/parti**
- Incapsulamento forte
- Comunicazione solo tramite messaggi
- Interazione tramite **porte**

È gerarchica: una parte può essere a sua volta classe strutturata.

Comportamento spesso modellato con:
- **Macchine a stati finiti**

### Differenza ruolo vs parte
- **Ruolo** → semantica per riferimento
- **Parte** → semantica per valore

### Concetto chiave
Classe vista come **scatola nera** che espone servizi e nasconde implementazione.
![[Pasted image 20260303195724.png]]


---

## 9. Class Diagram vs Composite Structure Diagram
Con class diagram e composizione:
- se elimino l’oggetto principale → elimino anche quelli interni.

Con classe strutturata:
- dichiaro parti interne come istanze.

La classe strutturata è più adatta a sistemi complessi e gerarchici.

In UML 2:
- i componenti software diventano **artefatti**
- si descrive il passaggio da progettazione a esecuzione

![[Pasted image 20260303195427.png]]


---

## 10. Deployment Diagram
Serve a descrivere:
- nodi fisici
- allocazione software

### Tipi di nodi
1. **Device Node** → risorsa fisica
2. **Execution Environment** → ambiente di esecuzione
3. **Support Device** → dispositivo senza capacità di elaborazione

Le connessioni sono rappresentate da archi.

Si possono indicare molteplicità.
![[Pasted image 20260303195549.png]]

---

## 11. Process-to-Node Allocation
Descrive come allocare processi ai nodi.

Criteri:
- Distribuzione del carico
- Minimizzazione tempi di risposta
- Massimizzazione throughput
- Riduzione traffico di rete
- Capacità hardware (CPU, RAM)
- Banda di rete
- Availability
- Rerouting in caso di guasto

### Obiettivo
Trovare una configurazione efficiente, scalabile e robusta.

---

# Concetti fondamentali da ricordare per l’esame
- Differenza Long Living Transaction vs transazione classica
- Negotiation Pattern e differenza proposta/richiesta
- Orchestrazione vs Coreografia
- BCE e oggetto Control
- Classe God (errore progettuale)
- Legge di Demeter
- Classe strutturata UML 2
- Deployment diagram e allocazione processi


---

# Deployment, SOA Case Study e Design Patterns

# 1. Deployment in UML 2
## Cos’è il Deployment
Il **Deployment** è l’attività che consente di assegnare (mappare) gli **artefatti software** ai **nodi fisici** sui quali verranno eseguiti.

In UML 2 il concetto di _componente_ (UML 1) viene sostituito dal concetto di:

### **Artifact (Artefatto)**
Un artefatto è un’entità fisica concreta su cui può essere effettuato il deployment.

Esempi:
- File sorgente
- File eseguibili (.exe)
- Tabelle database
- Pagine web
- Documentazione


---

## Manifestazione
La **Manifestazione** è la relazione tra:
- un elemento del modello (es. classe)
- l’artefatto che lo implementa

Esempio descritto nel PDF:
- `MainStudentForm.src` → codice sorgente
- È manifestazione della classe `MainStudentForm`
- Dopo compilazione diventa `.exe`
- L’eseguibile è anch’esso manifestazione
- Il deployment avviene sull’eseguibile

### Definizione
**Manifestazione**: relazione che collega un elemento concettuale del modello al suo artefatto fisico.

---

## Deployment Specification
L’oggetto `<<DeploymentSpec>>` permette di specificare:
- come eseguire l’artefatto
- dove eseguirlo
- con quale priorità

Serve per:
- arricchire il modello
- supportare sistemi automatici di deployment

![[Pasted image 20260303200838.png]]
![[Pasted image 20260303200852.png]]
![[Pasted image 20260303200900.png]]


---

# 2. SOA Case Study – Online Shopping System
Il caso di studio riguarda un sistema di **online shopping** progettato secondo paradigma SOA.


## Requisiti principali
Flusso generale:
1. Il cliente fornisce dati personali → salvati in un account
2. Effettua un ordine
3. Si verifica validità carta di credito
4. Il fornitore controlla disponibilità inventario
5. Conferma ordine e data consegna
6. Alla spedizione → notifica cliente
7. Addebito carta


---

## Attori
- **Customer**
- **Supplier**

Ogni caso d’uso deve:
- essere completo
- includere flussi alternativi
- essere attivato da almeno un attore
- essere indipendente


---

## Casi d’uso lato Customer
1. Sfoglia catalogo
2. Sottometti ordine
3. Visualizza stato ordine

## Casi d’uso lato Supplier
1. Processare ordine
2. Confermare spedizione
3. Addebitare carta
  

---

# 3. Context Class Diagram
Si parte da una **classe strutturata**:
`<<software system>> OnlineShoppingSystem`

Approccio gerarchico:
- prima vista globale
- poi raffinamento progressivo

Ricorda i DFD:
- prima un unico processo
- poi decomposizione


---

## Entity individuate
Identificate tramite:
- analisi requisiti (noun-phrase approach)
- use case diagram

Principali classi:
- Customer
- Supplier
- Catalog
- Item
- CustomerAccount
- DeliveryOrder
- Inventory


---

## Aggregation vs Composition
Nel diagramma:
- **Rombo pieno (composition)** → dipendenza di esistenza
- **Rombo vuoto (aggregation)** → solo riferimento


Esempio:  
DeliveryOrder contiene Item come **aggregation**, perché:  
se cancello l’ordine, gli item continuano a esistere.

### Definizioni
- **Composition**: relazione forte con dipendenza di esistenza.
- **Aggregation**: relazione debole, senza dipendenza di esistenza.

![[Pasted image 20260303201127.png]]

---

# 4. Architettura Service Oriented
Le entity vengono integrate tramite:

### Service Classes
Quattro servizi principali:
- DeliveryOrderService
- InventoryService
- CatalogService
- CustomerAccountService

Questi servizi:
- forniscono accesso alle entity
- incapsulano la logica


---

## Ulteriori classi
### User Interaction Classes (Boundary)
- Customer Interaction
- Supplier Interaction

### Coordinator Classes (Control)
- Customer Coordinator
- Supplier Coordinator
- Billing Coordinator

### Servizi esterni (Black Box)
- CreditCard Service
- Email Service

Questi ultimi:
- non vengono implementati
- si definisce solo l’interfaccia

![[Pasted image 20260303201401.png]]


---

# 5. Dynamic Modeling – Communication Diagrams
Si usano **communication diagrams** (ex collaboration diagrams).

Differenza dai sequence diagram:
- non mostrano timeline esplicita
- usano numeri di sequenza

![[Pasted image 20260303201419.png]]


---

## BCE rispettato
Regole:
- Boundary → solo Boundary o Control
- Control → Control o Entity
- Entity → Entity o Control

Questo garantisce:
- bassa accoppiatura
- alta coesione


---

# 6. Architettura Stratificata
Tre layer:
1. User Layer
2. Coordination Layer
3. Service Layer

Corrispondono a BCE.

![[Pasted image 20260303201501.png]]


---

# 7. Pattern Architetturali in SOA
Nel caso di studio si usano:

### 1. Broker Handle Pattern
Ogni richiesta passa attraverso un broker.

### 2. Comunicazione Sincrona
Il chiamante si blocca in attesa risposta.

### 3. Comunicazione Asincrona
Il servizio risponde tramite callback.

Nel caso:
- Customer Coordinator → sincrona
- Supplier e Billing Coordinator → asincrona

### 4. Service Discovery
Per trovare servizi disponibili.

### 5. Two Phase Commit
Per gestire transazioni distribuite.

---

# 8. Progettazione delle Componenti
Un componente:
- separa interfaccia e implementazione

UML usa:
- notazione “pallino” (lollipop) per interfaccia fornita
- porte per accesso

### Required vs Provided
- R (Required) → richiede funzionalità
- P (Provided) → fornisce funzionalità

User Interaction:
- solo R

Coordinator:
- R e P

Service:
- solo P

![[Pasted image 20260303201607.png]]

---

# 9. Definizione Interfacce – Esempio CatalogService
Operazioni:
- requestCatalog
- requestSelection

Ogni operazione:
- specifica parametri
- indica input/output

CatalogService interagisce con:
- CatalogInfo
- ItemInfo
- CatalogType (enumeration)

Gli altri servizi vengono progettati allo stesso modo.

I servizi esterni:
- solo interfaccia

![[Pasted image 20260303201751.png]]

---

# 10. Riusabilità in SOA
Una volta implementati:
- CatalogService
- DeliveryOrderService
- etc.

possono essere pubblicati e riusati.

Principio:  
se esiste un servizio già pronto → lo uso  
altrimenti → lo implemento e lo rendo disponibile.

---

# 11. Design Patterns

## Cosa sono
Soluzioni riutilizzabili a problemi ricorrenti nella progettazione.
Obiettivi:
- ridurre tempi
- ridurre costi
- aumentare affidabilità
- migliorare riusabilità

---

## Perché servono
In fase di analisi:
- classi rappresentano entità reali


In fase di progetto:
- emergono classi astratte (boundary, control)
- queste astrazioni aumentano riusabilità

I pattern aiutano a:
- identificare queste astrazioni
- evitare di reinventare soluzioni

---

## Classificazione dei Design Pattern
### Per Purpose (obiettivo)
1. **Creazionali**
    - Creazione oggetti
    
2. **Strutturali**
    - Struttura sistema
    
3. **Comportamentali**
    - Interazioni e responsabilità
   

---

### Per Scope (raggio d’azione)
1. **Class**
    - relazioni statiche (compile-time)
    
2. **Object**
    - relazioni dinamiche (run-time)


---

## Struttura standard di descrizione di un pattern
Ogni pattern è descritto tramite 10 campi:
1. Nome e classificazione
2. Motivazione
3. Applicabilità
4. Struttura
5. Partecipanti
6. Conseguenze
7. Implementazione
8. Codice di esempio
9. Usi conosciuti


---

# Concetti chiave per l’esame
- Differenza artifact vs componente UML 1
- Manifestazione
- DeploymentSpec
- Aggregation vs Composition
- Stratificazione BCE in SOA
- Required vs Provided
- Comunicazione sincrona vs asincrona
- Broker Handle Pattern
- Classificazione design pattern (purpose + scope)


---
# Design Pattern e Framework
## Framework: concetto generale
Prima dei pattern è fondamentale chiarire cosa sia un **framework**.

Un **framework** non è una semplice libreria di classi riutilizzabili.  
È un **design riutilizzabile di un sistema**, cioè uno scheletro applicativo già strutturato, che lo sviluppatore completa implementando classi e metodi specifici.

### Caratteristiche principali
- È definito da un insieme di **classi astratte** e dalle loro interrelazioni.
- Definisce:
    - lo **scopo** del sistema
    - la **struttura statica**
    
- Permette:
    - riuso di **design**
    - riuso di **codice**

### Classe Astratta
Una **classe astratta** è una classe che contiene almeno un metodo non implementato (metodo astratto).  
Funziona come **template** per le sottoclassi, che devono completarne l’implementazione.

### Relazione tra Pattern e Framework
I **Design Pattern** sono considerati i _mattoni_ per costruire framework.  
Spesso non si usa un solo pattern: più pattern possono essere combinati.

---

# Abstract Factory Pattern
## Classificazione
Pattern **creazionale**, basato su **oggetti**.

## Scopo
Fornire un’interfaccia per creare **famiglie di oggetti correlati tra loro**, senza specificare le classi concrete.

## Problema che risolve
Esempio tipico: interfacce grafiche con diversi **look & feel** (chiaro/scuro, Windows/Mac ecc.).

Finestre, menu e scrollbar sono concettualmente gli stessi oggetti, ma cambiano implementazione.

Il client:
- non deve sapere come vengono creati gli oggetti
- non deve accoppiare manualmente oggetti incompatibili

## Struttura
Il client:
- non istanzia direttamente gli oggetti
- usa una **AbstractFactory**


La AbstractFactory è implementata da più **ConcreteFactory**, ciascuna responsabile di una famiglia coerente di prodotti.

Partecipanti:
- AbstractFactory
- ConcreteFactory
- AbstractProduct
- ConcreteProduct
- Client

![[Pasted image 20260303202501.png]]

## Applicabilità
Si usa quando:
- Il sistema deve essere indipendente dalle modalità di creazione degli oggetti.
- Esistono più famiglie di prodotti.
- Il client deve poter scegliere una famiglia senza essere legato a una specifica implementazione.

## Conseguenze
Vantaggi:
- Isola classi concrete da classi astratte.
- Facilita il cambio di famiglia di prodotti.

Svantaggi:
- L’aggiunta di nuovi tipi di prodotto richiede modifica dell’interfaccia della factory.
- Le famiglie sono legate staticamente alla struttura della factory.


---

## Esempio: UI con due Look & Feel 
Abbiamo:
- Window1 + ScrollBar1
- Window2 + ScrollBar2

Il client non deve fare:
```
Window w = new Window1();
ScrollBar s = new ScrollBar2(); // errore logico
```

Con Abstract Factory:
```
Factory f = new Factory1();
Window w = f.createWindow();
ScrollBar s = f.createScrollBar();
```

La responsabilità dell’accoppiamento corretto è demandata alla factory.

![[Pasted image 20260303202654.png]]

---

# Factory Method Pattern

## Classificazione
Pattern **creazionale**, basato su **classi**.

## Scopo
Definire un metodo per creare un oggetto, lasciando alle sottoclassi la decisione su quale classe concreta istanziare.

Differenza chiave con Abstract Factory:
- Abstract Factory lavora su famiglie di oggetti.
- Factory Method delega a runtime la creazione di un singolo oggetto.

## Struttura
- Creator (classe astratta)
    - contiene il metodo astratto `factoryMethod()`
    
- ConcreteCreator
    - implementa il metodo factoryMethod()
    
- Product
- ConcreteProduct

Il Creator può avere metodi concreti che usano factoryMethod().

![[Pasted image 20260303202747.png]]

## Applicabilità
- Quando una classe non sa quale oggetto concreto deve creare.
- Quando si vuole delegare la creazione alle sottoclassi.
- Tipico nei framework.

## Conseguenze
- Elimina dipendenze dirette dalle classi concrete.
- Introduce flessibilità dinamica.

---

## Esempio: Framework Documenti 
Application (classe astratta)
- openDocument()
- createDocument() → astratto

Document (astratta)
- PDFDocument (concreta)

openDocument() chiama createDocument().  
La sottoclasse decide quale documento creare.

Si chiama Factory Method perché la creazione è delegata a un **metodo astratto**, non a una classe factory separata.

---

# Adapter Pattern
## Classificazione
Pattern **strutturale**, basato su classi o oggetti.

## Scopo
Convertire l’interfaccia di una classe esistente in una compatibile con quella richiesta dal client.

## Problema
Si vuole riusare una classe con interfaccia incompatibile.
Esempio: editor grafico con `display()` ma nuova classe Circle con `show()`.

## Struttura
- Target → interfaccia attesa dal client
- Adaptee → classe esistente
- Adapter → converte interfacce
- Client

### Due varianti
1. **Object Adapter**
    - Usa composizione
    - Contiene un oggetto Adaptee
2. **Class Adapter**
    - Usa ereditarietà multipla
    - Eredita da Target e Adaptee

![[Pasted image 20260303202851.png]]
![[Pasted image 20260303202947.png]]

## Conseguenze
- Permette riuso di codice esistente.
- Richiede valutazione dell’effort di adattamento.


---

# Composite Pattern
## Classificazione
Pattern **strutturale**, basato su oggetti.

## Scopo
Comporre oggetti in strutture gerarchiche, trattando in modo uniforme oggetti semplici e composti.

## Idea chiave
Il client non distingue tra:
- oggetto semplice (Leaf)
- oggetto composto (Composite)


## Struttura
- Component → interfaccia comune
- Leaf → elemento semplice
- Composite → contiene altri Component
- Client

Il Composite:
- implementa add/remove
- può contenere 1 o più Component

![[Pasted image 20260303203036.png]]
![[Pasted image 20260303203047.png]]

## Composizione vs Aggregazione
- **Composizione**: se il composite viene eliminato, vengono eliminati anche i figli.
- **Aggregazione**: si elimina il gruppo ma non gli oggetti contenuti.

## Conseguenze
Vantaggi:
- Semplifica il client.
- Aggiungere nuovi tipi è semplice.

Svantaggi:
- Può rendere il sistema troppo generico.
- Difficile imporre vincoli sui tipi contenuti.


---

# Decorator Pattern
## Classificazione
Pattern **strutturale**, basato su oggetti.

## Scopo
Aggiungere responsabilità a un oggetto **dinamicamente**.
Alternativa statica: subclassing (a compile time).

## Struttura
- Component
- ConcreteComponent
- Decorator (astratto)
- ConcreteDecorator

Ogni decorator:
- contiene un Component
- aggiunge comportamento prima/dopo la delega

![[Pasted image 20260303203208.png]]

## Differenze
- Con Composite: scopo diverso (gerarchie vs estensione dinamica)
- Con Adapter: Adapter cambia interfaccia, Decorator estende comportamento

## Limite
È possibile applicare più volte la stessa decorazione.  
Il pattern non lo vieta, anche se può non avere senso funzionale.

---

# Observer Pattern
## Classificazione
Pattern **comportamentale**, basato su oggetti.

## Scopo
Definire una dipendenza uno-a-molti tra oggetti, mantenendo basso il coupling.
Quando il Subject cambia stato, tutti gli Observer vengono notificati.

## Struttura
- Subject
    - register()
    - remove()
    - notify()
    
- ConcreteSubject
    - setState()
    - getState()
    
- Observer
    - update()
    
- ConcreteObserver


Workflow:
1. Un oggetto chiama setState().
2. Il Subject chiama notify().
3. Ogni Observer esegue update().
4. L’Observer chiama getState() per leggere il nuovo stato.

![[Pasted image 20260303203245.png]]
![[Pasted image 20260303203256.png]]

## Conseguenze
Vantaggi:
- Accoppiamento astratto.
- Notifica broadcast.

Svantaggi:
- Ogni modifica genera più chiamate.
- Possibili overhead di comunicazione.

---

# Template Method Pattern
## Classificazione
Pattern **comportamentale**, basato su classi.

## Scopo
Definire la struttura di un algoritmo lasciando alle sottoclassi l’implementazione di alcuni passi.

## Struttura
- AbstractClass
    - templateMethod()
    - primitiveOperation()
    
- ConcreteClass

Il templateMethod:
- definisce l’ordine dei passi
- invoca metodi astratti implementati dalle sottoclassi

![[Pasted image 20260303203324.png]]

## Hook
I metodi chiamati dalla superclasse sono detti **hook**:  
offrono comportamento di default, ridefinibile.

## Differenza con Factory Method
- Factory Method → crea oggetti.
- Template Method → generalizza un algoritmo.

## Conseguenze
- Riuso del codice.
- Inversione del controllo: è la superclasse che chiama i metodi delle sottoclassi.

---

# Strategy Pattern
## Classificazione
Pattern **comportamentale**, basato su oggetti.

## Scopo
Definire una famiglia di algoritmi intercambiabili.

## Struttura
- Strategy (interfaccia)
- ConcreteStrategy
- Client

Il client:
- usa l’interfaccia
- può cambiare strategia dinamicamente

Esempio: algoritmi di ordinamento (QuickSort, HeapSort).

## Conseguenze
Vantaggi:
- Elimina blocchi condizionali.
- Separa algoritmo da contesto.

Svantaggi:
- Il client deve conoscere le diverse strategie.

---


# DECORATOR – Approfondimento ed Esempi

## Esempio: TextView con Scroll e Border (pagina 1–2)
### Problema
Si parte da un oggetto base: **TextView** (finestra di testo).  
Si vogliono aggiungere responsabilità dinamiche:
- ScrollDecorator → barra di scorrimento
- BorderDecorator → bordo grafico

Obiettivo: poter aggiungere queste funzionalità **a runtime**, combinandole liberamente.

### Perché non usare subclassing?
Approccio statico (da evitare):
- BorderTextView
- ScrollTextView
- BorderScrollTextView
- ScrollBorderTextView
- ecc.

Problemi:
- Esplosione combinatoria di classi.
- Nessuna flessibilità a runtime.

### Soluzione: Decorator
Si definisce un’interfaccia comune:
- `UIComponent`
    - metodo `draw()`

Implementazioni:
- `TextView` → componente concreto
- `Decorator` → classe astratta che implementa UIComponent e contiene un oggetto UIComponent

Decorator:
- ha stessa interfaccia dell’oggetto decorato
- delega le richieste
- può aggiungere comportamento prima/dopo

![[Pasted image 20260303204924.png]]

### Meccanismo di esecuzione
Nel caso di BorderDecorator:
1. `draw()` invoca `super.draw()`
2. che richiama `draw()` dell’oggetto incapsulato
3. poi viene eseguito `borderDraw()`

Ordine:
- prima disegno TextView
- poi aggiungo il bordo

### Combinazione dinamica
```java
t = new BorderDecorator(
        new ScrollDecorator(
            new TextView()
        )
    );
```

Si ottiene:
- TextView
- con Scroll
- con Border

Ogni decoratore incapsula il precedente.

### Concetto chiave
Il Decorator:
- usa **composizione**
- evita subclassing
- permette estensione dinamica
- può essere annidato più volte


---

# OBSERVER – Esempio applicativo (pagina 2)
Esempio: sistema che mostra risultati di una partita.
- Il risultato cambia frequentemente.
- Le interfacce grafiche devono aggiornarsi automaticamente.

Qui:
- Subject → oggetto che rappresenta il risultato
- Observer → componenti grafici che mostrano il risultato

Quando lo stato cambia:
- il Subject notifica
- gli Observer aggiornano la visualizzazione

![[Pasted image 20260303205020.png]]

---

# TEMPLATE METHOD – Esempio con Document/Application (pagina 2–3)

## Struttura
Classi astratte:
- `Document`
    - save()
    - open()
    - close()
    - read() → varia a seconda del documento
- `Application`
    - create()
    - canOpen()
    - openDocument() → template method

openDocument():

```java
if (canOpen())
    create();
else
    errore;
```

I metodi `create()` e `canOpen()` sono astratti e implementati in `ConcreteApplication`.

### Inversione del controllo
È la classe astratta che definisce l’algoritmo generale.  
Le sottoclassi forniscono i dettagli.

Questo è un punto centrale per l’esame.

![[Pasted image 20260303205054.png]]


---

# Esercizio 1 – Factory + Strategy (pagina 3)
## Problema
Applicazione per download HTTP e FTP.
Requisiti:
- scelta in base a URL
- sistema estendibile

## Prima soluzione (solo Strategy)
Interfaccia:
- `ProtocolStrategy`
    - getFile(url, destinazione)

Implementazioni:
- HTTPStrategy
- FTPStrategy

Problema:
- Il client usa `if/else` per scegliere.
- DownloadApp conosce i protocolli.
- Poco estendibile.

## Soluzione completa: Factory + Strategy
Si introduce:
- `ProtocolFactory`
    - create(url)

La factory:
- analizza l’URL
- crea la Strategy corretta

Il client:
- chiede alla factory
- usa la strategy restituita

Vantaggi:
- Il client non conosce i protocolli.
- Per aggiungere nuovi protocolli si modifica solo:
    - Strategy concreta
    - metodo create()

Concetto importante: combinazione di pattern.


---

# Esercizio 2 – Impiegati con Decorator (pagina 3–4)
## Problema
Ogni impiegato:
- ha metodo `chiSono()`
- può avere responsabilità aggiuntive:
    - CapoArea
    - CapoProgetto

Requisito:
- responsabilità assegnabili dinamicamente


Soluzione naive (da evitare):
- SviluppatoreCapoArea
- SviluppatoreCapoProgetto
- SviluppatoreCapoAreaCapoProgetto
- ecc.

Non scalabile.

## Soluzione con Decorator
Struttura:
- Impiegato (interfaccia)
    - chiSono()
    
- Sviluppatore (concreto)
- RespDecorator (astratto)
    - implementa Impiegato
    - contiene un Impiegato
    
- CapoArea
- CapoProgetto

Meccanismo:
```java
Impiegato pippo = new Sviluppatore("Pippo");
pippo = new CapoProgetto(pippo);
pippo = new CapoArea(pippo);
```

chiSono() restituirà:

"Sono Pippo, sviluppatore e sono anche CapoProgetto e sono anche CapoArea"

### Attenzione
Si può decorare più volte con la stessa responsabilità.  
Il pattern non lo impedisce.

---

# Esercizio 3 – Observer con Java (pagina 4)
Scenario:
- Subject riceve valori casuali.
- Cambia stato in modo probabilistico.
- Watcher e Psychologist osservano.

Uso di:
- `Observable`
- `Observer`

Flusso:
1. receiveValue()
2. se random < 0.5 → cambia stato
3. notifyObservers()
4. update() negli observer
5. contatore changes incrementato

Nel client:
- si registrano gli observer
- si simulano chiamate
- si conta quante volte è cambiato lo stato

Nota: piccole incoerenze nel codice (value/state).

---

# Esercizio 4 – Editor grafico (pagina 4–5)
Requisiti:
- elementi elementari:
    - Frame
    - Testo
    - Immagine
    
- algoritmi di formattazione:
    - RightAlign
    - Justify
    
- elementi decorativi:
    - Border
    - ScrollBar

Soluzione combinata:
- Composite → per struttura gerarchica
- Strategy → per formattazione
- Decorator → per aggiunte grafiche

Struttura:
ElementoGrafico (astratto)
- draw()
- insert()

Immagine, Testo → atomici  
Frame → composito

Decorator → estende ElementoGrafico  
Strategy → incapsula algoritmo di formattazione

Concetto importante: uso combinato di pattern.


---

# Pattern tradotti in Java
## Adapter – Esempio Polygon/Rectangle (pagina 5)
Problema:
- Interfaccia Polygon
- Classe Rectangle incompatibile

### Class Adapter
RectangleClassAdapter:
- estende Rectangle
- implementa Polygon

### Object Adapter
RectangleObjectAdapter:
- contiene Rectangle
- implementa Polygon

Differenza fondamentale:
- ereditarietà vs composizione


---

## Composite – File System (pagina 5)
Struttura ad albero:
- File → elemento semplice
- Directory → composito

Interfaccia comune:
- print()
- add()
- remove()
- getChild()

Il client:
- non distingue tra file e directory

Concetto chiave: uniformità di trattamento.

---

## Decorator – Logging (pagina 6)
Scenario:
- monitorare metodo senza modificarne il codice

Soluzione:
- LoggingDecorator
- wrappa ConcreteComponent
- stampa messaggi prima/dopo execution

Possibile estensione:
- WaitingDecorator → aggiunge pausa


---

## Factory Method – Letture contatori (pagina 6)
Problema:
- AcquisizioneLetture legge file acqua/gas
- Nuovi formati in futuro

Soluzione:
- FileReaderFactory
- ReaderFactory
- sottoclassi specifiche

Separazione:
- codice stabile
- codice soggetto a variazioni


---

# METRICHE DI STRUTTURA (pagina 7–10)
## Perché misurare?
La qualità dell’architettura influenza:
- manutenibilità
- affidabilità
- riusabilità
- facilità di implementazione

L’architettura può essere modellata come **grafo**:
- nodi → moduli
- archi → dipendenze


---

## Modularità
Grado con cui il software è composto da componenti discrete con minimo impatto reciproco.

Si valuta tramite:
- Coesione
- Coupling
- Morfologia
- Information Flow

### Coesione
Grado con cui un modulo realizza un compito ben definito.

### Coupling
Grado di interdipendenza tra moduli.
Obiettivo:
- massimizzare coesione
- minimizzare coupling


---

# Morfologia
Caratteristiche:
- Size → nodi e archi
- Depth → distanza radice-nodo
- Width → nodi per livello
- Edge-to-Node Ratio → densità

Si vuole un grafo simile a un albero.

---

## Tree Impurity
Misura quanto il grafo è lontano da un albero.

Formula: $$m(G) = 2(e − n + 1) / ((n − 1)(n − 2))$$

dove:
- e = archi
- n = nodi

Valore tra 0 e 1.

Minore m(G) → migliore morfologia.

![[Pasted image 20260303205628.png]]


---

## Internal Reuse
$$r(G) = e − n + 1$$

Minore r(G) → migliore morfologia  
(ma non sufficiente da sola)

---

# Information Flow
Misura la complessità intermodulare.

Considera:
- complessità interna
- complessità dell’interfaccia

## Fan-In
Numero di flussi che entrano nel modulo:
- chiamate ricevute
- valori di ritorno
- uso di dati globali

## Fan-Out
Numero di flussi che escono:
- chiamate fatte
- aggiornamenti a dati globali

Alto fan-in + fan-out → modulo centrale, critico.


---

## Formula Henry & Kafura
$$IF(Mi) = [fan-in(Mi) × fan-out(Mi)]²$$

Per sistema:
$$IF = Σ IF(Mi)$$

Considera:
- flusso di dati
- flusso di controllo


---

## Variante Shepperd
Considera solo flusso di dati.

![[Pasted image 20260303205809.png]]


---

# Structural Measurements
Tre componenti:
1. Flusso di controllo
2. Flusso di dati
3. Struttura dei dati

Utili per:
- reverse engineering
- testing (path coverage)
- ristrutturazione codice
- data flow analysis

Nota importante: coprire tutti i percorsi non garantisce assenza di difetti logici.

---

