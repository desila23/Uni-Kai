## Definizione di IA
L’**Intelligenza Artificiale (IA)** è la disciplina che studia **come creare sistemi capaci di osservare, comprendere e riprodurre comportamenti intelligenti**.  
In altre parole, mira a costruire macchine in grado di **percepire l’ambiente**, **ragionare sulle informazioni ricevute** e **agire in modo autonomo** per raggiungere un obiettivo.
## Definizione di Agente
Nel linguaggio dell’IA, un **agente** è un’entità autonoma capace di **percepire l’ambiente** (attraverso percettori) e **intervenire su di esso** attraverso le proprie azioni con gli attuatori.  
Un singolo sistema può essere considerato un agente, ma in molti casi si parla di **sistemi multi-agente**, in cui più entità collaborano o competono per raggiungere determinati obiettivi.
## IA FORTE VS DEBOLE
L’IA può essere studiata e progettata da diverse prospettive. Le due principali sono:
- **IA FORTE**
	- **L’IA forte** si pone l’obiettivo ambizioso di *riprodurre il ragionamento umano*.
	- Non si limita quindi a fornire risposte corrette, ma cerca di *simulare i processi cognitivi* che portano un essere umano a elaborarle.
- **IA DEBOLE**
	- L’**IA debole**, al contrario, punta a *risolvere problemi pratici specifici*, senza preoccuparsi di replicare il pensiero umano.  
	- L’obiettivo è ottenere *prestazioni efficaci*, anche se il sistema non “comprende” davvero ciò che fa.  

## UMANITÀ O RAZIONALITÀ
![[Pasted image 20251013184910.png]]
L’IA può essere progettata per ispirarsi a due diversi principi:

- il **comportamento umano**, che riflette come le persone pensano e agiscono nella realtà;
- la **razionalità pura**, cioè l’ottimizzazione logica delle decisioni.
## Problem Solving
Una delle funzioni centrali dell’IA è il **problem solving**, ossia la capacità di risolvere problemi complessi partendo da informazioni incomplete o ambigue.

## Instruction Tuning
L’**Instruction Tuning** è una tecnica di addestramento in cui il modello impara a **seguire istruzioni testuali** in modo coerente.  
L’input è spesso costituito da una *premessa* seguita da una *domanda*, che attiva un processo di ragionamento iterativo.

## Prompt
Il **prompt** rappresenta la **base di comunicazione tra l’utente e il modello**.  
È una combinazione di tre elementi:
- *premessa*, contesto o introduzione al compito da eseguire
- *domanda*, ciò che si chiede al modello
- *contesto*, informazioni aggiuntive

## Il Test di Turing

Nel 1950, **Alan Turing** propose un esperimento per stabilire se una macchina potesse essere considerata intelligente.

> “Un sistema è intelligente se un osservatore umano, dialogando con esso, non riesce a distinguere se sta parlando con una persona o con una macchina.”

LEZ 2 -> 

---  
## L’Effetto IA
Ogni volta che una tecnologia basata sull’IA diventa di uso comune, **smettiamo di percepirla come intelligenza artificiale**.  
È il fenomeno noto come **Effetto IA**.


## Ciclo di un agente intelligente
- Ciclo dell'agente
	- *percepire una azione mediante i sensori*
		- riceve dei dati
	- *decido*
		- elabora la percezione ed effettua la sua funzione agente
	- *agisco con una azione*
		- esegue l'azione scelta anche mediante gli effettori
	- *si aggiorna*
		- aggiorna l'ambiente contando l'azione appena eseguita
![[Pasted image 20251013185628.png]]
## Percezioni e Azioni dell'agente
- come abbiamo detto l'agente riceve *percezioni* ,ovvero l'**input ricevuto dai sensori** dell'agente
	- l'insieme di tutte le percezioni passate rappresentano la *Sequenza Percettiva*
- La *Funzione Agente* serve per definire le azioni che esso può eseguire
	- Definisce l'**azione da compiere per ogni possibile sequenza percettiva**
	    - È una **descrizione matematica astratta** del comportamento dell'agente: $f: P^* \to A$ 
		    - (dove $P^*$ è l'insieme delle sequenze percettive e $A$ è l'insieme delle azioni)
- Il *programma Agente* è l'**implementazione concreta** della funzione agente, in esecuzione all'interno di un sistema fisico (l'architettura dell'agente)
## Struttura di un Agente con Ambiente
![[Pasted image 20251016085815.png]]

## Agenti Razionali
- quando si parla di *agente intelligente* si intende proprio *agente razionale*
	- **Razionalità $\neq$ Onniscienza:** Un agente razionale non è necessariamente **onnisciente** o addirittura *onnipotente*
- L'agente Razionale è colui che per ogni possibile sequenza di percezioni, cerca di scegliere un'azione che **massimizzi il valore atteso della sua misura di prestazione**, considerando le sue percezioni passate e le sue capacità. 
	- Per **Misura di Prestazione** si intende un criterio volto a valutare l'efficacia di una azione scelta dall'agente 
		- Per costruire una misura di prestazione utile, bisogna considerare **due aspetti fondamentali**:
			- *Natura* della misura esterna
				- La misura deve essere **esterna all’agente**, cioè guardare **agli effetti che le sue azioni producono sull’ambiente**, non ai processi interni.
			- *Scopo* della misura → “Criterio del progettista”
				- La misura della prestazione è quindi uno strumento per **definire la razionalità** del comportamento: ossia, cosa significa “agire bene” in quel contesto.
				- questo è demandato al progettista

## 4 fattori della razionalità
La scelta razionale di un agente in un dato momento dipende da quattro elementi chiave:
- *Misura di prestazione*
	- Un'azione è razionale solo se contribuisce positivamente al raggiungimento degli obiettivi stabiliti da questa misura
- *Conoscenza pregressa*
	- La conoscenza pregressa (come ad esempio le regole della fisica o la mappa di un'area) aiuta l'agente a **prevedere le conseguenze** delle sue azioni
- *Percezioni presenti e passate*
	- Tutta la storia delle percezioni ricevute dai sensori.
- *Capacità dell'agente*
	- Un'azione è razionale solo se rientra nelle **possibilità di esecuzione** dell'agente.
## Agenti autonomi
Un agente è definito *autonomo* nella misura in cui il suo comportamento dipende dalla sua esperienza (cioè, dalle percezioni passate e dall'apprendimento che ne deriva). 
## Definizione di Ambiente Operativo e PEAS
- Il **problema P** di un agente, ovvero la sua attività principale, è definito dalla **caratterizzazione adeguata dell'ambiente operativo**.
- La progettazione di un **agente razionale** corrisponde alla **soluzione** per questo problema.

Il framework **PEAS** fornisce un metodo sistematico per specificare *l'ambiente operativo*, identificando i quattro fattori cruciali che influenzano la progettazione dell'agente:
##### **P**erformance (Prestazioni)
- **Definizione:** La **misura di prestazione** che definisce il **criterio del successo**. Valuta la sequenza di stati dell'ambiente per determinare la desiderabilità del comportamento dell'agente.
- _Esempio: Autista di taxi automatico:_ Sicurezza, velocità, legalità, massimizzazione dei profitti.
##### **E**nvironment (Ambiente)
- **Definizione:** La **parte dell'universo** di cui ci interessa lo stato quando progettiamo l'agente — la parte che influenza ciò che l'agente percepisce e sulla quale influiscono le sue azioni.
- _Esempio: Autista di taxi automatico:_ Strade, altri veicoli nel traffico, pedoni, clienti, tempo atmosferico.
##### **A**ctuators (Attuatori)
- **Definizione:** I **mezzi** che l'agente utilizza per **agire sull'ambiente**.
- _Esempio: Autista di taxi automatico:_ Sterzo, acceleratore, freni, clacson.
##### **S**ensors (Sensori)
- **Definizione:** I **dispositivi** attraverso i quali l'agente **percepisce** il suo ambiente. Il dato percepito è chiamato **percezione** (_percept_).
- _Esempio: Autista di taxi automatico:_ Telecamere, radar, tachimetro, GPS.
#### Esempio con Chat GPT
![[Pasted image 20251016093738.png]]
## Proprietà dell’ambiente e del problema
I diversi ambienti di lavoro di un agente si caratterizzano lungo alcune dimensioni che ne influenzano la complessità e la progettazione.
### Osservabilità
- **Completamente Osservabile**
	- L'agente ha accesso allo **stato completo** dell'ambiente in ogni momento, attraverso i suoi sensori. È sufficiente che i sensori misurino tutti gli aspetti _rilevanti_ per la scelta dell'azione.

- **Parzialmente Osservabile**
	- L'agente non può vedere l'intero stato dell'ambiente a causa di sensori rumorosi, inaccurati o incompleti. Se l'agente non ha sensori, l'ambiente è **inosservabile**.
### Numero di agenti
- **Agente Singolo**
	- L'ambiente contiene solo un agente che opera e le "altre" entità possono essere trattate come semplici oggetti che si comportano secondo le leggi della fisica.

- **Multi-Agente**
	- L'ambiente contiene **più agenti**, e la distinzione chiave è se il comportamento di un'altra entità può essere descritto come il tentativo di **massimizzare una misura di prestazione** il cui valore dipende dalle azioni del tuo agente.

### Prevedibilità del Modello di Transizione
- **Deterministico**
	- Lo stato successivo dell'ambiente è **completamente determinato** dallo stato corrente e dall'azione dell'agente (o degli agenti).
- **Stocastico**
	- Il modello dell'ambiente è associato esplicitamente a **probabilità** per i risultati delle azioni (es. "c'è una probabilità del 25% che domani piova").

- **Non Deterministico**
	- Lo stato successivo non è completamente determinato, e le varie possibilità di risultato sono elencate **senza essere quantificate** (es. "c'è la possibilità che domani piova").
### Struttura del Ciclo di Interazione
- **Episodico**
	- L'esperienza dell'agente è divisa in episodi atomici. Ogni decisione è **indipendente** dalle azioni intraprese negli episodi precedenti.

- **Sequenziale**
	- Ogni decisione può **influenzare tutte le decisioni successive**. Le azioni a breve termine hanno conseguenze a lungo termine (es. gli scacchi, guidare).
### Cambiamento Temporale
- **Statico**
	- L'ambiente **non cambia** mentre l'agente sta decidendo come agire.

- **Dinamico**
	- L'ambiente **può cambiare** mentre l'agente sta decidendo. Richiede che l'agente osservi continuamente e risponda rapidamente (es. un taxi autonomo).

- **Semi-Dinamico**
	- L'ambiente in sé **non cambia** col tempo, ma la **misura di prestazione** (la valutazione) dell'agente sì (es. scacchi giocati con l'orologio).
### Natura delle Variabili
- **Discreto**
	- Lo stato dell'ambiente, la gestione del tempo, le percezioni e le azioni sono rappresentabili con un **numero finito** di valori (es. le caselle su una scacchiera, input digitali).

- **Continuo**
	- Le variabili (stato, tempo, azioni) sono descritte da **numeri reali** e possono assumere un numero infinito di valori (es. la velocità di un'auto, l'angolo di sterzo).
### Visibilità
- **Ambiente Noto (Known)**
	- L'agente (o il suo progettista) **conosce le regole del gioco**. Sono noti i risultati (o le probabilità di risultato, se l'ambiente è stocastico) per tutte le azioni.
	- L'agente può eseguire una **ricerca _offline_** (pianificazione) per calcolare la sequenza di azioni ottimali prima di agire.

- **Ambiente Ignoto (Unknown)**
	- L'agente **non conosce le regole del gioco**. L'agente non sa come l'ambiente reagirà alle sue azioni.
	- L'agente **dovrà apprendere come funziona** l'ambiente. Dovrà compiere **azioni esplorative** (sperimentazione) per acquisire la conoscenza dinamica necessaria a prendere buone decisioni.
#### ESEMPI
![[Pasted image 20251016094914.png]]

## Ambiente simulato
In un sistema automatizzato o simulato, l’ambiente **non è reale**, ma **modellato da un software** che ne gestisce gli stati e le regole di funzionamento.
Il software che simula l’ambiente deve ricreare l’intero **ciclo percezione–azione–valutazione**.  
Per farlo, svolge una serie di funzioni fondamentali:
- generare stimoli per gli agenti
- raccogliere le azioni in risposta
- aggiornare il proprio stato
- attivare altri processi implicati dal cambiamento effettuato
- valutare le prestazioni degli agenti
#### Esempio di **ambiente di simulazione** che serve per valutare uno o più **agenti**.
![[Pasted image 20251016140906.jpg]]
## STRUTTURA DI UN AGENTE
$$ AGENTE=ARCHITETTURA + PROGRAMMA$$
- l'agente ha una sua funzione ( come spiegato in precedenza)
- `Agent()`
$$Agent:Percezioni \rightarrow Azioni$$
##### Pseudo programma agente
![[Pasted image 20251016141848.jpg]]

# Diverse architetture di agenti
- <u><font color="#4bacc6">Basata su tabella</font></u>
	- Ogni azione dell'agente viene decisa in base a una **tabella che associa un'azione ad ogni possibile sequenza di percezioni**.  
	- gli *agenti reattivi semplici* usano questo tipo di architettura
![[Pasted image 20251016143808.jpg]]
Partendo dall'ambiente, l'agente
- riceve delle percezioni tramite i sensori
	- capisce lo stato dell'ambiente
- guarda nella sua tabella (percezioni -> azioni)
	- esegue l'azione  
![[Pasted image 20251016144146.jpg]]


- <u><font color="#4bacc6">Basata su modello</font></u>
- Gli agenti che usano questa architettura hanno una **memoria interna** che gli permette di rappresentare il mondo in cui si trovano. questi **mantengono e aggiornano uno stato interno** che descrive _cosa credono che stia succedendo_ 
![[Pasted image 20251016144855.jpg]]
🔹 1️⃣ Percezione e costruzione del modello del mondo
L’agente:
- **riceve le percezioni** dall’ambiente attraverso i **sensori**;
- elabora da queste informazioni la rappresentazione di **“what the world is like now”**, cioè com’è il mondo in questo momento;
- **aggiorna lo stato interno** (la sua memoria) combinando:
    - le percezioni **attuali**,
    - le **percezioni passate**,
    - la conoscenza di **come il mondo evolve naturalmente** nel tempo (“how the world evolves”),
    - e la conoscenza di **come le proprie azioni influenzano il mondo** (“what my actions do”).
🔹 2️⃣ Predizione e decisione
Una volta aggiornato il proprio stato interno, l’agente:
- utilizza il modello del mondo per **prevedere** cosa accadrà dopo e per valutare le possibili conseguenze delle sue azioni;
- decide **“what action I should do now”**, ossia l’azione più opportuna da eseguire in base:
    - al proprio stato interno aggiornato,
    - alle **regole condizionali azione–condizione** (_condition–action rules_),
    - e alla **misura di prestazione** (il criterio con cui il progettista valuta l’efficacia del comportamento).
🔹 3️⃣ Esecuzione dell’azione
Infine:
- l’agente invia l’azione scelta agli **attuatori**,
- che la eseguono sull’ambiente, modificandone lo stato.

👉 A questo punto il ciclo ricomincia: l’ambiente cambia, genera nuove percezioni e l’agente aggiorna di nuovo il proprio modello interno.

![[Pasted image 20251016145402.jpg]]


- <u><font color="#4bacc6">Basata su obiettivo</font></u>
	- Gli **agenti basati su obiettivo** sono un’evoluzione degli agenti basati su modello.  
	- Come loro, **mantengono uno stato interno** del mondo (memoria e conoscenza di come si evolve), 
	- ma in più **hanno un obiettivo da raggiungere (goal)** che guida la scelta delle azioni.
![[Pasted image 20251016145830.jpg]]
L’**agente basato su obiettivo**, **va oltre**:  
→ non si limita a prevedere _cosa succederà_, ma **decide cosa vuole che succeda**, e **sceglie le azioni** per raggiungere un _goal_ (obiettivo) desiderato.

- <u><font color="#4bacc6">Basato su utilità</font></u>
Gli **agenti con valutazione di utilità** sono un’estensione degli agenti basati su obiettivo.  
Anziché limitarsi a _raggiungere un goal_, valutano **quanto è “buono” o vantaggioso** ciascun possibile stato del mondo.
- utilizzano una funzione di utilità
	- È una **funzione che assegna a ogni stato un valore numerico** → rappresenta **quanto l’agente è soddisfatto** in quello stato (“quanto sarò felice se arrivo lì”).
$$U(s) = \text{grado di utilità dello stato }$$

- <u><font color="#4bacc6">Basata su apprendimento</font></u>
	- Questi agenti sono in grado di **migliorare il proprio comportamento nel tempo**, grazie a un meccanismo di apprendimento interno.
![[Pasted image 20251016150117.jpg]]
- 🔹 **Performance Element**
	- È il **cuore operativo** dell’agente:
	- Riceve **le percezioni** dai sensori.
	- Sceglie **le azioni** da eseguire tramite gli attuatori.
	- È la parte che determina **“come si comporta l’agente ora”**.

- 🔹 **Critic**
	- Valuta la qualità delle azioni dell’agente.
	- Confronta le prestazioni osservate con un **performance standard** (criterio di riferimento) e fornisce **feedback**.
	- Usa le percezioni ricevute dai sensori per osservare gli effetti delle azioni.
	- Produce un segnale di feedback (positivo o negativo) che dice all’agente quanto bene ha agito.

- 🔹 **Learning Element**
	- Il **modulo di apprendimento** utilizza il feedback del _critic_ per **migliorare il comportamento futuro** dell’agente.
	- Aggiorna il _performance element_ (cioè modifica il modo in cui l’agente prende decisioni).

- 🔹 **Problem Generator**
	- Suggerisce **nuove azioni da provare** per ottenere esperienze utili all’apprendimento.

## Rappresentazione degli stati
Quando un agente deve ragionare o apprendere, ha bisogno di **una rappresentazione interna dello stato del mondo**.  

##### 1. Rappresentazione atomica
![[Pasted image 20251016150129.jpg]]
- Ogni **stato** o **situazione** è considerato come un **blocco unico e indivisibile**.
- L’agente conosce solo _che quello stato esiste_, ma **non ha informazioni sulla sua struttura interna**.
- È il modello più semplice:
	→ **stati finiti**, **transizioni semplici**, a volte con **probabilità associate** (se stocastico).

##### 2. Rappresentazione fattorizzata
![[Pasted image 20251016150349.jpg]]
- Ogni stato è **descritto tramite un insieme di variabili (fattori)**.
- Invece di trattare tutto come un unico blocco, l’agente **rappresenta le caratteristiche principali** dello stato (es. posizione, temperatura, velocità, ecc.).
- Queste variabili possono essere viste come **dimensioni in uno spazio vettoriale**.

##### 3. Rappresentazione strutturata
![[Pasted image 20251016150400.jpg]]
- È la più **ricca e complessa**.
- Gli oggetti non sono solo elenchi di valori, ma **entità con relazioni tra loro** (come in un grafo o in un linguaggio logico).
- Permette di descrivere **relazioni, gerarchie e dipendenze**.

LEZ.3 -> 

---
## AGENTI RISOLUTORI DI PROBLEMI
- si basano sull'architettura basata sui goal
	- Tipologia di agenti che puntano a risolvere un problema attraverso un algoritmo ben definito
		- Di solito usano algoritmi di ricerca
			- che possono essere di tipo:
				- *informato*
					- L’agente stima quanto è vicino al goal, riducendo la ricerca
						- Greedy Search, A*
				- *non informato*
					- L’agente non conosce la distanza dal goal, esplora tutto lo spazio
						- BFS, DFS, Uniform Cost
	- l’agente risolutore di problemi **costruisce prima un piano completo di azioni**, tramite un **processo di ricerca interna**.
#### 🧩 Rappresentazione e categorie
- Gli agenti risolutori di problemi utilizzano rappresentazioni **atomiche**,  
    dove gli **stati del mondo** sono **entità indivisibili** (nodi di un grafo) **senza struttura interna visibile**.
- Gli agenti che invece utilizzano **rappresentazioni fattorizzate o strutturate** (cioè con sottocomponenti interne agli stati) sono detti **agenti pianificatori**.
- Il **ragionamento dell’agente atomico** è puramente **algoritmico** e basato su **modelli di grafo** (stati = nodi, azioni = archi).
Gli agenti risolutori di problemi operano in ambienti **semplici e controllabili**, tipicamente:
- Episodici
- A singolo agente
- **Completamente osservabili**
- **Deterministici**
- **Statici** (non cambiano mentre l’agente pensa)
- **Discreti** (stati e azioni finite)
- **Noti** (modello di transizione conosciuto)
####  Esecuzione: anello aperto vs anello chiuso
- In un **ambiente completamente osservabile, deterministico e noto**, la soluzione è una **sequenza fissa di azioni**.  
    → L’agente può **ignorare le percezioni durante l’esecuzione**:  
    si parla di **sistema ad anello aperto (open-loop)**.
- Se invece:
    - il modello può essere impreciso, oppure
    - l’ambiente non è deterministico,  
        → l’agente deve **monitorare le percezioni e riadattarsi**,  
        quindi lavora in **anello chiuso (closed-loop)**.
#### ⚙️  Le quattro fasi principali del processo di risoluzione

| Fase                               | Descrizione                                         |
| ---------------------------------- | --------------------------------------------------- |
| **1. Formulazione dell’obiettivo** | L’agente decide cosa vuole raggiungere              |
| **2. Formulazione del problema**   | Definisce stati, azioni, transizioni e costi        |
| **3. Ricerca (Search)**            | Calcola una sequenza ottimale di azioni nel modello |
| **4. Esecuzione (Execution)**      | Esegue il piano nel mondo reale                     |

📌 Durante la **ricerca**, l’agente non agisce fisicamente: pensa, simula e valuta internamente.
## DEFINIZIONE FORMALE DEL PROBLEMA DI RICERCA
Un **problema di ricerca** è una **descrizione astratta** di una situazione in cui un agente deve **trovare una sequenza di azioni** che porti dallo **stato iniziale** a uno **stato obiettivo**.
$$\text{Problema di ricerca} = \langle S, S_0, A, Result, Goal, C \rangle$$
Un problema di ricerca è definito da **cinque elementi principali**:

|#|Componente|Descrizione|
|---|---|---|
|**1️⃣**|**Stato iniziale**|È lo stato in cui si trova l’agente all’inizio del problema.|
|**2️⃣**|**Azioni possibili**|La funzione **Azioni(s)** restituisce l’insieme finito di azioni eseguibili nello stato `s`. Ogni azione è _applicabile_ in `s`.  <br>Es: `Azioni(Arad) = {VersoSibiu, VersoTimisoara, VersoZerind}`|
|**3️⃣**|**Modello di transizione**|Descrive come le azioni modificano lo stato del mondo.  <br>Formalmente: `Risultato(s, a) = s′` indica lo stato successivo ottenuto eseguendo l’azione `a` nello stato `s`.  <br>Es: `Risultato(Arad, VersoZerind) = Zerind`|
|**4️⃣**|**Insieme di stati obiettivo**|Contiene uno o più stati che soddisfano il goal dell’agente (le condizioni di successo).|
|**5️⃣**|**Funzione di costo**|La funzione `CostoAzione(s, a, s′)` (o `c(s, a, s′)`) assegna un valore numerico positivo al costo di eseguire `a` in `s` per raggiungere `s′`.  <br>Serve per confrontare soluzioni e trovare quella più economica.|
- Una **sequenza di azioni** forma un **cammino** (_path_) attraverso lo spazio degli stati.
- Una **soluzione** è un cammino che parte dallo stato iniziale e arriva a uno stato obiettivo.
- Una **soluzione ottima** è quella con **costo totale minimo**, rispetto alla funzione di costo definita.
- Lo **spazio degli stati** può essere rappresentato come un **grafo**:
    - i **nodi** (vertici) rappresentano gli **stati**;
    - gli **archi orientati** rappresentano le **azioni** e le **transizioni**;
    - i **pesi degli archi** rappresentano i **costi delle azioni**.
#### Modello e Tipi di astrazione
Quando formuliamo un problema (es. “**raggiungere una certa città**”), stiamo creando un **modello**,  
cioè una **descrizione matematica astratta** della realtà.  
Non rappresentiamo il mondo in tutti i suoi dettagli, ma solo gli aspetti **rilevanti per la risoluzione del problema**.
Il processo con cui **semplifichiamo una rappresentazione** eliminando dettagli non essenziali  
è chiamato **astrazione**.


|Tipo di astrazione|Definizione|Utilità|
|---|---|---|
|**Astrazione Valida**|Ogni soluzione trovata nel modello astratto può essere **espansa** in una soluzione valida nel mondo reale più dettagliato.|Garantisce che la soluzione “astratta” sia **corretta e applicabile** nella realtà.|
|**Astrazione Utile**|Le azioni nella soluzione astratta sono **più facili o più economiche** da eseguire rispetto a quelle nel problema reale.|Permette di **semplificare la ricerca** e ridurre il costo computazionale.|

📌 Una buona astrazione è **sia valida che utile**.
 
### PROBLEMI ESEMPLIFICATIVI E REALI
Lo studio dei **problemi di ricerca** avviene partendo da **problemi esemplificativi (standardizzati)**,  
che servono a **testare metodi di risoluzione**, per poi passare a **problemi reali**,  
più complessi e legati a contesti pratici.

- I problemi **esemplificativi**:
	- Servono per **illustrare o mettere alla prova diversi metodi di risoluzione** (ricerca, ottimizzazione, pianificazione, ecc.).
	- Sono **astratti**, **semplificati** e **standardizzati**, cioè formulati in modo generico per poter essere applicati a diversi algoritmi.
- Invece, i **problemi reali**:
    - Hanno una formulazione specifica e non standard,
    - e le soluzioni trovate hanno **utilità pratica**.
###### 🔸 Problemi ESEMPLIFICATIVI
###### 🧹 Esempio: Mondo dell’Aspirapolvere
Uno dei problemi classici su griglia, usato per testare gli algoritmi di ricerca di base.
![[Pasted image 20251021125057.jpg]]
![[Pasted image 20251021125109.jpg]]


|Elemento|Descrizione|
|---|---|
|**Stati**|Ogni stato indica la posizione dell’agente e la presenza o assenza di sporco in ogni cella.  <br>In un mondo con `n` celle, ci sono `n × 2ⁿ` stati possibili.|
|**Stato iniziale**|Può essere qualunque configurazione iniziale di agente e sporco.|
|**Azioni**|`Sinistra`, `Destra`, `Aspira` (nel mondo a due celle).|
|**Modello di transizione**|`Aspira` rimuove lo sporco dalla cella; `Sinistra` e `Destra` spostano l’agente (se non ci sono muri).|
|**Stati obiettivo**|Stati in cui **tutte le celle sono pulite**.|
|**Costo di azione**|Tutte le azioni hanno **costo uniforme = 1**.|

📌 Lo **spazio degli stati** è un piccolo grafo, gestibile, utile per illustrare i concetti di esplorazione e soluzione ottimale.

---

###### 🧩 Puzzle dell’Otto

Un classico problema di ricerca usato per confrontare algoritmi come A*, BFS, DFS, ecc.
![[Pasted image 20251021132649.jpg]]

|Elemento|Descrizione|
|---|---|
|**Stati**|Tutte le possibili configurazioni della scacchiera 3×3 con i numeri da 1 a 8 e una casella vuota.|
|**Stato iniziale**|Una configurazione specifica del puzzle.|
|**Obiettivo**|Configurazione ordinata (numeri da 1 a 8, casella vuota in basso a destra).|
|**Azioni**|Spostare la casella vuota **su, giù, destra, sinistra**.|
|**Goal test**|Verificare se la configurazione corrente corrisponde allo stato obiettivo.|
|**Costo del cammino**|Costo uniforme (ogni mossa = 1).|
|**Spazio degli stati**|Molto ampio, può contenere cicli; adatto a testare efficienza degli algoritmi.|

###### 👑 Problema delle Otto Regine
![[Pasted image 20251021132907.jpg]]

Un altro problema classico per testare **formulazioni diverse** e strategie di ricerca.

|Formulazione|Descrizione|Spazio di ricerca|
|---|---|---|
|**Incrementale 1 (base)**|Si aggiungono regine una per volta su qualunque casella.|~1.8 × 10¹⁴ sequenze (molto grande).|
|**Incrementale 2 (migliorata)**|Si aggiunge una regina per colonna, assicurandosi che non minacci le precedenti.|Solo 2057 stati (molto più efficiente).|
|**A stato completo**|La scacchiera contiene 8 regine (una per colonna) e si spostano finché non sono tutte non minacciate.|Usata in algoritmi di ricerca locale (es. _Hill Climbing_).|

📌 Questo problema mostra come **la formulazione influenza l’efficienza della ricerca**:  
più il modello è compatto e vincolato, più facile sarà trovare una soluzione.


######  Problemi del mondo reale

I problemi reali sono molto più **complessi** dei modelli astratti e le loro soluzioni sono **praticamente utili**.  
Spesso la loro formulazione è **specifica e non standardizzata**.
✈️ Esempio: Problema di ricerca dell’itinerario aereo

| Elemento                   | Descrizione                                                                                                         |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Stati**                  | Includono posizione (aeroporto), ora corrente e altre informazioni storiche (es. tratte, tariffe, voli precedenti). |
| **Stato iniziale**         | L’aeroporto di partenza dell’utente.                                                                                |
| **Azioni**                 | Prendere un volo disponibile dopo l’ora corrente, rispettando i tempi di trasferimento.                             |
| **Modello di transizione** | Lo stato successivo aggiorna la posizione e l’orario di arrivo del volo.                                            |
| **Stato obiettivo**        | Aeroporto di destinazione desiderato.                                                                               |
| **Costo dell’azione**      | Combinazione di fattori: costo del biglietto, tempo, durata, coincidenze, dogane, qualità del posto, ecc.           |

# 🔎 Algoritmi di Ricerca

Un **algoritmo di ricerca** riceve in input un **problema di ricerca** e restituisce una **soluzione** (un cammino verso lo stato obiettivo) o un **fallimento**.
- Gli algoritmi costruiscono un **albero di ricerca** sul **grafo dello spazio degli stati**.
- Ogni **nodo** rappresenta uno **stato**, ogni **ramo** un’**azione**.
- **nodo** dell’albero contiene:
	- `n.stato` → lo stato rappresentato
	- `n.padre` → il nodo da cui è stato generato
	- `n.azione` → l’azione che ha portato a questo stato
	- `n.costo-cammino = g(n)` → costo totale dal nodo iniziale fino a `n`
- La **radice** corrisponde allo stato iniziale.
	- Espandere un nodo = generare i **nodi figli** applicando le azioni possibili (`Risultato(s, a)`).

📌 **Distinzione chiave:**

- **Spazio degli stati** → tutti i possibili stati del mondo.

- **Albero di ricerca** → cammini esplorati dall’agente durante la ricerca.

- La **frontiera** è l’insieme dei nodi generati ma non ancora espansi.
	- Separa gli **stati esplorati** (interni) da quelli **ancora da esplorare** (esterni).
	- È implementata come una **coda**(FIFO,LIFO,PRIOR) , con le operazioni:
		- `VUOTA?(coda)` → verifica se la frontiera è vuota
		- `POP(coda)` → estrae un nodo dalla frontiera
		- `INSERISCI(elemento, coda)` → aggiunge nuovi nodi (figli)
- La **strategia di scelta del nodo da espandere** determina il tipo di algoritmo (BFS, DFS, A*, ecc.).
- *tipi di misura di prestazioni: *

|Criterio|Descrizione|
|---|---|
|**Completezza**|Trova una soluzione se esiste.|
|**Ottimalità**|Restituisce la soluzione di costo minimo.|
|**Tempo**|Numero di nodi generati.|
|**Spazio**|Memoria richiesta.|

$$\text{Costo totale} = \text{Costo della ricerca} + \text{Costo del cammino soluzione}$$

L’obiettivo è **minimizzare il costo complessivo**: trovare una soluzione **valida e conveniente** con il minor sforzo possibile.

#### 🧮 Tipi di Gestione della Frontiera (strategie)

|Strategia|Struttura dati|Comportamento|
|---|---|---|
|**FIFO**|Coda|Ricerca in ampiezza (Breadth-First Search)|
|**LIFO**|Pila|Ricerca in profondità (Depth-First Search)|
|**Coda con priorità**|Ordinata da una funzione di costo o euristica|Ricerca di costo uniforme, Greedy, A*|

##### 🔹 Tipi di strategie

###### 🔸 Non informate (cieche)

- Non usano informazioni sul goal.  
    Esempi:
    - **Ricerca in ampiezza (BFS)**
    - **Ricerca di costo uniforme (UCS)**
    - **Ricerca in profondità (DFS)**
    - **Profondità limitata**
    - **Approfondimento iterativo**
###### 🔸 Informate (euristiche)
- Usano una **funzione euristica** `h(n)` che stima la distanza dal goal.  
    Esempi:
    - **Greedy Search**
    - **A*** (ricerca ottimale euristica)

📌 Ogni strategia cerca un equilibrio tra **tempo**, **spazio**, **completezza** e **ottimalità**.

#### Pseudocodice generico di ricerca albero
![[Pasted image 20251021140935.jpg]]

#### Pseudocodice più dettagliato
![[Pasted image 20251021141804.jpg]]


#### Ricerca in ampiezza
![[Pasted image 20251021142331.jpg]]
##### Pseudo
![[Pasted image 20251021142416.jpg]]
- È una **ricerca non informata** e **sistematica**, completa anche su spazi di stati infiniti (se ogni stato ha un numero finito di successori).
- Usa una **coda FIFO**: i nuovi nodi vengono aggiunti in fondo, e quelli più vecchi vengono espansi per primi.

| Aspetto            | Descrizione                                                                              |
| ------------------ | ---------------------------------------------------------------------------------------- |
| **Frontiera**      | Implementata come coda FIFO                                                              |
| **Test obiettivo** | Può essere effettuato subito dopo la generazione di un nodo (“anticipato”)               |
| **Raggiunti**      | Insieme degli stati già visitati, per evitare di riespandere stati già esplorati         |
| **Espansione**     | Tutti i nodi di profondità $d$ vengono generati **prima** di quelli a profondità $d + 1$ |

#####  Proprietà della BFS

| Proprietà                        | Valore                                                   |
| -------------------------------- | -------------------------------------------------------- |
| **Completezza**                  | ✅ Sempre completa (trova una soluzione se esiste)        |
| **Ottimalità**                   | ✅ Ottimale se **tutti i costi delle azioni sono uguali** |
| **Tempo**                        | $O(b^d)$                                                 |
| **Spazio**                       | $O(b^d)$                                                 |
| **Fattore di ramificazione (b)** | Numero massimo di successori di un nodo                  |
| **Profondità (d)**               | Profondità della soluzione più superficiale              |
| **Cammino massimo (m)**          | Lunghezza massima di un cammino nello spazio di ricerca  |
##### Complessità
Se tutti gli operatori hanno costo costante $k$:
$g(n) = k \times \text{profondità}$
- **Complessità temporale:**
    $$T(b, d) = b + b^2 + \dots + b^d = O(b^d)$$
- **Complessità spaziale:**  
    Anch’essa $$O(b^d)$$ poiché tutti i nodi devono essere mantenuti in memoria.
📌 Entrambe le complessità sono **esponenziali**, quindi la BFS è praticabile solo per problemi di piccola scala.
#### Ricerca a Costo Uniforme (Uniform-Cost Search, UC)
- È una **generalizzazione della ricerca in ampiezza**, usata quando **le azioni hanno costi diversi**
- L’idea è di **espandere sempre il nodo con costo di cammino minimo** $g(n)$
- Usa una **coda con priorità** come frontiera (invece della coda FIFO della BFS).
- Espande i nodi **in ordine di costo crescente**
- Si comporta come l’**algoritmo di Dijkstra**: la ricerca si “espande a onde” di costo uniforme
![[Pasted image 20251021143052.jpg]]
## Proprietà

| Proprietà       | Descrizione                                                                 |
| --------------- | --------------------------------------------------------------------------- |
| **Completezza** | ✅ Completa se $\varepsilon > 0$ (cioè se ogni azione ha un costo positivo). |
| **Ottimalità**  | ✅ Ottimale rispetto al costo del cammino.                                   |
| **Tempo**       | $O(b^{1 + \lfloor C^*/\varepsilon \rfloor})O$                               |
| **Spazio**      | $O(b^{1 + \lfloor C^*/\varepsilon \rfloor})O$                               |

dove:

- $C^*$ = costo della soluzione ottima
- $\varepsilon$ = costo minimo possibile per un’azione

📌 L’esponente $1 + \lfloor C^*/\varepsilon \rfloor$rappresenta la **profondità massima** che deve essere esplorata per garantire l’ottimalità, includendo anche il livello iniziale.
##### 💡 Confronto con la Ricerca in Ampiezza

|Caso|Comportamento|
|---|---|
|**Tutti i costi uguali**|UC ≡ BFS (stesse prestazioni e soluzione minima in numero di azioni).|
|**Costi diversi**|UC esplora prima i cammini a costo minore, garantendo la soluzione più economica.|

#### Ricerca in profondità DFS
![[Pasted image 20251021151954.png]]
#### Analisi costi
• Se m distanza massima della soluzione nello spazio di ricerca 
• b fattore di diramazione 
	• Allora la complessità temporale è: $O(b^{m+1})$
profondità usa meno memoria di ampiezza
### Ricerca in profondità limitata
La Ricerca in Profondità Limitata è una strategia di ricerca non informata che esegue la ricerca in profondità fino a un livello massimo predefinito, chiamato **limite di profondità ($\ell$)**.
- **Principio Operativo:** La ricerca procede in profondità, espandendo il nodo più recente, ma si ferma non appena si raggiunge il livello $\ell$.
- **Limite $\ell$:** Questo valore predefinito agisce come un "muro" o un vincolo; i nodi al livello $\ell$ non vengono espansi, evitando così che la ricerca si perda indefinitamente in rami profondi o cicli.
- **Esempio di Utilizzo:** È utile per problemi in cui si conosce un **limite superiore** per la profondità della soluzione (es. in un problema di _Route-finding_ tra $N$ città, la soluzione più lunga non può superare $\text{N}-1$ mosse).
• Complessità tempo: $O(b^d)$
- Spazio: $O(b*d)$
![[Pasted image 20251021152344.png]]
![[Pasted image 20251021152421.png]]

#### Ricerca Bidirezionale

La **ricerca bidirezionale** esplora simultaneamente:
- **In avanti** dallo **stato iniziale**, e
- **All’indietro** dallo **stato obiettivo**,
fino a far **incontrare le due ricerche** in un punto intermedio dello spazio degli stati.
- Invece di esplorare $O(b^d)$ nodi, ne esplora circa:
    $O(b^{d/2} + b^{d/2}) \approx O(b^{d/2})$
- Questo riduce drasticamente il numero di nodi da analizzare, **a parità di profondità** $d$.
📌 Funziona bene solo se:
- È possibile **ragionare all’indietro** (cioè generare predecessori),
- E lo **stato obiettivo** è **ben definito**.
- Mantiene **due frontiere** (una per ogni direzione) e due insiemi di **stati raggiunti**.
- Espande **il nodo con costo minore** tra i due lati (strategia best-first).
- Se la funzione di valutazione è il **costo di cammino**, otteniamo una **ricerca bidirezionale a costo uniforme**, ottimale come UC.
- Nessun nodo con costo >$C^*/2$ (dove $C^∗$ è il costo ottimo) viene espanso.
![[Pasted image 20251021154403.png]]

#### TUTTE LE STRATEGIE A CONFRONTO
![[Pasted image 20251021154529.png]]

#### PROBLEMA DEI CICLI
##### Tre soluzioni pratiche
![[Pasted image 20251021154940.png]]

##### Esempio di soluzione con i grafi
![[Pasted image 20251021155035.png]]

### Fix della ricerca-grafo in ampiezza
![[Pasted image 20251021155104.png]]
### Fix della ricerca-grafo con costo uniforme UC
![[Pasted image 20251021155139.png]]

# Ricerca esaustiva
Nella ricerca **non informata**, come BFS o UC, l’agente esplora tutto lo spazio degli stati “alla cieca”, senza sapere quale strada lo avvicina davvero alla soluzione.  
	→ Questo è **impraticabile** quando il numero di stati cresce in modo **esponenziale**.
- si cerca quindi di applicare della euristica
	- Una **euristica** è una _stima intelligente_ della distanza (o del costo) che manca per raggiungere l’obiettivo.
		- deriva da **esperienza o conoscenza del dominio**
		- esplora prima i nodi più promettenti.
		- non garantisce l’ottimo assoluto, ma una **buona soluzione in tempi accettabili**.
- Funzione di valutazione euristica
	- La conoscenza euristica si formalizza in una **funzione**:
$$f: n \rightarrow \mathbb{R}
$$
	- Questa associa a ogni **nodo n** (che rappresenta uno stato) un **valore numerico** che misura “quanto sembra promettente” quel nodo.
		- $f(n)$ è un **numero reale**;
		- si calcola **a partire dallo stato del nodo (`n.Stato`)**, non dalla sua storia.

### Ricerca Best-First
![[Pasted image 20251025113910.png]]
Ad ogni passo viene scelto il **nodo più promettente**, ossia quello con il **valore di f(n) più basso** (in caso di costi o distanze).
- “Migliore = minore”, perché un f(n) piccolo indica “più vicino” al goal.
- L’implementazione usa una **coda con priorità**, ordinata in base al valore di f(n).
- Quindi tutto dipende da **come definiamo f(n)**
	- in quello classico lo definiamo uguale a $g(n)$
#### CLASSICO
![[Pasted image 20251025111757.png]]
- **g(n)** = costo reale del cammino dall’inizio al nodo n.
- Nessuna euristica: usiamo solo il costo accumulato finora.
In questo caso, la “Best-First” **coincide esattamente con la Ricerca di Costo Uniforme (Uniform-Cost Search)**.
- **`Goal-Test`** è una funzione fornita dalla definizione del problema:  
	- prende come input lo **stato** di un nodo e restituisce **vero** se quello stato è uno degli **stati obiettivo** (cioè soddisfa la condizione del goal), oppure **falso** in caso contrario.
Infatti:
- l’algoritmo sceglie sempre il nodo con il **costo cumulativo minore** (`lowest-cost node in frontier`),
- e continua ad espandere fino a trovare il goal con costo minimo.
#### Greedy Best-First
![[Pasted image 20251025112102.png]]
![[Pasted image 20251025111949.png]]
- sfrutta **h(n)**
	- **h(n)** = stima del costo _dal nodo n al goal_ (quanto “manca”).
		- non è proprio euristica perché vede solo il passato
- L’algoritmo ignora completamente il costo già speso **(g(n))**, guarda solo _chi sembra più vicino alla meta_.
**Vantaggi:**
- molto più veloce, perché guida subito verso il goal.  
**Svantaggi:**
- non è ottimale (può trovare percorsi più costosi).   
- non è garantito che sia completa se ci sono cicli o stime sbagliate.


LEZ.4 ->

---
# A* search
L'idea principale è cercare un equilibrio tra:
- **arrivare al goal** (come Greedy),
- **risparmiare sul costo fatto finora** (come Uniform Cost),  
Quindi l'alg, vuole **trovare il percorso totale più economico possibile**, stimando il costo complessivo.
### La funzione di valutazione
A usa:$$
f(n)=g(n)+h(n)$$
dove:
- **g(n)** = costo _reale_ per arrivare fino al nodo `n` (già percorso);
- **h(n)** = stima _euristica_ del costo rimanente per arrivare al goal;
- quindi **f(n)** = stima del costo _totale_ del cammino passando per n.

In altre parole:
> A valuta ogni nodo come “quanto ho speso finora + quanto (credo) manchi ancora”.

- se vogliamo che un algoritmo A sia completo 
Condizione sufficiente: ogni passo deve costare almeno **ε > 0**, cioè
$$g(n) ≥ d(n)·ε$$
→ garantisce che l’algoritmo non resti bloccato in cicli o cammini infiniti a costo zero.
####  L’algoritmo A*
- per fare chiarezza, quando si parla di A, si intende la famiglia di algoritmi che usa la funzione di valutazione $f(n)=g(n)+h(n)$
- quando si parla di A* si intende
L’**$A^*$** è un **caso particolare di A**, in cui si **impone una condizione precisa sull’euristica h(n)** per fare in modo che sia completo e ottimale:  

| Proprietà                  | Significato                                                         | Effetto                                              |
| -------------------------- | ------------------------------------------------------------------- | ---------------------------------------------------- |
| **h(goal)=0**              | al goal il costo mancante è 0                                       | condizione base                                      |
| **h(n) ≥ 0**               | nessuna stima negativa                                              | realismo                                             |
| **Ammissibile**            | non sovrastima mai il costo reale: $h(n) ≤ h^*(n)h$                 | garantisce ottimalità                                |
| **Consistente (Monotona)** | $h(n) ≤ c(n,a,n') + h(n')$           dove $n'$ è un successore di n | evita ri-espansioni, assicura $f(n)$ non decrescente |
###### PSEUDOCODICE

```scss
function A* (problem) returns a solution or failure
nodo <- nodo con stato = problem.initialstate
frontiera <- coda di priorità ordinata in base a f(n) con all'inizio solo nodo "nodo"
esplorati <- insieme dei nodi esplorati inizialmente vuoto
loop do
    if frontiera is empty? then return failure
    nodo <- POP(frontiera)
    if problem.GOALTEST(nodo.state) then return SOLUTION(nodo)
    add nodo.state to esplorati
    for each action in problem.ACTIONS(nodo.state) do
        child <- CHILD-NODE(problem, nodo, action)
        if child.state non in frontiera or esplorati then
            frontiera <- INSERT(child.state)
        else if child.state is in frontiera con f(n) più alto allora
            replace that frontier node with child
```

##### CODICE A*
##### Complessità e Limiti di A*

- **Tempo:** esponenziale $O(b^d)$
- **Spazio:** molto elevato $O(b^{d+1})$
- **Problema principale:** memoria → A* mantiene tutta la frontiera.

#### Migliorare l'occupazione in memoria di A*

#### Mediante Beam Search
Invece di tenere in memoria TUTTI I NODI, l'idea è quella di ricordare solo i *k nodi più promettenti*, dove `k` è detto **ampiezza del raggio (beam)**.

>[!tip] LA BEAM SEARCH ***NON* È COMPLETA**

### Idea e pseudocodice
![[Pasted image 20251025193001.jpg]]

![[Pasted image 20251025193007.jpg]]


>[!tip]- Esempio
>![[Pasted image 20251025193059.jpg]]
#### IDA*
L'algoritmo IDA* combina
- A*
- ricerca in profondità iterativa(con limite) (ID)
Più precisamente, combina i vantaggi di entrambe
- come A*: usa la funzione di valutazione $$f(n) = g(n) + h(n)$$
- come ID: esplora **in profondità**, ma **con un limite**.
- il limite non sulla profondità ma sul valore del nodo
	- Si imposta un limite iniziale $f_{limit}$ ;
	- Si esplora in profondità solo i nodi con $f(n) ≤ f_{limit}$
	- Se non si trova la soluzione, si aumenta $f_{limit}$ e si ricomincia.

**Tempo**❌ esponenziale (come A*)
**Spazio**✅ lineare, $O(b·d)$
## ⚙️ Valutazione delle Funzioni Euristiche

### 🔹 Definizione

Una **funzione euristica** $h(n)$ stima il **costo rimanente** per raggiungere il goal da un nodo $n$.

> A parità di ammissibilità, un’euristica è **più efficiente** quanto più è **informata**, cioè quanto più i suoi valori si avvicinano al costo reale $h^∗(n)$.

---

### 🔹 Livello di informazione

| Caso                | Descrizione                          | Tipo di ricerca    |
| ------------------- | ------------------------------------ | ------------------ |
| $h(n) = 0$          | Nessuna informazione → esplora tutto | BFS / Uniform Cost |
| $0 < h(n) < h^*(n)$ | Euristica ammissibile, ma parziale   | A*                 |
| $h(n) = h^*(n)$     | Conoscenza perfetta (oracolo)        | Ottimo immediato   |

Condizione generale per le euristiche **ammissibili**:
$0 \le h(n) \le h^*(n)$
#### Teorema di dominanza

> Se $h_1(n) \le h_2(n)$per ogni nodo $n$:
> 
> - i nodi espansi da **A*** con $h_2$​ sono **un sottoinsieme** di quelli espansi con $h_1$;
>     
> - quindi **A*** con $h_2$​ è **almeno efficiente quanto** con $h_1$​.
>     

📌 In sintesi:
> Più l’euristica è **vicina a $h^∗$, meno nodi vengono esplorati → più efficiente.

##### Compromesso: costo dell’euristica vs costo della ricerca
- Un’euristica **semplice** è veloce da calcolare ma fa esplorare molti nodi.
- Un’euristica **precisa** riduce la ricerca ma può essere costosa da valutare.
> L’obiettivo è trovare un equilibrio tra **qualità della stima** e **costo computazionale**
![[Pasted image 20251025193638.jpg]]
##### Misurare l’efficacia: Fattore di diramazione effettivo $b^*$
Per misurare quanto è “forte” o efficace un’euristica possiamo utilizzare un valore chiamato **fattore di diramazione effettivo (`b*`)**.

Rappresenta **il numero medio di nodi generati per livello** dalla ricerca.

$N + 1 = 1 + b^* + (b^*)^2 + \dots + (b^*)^d$

Dove:
- $N$: numero totale di nodi generati
- $d$: profondità della soluzione
💡 Più $b^*$ è vicino a **1**, più l’euristica è **efficace**.

#### Come inventare una euristica
- **Rilassamento del problema:** togli vincoli per ottenere un problema più semplice → la sua soluzione dà una _sottostima_ ammissibile.
- **Massimizzazione:** se hai più euristiche ammissibili, prendi il _massimo_ → resta ammissibile e più informata.
- **Sottoproblemi / Pattern database:** pre-calcola i costi di sottoproblemi; se _disgiunti_, puoi sommare le euristiche.
- **Apprendimento:** l’euristica può essere appresa automaticamente dai dati (ma non sempre ammissibile).
- **Combinazione lineare:** somma pesata di più euristiche, con coefficienti scelti o appresi.

## Agenti classici
Gli agenti classici assumono che l'ambiente sia:
- **Completamente Osservabile:** L'agente conosce tutto ciò che è rilevante per la sua decisione in ogni momento. Non ci sono informazioni nascoste.
- **Deterministico:** Ogni azione ha un unico risultato, certo e prevedibile. Se un robot decide di andare avanti, andrà avanti, senza possibilità di scivolare o deviare.
**La conseguenza di queste due assunzioni è potentissima:**
- **Pianificazione Offline:** L'agente può calcolare l'intera sequenza di azioni per raggiungere l'obiettivo prima ancora di muovere un solo passo.
- **Esecuzione senza sorprese:** Una volta creato, il piano può essere eseguito a occhi chiusi, perché si è certi che il mondo non cambierà in modi imprevisti.
### RICERCA LOCALE
il **mondo reale è raramente** così semplice e prevedibile. Questo ci spinge a riconsiderare le nostre assunzioni e a cercare approcci più flessibili e realistici.
Mentre gli algoritmi classici cercano un **cammino soluzione** (una sequenza di azioni per arrivare al goal),
- Si usa quando interessa **solo lo stato finale**, non il cammino
##### Come Funziona la Ricerca Locale?
Le sue caratteristiche principali sono:
- **Non è sistematica**: 
	- Non garantisce di esplorare tutte le possibilità.
- **Mantiene solo lo stato corrente**: 
	- A differenza degli algoritmi classici che memorizzano un'intera frontiera di nodi, la ricerca locale tiene traccia solo della posizione attuale (il **nodo corrente**).
- **Si muove tra nodi adiacenti**: 
	- Ad ogni passo, valuta gli stati vicini e si sposta in uno di essi, sperando di migliorare la situazione.
- **Memoria super efficiente**: 
	- Non tenendo traccia dei cammini passati, consuma una quantità di memoria minima e costante.
- **Ideale per problemi di ottimizzazione**: 
	- È perfetta per trovare lo stato "migliore" secondo una **funzione obiettivo** (che vogliamo massimizzare) o lo stato a **costo minore** (che vogliamo minimizzare).

Per comprendere il funzionamento della **ricerca locale**, possiamo immaginare lo **spazio degli stati** come un vero e proprio **paesaggio tridimensionale** dove:
- ogni **punto** del paesaggio rappresenta **uno stato possibile** del problema;
- la **quota (altezza)** del punto rappresenta il **valore della funzione obiettivo**, cioè quanto quello stato è buono o conveniente.

L'obiettivo finale è trovare il punto migliore dell'intera mappa.
- **Ottimo Globale (global maximum)**: È il picco più alto in assoluto, ovvero la **migliore soluzione possibile**.
Tuttavia, il paesaggio è complesso e pieno di "trappole" che possono ingannare un algoritmo semplice.
- **Ottimo Locale (local maximum) ⛰️**:
    - **Cos'è**: Un picco che è più alto di tutti i suoi vicini, ma **non è il picco più alto** dell'intera mappa.
- **Altopiano (shoulder o plateau) 🏜️**:
    - **Cos'è**: Una zona piatta dove tutti i vicini hanno la stessa altezza.

![[Pasted image 20251028154347.png]]

#### ALGORITMO HILL CLIMBING
L’**Hill Climbing** è l’algoritmo di **ricerca locale** più semplice e intuitivo.  
a ogni passo, sceglie la direzione che porta **più in alto possibile**, cioè verso uno stato migliore, ma **senza pianificare a lungo termine**.
👉 È quindi un approccio **greedy (ingordo)** — sceglie sempre la soluzione migliore **nell’immediato**, senza preoccuparsi del futuro.
1. **Inizializzazione** – si parte da uno stato casuale (stato corrente).
2. **Generazione** – si producono tutti gli stati vicini (successori).
3. **Valutazione** – si valuta la funzione obiettivo di ogni successore.
4. **Spostamento** – si passa al vicino con valore migliore.
5. **Iterazione** – il nuovo stato diventa corrente e il ciclo ricomincia.
🧠 L’algoritmo **non memorizza** gli stati passati

![[Pasted image 20251028160108.png]]

#### 🔁 Varianti Principali

|Variante|Descrizione|Vantaggi|
|---|---|---|
|**Steepest-Ascent (salita più ripida)**|Sceglie il **miglior vicino in assoluto**|Converge rapidamente|
|**Stocastico**|Sceglie **a caso** tra i vicini migliori|Evita alcuni massimi locali|
|**Prima Scelta**|Genera vicini casualmente e accetta il **primo migliore**|Molto efficiente quando i vicini sono numerosi|
|**Con Mosse Laterali**|Consente passi con **valore uguale** al corrente per uscire da plateau|Evita blocchi su superfici piatte|
|**Con Riavvio Casuale**|Se si blocca, **riparte da un nuovo stato casuale**|Completo con probabilità 1 (prima o poi trova il massimo globale)|
#### ⚠️ Problemi Tipici: Le “Trappole” del Paesaggio

| Tipo di trappola            | Descrizione                                                | Effetto sull’algoritmo                                  |
| --------------------------- | ---------------------------------------------------------- | ------------------------------------------------------- |
| **Massimo Locale(collina)** | Punto più alto dei vicini, ma inferiore al massimo globale | L’agente si ferma troppo presto                         |
| **Altipiani (Plateau)**     | Area piatta dove tutti i vicini hanno lo stesso valore     | L’agente si muove a caso o si blocca                    |
| **Crinali (Ridge)**         | Serie di massimi locali separati da discese laterali       | L’agente non riesce a “girare” verso la salita corretta |
![[Pasted image 20251028162118.png]]
![[Pasted image 20251028162130.png]]
![[Pasted image 20251028162157.png]]

📉 In questi casi, l’algoritmo può **fermarsi prematuramente** o “girare in tondo” senza mai raggiungere la soluzione ottimale.

#### ALGORITMO SIMULATED ANNEALING
È una **combinazione tra:**
- **Hill Climbing**, che tende sempre a migliorare lo stato (approccio _greedy_),
- e una **scelta stocastica controllata**, che _a volte accetta stati peggiori_.
👉 Questo serve a **sfuggire dai massimi locali**:  
accettando temporaneamente un peggioramento, l’algoritmo può “scendere” da una collina minore per poi risalire verso un picco più alto (il **massimo globale**).
La **temperatura** regola quanto l’algoritmo è disposto ad accettare peggioramenti:
- **Alta `T`** → accetta spesso anche mosse peggiori → ampia esplorazione;
- **Bassa `T`** → accetta solo miglioramenti → comportamento simile a Hill Climbing.
Man mano che il processo procede, la temperatura **decresce gradualmente** secondo un _cooling schedule_, ad esempio:
$$T_{k+1} = \alpha \cdot T_k \quad \text{con } 0<α<1$$
### Funzionamento dell’algoritmo
1. **Inizializzazione:** scegli uno stato iniziale casuale e imposta una temperatura iniziale `T₀`.
2. **Genera un successore casuale** dello stato corrente.
3. **Valuta la differenza di energia (o costo):**
    $\Delta E = f(n') - f(n)$
4. **Decidi se accettarlo:**
    - Se la mossa **migliora** la soluzione ($ΔE < 0$) → **accettala sempre**.
    - Se **peggiora** la soluzione ($ΔE > 0$) → **accettala con probabilità**
        $p = e^{-\Delta E/T}$
        (poiché $ΔE > 0$, il valore è compreso tra 0 e 1).  
        In pratica:
        - più la mossa è “poco peggiore” → più probabile accettarla;
        - più è “molto peggiore” → meno probabile.  
            L’algoritmo genera un numero casuale in$[0,1]$ e accetta la mossa se è $< p$.
5. **Aggiorna la temperatura:** riduci `T` secondo il piano di raffreddamento.
6. **Ripeti** finché `T` è prossima a 0. 
### Algoritmo
![[Pasted image 20251029193033.png]]

####  Ricerca Local Beam
È una ricerca locale che mantiene **k stati alla volta** (anziché uno solo, come nell’Hill Climbing).  
A ogni passo:
1. genera tutti i successori dei `k` stati;
2. se uno è il goal, termina;
3. altrimenti seleziona i **k migliori** e ripete.
👉 A differenza del riavvio casuale, le ricerche **collaborano**, condividendo i migliori risultati.  
⚠️ Rischia di perdere **diversità** (tutti i cammini si concentrano nella stessa zona).  
🎲 Variante: **Beam stocastica**, che sceglie i successori con probabilità proporzionale al valore → più esplorazione.
### ALBERI AND-OR
Quando ci troviamo in **ambienti non deterministici**, l’albero di ricerca classico (quello usato negli ambienti deterministici) **non basta più**.  
- si utilizza una struttura chiamata **albero AND–OR**
![[Pasted image 20251029193155.png]]
- NODI OR -> cerchio singolo
- NODI AND -> cerchio singolo + semicerchio
- Ogni **foglia** del sottoalbero è un **nodo obiettivo**.
### Pseudocodice
![[Pasted image 20251029193206.png]]
#### Gestione dei cicli
- immaginando una situazione non deterministica 
	- il robot casualmente potrebbe fallire nelle sue azioni
- si può incorrere in situazioni cicliche 
	- Esiste però una **soluzione ciclica**, che consiste nel **ripetere un’azione finché non riesce**.  
- Per esempio:
> “Continua a provare **Destra** finché non ti sposti davvero a destra”.
```scss
while (non sei nel riquadro destro)
    esegui Destra
```
![[Pasted image 20251029193219.png]]
#### Ricerca con Osservazioni Parziali
Quando l’agente si trova in un ambiente **parzialmente osservabile**, le sue percezioni **non bastano per sapere con certezza in quale stato si trova**.  
Deve quindi **gestire l’incertezza**, mantenendo una **rappresentazione interna** di ciò che _potrebbe_ essere vero.
- perciò ora l'obiettivo è quello di raccogliere più informazioni possibili

#### Ricerca sensor-less
- Se l’agente **non riceve alcuna informazione** durante l’esecuzione → si parla di **problema senza sensori** o **problema conformante**.
	- La ricerca non avviene più sugli **stati fisici**, ma sugli **stati-credenza**
	- Ogni stato-credenza rappresenta **tutte le situazioni fisiche possibili** in cui l’agente potrebbe trovarsi.
- Questo rende il problema **completamente osservabile** nel nuovo spazio, perché l’agente conosce sempre il proprio stato-credenza.
	- La ricerca non avviene più sugli **stati fisici**, ma sugli **stati-credenza**, cioè insiemi di stati.
**Componenti principali:**

|Elemento|Descrizione|
|---|---|
|**Stati**|Ogni belief state è un sottoinsieme degli stati fisici possibili (fino a 2ⁿ).|
|**Stato iniziale**|Insieme di tutti gli stati compatibili con le informazioni note.|
|**Azioni**|Ammissibili se sicure in tutti gli stati del belief state.|
|**Transizioni**|Il nuovo belief state è l’unione dei risultati dell’azione su ciascuno stato possibile.|
|**Test obiettivo**|È raggiunto se almeno uno stato del belief state soddisfa l’obiettivo.|
|**Costo**|Può essere medio o prudente (es. il massimo).|

###### Come vengono aggiornati gli stati credenza (versione deterministica e non)
![[Pasted image 20251029193235.png]]
###### Spazio degli stati completo
![[Pasted image 20251029193247.png]]
Quando l’agente agisce in un ambiente parzialmente osservabile, il passaggio tra stati-credenza avviene in **tre fasi principali**:

1. **🔸 Predizione**
    - Si calcola lo **stato-credenza previsto** dopo aver eseguito un’azione, esattamente come nel caso senza sensori.
    - In questa fase si considerano **tutti i possibili risultati** dell’azione.
2. **🔸 Percezioni possibili**
    - Dallo stato-credenza previsto si determinano **tutte le percezioni** che l’agente _potrebbe_ ricevere in base ai sensori.
    - Serve per stimare **quali informazioni** saranno disponibili dopo l’azione.
3. **🔸 Aggiornamento (filtraggio)**
    - Per ogni percezione ricevuta, si costruisce un **nuovo stato-credenza** che include **solo gli stati compatibili** con quella percezione.
    - Tutti gli stati non coerenti vengono eliminati → l’agente **riduce l’incertezza**.
#### Agenti per ricerca online
Finora abbiamo visto **ricerche offline**, dove l’agente pianifica **tutto il percorso prima di agire**.  
Negli ambienti **reali, dinamici o ignoti**, questo non è sempre possibile: perciò si usa la **ricerca online**, che alterna **azione → osservazione → decisione**.
- nella ricerca online l’agente **non calcola un piano completo**, ma decide passo dopo passo:
1. **Agisce** → esegue un’azione.
2. **Osserva** → percepisce il nuovo stato.
3. **Aggiorna** → sceglie la prossima mossa in base a ciò che ha appreso.
📍 È utile in:
- **ambienti dinamici** (che cambiano nel tempo);
- **ambienti non deterministici** (le azioni non hanno sempre lo stesso effetto);
- **ambienti sconosciuti**, dove deve imparare gli effetti delle proprie azioni.
#### Ambienti sconosciuti
In un ambiente ignoto, l’agente **non conosce**:
- gli stati,
- gli effetti delle azioni,
- né i costi associati.
Deve **sperimentare** e costruire **un modello dell’ambiente** (es. costruzione di mappe).  
Ogni azione serve sia per agire sia per **imparare**.
####  Problemi di ricerca online
Un problema di ricerca online coinvolge tre attività: **elaborazione, percezione e azione**.
L’agente:
- conosce **solo lo stato attuale**;
- scopre **Risultato(s, a)** e **costo c(s,a,s′)** solo dopo aver agito;
- può usare una **funzione euristica h(s)** come stima della distanza dal goal.
###### Obiettivo: raggiungere l’obiettivo **minimizzando il costo totale effettivo**.  
Il **rapporto di competitività** confronta questo costo con quello della soluzione ottima in un ambiente noto (più è basso, meglio è).
⚠️ **Limiti**:
- rischio di **vicoli ciechi** (stati da cui non si può più uscire);
- **nessun algoritmo** può evitarli in tutti i casi;
- ambienti esplorabili in sicurezza solo se **non esistono azioni irreversibili**.
####  Agenti Online
Gli agenti **non pianificano**, ma decidono **una sola azione alla volta**.  
Devono ricordare le informazioni acquisite → usano **backtracking** per tornare indietro.
#### Ricerca Locale Online
Come nella ricerca Hill Climbing:
- l’agente conosce `h(s)` solo dopo aver esplorato `s`;
- mantiene **un solo stato in memoria** → è già un algoritmo **online**.
⚠️ Tuttavia, può bloccarsi in un massimo locale e **non può usare riavvii casuali**, perché non può “teletrasportarsi”.
#### Strategie Alternative
1. **Random Walk** → l’agente sceglie casualmente una delle azioni possibili per uscire da massimi locali.
2. **LRTA*** (_Learning Real-Time A*_) → l’agente impara durante la ricerca, aggiornando la propria euristica.
#### 💡 LRTA* — Learning Real-Time A*
Algoritmo che simula A*, ma **in tempo reale** e **localmente**:
- aggiorna il valore `H(s)` dello stato appena lasciato;
- poi sceglie la **mossa migliore** in base alle nuove stime.

![[Pasted image 20251030112816.png]]
![[Pasted image 20251030112825.png]]
###### 📊 Proprietà

|Proprietà|Descrizione|
|---|---|
|**Completezza**|Sì, in spazi esplorabili in sicurezza.|
|**Efficienza**|Nel caso peggiore visita ogni stato 2 volte, ma mediamente è più rapido della profondità online.|
|**Ottimalità**|Non garantita, salvo euristica perfetta.|
### Agenti basati sulla conoscenza

Gli **agenti basati sulla conoscenza (Knowledge-Based Agents)** sono sistemi che **ragionano sul mondo attraverso formule logiche**.  
L’elemento fondamentale è la **Base di Conoscenza (KB)**, cioè un insieme di **fatti e regole** che descrivono il mondo in modo simbolico.
La **KB** contiene un insieme di **formule logiche** (proposizioni o predicati) che rappresentano asserzioni sul mondo.
- Quando una formula è accettata come vera **senza essere derivata**, si chiama **assioma**.
- Le formule possono essere **aggiunte**, **rimosse** o **interrogate** attraverso operazioni logiche:
	- **TELL(KB, φ)** → inserisce nella KB una nuova formula (nuovo fatto o regola).
	- **ASK(KB, α)** → interroga la KB per verificare se α è una **conseguenza logica** delle informazioni memorizzate.
	- **RETRACT(KB, φ)** → facoltativo, rimuove una formula
	- dove:
	-  **α** = singolo fatto (formula)
	- **Φ** = insieme di fatti e regole (base di conoscenza)
![[Pasted image 20251112115048.png]]
#### Requisito fondamentale
> Ogni risposta dell’agente deve essere **una conseguenza logica** di ciò che gli è stato detto in precedenza.  
> In simboli: se **KB ⊨ α**, allora α è logicamente conseguente da KB.
#### PSEUDOCODICE DEL PROGRAMMA AGENTE CON KB
Un agente di questo tipo alterna **percezione, inferenza e azione**, aggiornando continuamente la KB.
![[Pasted image 20251112114302.png]]
L’agente quindi:
1. **Osserva** l’ambiente (percezioni → formule logiche);
2. **Ragiona** deducendo nuove informazioni (inferenza logica);
3. **Agisce** nel mondo e aggiorna la KB.
un agente basato su conoscenza può essere
- **Dichiarativo:** si “dice” all’agente _cosa sapere_ (formule logiche esplicite).  
    ➜ più **modulare**, **manutenibile**, **spiegabile**.
- **Procedurale:** si “programma” direttamente il comportamento con codice.  
    ➜ meno flessibile e più difficile da modificare.
#### Componenti fondamentali della rappresentazione logica
- **Sintassi**
	- Definisce i simboli e le regole per costruire frasi logiche.
- **Semantica**
	- Stabilisce la corrispondenza tra formule e fatti del mondo (quando una formula è vera).
- **Inferenza**
	- Insieme di regole che permettono di derivare nuove formule vere da quelle note.

> Una KB può essere vista come l’insieme di formule, oppure come una singola formula che le implica tutte.
#### Grounding (Radicamento)
È il legame tra **rappresentazione logica** e **mondo reale**.
- Le **percezioni sensoriali** producono formule vere nella KB (es. “Odore percepito → Odore(2,3)”).
- Le **regole generali** derivano da **apprendimento induttivo**, che può essere fallibile.
> In sostanza, il grounding collega le **formule** (mondo simbolico) con **gli stati reali del mondo** (mondo fisico).
### Rappresentazione e mondo
- La **rappresentazione logica** produce **nuovi fatti** (inferenze) coerenti con la realtà.
- La **semantica** collega formule e mondo:
    - “verso il basso” → formule → fatti reali (interpretazione);
    - “verso l’alto” → nuovi fatti logici → nuovi aspetti veri del mondo.
![[Pasted image 20251112112059.png]]

Un’**interpretazione** I stabilisce la corrispondenza tra simboli e elementi reali.  
Una formula **A** è **conseguenza logica** di KB se:  
$$KB ⊨ A \ \text{⇔}\ M(KB) ⊆ M(A)$$
cioè: tutti i modelli che rendono vera KB rendono vera anche A.
- Una KB è un insieme di formule logiche:
-  per M(qualcosa) si intende **l'insieme di tutti i modelli** (cioè le interpretazioni del mondo) in cui **tutte le formule di quel qualcosa sono vere**.
>[!tip] per capire meglio
>Ora passiamo alla semantica:
>
> - $M(p)$ = tutti i mondi in cui **p è vero**
>     
> - $M(q)$= tutti i mondi in cui **q è vero**
>     
> - $M(KB) = M(p \land q) = M(p) \cap M(q)$
> Cioè: l’insieme dei mondi che rendono **vera la KB** è l’intersezione dei mondi che rendono veri **tutti** i fatti in KB.
> 👉 Quindi **più formule ci sono in KB, meno modelli soddisfano tutto**.  
> KB più grande → M(KB) **più piccolo**.


![[Pasted image 20251112124104.png]]

### Ragionamento non monotono
Nella **logica classica** vale la **monotonia**: se $KB ⊨ α$, allora anche $KB ∪ \{β\} ⊨ α$ 
- Se aggiungo una nuova informazione non modifico ciò che prima era vero
Nel ragionamento umano, invece, **nuove informazioni possono invalidare** conclusioni precedenti → **ragionamento non monotòno**.

> Esempio: “Gli uccelli volano; Tweety è un uccello ⟹ vola.”  
> Aggiungo: “Tweety è un pinguino” ⟹ la conclusione non vale più.  
> È tipico del **ragionamento per default** e dell’**assunzione di mondo chiuso**.


[[IA LEZ.7  DI LOGICA]]


### SPIEGAZIONE WUMPUS, 8 REGINE E GIOCO DELL'8
#### AGENTI REATTIVI=WUMPUS
#### 8 regine
![[Pasted image 20251116165303.png]]
Mettere **8 regine** su una scacchiera **8×8** in modo che **nessuna minacci un’altra**.
Le regine attaccano:
- **sulla stessa riga**
- **sulla stessa colonna**
- **sulle diagonali**
##### Si usa l'algoritmo di hill climbing
- limitando il numero di mosse laterali(scegliere sempre la colonna più a dx libera )
	- l'algoritmo delle 8 regine con hill climbing ha successo il 94% dei casi
	- e impiega 21 passi
	- possiamo avere meno iterazioni con il riavvio casuale
		- con 1/p riavvii
- senza hill climbing ci vorrebbero 
	- $1,8*10^{14}$ passi
#### gioco dell'8
- Hai una griglia **3×3** che contiene 8 tessere numerate e **una casella vuota** (“blank”).
- L’obiettivo è **raggiungere lo stato finale** (goal state) facendo scorrere le tessere nella casella vuota.
![[Pasted image 20251116172254.png]]

viene usato A*
A* genera tutti gli stati successori (le mosse possibili) e calcola:

$f(n) = g(n) + h(n)$

Poi sceglie di espandere **prima** lo stato con il f più basso.

👉 **Quindi la euristica serve solo per guidare la ricerca verso stati promettenti.**  
Non dice cosa fare, ma dice quali stati “sembrano migliori”.
