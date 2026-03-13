# Differenza Software tradizionale e AI
- AI -> non lavora in isolamento nella sua struttura Hardware-Software, ma fa riferimento a un ambiente operativo non deterministico 
	- può non conoscere l'ambiente ma riceve delle **percezioni** (dall'ambiente), che sono segnali (es. prompt), e agisce mediante **azioni**
		- le azioni avvengono tramite delle estensioni (effettori)
	- l'ambiente si manifesta all'agente tramite **sensori**
	- l'ambiente deve poter far modificare le decisioni dell'agente (in base a ciò che è successo)
![[Pasted image 20251016094553.png]]

# Percezioni e azioni
Ogni agente (che sia un robot o un programma) ha dei **sensori** che gli permettono di ricevere informazioni dall’ambiente.  
Queste informazioni sono le **percezioni**: cioè tutto ciò che l’agente _vede, sente o misura_.

Un agente non vive solo nel momento presente: memorizza tutto ciò che ha percepito fino ad ora → questa è la **sequenza percettiva**.  
> Questa sequenza serve perché **le decisioni non dipendono solo da ciò che l’agente percepisce ora**, ma anche da _cosa ha percepito prima_.


>[!lemma] Definizione generale di agente
>Nel linguaggio dell’IA, un **agente** è un’entità autonoma capace di **percepire l’ambiente** (attraverso sensori) e **intervenire su di esso**, attraverso le proprie azioni, con gli attuatori.  
>Un singolo sistema può essere considerato un agente, ma in molti casi si parla di **sistemi multi-agente**, in cui più entità collaborano o competono per raggiungere determinati obiettivi.


# Diagramma Agente-Ambiente
Questo è uno schema GENERALE di tutti gli agenti che vedremo poi.
Il `?` cambia da agente a agente.
![[Pasted image 20251016094654.png]]

# Agente razionale
Ogni agente è dedicato a uno scopo (o più).

### Definizione: Razionalità
La razionalità è relativa a:
- la **misura delle prestazioni** (che hanno successo)
- le **conoscenze pregresse** dell'ambiente
- le **percezioni** presenti e passate
- le **capacità dell'agente**


>[!lemma] Un agente è detto **razionale** se:
> per ogni sequenza di percezioni, compie delle azioni che massimizzano il valore atteso della misura delle prestazioni, considerando
> - le sue percezioni passate
> - la sua conoscenza pregressa
> - le sue capacità (questa il prof non lo dice ma secondo me ha senso)

Per valutare la razionalità quindi è fondamentale avere una **misura di prestazione**, ossia un criterio volto a valutare l'efficacia di un'azione scelta dall'agente.
Funzione che associa ad ogni azione un valore numerico.
Questa misura, che nell'effettivo esprime l'obiettivo dell'agente, è
- **esterna**, non dipende dall'agente ma dal progettista
- **scelta a priori** dal progettista
- **applicabile ad ambienti diversi**

>[!tip]- Esempi
>![[Pasted image 20251016095030.png]]


### Apprendimento
In molti casi, l'ambiente è troppo **complesso o imprevedibile** per essere completamente descritto in anticipo (es. un veicolo con guida automatica ha come ambiente la strada).
Per questo, un agente razionale deve **imparare dall'esperienza**:
- osserva cosa succede dopo ogni azione eseguita
- valuta se è stato un successo o un errore
- aggiorna le proprie regole o strategie.

> L’apprendimento è parte integrante della razionalità.


### Agenti autonomi
Un agente autonomo non dipende continuamente dall'uomo o da regole fisse, ma
- usa le regole di base come punto di partenza
- **modifica e migliora il proprio comportamento** in base all'esperienze e alle nuove percezioni.


# Ambiente
Prima di progettare un agente, bisogna descrivere l'**ambiente in cui si muoverà**.
Infatti definire un problema `P` per un agente significa proprio **caratterizzare l'ambiente in cui deve operare**.
> In un certo senso, la progettazione dell'agente corrisponde a una soluzione per `P`. $$\text{Agente razionele} = \text{Soluzione}$$

### Standard PEAS
PEAS è un modello standard per descrivere qualsiasi problema di IA, e serve per dire cosa deve fare l'agente e in quale contesto.

| Sigla | Nome                   | Significato                                                                    | Esempio (auto autonoma)     |
| :---- | :--------------------- | :----------------------------------------------------------------------------- | :-------------------------- |
| **P** | Prestazioni            | Indica come misuriamo il successo dell'agente                                  | sicurezza, comfort, consumo |
| **E** | Environment (ambiente) | il mondo in cui si muove l'agente, con tutti i suoi elementi, regole e vincoli | strade, traffico, meteo     |
| **A** | Attuatori              | i mezzi con cui l'agente agisce sull'ambiente, ossia gli ***"effettori"***     | sterzo, freni, motore       |
| **S** | Sensori                | ciò che permette all'agente di **percepire l'ambiente**                        | telecamere, radar, GPS      |

>[!tip]- Esempio PEAS per un tassista
>![[Pasted image 20251013194845.png]]

>[!tip]- Esempio PEAS per ChatGPT
>![[Pasted image 20251016100755.png]]


# Le 7 proprietà fondamentali dell'ambiente

###### OSSERVABILITÀ: Completamente / Parzialmente osservabile
- **Completamente osservabile:** i sensori forniscono tutte le info necessarie per decidere.  
	    → es. scacchi: tutti i pezzi sono visibili.
- **Parzialmente osservabile:** i sensori sono limitati o imprecisi.  
	    → es. poker: non vedo le carte degli altri, guida autonoma: nebbia.
>[!tip] Se è parziale, l’agente deve **mantenere uno stato interno** per ricordare e stimare cosa non percepisce, e quindi l'ambiente viene ricostruito in base alla sua conoscenza.

###### NUMERO DI AGENTI: Agente singolo / Multi-agente
- **Agente singolo:** interagisce da solo con l’ambiente.  
	    → es. robot aspirapolvere.
- **Multi-agente:** più agenti agiscono contemporaneamente.
	 - _Competitivi_: avversari → es. scacchi, calcio.
	 - _Cooperativi_: collaborano → es. auto autonome nel traffico.
>[!tip] in multi-agente, le decisioni dipendono anche dal comportamento degli altri.

###### PREDICIBILITÀ: Deterministico / Stocastico / Non deterministico
- **Deterministico:** lo stato futuro è completamente determinato da stato attuale + azione.  
	    → es. scacchi.
- **Stocastico:** esiti influenzati da probabilità → incertezza nota.  
	    → es. guida autonoma, tiro in porta.
- **Non deterministico:** non conosco le probabilità degli esiti.  
	    → es. comportamento umano.

>[!tip]- Determinismo
>![[Pasted image 20251016101401.png]]

###### DIPENDENZA TEMPORALE: Episodico / Sequenziale
- **Episodico:** ogni decisione è indipendente dalle precedenti e l'esperienza dell'agente è divisa in episodi **atomici indipendenti**.  
	    → es. riconoscimento di immagini: ogni input è separato.
		     →bastano regole semplici (riflessi).
- **Sequenziale:** le azioni influenzano gli stati futuri.  
	    → es. scacchi, guida, navigazione robot.
		    → serve **memoria + pianificazione**. 

###### DINAMISMO: Statico / Dinamico / Semi-dinamico
- **Statico:** ambiente fermo mentre l’agente decide.  
	- la staticità è intesa rispetto alla velocità di decisione dell'agente
		    → es. scacchi (l'avversario fa una mossa solo dopo che l'ho fatta io).
- **Dinamico:** ambiente può cambiare anche durante la decisione.  
	- serve **rapidità di decisione e adattamento**.
		    → es. traffico stradale, videogiochi.
- **Semi-dinamico:** ambiente fermo, ma il tempo influisce.  
	    → es. scacchi con timer.

###### STRUTTURA: Discreto / Continuo
- **Discreto:** numero finito di stati e azioni.  
	- si modella con regole
		    → es. tris, sudoku, giochi a turni.
- **Continuo:** stati e azioni variano in modo continuo.  
	- si modella con funzioni matematiche
		    → es. guida reale, robotica, controllo di volo.

###### CONOSCENZA: Noto / Ignoto
- **Noto:** l’agente conosce le regole dell’ambiente (transizioni, effetti delle azioni).
	- MA ATTENZIONE: $noto \neq osservabile$
	    → es. scacchi.
- **Ignoto:** l’agente non conosce le regole e deve impararle esplorando.  
	    → es. robot in ambiente sconosciuto.

# STRUTTURA DI UN AMBIENTE REALE
In genere:
- parzialmente osservabile
- multi-agente
- stocastico
- sequenziale
- dinamico
- continuo
- ignoto


# Automazione: simulatore di ambienti
L'ambiente richiede la simulazione attraverso uno strumento **software** che serve a ricreare e controllare artificialmente l’ambiente in cui opera l’agente.  
In pratica, è un “mondo virtuale” dove l’agente può percepire, agire e ricevere valutazioni.

Funzioni principali:
- **Genera stimoli per gli agenti** → invia le percezioni (input) come se arrivassero dal mondo reale.
    Es: il simulatore manda a un robot il segnale “ostacolo davanti”.
    
- **Raccoglie le azioni in risposta** → legge cosa l’agente decide di fare (output).  
    Es: l’agente risponde con “gira a sinistra”.
    
- **Aggiorna lo stato dell’ambiente** → modifica il mondo in base all’azione fatta.  
    Es: aggiorna la posizione del robot dopo la svolta.
    
- **(Facoltativo)** _Attiva altri processi_ che possono cambiare l’ambiente.  
    Es: altri agenti, eventi casuali, condizioni meteo.
    
- **Valuta le prestazioni dell’agente** → assegna un punteggio o misura di performance.  
    Es: quanto velocemente ha raggiunto l’obiettivo, quante collisioni ha evitato.

>[!tip]- ESEMPIO
>![[Pasted image 20251013200523.png]]![[Pasted image 20251016102509.png]]


---


# 🧩 Struttura di un agente

Un **agente** è formato da due componenti principali:
> **Agente = Architettura + Programma**

Possiamo scriverlo anche come una funzione:
$$
AG: P \rightarrow Az
$$

dove:
- **P** = percezioni → ciò che l’agente riceve dall’ambiente;  
- **Az** = azioni → ciò che l’agente esegue in risposta.

👉 La **funzione agente** definisce *come* le percezioni vengono trasformate in azioni.  
È il collegamento logico tra “ciò che l’agente sente” e “ciò che fa”.

>[!tip] **ESEMPIO**
> QUESTO SCHEMA (che vedremo anche poi in modo approfondito per ogni agente) IL PROF LO VUOLE!!!!!!
> ![[Pasted image 20251013200948.png]]
> Qui c'è tutto il discorso che aggiorno la memoria dopo l'azione, ed è importante perché magari credo di aver fatto una cosa ma sono rimasto allo stesso punto di prima.

---

>[!question]- **Cos'è la fica?**  
> Un concetto? continuate a spiegarmelo.  
> Un’idea? non toglietemela.  
> Un sogno? non svegliatemi.

---

# 🤖 Agente basato su tabella
La scelta di una azione (per volta) corrisponde ad un accesso a una **tabella che associa un'azione ad ogni possibile sequenza di percezioni**.  
> Tutti gli algoritmi che abbiamo visto si basano su questo.  

Funzionano su ambienti **discreti** e **statici**.
In ambito IA è **molto difficile da costruire**, e soprattutto NON si ha autonomia.

## Schema di agenti reattivi semplici
![[Pasted image 20251016103639.png]]
Partendo dall'ambiente, l'agente
- riceve delle percezioni tramite i sensori
	- capisce lo stato dell'ambiente
- guarda nella sua tabella (percezioni -> azioni)
	- esegue l'azione  


## Programma agenti reattivi
![[Pasted image 20251016103842.png]]
È molto esplicativo.

>[!tip]- Un esempio di agente reattivo semplice è quello che risolve il problema del wumpus
>![[Pasted image 20251016104121.png]]
>IL WUMPUS GENERA L'OMEGASBURRO.
>![[Pasted image 20251016104155.png]]



---

# 🧠 Agenti basati sul modello
Gli **agenti basati su modello** hanno una **memoria interna** che gli permette di rappresentare il mondo in cui si trovano.  
A differenza di quelli reattivi semplici (che agiscono solo in base alla percezione immediata), questi **mantengono e aggiornano uno stato interno** che descrive _cosa credono che stia succedendo_.

## Struttura logica
![[Pasted image 20251016105009.png]]
L’agente riceve le **percezioni dai sensori** e aggiorna il proprio **stato interno** in base a:
- la percezione attuale,
- la conoscenza di come **il mondo evolve** nel tempo,
- e di **come le proprie azioni** modificano l’ambiente.
Con queste informazioni l’agente costruisce un modello di “**come il mondo è adesso**” (_what the world is like now_).  

Su questo modello applica poi le **regole condizione–azione** per decidere **che cosa fare ora** (_what action I should do now_).

Le azioni vengono infine inviate agli **attuatori**, che le eseguono nell’ambiente.

## Codice
![[Pasted image 20251016105103.png]]
- l’agente **ricorda cosa è successo prima**,
- **aggiorna il suo stato interno** dopo ogni azione,
- **cerca la regola** corrispondente a quello stato
- e **decide l’azione successiva** in base alla nuova conoscenza del mondo.


---

# 🎯 Agenti con obiettivo
Gli **agenti basati su obiettivo** sono un’evoluzione degli agenti basati su modello.  
Come loro, **mantengono uno stato interno** del mondo (memoria e conoscenza di come si evolve), 
ma in più **hanno un obiettivo da raggiungere (goal)** che guida la scelta delle azioni.

>[!tip] **NOTA BENE:**  Gli **obiettivi del task** (cioè quelli definiti dal progettista) e quelli **dell’agente** (cioè come l’agente li rappresenta internamente) possono non coincidere perfettamente, ma l’importante è che **l’agente li conosca e li interpreti correttamente**.
>
In generale, i _goals_ sono una **rappresentazione o approssimazione** dell’obiettivo reale da raggiungere.


## Struttura logica
![[Pasted image 20251016105711.png]]
- **Percepiscono** l’ambiente tramite i sensori,  
    aggiornano lo **stato interno** (cioè cosa credono che stia succedendo).
- Usano il modello del mondo per **prevedere cosa succederebbe** se eseguissero una certa azione  
    → _“What it will be like if I do action A”_.
    
- Confrontano il risultato previsto con il **goal**  
    → scelgono l’azione che **avvicina di più** all’obiettivo.
    
- L’azione scelta viene inviata agli **attuatori** e quindi eseguita.

## Caratteristiche principali
- **Guidati da un obiettivo:** l’agente non si limita a reagire, ma agisce per _raggiungere_ qualcosa.  
    → Esempio: “arrivare a destinazione”, “raggiungere la temperatura ideale”.
    
- **Pianificano** una sequenza di azioni per arrivare allo stato desiderato.  
    → Non si fermano alla singola mossa, ma valutano più passi avanti.
    
- **Più flessibili** degli agenti reattivi, ma anche **meno efficienti**:  
    richiedono più calcolo, tempo e memoria.


---

# ⚖️ Agenti con valutazioni di utilità
Gli **agenti con valutazione di utilità** sono un’estensione degli agenti basati su obiettivo.  
Anziché limitarsi a _raggiungere un goal_, valutano **quanto è “buono” o vantaggioso** ciascun possibile stato del mondo.

## Obiettivi alternativi
L’agente può avere **più obiettivi possibili** e deve scegliere verso quale muoversi.  
→ serve una **funzione di utilità** per valutare quale stato finale offre il miglior compromesso.
#### Funzione di utilità
È una **funzione che assegna a ogni stato un valore numerico** → rappresenta **quanto l’agente è soddisfatto** in quello stato (“quanto sarò felice se arrivo lì”).
$$U(s) = \text{grado di utilità dello stato }$$
- **Più alto è il valore**, più quello stato è desiderabile.
- Permette di **confrontare obiettivi diversi** e scegliere quello migliore.

>[!tip]- Esempio  
Un’auto autonoma deve decidere se andare per la strada più **breve ma trafficata**, o per quella **più lunga ma più sicura** → la funzione di utilità combina tempo, rischio, comfort e sceglie la soluzione _più vantaggiosa complessiva_.


## Obiettivi con probabilità diverse
La funzione di utilità considera anche la **probabilità di successo**:
> un obiettivo molto buono ma difficilissimo può avere meno valore atteso di uno più facile da raggiungere.


>[!lemma] Più il modello è ricco, **più l’utilità migliora**.  


>[!tip] Bisogna distinguere tra:
>  - **autovalutazione dell’agente**
>  - **valutazione dell’ambiente**  
  (non combaciano mai perfettamente)



---

# 📈 Agenti che apprendono
Questi agenti sono in grado di **migliorare il proprio comportamento nel tempo**, grazie a un meccanismo di apprendimento interno.

## Struttura logica
![[Pasted image 20251016111132.png]]
###### **Performance Element**
- È **l’elemento esecutivo**, cioè il **programma agente**.
- Interagisce direttamente con l’ambiente: riceve le percezioni dai sensori e compie azioni tramite gli attuatori.
- Rappresenta **“ciò che l’agente sa fare”** in un dato momento.

###### **Performance Standard**
- Fornisce **informazioni esterne di riferimento**, cioè una misura delle prestazioni dell’agente.
- Serve a capire **quanto bene** l’agente sta eseguendo il compito.
    - Es: il sensore rileva che si sta avvicinando un muro.
    - Se la previsione è errata (ho colpito il muro) → interviene il performance standard.
###### **Critic**
- Analizza i risultati e **interpreta il comportamento dell’agente**.
- Fornisce **feedback** al modulo di apprendimento (positivo o negativo).
    - Es: l’agente sbatte contro un muro → feedback negativo.
- Serve per valutare quanto le azioni passate siano state efficaci.

###### **Learning Element**
- Riceve i feedback dal critic e **capisce cosa cambiare** nel comportamento dell’agente.
- Produce **modifiche** al programma agente (performance element).
- È la parte che **apprende dai propri errori o successi**.

###### **Problem Generator**
- Suggerisce **nuove situazioni da esplorare**.
- Crea **problemi o scenari ipotetici** per migliorare l’apprendimento.
- Genera nuovi dati o esperienze utili per aggiornare il modello interno.


## 🔄 Meccanismo di apprendimento
1. Il **performance element** agisce nell’ambiente reale.    
2. I risultati vengono analizzati dal **critic** e confrontati con il **performance standard**.
3. Gli errori o i successi vengono passati al **learning element**, che li usa per migliorare il comportamento.
    - LAVORA IN UN AMBIENTE SIMULATO
4. Il **problem generator** fornisce nuovi stimoli per continuare l’apprendimento.
5. Il **learning element** aggiorna il **performance element**, che poi verrà riutilizzato nel mondo reale.


---

# 💻 Implicazioni computazionali

## Tipi di rappresentazione
Quando un agente deve ragionare o apprendere, ha bisogno di **una rappresentazione interna dello stato del mondo**.  
Questa rappresentazione può essere più o meno complessa a seconda del tipo di informazione che deve gestire.

##### 1. Rappresentazione atomica
![[Pasted image 20251016112203.png|center|100]]
- Ogni **stato** o **situazione** è considerato come un **blocco unico e indivisibile**.
- L’agente conosce solo _che quello stato esiste_, ma **non ha informazioni sulla sua struttura interna**.
- È il modello più semplice:
	→ **stati finiti**, **transizioni semplici**, a volte con **probabilità associate** (se stocastico).


##### 2. Rappresentazione fattorizzata
![[Pasted image 20251016112224.png|center|150]]
- Ogni stato è **descritto tramite un insieme di variabili (fattori)**.
- Invece di trattare tutto come un unico blocco, l’agente **rappresenta le caratteristiche principali** dello stato (es. posizione, temperatura, velocità, ecc.).
- Queste variabili possono essere viste come **dimensioni in uno spazio vettoriale**.


##### 3. Rappresentazione strutturata
![[Pasted image 20251016112332.png|center|200]]
- È la più **ricca e complessa**.
- Gli oggetti non sono solo elenchi di valori, ma **entità con relazioni tra loro** (come in un grafo o in un linguaggio logico).
- Permette di descrivere **relazioni, gerarchie e dipendenze**.

>[!tip]- Digressione su Semantic Embedding (Wordspace)
>![[Pasted image 20251016112642.png|320]]![[Pasted image 20251016112651.png|320]]
>Queste slide mostrano un esempio pratico di **rappresentazione strutturata basata sul linguaggio**.
>
>- “Wordspace” è un **modello semantico** che rappresenta le **parole come vettori in uno spazio multidimensionale**, in base al contesto in cui compaiono.
>    
>- Parole con significati simili → **vettori vicini** nello spazio.
>    
>- Serve per **capire le relazioni semantiche** tra concetti in modo automatico (embedding linguistico).
>
>Esempio:
>
>- La parola “Parma” è collegata a “culatello”, “Langhirano”, “salame”…
>    
>- Questo perché compaiono spesso negli stessi contesti → l’algoritmo li percepisce come _semanticamente correlati_.
>
> In pratica, è un modo per tradurre la **rappresentazione strutturata** (relazioni concettuali) in **una forma numerica continua** usata nelle reti neurali.



---

## 🎯 Desiderata di un agente
I sistemi di **Intelligenza Artificiale** (e gli agenti in particolare) sono **complessi da progettare e implementare**, perché devono operare in ambienti reali e dinamici.  
Per questo la progettazione e il rilascio sono **costosi** e richiedono molta cura.

#### ⚙️ Sfide principali
- **Accuratezza:** prestazioni vicine a quelle umane o di esperti.
- **Generalità:** capacità di adattarsi a **domini e compiti diversi** (portabilità).
- **Sostenibilità:** deve poter **evolvere nel tempo** con costi contenuti di manutenzione.
- **Modularità:** i componenti devono essere **riutilizzabili** e facilmente aggiornabili.
- **Trasparenza:** deve essere chiaro **come e perché** l’agente prende certe decisioni.
- **Scalabilità:** deve funzionare bene anche **con molti dati o utenti**.


---

Finora la maggior parte degli agenti che abbiamo visto (reattivi, basati su modello, ecc.) **sceglievano un’azione immediata** in base allo stato attuale. 

Quando però l'azione giusta da compiere non è subito evidente, un agente deve poter avere la possibilità di *guardare in avanti*, come quelli ***ad obiettivo***.

Si parla di agenti che devono **ragionare prima di agire**, cioè valutare **più azioni nel tempo** per capire quale sequenza porterà al risultato desiderato.

Questi tipi di agenti utilizzano rappresentazioni **atomiche**, in cui gli stati del mondo sono rappresentati in modo semplice e in cui non viene presa in considerazione la sua struttura interna.

>[!lemma] ASSUNZIONI IMPORTANTI
>Gli ambienti che consideriamo sono semplici
>- episodici
>- a singolo agente
>- completamente osservabili
>- deterministici
>- statici
>- discreti
>- noti


# Agenti risolutori di problemi
Dato un problema da risolvere, l'agente esegue un processo di risoluzione in quattro fasi
1. **FORMULAZIONE DELL'OBIETTIVO**
	- l'agente sceglie un obiettivo, utile per organizzare il comportamento limitando le azioni da considerare
2. **FORMULAZIONE DEL PROBLEMA**
	- l'agente elabora una descrizione degli stati e delle azioni necessarie per raggiungere l'obiettivo, ovvero un modello astratto della parte del mondo interessata
3. **RICERCA**
	- prima di effettuare qualsiasi azione, l'agente simula nel suo modello alcune sequenze di azioni, cercando una sequenza che raggiunga l'obiettivo.
		- se arriva all'obiettivo, ha trovato una **soluzione**
		- se nessuna sequenza provata raggiunge l'obiettivo, ritorna che non è possibile
4. **ESECUZIONE**
	- l'agente esegue le azioni specificate nella soluzione, una per volta


>[!tip] Osservazione importante
>Se l'ambiente è **completamente osservabile, deterministico e noto**, l'agente sa
>- in che stato si trova
>- quali azioni può eseguire
>- quali effetti avranno sull'ambiente
>
>E quindi la soluzione è **una sequenza fissata di azioni** e l'agente può ignorare le percezioni esterne (non avranno alcun impatto).
>Questo sistema è definito **ad anello aperto**.
>
> Se invece l'ambiente è **parzialmente osservabile o non deterministico** allora serve una **strategia ramificata**, ossia un piano che specifica **più percorsi alternativi** IN BASE A CIÒ CHE PERCEPISCE L'AGENTE (qui l'ambiente può cambiare e di conseguenza deve farlo anche l'ambiente).
> Questo sistema è definito **ad anello chiuso**.


# Problemi di ricerca e soluzioni
Un problema di ricerca può essere definito formalmente come segue:
- Un **insieme di possibili stati** in cui può trovarsi l’ambiente. 
	- Lo chiamiamo **spazio degli stati**.
- Lo **stato iniziale** in cui si trova l’agente inizialmente.
- Un **insieme di uno o più stati obiettivo**.
- Le **azioni possibili** dell’agente. 
	- Dato uno stato $s$, `Azioni(s)` restituisce un insieme finito di azioni che possono essere eseguite in $s$. 
	- Diciamo che ognuna di queste azioni è **applicabile** in $s$.
-  Un **modello di transizione** che descrive ciò che fa ogni azione. 
	- `Risultato(s, a)` restituisce lo stato risultante dall’esecuzione dell’azione $a$ nello stato $s$.
- Una funzione di **costo dell’azione**, denotata da `Costo-Azione(s, a, s′)` o `c(s, a, s′)`, 
	- che restituisce il costo numerico di applicare l’azione $a$ nello stato $s$ per raggiungere lo stato $s^{′}$.

Una sequenza di azioni forma un **cammino**.
Una **soluzione** è un cammino che dallo stato iniziale porta uno stato obiettivo.
Una **soluzione ottima** è, tra tutte le possibili soluzioni, quella che ha **costo minimo**.

>[!tip] Lo spazio degli stati può essere rappresentato come un **grafo** in cui i vertici (nodi) rappresentano gli stati e i **collegamenti orientati** (archi) tra di essi rappresentano le azioni.


# Formulazione dei problemi
Quando si parla di formulare un problema, si intende creare un **modello semplificato** del mondo reale,
> prendere una situazione reale e trasformarla in qualcosa che un algoritmo può comprendere e risolvere.

In questo contesto risulta molto utile l'**astrazione**, ossia il **processo di rimozione dei dettagli inutili** per semplificare il problema.

L'astrazione deve rispettare due condizioni
- **VALIDA** -> se una soluzione trovata nel modello **può essere applicata al mondo reale**
	- se trovo come soluzione un percorso A -> B -> C, per essere valida devo poter eseguire quel percorso realmente
- **UTILE** -> se, oltre ad essere valida, **semplifica anche il lavoro** (ossia è più facile da risolvere rispetto alla versione reale).


---

# Problemi esemplificativi VS reali
La distinzione tra queste due categorie di problemi è fondamentale per illustrare come i principi di risoluzione vengano prima testati in ambienti controllati (standardizzati) e poi applicati a contesti complessi (reali).

##### Esempio problema standardizzato
![[Pasted image 20251020192109.png]]

>[!tip]- ALTRI ESEMPI PROBLEMI STANDARDIZZATI
>![[Pasted image 20251022094220.png]]![[Pasted image 20251022094228.png]]![[Pasted image 20251022094255.png]]![[Pasted image 20251022094309.png]]![[Pasted image 20251022100151.png]]![[Pasted image 20251022100155.png]]![[Pasted image 20251022100205.png]]

##### Esempio problema reale
![[Pasted image 20251020192148.png]]

>[!tip]- Altri problemi reali
>![[Pasted image 20251020192214.png]]


# Algoritmi di ricerca
Un **algoritmo di ricerca** serve per **trovare una sequenza di azioni** che porta da uno stato iniziale a uno stato obiettivo.  
Se trova la soluzione, la restituisce; altrimenti dice che non c’è soluzione.

Per fare questo, l’algoritmo costruisce un **albero di ricerca**.
Un **nodo** `n` dell’albero è una struttura dati con quattro componenti
1. Uno **stato**: `n.stato`
2. Il **nodo padre**: `n.padre`
3. L'**azione** effettuata per generarlo: `n.azione`
4. Il **costo del cammino** dal nodo iniziale al nodo: `n.costo-cammino` indicato come $g(n)$

### Spazio degli stati vs Albero di ricerca
- **Spazio degli stati** → è l’insieme di tutti gli stati possibili del problema, come se fosse una mappa.     
- **Albero di ricerca** → è **la parte esplorata** dallo specifico algoritmo.  
    L’algoritmo non esplora tutta la mappa, ma costruisce **solo i cammini** che prova a seguire.

### Espandere un nodo
Per "espandere un nodo" si intende verificare quali azioni possono essere intraprese dallo stato (nodo) in cui si trova l'ambiente.

La strategia di scelta del nodo da espandere determina il tipo di algoritmo (BFS, DFS, A*, ecc.).
	Vedremo dopo bene con "Strutture dati per la frontiera".
### Frontiera
Durante la ricerca, l'algoritmo tiene traccia dei nodi che ha già generato ma non ha ancora esplorato.
Questo insieme si chiama **frontiera**.
- Gli **stati raggiunti** sono quelli già scoperti (che hanno un nodo nell'albero)
- gli **stati espansi** sono quelli di cui l'algoritmo ha già esplorato i figli
- la **frontiera** separa i due gruppi
	- nodi esplorati (interni)
	- nodi da visitare (esterni)

![[Pasted image 20251022101232.png]]



## Strutture dati per la frontiera
Ci serve una **struttura dati** per memorizzare la frontiera. 


Negli algoritmi di ricerca si utilizzano tre tipi di code:
- la **coda con priorità**, in cui viene estratto prima il nodo di costo minimo in base a una funzione di valutazione `f`. 
	- Questo tipo di coda è usato nella ricerca best-first;
- la **coda FIFO**, in cui viene estratto prima il nodo che è stato aggiunto alla coda. 
	- usato nella ricerca in ampiezza;
- la **coda LIFO**, detta anche **stack**, in cui viene estratto il nodo che è stato aggiunto alla coda per ultimo. 
	- usato nella ricerca in profondità.

Gli stati raggiunti possono essere memorizzati come **tabella di lookup** (per esempio una tabella hash) in cui ogni **chiave** è uno **stato** e ogni **valore** è il nodo per tale **stato**.


## Strategie (algoritmi) non informate VS informate
- **NON INFORMATE**: l'algoritmo non ha alcuna informazione aggiuntiva sul problema oltre la sua definizione formale (stato iniziale, azioni possibili, ecc...)
	- BFS
	- DFS
	- Ricerca di costo uniforme
	- Ricerca con approfondimento iterativo
- **INFORMATE**
	- Ricerca Euristica (o Informata)


## Valutazione di una strategia
Abbiamo quattro caratteristiche principali
- **COMPLETEZZA**
	- se la soluzione del problema esiste, allora l'algoritmo riesce a trovarla
- **OTTIMALITÀ**
	- l'algoritmo trova la soluzione migliore, ossia quella con costo minore
- **COMPLESSITÀ TEMPORALE**
	- ossia il tempo richiesto affinché l'algoritmo trovi la soluzione
- **COMPLESSITÀ SPAZIALE**
	- quanta memoria viene richiesta dal completamento di un'elaborazione completa dell'algoritmo


---

# Ricerca in ampiezza (BFS)
![[Pasted image 20251022102152.png]]
### Analisi complessità spazio-temporale
Assumiamo che
- `b` = fattore di ramificazione (*brancing*)
	- quanti successori al massimo vengono generati
- `d` = profondità del nodo obiettivo
- `m` = lunghezza massima dei cammini nello spazio di ricerca
#### **COMPLETEZZA**
La strategia è completa perché, se esiste una soluzione, la BFS la trova sempre.
#### **OTTIMALITÀ**
La strategia è ottimale solo se gli operatori hanno tutti lo **stesso costo** `k`.
Questo vuol dire:
- ogni azione (passaggio da un nodo al successivo) costa uguale, diciamo **k**.
- allora BFS è **ottimale**, perché trova il **cammino con meno passi** (e quindi con costo minimo totale).

Se invece i costi delle azioni sono diversi (es. una strada lunga 10 km, un’altra 100 km), BFS non garantisce l’ottimo → serve la **ricerca a costo uniforme (Uniform Cost Search)**.
#### **COMPLESSITÀ TEMPORALE**
La BFS genera
- `b` nodi al livello 1
- `b²` nodi al livello 2
- …
- `bᵈ` nodi al livello d (dove si trova la soluzione).
Quindi il costo sarà $$T(b, d) = b + b^{2} + ... + b^{d} \rightarrow O(b^{d})$$
#### **COMPLESSITÀ SPAZIALE**
Devo tenere in memoria tutti i nodi, quindi $$O(b^{d})$$

---

# Ricerca di costo uniforme (UC)
È la generalizzazione della BFS.
- si sceglie il nodo di costo minore sulla frontiera
- e lo si espande

>[!warning] NB: è simile a dijsktra ma si ferma QUANDO TROVA IL GOAL (dijsktra trova tutti i cammini)

## Pseudocodice![[Pasted image 20251022103527.png]]

## Analisi
La completezza e l'ottimalità sono garantite solo se tutti i costi degli archi sono $\epsilon > 0$.
Significa:
- **Completezza:** UC trova sempre una soluzione se esiste.
- **Ottimalità:** UC garantisce che la soluzione trovata sia **la più economica possibile** (cioè quella con costo minimo).

👉 Ma questo vale solo se **tutti i costi degli archi sono positivi** (ε > 0).  
Perché?  
Se ci fossero **archi di costo 0 o negativo**, l’algoritmo potrebbe:
- finire in cicli infiniti (continuando a “migliorare” un costo),
- o scegliere percorsi “gratis” che falsano il risultato.


---

# Ricerca in profondità
- **m** → è la profondità massima (cioè la distanza massima della soluzione dallo stato iniziale).
- **b** → è il _fattore di diramazione_, cioè quanti figli ha in media ogni nodo (quante azioni possibili).

### Complessità
- **Tempo**: $O(b^{m+1})$  
    Perché, nel peggiore dei casi, esplora tutti i nodi fino alla profondità massima _m_, quindi circa $$1 + b + b^2 + … + b^m \approx b^{m+1}$$
- **Memoria**: $O(bm+1)$  
    In realtà è molto piccola, perché salva solo il **cammino corrente** (la catena di nodi fino al punto attuale) e i fratelli ancora da visitare.
    
### ⚠️ Proprietà
- **Non completa** → se lo spazio di ricerca è infinito o ci sono cicli, può non trovare mai la soluzione (es. va giù all’infinito).
- **Non ottimale** → può trovare una soluzione, ma non quella più corta.


>[!tip] Risparmio memoria (esempio)
>- Ricerca in ampiezza (BF): per profondità d = 16, servirebbero 10 _Esabyte_ (O(b^d)).
>- Ricerca in profondità (DF): solo 156 Kbyte (O(b × d)).  
>    → quindi la DFS è **molto più parsimoniosa in memoria** rispetto alla BFS.


---

# Ricerca in profondità limitata
È una variante della DFS che si ferma **a un certo livello limite ℓ**.  
Serve per evitare che la ricerca scenda all’infinito.
### Idea
Si impone una profondità massima ℓ: non si esplorano nodi più profondi di quella soglia.
### Proprietà
- **Completa** solo se la soluzione si trova a una profondità ≤ ℓ.  
    (cioè se la profondità reale `d` della soluzione è minore di ℓ)
- **Non ottimale**, perché trova la prima soluzione, non necessariamente la più vicina.
- **Complessità tempo**: O($b^ℓ$)  -> come la BFS
- **Complessità spazio**: O(bℓ)  -> come da DFS
![[Pasted image 20251022105309.png]]

>[!tip] È un **compromesso** tra:
>- la BFS (che è completa e ottimale ma consuma troppa memoria),  
>- e la DFS (che usa poca memoria ma non è completa).


![[Pasted image 20251111160836.png]]


---

# Direzione della ricerca
È un aspetto **ortogonale** alla strategia di ricerca (cioè indipendente dal fatto che sia in ampiezza, in profondità, ecc.).

Esistono due approcci:
### 🔸 Ricerca in avanti (forward o _data-driven_)
- Si parte **dallo stato iniziale** e si procede **verso lo stato obiettivo**.
- Si usano i **dati disponibili** per generare nuovi stati fino a raggiungere il goal.
	- Esempio: nel _path finding_, parti da una città e cerchi di raggiungere la destinazione seguendo le possibili strade.
👉 È detta anche _guidata dai dati_ perché procede “naturalmente” dall’origine.

### 🔸 Ricerca all’indietro (backward o _goal-driven_)
- Si parte **dallo stato obiettivo** e si risale **verso lo stato iniziale**.
- Si formula una serie di “sotto-goal” fino a risalire all’inizio.
	- Esempio: nei sistemi di deduzione logica (_theorem proving_), si parte da ciò che vogliamo dimostrare e si risale alle premesse necessarie.
👉 È detta anche _guidata dall’obiettivo_ perché parte dal traguardo e cerca le condizioni per ottenerlo.

>[!question]- Quale direzione scegliere
>⚖️ Regola generale
> Conviene procedere nella direzione in cui il **fattore di diramazione** è **minore**,  
> cioè dove ogni passo genera **meno possibilità da esplorare** → meno combinazioni → ricerca più efficiente.
> ![[Pasted image 20251022110517.png]]


# Ricerca bidirezionale
Invece di cercare solo **in una direzione** (dal punto iniziale al goal _oppure_ viceversa), la ricerca bidirezionale **procede in entrambe le direzioni** contemporaneamente:
- una ricerca **in avanti** a partire dallo **stato iniziale (Start)**,
- e una ricerca **all’indietro** a partire dallo **stato obiettivo (Goal)**.

➡️ L’idea è che **le due frontiere si incontrino a metà strada**.  
Quando si trova un nodo comune, il percorso completo può essere ricostruito concatenando i due cammini.

### Complessità spaziale e temporale
- **TEMPORALE**: vengono eseguite due **BFS** ($O(b^{d})$) fino a metà, quindi avremo $$O(b^{\frac d 2})$$
- **SPAZIALE**: stessa cosa di prima $$O(b^{\frac d 2})$$

>[!warning] NON SEMPRE LA RICERCA BIDIREZIONALE È APPLICABILE
>- se le azioni non sono reversibili
>- se ci sono troppi stati obiettivo


---

# PANORAMICA GENERALE
![[Pasted image 20251022111555.png]]

---

# Ricerca su grafi
## Problematiche
Varie problematiche per le ricerche sui grafi
- **CAMMINI CICLICI** -> se un algoritmo di ricerca NON controlla i cicli, può portare ad avere un albero di ricerca infinito
- **RIDONDANZE** -> anche se non ci sono cicli, un algoritmo può generare più volte lo stesso stato 
	![[Pasted image 20251022112014.png]]
- **COMPROMESSO TRA SPAZIO E TEMPO**
	- Se **memorizzi** i nodi visitati → eviti di ripetere il lavoro → più efficiente, ma serve memoria.
	- Se **non li memorizzi** → consumi meno spazio, ma rischi di ripetere lo stesso cammino → più lento.


## Tre Soluzioni
1. **Non tornare allo stato da cui si proviene**  
    → quando generi i successori, elimina il nodo “padre”.  
    (Eviti solo il passo immediatamente indietro.)
    
2. **Non creare cammini con cicli**  
    → controlla che il nuovo nodo non sia **un antenato** del nodo corrente nel cammino.  
    (Eviti cicli più lunghi.)
    
3. **Non generare nodi già visitati**  
    → mantieni una **struttura (hash table o lista chiusa)** con tutti i nodi già esplorati.  
    Se un nodo è già nella lista, **non lo espandi di nuovo.**  
    (È il metodo più efficace, ma anche il più costoso in memoria.)

Queste tre vengono usate quando si implementa un ***graph search***.
⚠️ Tuttavia:
> è ottimale **solo** se possiamo garantire che il nuovo cammino trovato non sia più costoso del precedente.  
> (se il grafo ha pesi diversi sugli archi, serve gestire anche i costi minimi).


# Ricerca grafo in ampiezza
![[Pasted image 20251022112357.png]]

# Ricerca grafo UC
![[Pasted image 20251022112419.png]]


---

# CONCLUSIONI
![[Pasted image 20251022113002.png|center]]


---

# Ricerca esaustiva
Nella ricerca **non informata**, come BFS o UC, l’agente esplora tutto lo spazio degli stati “alla cieca”, senza sapere quale strada lo avvicina davvero alla soluzione.  
	→ Questo è **impraticabile** quando il numero di stati cresce in modo **esponenziale**.

### L’idea base dell’euristica
Una **euristica** è una _stima intelligente_ della distanza (o del costo) che manca per raggiungere l’obiettivo.
- Deriva da **esperienza o conoscenza del dominio**
- Non elimina la ricerca, ma **la rende più efficiente**, perché esplora prima i nodi più promettenti.
- Di solito non garantisce l’ottimo assoluto, ma una **buona soluzione in tempi accettabili**.

>[!tip] La conoscenza euristica indica una "**scelta oculata**" o un'intuizione che aiuta a risolvere il problema.

### Funzione di valutazione euristica
La conoscenza euristica si formalizza in una **funzione**:
$$f: n \rightarrow \mathbb{R}
$$
Questa associa a ogni **nodo n** (che rappresenta uno stato) un **valore numerico** che misura “quanto sembra promettente” quel nodo.

In pratica:
- $f(n)$ è un **numero reale**;
- più è **basso**, più il nodo è “vicino” o “economico” rispetto al goal;
- si calcola **a partire dallo stato del nodo (`n.Stato`)**, non dalla sua storia.


---

# Ricerca Best-First
Ad ogni passo viene scelto il **nodo più promettente**, ossia quello con il **valore di f(n) più basso** (in caso di costi o distanze).
- “Migliore = minore”, perché un f(n) piccolo indica “più vicino” al goal.
- L’implementazione usa una **coda con priorità**, ordinata in base al valore di f(n).

Quindi tutto dipende da **come definiamo f(n)** (vedi le due foto).  

#### Best-First classico
![[Pasted image 20251024114221.png]]
- **g(n)** = costo reale del cammino dall’inizio al nodo n.
- Nessuna euristica: usiamo solo il costo accumulato finora.
In questo caso, la “Best-First” **coincide esattamente con la Ricerca di Costo Uniforme (Uniform-Cost Search)**.

Infatti:
- l’algoritmo sceglie sempre il nodo con il **costo cumulativo minore** (`lowest-cost node in frontier`),
- e continua ad espandere fino a trovare il goal con costo minimo.

>[!tip]- Esempio
>![[Pasted image 20251024114452.png]]


#### Greedy Best-First
![[Pasted image 20251024114344.png]]
- L’algoritmo ignora completamente il costo già speso **(g(n))**, guarda solo _chi sembra più vicino alla meta_.

È come dire:
> “Seguo sempre la direzione che sembra più promettente, anche se magari sto facendo un giro più lungo.”

**Vantaggi:**
- molto più veloce, perché guida subito verso il goal.  
**Svantaggi:**
- non è ottimale (può trovare percorsi più costosi).   
- non è garantito che sia completa se ci sono cicli o stime sbagliate.

>[!tip]- Esempio
>Vogliamo fare Arad-Bucarest
>![[Pasted image 20251024114739.png]]![[Pasted image 20251024114820.png]]![[Pasted image 20251024114834.png]]
>La parte in blu indica un bug dell'algoritmo:
>- se parto da Iasi e voglio arrivare a Fagaras, c'è il rischio di 
>	- andare a Neamt (costo minore)
>	- tornare indietro (non ho altre strade)
>	- ritornare a Neamt (VISTO CHE NON HO **g(n)**) e ciclare all'infinito (o comunque aver perso tempo)


>[!question]- Avere una funzione g lo rende euirstico? una funzione che conosce il passato?
la risposta è no, serve introdurreuna funzione h che vede al futuro.
>- h rappresenta una stima, ma come fa a essere una stima invece che un calcolo vero e proprio?
>    - abbiamo detto che una cosa euristica non conosce l'ambiente... mh... sborra...
>- Esempio con mappa fatta della romania
>- a quanto pare h è una funzione che mi restituisce una ENORME CAZZATA DI MERDA(linea d'area)



---

# A* search
L'idea principale è cercare un equilibrio tra:
- **arrivare al goal** (come Greedy),
- **risparmiare sul costo fatto finora** (come Uniform Cost),  
Quindi l'alg, vuole **trovare il percorso totale più economico possibile**, stimando il costo complessivo.

### La funzione di valutazione
A* usa:$$
f(n)=g(n)+h(n)$$
dove:
- **g(n)** = costo _reale_ per arrivare fino al nodo `n` (già percorso);
- **h(n)** = stima _euristica_ del costo rimanente per arrivare al goal;
- quindi **f(n)** = stima del costo _totale_ del cammino passando per n.

In altre parole:
> A* valuta ogni nodo come “quanto ho speso finora + quanto (credo) manchi ancora”.


### Come funziona in pratica
L’algoritmo mantiene una **coda con priorità** ordinata per $f(n)$:
1. sceglie il nodo con f(n) più basso (il “più promettente” considerando costi reali + stimati);
2. lo espande, generando i successori;
3. aggiorna la frontiera con i nuovi nodi e i loro f(n).

Continua finché trova un nodo obiettivo.


### Proprietà della funzione $h(n)$
Per garantire che A* sia **completo e ottimale**, servono due condizioni:
1. **h(n) ≥ 0** — i costi stimati non possono essere negativi (ovvio ma importante);
2. **h(goal) = 0** — al goal il costo residuo è nullo.

Se poi l’euristica è **ammissibile** (cioè non sovrastima mai il vero costo), A* trova **sempre la soluzione ottima**.

### Relazioni con altri algoritmi
A* è una **famiglia di algoritmi “A”**, e in base a come scegli h(n) o g(n) ottieni casi particolari:

| Caso     | Condizione           | Diventa…                     | Significato                                      |
| -------- | -------------------- | ---------------------------- | ------------------------------------------------ |
| h(n) = 0 | ⇒ f(n) = g(n)        | **Uniform Cost Search (UC)** | ignora la stima futura → esplora per costo reale |
| g(n) = 0 | ⇒ f(n) = h(n)        | **Greedy Best-First Search** | ignora il costo fatto → segue la stima del goal  |
| entrambi | ⇒ f(n) = g(n) + h(n) | **A***                       | bilancia costo reale + stimato                   |

>[!tip]- Esempi
>![[Pasted image 20251024115746.png]]
>ITINERARIO
>![[Pasted image 20251024115847.png|center]]![[Pasted image 20251024115854.png]]![[Pasted image 20251024115900.png]]![[Pasted image 20251024115905.png]]![[Pasted image 20251024115911.png]]![[Pasted image 20251024115919.png]]

## A* è completo
>[!lemma] Teorema: L'algoritmo `A*` con la condizione $$g(n) \ge d(n) \cdot \epsilon$$è completo. 
>Con
>- **g(n)** = costo accumulato per arrivare al nodo n (cioè quanto abbiamo speso fino a lì);
>- **d(n)** = profondità del nodo (cioè quanti passi/azioni abbiamo fatto);   
>- **ε** = il **costo minimo possibile** di un’azione (quindi un numero positivo).

Questa condizione dice:
> “Ogni volta che l’agente fa un passo, quel passo deve costare _almeno un po’_, mai zero.”
> In altre parole, **non possono esistere archi di costo zero o negativo**.

### Perché la condizione ci garantisce completezza?
Imponendo che ogni passo costi **almeno ε**, cioè che il costo **cresca un minimo a ogni azione**, otteniamo due effetti:
1. **Ogni cammino ha un costo che aumenta** man mano che scendiamo di livello (non rimaniamo fermi a costo quasi 0).
2. **Esistono solo un numero finito di nodi con un costo minore del costo della soluzione** → l’algoritmo non può esplorare all’infinito.

Questa è la chiave della completezza.

#### Dimostrazione
![[Pasted image 20251025105156.png]]

### Stima ideale di A*
![[Pasted image 20251025105304.png]]
Questa slide serve per capire che A* è un algoritmo molto buono ma non è perfetto, perché non conosce i veri costi minimi.
Infatti, nella pratica, noi non conosciamo né g*(n) né h*(n):
- **g(n)** → è il costo _che abbiamo accumulato_ finora (può essere uguale o più grande del costo minimo reale g*(n));
- **h(n)** → è **una stima** di h*(n), cioè una previsione di quanto manca.

## Algoritmo A*: definizione
***Definizione***: *euristica ammissibile* $$\forall n, \ h(n) \le h^{*}$$cioè
> per ogni nodo `n`, l'euristica **non deve mai sovrastimare** il vero costo per arrivare al goal.

Quindi, **un’euristica è ammissibile se è sempre una “sottostima”** del costo reale.


***Definizione***: *Algoritmo `A*`*
> “Un **algoritmo A*** è un algoritmo A in cui la funzione euristica h è ammissibile.”

Cioè A* non è altro che la versione di Best-First Search con: $$f(n) = g(n) + h(n)$$dove h(n) è una **sottostima realistica** del costo residuo.


***Teorema***: *Gli algoritmo `A*` sono ottimali*
> Se h(n) è ammissibile, allora A* **troverà sempre la soluzione ottimale** (quella col costo minimo reale).

Perché?
- Se h(n) sottostima sempre il costo reale,
- A* non potrà mai “saltare” un cammino più economico:  
	- prima di espandere un percorso più costoso,  
	- espanderà sempre quello con il costo totale stimato più basso.


***Corollario***: BF e UC sono ottimali (`h(n) = 0`)


## Pseudocodice A*
```scss
function A* (problem) returns a solution or failure
	nodo <- nodo con stato = problem.initialstate
	frontiera <- coda di priorità ordinata in base a f(n) con all'inizio solo nodo 
                 "nodo"
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

## Proprietà di A*
- ***COMPLETEZZA*** -> si (a meno che non vi sia un numero infinito di nodi con $f ≤ f(G))$)
	- se ci sono infiniti nodi "promettenti", l'algoritmo potrebbe non finire mai di esplorarli.
	
- ***TEMPO*** -> esponenziale
	- A* esplora _tutti_ i nodi con f(n) ≤ f(goal);
	- e il numero di questi nodi cresce molto rapidamente, soprattutto se l’euristica non è molto precisa.
	
- ***SPAZIO*** -> mantiene tutti i nodi in memoria
	
- ***OTTIMALITÀ*** -> si


## Considerazioni su A*
1. ==Una sottostima può farci compiere del lavoro inutile, però non ci fa perdere il cammino migliore.==
	- Se **h(n)** è una _sottostima_ del costo reale (**ammissibile**), allora A* rimane **ottimale**.
	- Però, se la sottostima è **troppo ottimista**, A* esplorerà **molti nodi inutili** perché non riesce a “capire subito” quale strada è la migliore.
	👉 In pratica:
		Una h troppo piccola = A* più lento, ma comunque corretto.
	
2. ==La componente g fa sì che si abbandonino cammini che vanno troppo in profondità.==
	- se un cammino sta diventando troppo lungo (cioè g(n) cresce molto), il suo f(n) diventa grande → **A*** lo considera meno promettente e lo scarta.
		- ricorda che `(g(n))` è il costo già speso
	
3. ==Una funzione che qualche volta sovrastima può farci perdere la soluzione ottimale.==
	- Se l’euristica **h(n)** qualche volta **sovrastima** (cioè è più grande del costo reale h*(n)), allora:
		- A* può pensare che un certo percorso sia più costoso di quanto sia davvero,
		- e quindi **potrebbe non esplorarlo**, credendo che non convenga.


## Ottimalità di A*
- **PER LA RICERCA SUGLI ALBERI** -> è sufficiente l'uso di un'euristica ammissibile
- **PER LA RICERCA SUI GRAFI** -> serve una proprietà più forte: la ***consistenza*** (detta anche *monotonicità*)


## Euristica consistente o monotòna
La definizione formale è $$h(goal) = 0$$e $$\forall n, \ h(n) \le c(n,a,n') + h(n')$$dove
- $n′$ è un **successore** di $n$,
- $c(n,a,n^{′})$ è il **costo reale** dell’azione per andare da $n$ a $n^{′}$.

>[!tip]- Tradotto in parole semplici:
Un’**euristica è consistente** se la **stima del costo** da un nodo $n$ al goal **non è mai maggiore** del costo reale per andare a un successore n′ **più** la stima da n′ al goal.
>
In altre parole:
> “Ogni passo che faccio verso il goal deve ridurre la stima h(n) di un valore **non superiore** al costo effettivo del passo.”


### Cosa implica: $f(n) \le f(n^{'})$ (monotonia)
Dalla condizione sopra deriva automaticamente che:
$$f(n) = g(n) + h(n) \le g(n') + h(n') = f(n')$$

Questo significa che:
> lungo un cammino, il valore di $f(n)$ **non diminuisce mai**.

In altre parole:
- ogni volta che A* espande un nodo,
- i nodi successivi non potranno mai avere f più basso.

👉 ecco perché si dice **euristica “monotòna”**:  
	f(n) **cresce o resta uguale**, ma **non scende mai**.

### Perché è importante
Questa proprietà ha due effetti pratici fondamentali per A*:
1. **Efficienza:**  
    Se h è consistente, A* **non deve mai riespandere un nodo** già visitato.  
    (perché non potrà mai trovare un percorso con f minore del precedente).
2. **Ordine perfetto:**  
    I nodi vengono espansi **in ordine non decrescente di f(n)**, cioè dal più promettente al meno promettente.

👉 Questo rende A* più semplice, più veloce e più sicuro nella gestione della frontiera.


## Proprietà delle euristiche monòtone
1. ***TEOREMA***: se un'euristica è **monòtona**, allora è automaticamente ammissibile (non vale sempre il contrario!)
	
2. Esistono euristiche ammissibili che non sono monotone (ma sono rare)
	- nel senso che può esistere un'euristica che sottostimi (ammissibile), ma non rispetti la regola di monotonia
	
3. Le euristiche monotone garantiscono che la soluzione meno costosa venga trovata per prima
	Se h è monotona, allora:
	- i valori di f(n) **non diminuiscono mai** lungo i cammini;
	- quindi A* esplora i nodi **in ordine crescente di f(n)** (dal più economico al più costoso).
	
	👉 Risultato:
	- quando A* trova **una soluzione**, è **sicuramente quella col costo minimo** —  
> perché nessun altro percorso meno costoso poteva avere un f più basso e venire scelto prima.


>[!tip]- Esempi euristiche ammissibile
>![[Pasted image 20251025121438.png]]![[Pasted image 20251025121444.png]]


## Bilancio su A*
![[Pasted image 20251025122012.png]]

>[!problem] PROBLEMA DI A* -> occupa troppo a livello di memoria $(O(b^{d+1}))$ 


---

# Migliorare l'occupazione in memoria di A*

# Beam Search
Invece di tenere in memoria TUTTI I NODI, l'idea è quella di ricordare solo i *k nodi più promettenti*, dove `k` è detto **ampiezza del raggio (beam)**.

>[!tip] LA BEAM SEARCH ***NON* È COMPLETA**

### Idea e pseudocodice
![[Pasted image 20251025122351.png]]![[Pasted image 20251025122405.png|center]]
>[!tip]- Esempio
>![[Pasted image 20251025122444.png]]

>[!tip] Diverse applicazioni
>![[Pasted image 20251025122758.png]] Tutti questi processi devono **scegliere una sequenza ottimale** di output fra milioni di possibilità.  
→ Qui entra in gioco **Beam Search**, che esplora solo le migliori _K_ continuazioni invece di tutte.
>
>![[Pasted image 20251025122825.png]]Qui abbiamo un `beam = 2` (è un'applicazione diretta dell'algoritmo)
>
>![[Pasted image 20251025122906.png]]Questa mostra **l’applicazione pratica** del beam search durante l’addestramento di un modello di _Speech Recognition_ o _Machine Translation_.


---

# IDA*
L'algoritmo IDA* combina
- A*
- ricerca in profondità iterativa (ID)
Più precisamente, combina i vantaggi di entrambe
- come A*: usa la funzione di valutazione $$f(n) = g(n) + h(n)$$
- come ID: esplora **in profondità**, ma **con un limite**.

### Differenza chiave: il limite su `f`, non sulla profondità
Nel classico “approfondimento iterativo” (ID), il limite è sulla **profondità** (quanti passi posso fare).

In IDA*, invece, il limite è sul valore di **f(n)** (cioè sul costo stimato totale).
Quindi:
- Si imposta un limite iniziale $f_{limit}$ ;
- Si esplora in profondità solo i nodi con $f(n) ≤ f_{limit}$
- Se non si trova la soluzione, si aumenta $f_{limit}$ e si ricomincia.

Questo processo si ripete finché non si trova una soluzione.

## Come funziona (riassunto operativo)
1. **Inizializza** $$f_{limit} = f(nodo \ iniziale)$$
2. **Ricerca in profondità limitata**  
    esplora tutti i nodi con$f(n) \le f_{limit}$
    
3. **Se non trovi il goal**, aumenta $f_{limit}$ al **minimo valore di f(n)** che ha superato il limite precedente
    
4. **Ripeti** finché non trovi il goal.

👉 Così IDA* si espande “a strati” di f crescenti


## Ma di quanto deve essere aumentato il limite $f_{limit}$?
Abbiamo due casi principali
1. CASO 1 -- Costi fissi delle azioni
	- Se ogni passo costa la stessa quantità (es. 1), allora possiamo aumentare il limite di `1` a ogni azione
	
2. CASO 2 -- Costi variabili
	- Se i passi costano diversamente **non possiamo aumentare il limite di una quantità fissa**,   perché non sappiamo qual è “il passo giusto” per includere la prossima soluzione.
	👉 Soluzione:  si guarda **tutti i nodi che sono stati scartati** perché avevano $f(n) \ge f_{limit}$
		Poi
		 - si prende **la più piccola di queste f**
		 - e la si usa come nuovo limite per la prossima iterazione

>[!tip] Esempio del caso 2
Diciamo che il tuo `f_limit = 10`.  
Durante la ricerca, trovi nodi con f = 8, 9, 10 (ok, esplorati) e altri con f = 11, 13, 15 (scartati).
>
👉 Il più piccolo scartato è 11 → `next_limit = 11`.  
Alla prossima iterazione esplorerai **tutti i nodi con f ≤ 11**.

## Considerazioni
![[Pasted image 20251025140435.png]]

## Valutazioni funzioni euristiche
A parità di ammissibilità, una euristica può essere più efficiente di un'altra nel trovare il cammino soluzione migliore (visitare meno nodi) **IN BASE A QUANTO È INFORMATA**.

>[!tip] Più informata = più vicina al costo reale $h^{*}(n)$

Abbiamo infatti
- $h(n) = 0$ -> minimo di informazione (BF o UC)
- $h^{*}(n)$ -> massimo di informazione (oracolo)
In generale, per le ***euristiche ammissibili*** $$0 \le h(n) \le h^{*}(n)$$

>[!lemma] TEOREMA
>Se $h_{1} \le h_{2}$, i nodi espansi da A* con $h_{2}$ sono **un sottoinsieme** dei nodi espansi da A* con $h_{1}$.
>Se $h_{1} \le h_{2}$, allora A* con $h_{2}$ è **almeno efficiente quanto** A* con $h_{1}$

Questo perché
- se $h_{1} \le h_{2}$, vuol dire che $h_{2}$ **fornisce stime "più alte"** (vicine al valore reale ($h^{*}(n)$) pur restando **ammissibile** 
	- allora possiamo dire che $h_{2}$ è **più precisa**.
		- più precisa vuol dire che **espande meno nodi**, da qui derivano
			- **SOTTOINSIEME** -> perché A* con $h_{2}$ visita meno nodi
			- **ALMENO EFFICIENTE** -> perché A* con $h_{2}$ impiega meno tempo (o al massimo lo stesso di A* con $h_{1}$)


>[!tip]- Esempio
>![[Pasted image 20251025141853.png]]La **distanza Manhattan** tra due caselle è il **numero di mosse orizzontali e verticali** (non diagonali) necessarie per spostarsi da una posizione all’altra.


## Compromesso tra costo del calcolo dell'euristica e il costo delle ricerca
![[Pasted image 20251025142647.png]]Questo grafico mostra il compromesso tra quanto è informata un’euristica e il costo totale della ricerca.  
- Un’euristica poco informata è veloce da calcolare ma fa esplorare molti nodi, quindi la ricerca è lenta.  
- Al contrario, un’euristica molto precisa riduce la ricerca ma è più costosa da calcolare.  
Il **costo complessivo** è dato dalla somma di questi due effetti.  
L’obiettivo è trovare un equilibrio: un’euristica abbastanza informata da ridurre lo spazio di ricerca, ma non troppo complessa da rendere il calcolo inefficiente.


## Valutare l'efficacia di un'euristica
Per misurare quanto è “forte” o efficace un’euristica possiamo utilizzare un valore chiamato **fattore di diramazione effettivo (`b*`)**.
>b* rappresenta **quanti nodi, in media, vengono generati per ogni nodo esplorato** durante la ricerca.

Per calcolarlo, si considerano:
- **N** = il numero totale di nodi generati dall’algoritmo;
- **d** = la profondità della soluzione (cioè quanti passi servono per arrivare al goal).

Poi si immagina un **albero uniforme** che ha lo stesso numero di nodi, e si risolve l’equazione: $$N +1 = b^{*} + (b^{*})^{2} + ...+ (b^{*})^{d}$$per trovare $b^{*}$.

Più **b*** è basso, **più l’euristica è efficace**, perché l’algoritmo riesce a “stringere” la ricerca esplorando meno nodi.  
In generale, una buona euristica ha **b*** vicino a 1 (di solito sotto 1.5).

>[!tip]- Esempi
>![[Pasted image 20251025143505.png]]

#### Esempio utile
![[Pasted image 20251025143457.png|center|400]]

![[Pasted image 20251025143621.png]]


---

# Come inventare un'euristica
Diverse strategie.

## 1. Rilassamento del problema
Se il problema originale è difficile da risolvere, possiamo “semplificarlo” togliendo alcune regole o vincoli.  
> La soluzione del problema semplificato può darci una **stima del costo minimo** per risolvere quello reale → cioè una **euristica ammissibile**.

>[!tip]- Esempio
>![[Pasted image 20251025144053.png]]


## 2. Massimizzazione di euristiche
Se abbiamo più euristiche **senza dominazione reciproca** (cioè nessuna è sempre ≥ dell’altra),  
possiamo costruirne una nuova prendendo **il massimo** tra i loro valori: $$h(n) = max(h_{1}(n), h_{2}(n),...,h_{k}(n)$$

## 3. Euristiche da sottoproblemi
Spesso un problema grande può essere diviso in **sottoproblemi più piccoli**, che sono più facili da risolvere.  

L’idea è:
> il costo per risolvere un sottoproblema è sempre **una sottostima** del costo per risolvere l’intero problema.

Il passo successivo è rendere tutto automatico:
- si pre-calcola, una volta per tutte, **il costo minimo** per ogni possibile configurazione del sottoproblema;
    
- poi si salva tutto in un **database di pattern** (una tabella che mappa configurazioni → costi).
    
- durante la ricerca, basta consultare il database per sapere subito il valore dell’euristica $hDB(n)$.


## 4. Apprendere dall'esperienza
Invece di scrivere a mano un’euristica (come la distanza Manhattan, ecc.), possiamo **insegnare al programma** a stimare da solo il costo $h(n)$, basandosi sull’esperienza acquisita durante l’esecuzione.

Quindi l’euristica non è più definita da noi, ma **appresa automaticamente**.

![[Pasted image 20251025145429.png]]


## 5. Combinazione di euristiche
A volte **una sola euristica non basta** per descrivere la difficoltà di uno stato.  
In questi casi possiamo **combinare più euristiche diverse** in una **formula unica**, pesandole secondo la loro importanza: $$h(n) = c_{1}h_{1}(n) + c_{2}h_{2}(n) + ... + c_{k}h_{k}(n)$$Dove:
- $h_{i}​(n)$ = una diversa funzione euristica (che misura un certo aspetto del problema)
- $c_{i}$ = un coefficiente che ne indica il peso o l’importanza

>[!question] Come si scelgono i coefficienti `c`?
>Possono essere 
>- scelti a mano in base all'esperienza
>- oppure appresi automaticamente dal programma.


---

# Il problema di fondo
I metodi di **ricerca euristica** funzionano su problemi piccoli, ma in ambienti **reali e complessi** diventano troppo costosi in termini di tempo e memoria.


# Metodi di ricerca locale
Invece di analizzare tutto lo spazio di stati, questi metodi
- guardano solo una parte limitata del problema
- prendono decisioni locali
- e cercano una soluzione buona, non per forza ottima

### Assunzioni da riconsiderare
- Le azioni sono **non deterministiche** (una condizione -> più azioni) 
- gli ambienti sono **parzialmente osservabili** e **sconosciuti**


# Assunzioni sui problemi
Gli algoritmi visti finora cercavano un cammino nello spazio degli stati, ossia cercano di scoprire COME SI ARRIVA AL GOAL.

Alcuni problemi però hanno come goal solo il raggiungimento dello stato finale, ossia della soluzione, senza interessarsi del cammino.


# Algoritmi di ricerca locale
Gli algoritmi di ricerca locale sono pensati per problemi di ottimizzazione, dove:
- Non serve la sequenza di azioni,
- Basta trovare **una configurazione buona o ottimale**.
	Possiamo avere uno **stato completo ma imperfetto**, in cui ci sono già tutti gli elementi della soluzione ma **alcuni vincoli non sono ancora rispettati**.  
	L’algoritmo locale serve proprio a **migliorare progressivamente** la configurazione finché non diventa valida o ottimale.

Esempi tipici:
- Il problema delle **N regine**,
- Il **travelling salesman problem**,
- L’ottimizzazione di funzioni matematiche.


### Caratteristiche degli algoritmi di ricerca locale
- Non sono sistematici
- Tengono traccia solo del nodo corrente e si spostano su nodi adiacenti
- Non tengono traccia dei cammini
- Efficienti in occupazione di memoria
- Utili per risolvere problemi di ottimizzazione

![[Pasted image 20251028151437.png]]


---

# Ricerca in salita Hill climbing
L’algoritmo di **Hill Climbing**
- sa solo dove si trova (stato corrente),
- guarda nelle direzioni possibili (stati successori),
- sceglie la direzione che porta più in alto (cioè migliora di più la funzione obiettivo),
- e continua finché non può più migliorare.

👉 Quindi, è una **ricerca locale** perché considera solo gli stati vicini, e **greedy** perché cerca sempre il miglioramento immediato, senza guardare più lontano.

#### Funzionamento 
A ogni passo:
1. Si generano i **successori** dello stato corrente.
2. Si valuta ognuno secondo una **funzione di valutazione** (quanto è “buono” lo stato).
3. Si sceglie un nuovo stato **migliore** di quello attuale.

Se non esiste nessun successore migliore → **l’algoritmo si ferma** (anche se non ha trovato il massimo globale).

#### Tre versioni principali
1. **Salita rapida**
    → si scelgono **tutti** i successori, si valuta ciascuno, e si passa al **migliore**.  
    È la versione più “precisa” ma anche la più lenta.
    
2. **Hill climbing stocastico**  
    → si sceglie **uno a caso** tra i successori che migliorano la situazione.  
    A volte evita di bloccarsi in massimi locali, ma introduce casualità.
    
3. **Hill climbing con prima scelta**  
    → si esplorano i successori in ordine e si prende **il primo che migliora**.  
    È più veloce ma può ignorare alternative migliori.

## ⚠️ Quando termina
L’algoritmo **termina** quando:
- nessuno dei vicini è migliore (si è raggiunto un **massimo locale**),
- oppure si entra in una **zona piatta** dove tutti i successori hanno lo stesso valore.
Questo è il principale limite di Hill Climbing.


#### Algoritmo 
![[Pasted image 20251028152145.png]]


## Problemi dell'Hill Climbing
- **MASSIMI LOCALI MA NON GLOBALE**
	- Un _massimo locale_ è un punto più alto di tutti quelli vicini, ma **non è per forza il massimo globale** (cioè non è la soluzione migliore possibile).
	Hill Climbing si ferma lì perché non trova vicini migliori, anche se ci fosse un percorso GLOBALMENTE migliore

- **ALTIPIANI (*plateaux*)**
	- Un _altipiano_ è una **zona piatta** della funzione, dove tutti gli stati hanno lo stesso valore.  In questo caso, l’algoritmo **non sa in che direzione andare**, perché nessun vicino migliora lo stato.
	Di solito rimane fermo o si muove casualmente, rischiando di non progredire.

- **CRINALI (o creste)**

![[Pasted image 20251028153216.png]]


## Miglioramenti
1. Consentire un numero limitato di **mosse laterali**
2. Hill climbing stocastico
3. Hill climbing casuale
4. **Hill climbing con riavvio casuale**
	- Se si blocca, RIPARTE DA UN NUOVO STATO INIZIALE CASUALE
	- Ripete questo processo più volte finché non trova una soluzione ottimale.
	- TENDENZIALMENTE è **completo** (basta ripetere!!)
	- Il funzionamento **non dipende molto dalla forma** del paesaggio, perché il riavvio consente di "saltare" in zone nuove.


## Simulated Annealing (Tempra simulata)
È una combinazione tra:
- **Hill Climbing**, che cerca sempre di migliorare lo stato,
- e una **scelta stocastica controllata**, che _a volte_ accetta anche stati peggiori.

Questo serve a **scappare dai massimi locali**:  
accettare temporaneamente un peggioramento può permettere di uscire da una “collina” e raggiungere un picco più alto (la soluzione globale).

#### Il ruolo della temperatura
La temperatura `T` controlla quanto l’algoritmo è disposto ad accettare peggioramenti:
- all’inizio `T` è alta → le mosse peggiori vengono accettate spesso (esplorazione ampia);
- col tempo `T` scende → il comportamento diventa più “rigido”, simile all’Hill Climbing.


#### Funzionamento effettivo
A ogni iterazione, l’algoritmo sceglie **un successore a caso** dello stato corrente (cioè una nuova possibile soluzione vicina).  
Poi decide **se accettarlo o no**, secondo queste regole:
1. ***CASO 1***: il successore migliore la soluzione
	- Se il nuovo stato `n'` ha un valore migliore di quello attuale `n` -> viene accettato subito (hill climbing classico)
	
2. ***CASO 2***: il successore è peggiore
	- se `n'` è peggiore (cioè $\Delta E = f(n^{'}) - f(n) < 0$) -> l'algoritmo può **accettarlo comunque**, ma con una **certa probabilità** $$p = e^{\Delta E/T}$$dove
		- $\Delta E$ è il peggioramento 
		- $T$ è la tempra corrente
		Poiché $\Delta E < 0$, il valore di $e^{\Delta E/T}$ sarà compreso tra `0` e `1`
	
	👉 Quindi, l’algoritmo **genera un numero casuale tra 0 e 1** e **accetta il nuovo stato** solo se il numero casuale è **minore di p**.  
	In pratica: più la mossa è “poco peggiore”, più è probabile che venga accettata.

##### Ruolo della temperatura `T`
La temperatura **controlla la probabilità di accettare peggioramenti**:
- Quando `T` è **alta**, anche stati peggiori vengono accettati spesso → grande esplorazione.
	- questo perché $\frac {\Delta{E}} T \approx 0$ e quindi $p = e^{0} \approx 1$ 
   
- Quando `T` **scende**, la probabilità diminuisce → il comportamento diventa più “rigido”, simile a Hill Climbing.

Man mano che l’algoritmo avanza, `T` **decresce gradualmente** secondo un piano definito (chiamato _cooling schedule_), ad esempio: $$T_{k+1} = \alpha \cdot T_{k} \ \ \  \ \ \text{con 0} < \alpha \ \text{< 1}$$
>[!tip] N.B: `p` è **inversamente proporzionale al peggioramento**: se una mossa peggiora di molto, sarà accettata con una probabilità più bassa.

### Algoritmo
![[Pasted image 20251028163107.png]]![[Pasted image 20251028163135.png|center|500]]

---

# Ricerca local beam
L’idea della **ricerca local beam** nasce per affrontare i limiti di memoria della ricerca locale tradizionale, che di solito mantiene un solo stato alla volta (come nell’Hill Climbing).  
In questo caso, invece, **vengono mantenuti contemporaneamente `k` stati**.

### Funzionamento
1. L’algoritmo inizia con `k` stati generati casualmente.
2. A ogni passo:
    - Si generano **tutti i successori** di questi `k` stati.
    - Se uno dei successori è una **soluzione**, l’algoritmo termina.
    - Altrimenti, si **selezionano i `k` migliori successori** (in base alla funzione di valutazione) e si ripete il processo.

### Differenza con la ricerca a riavvio casuale
A prima vista, la local beam può sembrare semplicemente **una versione parallela** della ricerca con riavvio casuale (che esegue più ricerche indipendenti).  

In realtà, **non è così**:
- Nella **ricerca a riavvio casuale**, ogni ricerca procede indipendentemente.
- Nella **local beam**, invece, **le ricerche comunicano tra loro**:
    - le informazioni sui migliori stati trovati vengono condivise,
    - e le risorse si concentrano dove i progressi sono più promettenti.

In questo modo, l’algoritmo **abbandona rapidamente** le direzioni poco fruttuose e continua a esplorare quelle più promettenti.

### ⚠️ Problema principale
Con il tempo, i `k` stati possono **convergere tutti nella stessa zona** dello spazio delle soluzioni (formando un _cluster_).  
Questo riduce la diversità della ricerca e la rende **simile a un Hill Climbing moltiplicato per `k`** — quindi più lenta ma non necessariamente più efficace.

### 🎲 Variante: Ricerca Beam Stocastica
Per evitare questa mancanza di diversificazione, esiste una variante chiamata **ricerca beam stocastica**:
- invece di scegliere sempre i migliori `k` successori,
- si scelgono **in modo probabilistico**, con una probabilità **proporzionale al loro valore euristico**.

Così si bilancia **esplorazione e sfruttamento**, evitando che tutti i cammini si concentrino sugli stessi stati promettenti.


---

# Ricerca con azioni non deterministiche
### 🧩 Contesto di partenza
Negli algoritmi di ricerca classici, si assume che:
- l’ambiente sia **completamente osservabile** (cioè l’agente sa sempre dove si trova);
- e che sia **deterministico**, quindi ogni azione ha **un solo risultato prevedibile**.

In questo caso, il piano è semplicemente una **sequenza di azioni** fisse, decise in anticipo (_offline_), e le percezioni servono solo **all’inizio** per determinare lo stato iniziale.

### ⚙️ Quando l’ambiente non è deterministico
In un ambiente **non deterministico** o **parzialmente osservabile**, la situazione cambia:
- l’agente **non conosce esattamente lo stato attuale** in cui si trova;
- e non può sapere **in quale stato arriverà** dopo aver eseguito un’azione.

Per gestire questa incertezza, l’agente mantiene un **insieme di stati possibili**, detto **stato-credenza** (_belief state_), cioè l’insieme di tutte le situazioni che ritiene plausibili.


### 🧠 Piani condizionali
In questi ambienti, una semplice sequenza di azioni non basta.  
Serve un **piano condizionale** (o _piano di contingenza_), cioè una **strategia** che specifica:
> “cosa fare in base a ciò che l’agente percepisce lungo il percorso”.

In pratica, il piano si adatta **alle percezioni e agli eventi imprevisti** durante l’esecuzione.


>[!tip]- 🧹 Esempio: Il mondo dell’aspirapolvere erratico
In questo ambiente:
>
>- Se l’azione **Aspira** è eseguita su un riquadro **sporco**, può:
>    
>    - pulirlo normalmente,
>        
>    - **e a volte pulire anche un riquadro adiacente**.
>        
>- Se invece è eseguita su un riquadro **già pulito**, può **sporcarlo di nuovo** in modo casuale.
>    
>
>Quindi l’ambiente è **non deterministico**, perché lo stesso comando può produrre **risultati diversi**.


### 🔄 Generalizzazione del modello di transizione
Per modellare questo comportamento, si passa:
- da una funzione classica **Risultato(s, a)** → _ritorna un solo stato_,
- a una nuova funzione **Risultati(s, a)** → _ritorna un insieme di stati possibili_.

In questo modo possiamo rappresentare tutti gli esiti che un’azione può produrre.


---

# Alberi di ricerca AND-OR
Quando ci troviamo in **ambienti non deterministici**, l’albero di ricerca classico (quello usato negli ambienti deterministici) **non basta più**.  
In questi casi si utilizza una struttura chiamata **albero AND–OR**, che rappresenta sia **le scelte dell’agente** sia **le incertezze dell’ambiente**.

### 🧠Differenza tra nodi OR e nodi AND
- **Nodi OR** → rappresentano **le scelte dell’agente**  
    Esempio: “Posso muovermi a destra oppure aspirare”.  
    L’agente sceglie **una sola** delle azioni disponibili.
    
- **Nodi AND** → rappresentano **le diverse conseguenze possibili di una stessa azione**, causate dall’ambiente non deterministico.  
    Esempio: “Se aspiro, potrei ottenere due risultati diversi: il pavimento resta sporco oppure si pulisce”.

Questi due tipi di nodi **si alternano** nell’albero.

![[Pasted image 20251029132355.png|center]]
- NODI OR -> cerchio singolo
- NODI AND -> cerchio singolo + semicerchio


### ✅ Soluzione di un problema AND–OR
Una **soluzione** non è una semplice sequenza di azioni (come nei problemi deterministici), ma un **sottoalbero** dell’albero di ricerca che rispetta tre condizioni:
1. Ogni **foglia** del sottoalbero è un **nodo obiettivo**.
2. In ogni **nodo OR**, è specificata **una sola azione** da eseguire.
3. In ogni **nodo AND**, **tutti i rami** devono essere inclusi, perché rappresentano i diversi possibili risultati dell’ambiente.


### Pseudocodice
![[Pasted image 20251029133828.png|center|600]]


## Soluzioni cicliche per problemi non deterministici
Pensiamo al **mondo dell’aspirapolvere scivoloso**, una variante del classico problema dell’aspirapolvere in cui:
- le azioni di movimento (**Sinistra**, **Destra**) **a volte falliscono**,
- e quindi l’agente può **rimanere fermo** anche se ha tentato di spostarsi.

### 🧩 Problema
A causa di questo comportamento **non deterministico**, non esiste una **soluzione aciclica** che porti sempre con certezza allo stato obiettivo.  
Se usassimo la normale ricerca AND–OR, l’algoritmo **fallirebbe**, perché non troverebbe un piano che garantisca il successo in tutti i casi.

### 🔁 Soluzione ciclica
Esiste però una **soluzione ciclica**, che consiste nel **ripetere un’azione finché non riesce**.  
Per esempio:
> “Continua a provare **Destra** finché non ti sposti davvero a destra”.

In pseudocodice, questa soluzione si esprimerebbe con un costrutto simile a:
```scss
while (non sei nel riquadro destro)
    esegui Destra
```

### Esempio visivo
![[Pasted image 20251029140334.png]]

### ⚙️ Condizioni di correttezza
Perché un piano ciclico sia valido, devono valere due condizioni:
1. **Ogni foglia** (cioè ogni possibile esito del piano) deve essere uno **stato obiettivo**;
2. Da **ogni punto del piano**, deve esserci **almeno un percorso** che porta a una foglia obiettivo.

In altre parole, qualunque cosa accada, esiste sempre una sequenza di azioni che **prima o poi** porta alla soluzione.

>[!danger] ATTENZIONE: l'ultima frase è vera SE E SOLO SE il fallimento è dovuto a una casualità; se invece il fallimento è dovuto a una condizione fissa e non osservata, ripetere non cambierà nulla. 


---

# Ricerca con osservazioni parziali
Quando l’agente si trova in un ambiente **parzialmente osservabile**, le sue percezioni **non bastano per sapere con certezza in quale stato si trova**.  
In questi casi, l’agente deve **gestire l’incertezza**, e a volte alcune delle sue azioni servono **non tanto a raggiungere un obiettivo**, ma a **raccogliere informazioni** e ridurre il dubbio sul proprio stato attuale.

### 🧠 Ricerca in assenza di osservazioni (problema senza sensori)
Se l’agente **non riceve nessuna informazione** dal mondo (cioè non ha sensori), si parla di **problema senza sensori** o **problema conformante**.

In questo tipo di problema:
- L’agente non sa dove si trova né lo stato esatto del mondo.
- Tuttavia, può comunque **ragionare su un insieme di stati possibili**, chiamato **stato-credenza (belief state)**.


>[!tip]- 🧩 Esempio: il mondo dell’aspirapolvere senza sensori
Immaginiamo il mondo dell’aspirapolvere deterministico, ma:
>- l’agente **conosce la mappa** del suo ambiente (sa che ci sono due stanze, ad esempio),
>- però **non sa dove si trova né quali riquadri sono sporchi**.
>
>Il suo stato iniziale, quindi, non è un singolo stato fisico, ma **l’insieme di tutti gli stati possibili**:
>
> {1, 2, 3, 4, 5, 6, 7, 8}
>
>Questo insieme rappresenta il **suo stato-credenza iniziale**.


### ⚙️ Come si svolge la ricerca
In questo caso, la ricerca non si svolge nello spazio degli stati reali, ma nello **spazio degli stati-credenza**.  
Ogni stato-credenza rappresenta **tutte le situazioni fisiche possibili** in cui l’agente potrebbe trovarsi.

In questo nuovo spazio, il problema diventa **completamente osservabile**,  
    perché l’agente conosce sempre **il proprio stato-credenza**, anche se non sa quale stato fisico specifico sta vivendo.


### 🧩 Componenti del problema di stati-credenza
1. **Stati:**  
    Ogni stato-credenza è un sottoinsieme degli stati fisici originali.  
    Se il problema `P` ha **`N` stati fisici**, allora il nuovo problema può avere fino a **2ⁿ stati-credenza** anche se non tutti sono effettivamente raggiungibili.
    
2. **Stato iniziale:**  
    Di solito è l’insieme di **tutti gli stati fisici possibili**, ma può essere ridotto se l’agente ha informazioni parziali.
    
3. **Azioni:**  
    Sono l’insieme di tutte le azioni possibili nei vari stati fisici inclusi nello stato-credenza.  
    In pratica:
    - se un’azione è lecita in almeno uno degli stati, può essere considerata;
    - ma se è pericolosa o dannosa in certi stati, conviene includere solo quelle **sicure in tutti**
    
4. **Modello di transizione:**  
    L’effetto di un’azione su uno stato-credenza è l’**unione** di tutti gli stati ottenibili applicando quell’azione a ciascuno degli stati possibili del belief state.
    
5. **Test obiettivo:**  
    Uno stato-credenza soddisfa l’obiettivo se **almeno uno dei suoi stati fisici** soddisfa la condizione obiettivo.
    
6. **Costo dell’azione:**  
    Se un’azione ha **costi diversi** nei vari stati, il costo nel belief state può essere:
    - il **valore medio** dei costi possibili,
    - oppure una **stima prudente** (es. il massimo), in base all’approccio adottato.


### Come vengono aggiornati gli stati credenza (versione deterministica e non)
![[Pasted image 20251029151214.png]]

### Spazio degli stati completo
![[Pasted image 20251029151242.png]]
Quando si lavora con stati-credenza, lo spazio cresce esponenzialmente: nel caso dell’aspirapolvere con 8 stati fisici si avrebbero 2⁸ = 256 stati-credenza, ma solo 12 realmente raggiungibili.  
Per evitare esplorazioni inutili si usa una **ricerca su grafo**, ignorando gli stati già visitati.  

Si può anche **potare** in modo più efficiente:
- se uno stato già incontrato `s'` è contenuto in `s` (`s'⊂s`), `s` è inutile e si scarta;
- se `s` è contenuto in `s'` (`s⊂s'`) e da `s'` esiste una soluzione, anche `s` si può scartare.

Poiché rappresentare tutti gli stati è costoso, si può applicare una **ricerca incrementale**:  
si trova una soluzione per un singolo stato, poi si verifica se funziona anche per gli altri.  
Questo approccio riduce i fallimenti precoci e mira a ottenere **una sola soluzione valida per tutti gli stati possibili**.


---

# Ricerca in ambienti parzialmente osservabili
In molti casi, un agente **non può risolvere un problema senza sensori**, perché non saprebbe mai in quale stato si trova.  

Per gestire questo tipo di situazioni, nella definizione del problema si introduce una funzione chiamata **Percezione(s)**, che restituisce la percezione che l’agente riceve quando si trova nello stato `s`.

Se i sensori sono **non deterministici**, la funzione diventa **Percezioni(s)**, e restituisce **un insieme di percezioni possibili**.
- Nei problemi **completamente osservabili**, vale **Percezione(s) = s**, perché l’agente conosce lo stato con certezza.
- Nei problemi **senza sensori**, invece, **Percezione(s) = null**, poiché l’agente non riceve alcuna informazione.

### 🧠 Transizione in ambienti parzialmente osservabili
Quando l’agente esegue un’azione, il passaggio da uno stato-credenza al successivo avviene in **tre fasi distinte**:
1. **Fase di predizione**  
    Si calcola lo **stato-credenza previsto** dopo aver eseguito un’azione, esattamente come nel caso senza sensori.  
    
2. **Fase delle percezioni possibili**  
    A partire dallo stato-credenza previsto, si calcola l’insieme di **tutte le percezioni** che l’agente potrebbe osservare.  
    Questa fase serve a stimare che tipo di informazioni i sensori potranno fornire.
    
3. **Fase di aggiornamento**  
    Per ogni possibile percezione, si calcola il nuovo **stato-credenza aggiornato**, che contiene solo gli stati coerenti con quella percezione.  
    In altre parole, si eliminano gli stati incompatibili con ciò che l’agente ha percepito.

Mettendo insieme le tre fasi (predizione → percezioni → aggiornamento), si ottiene l’insieme **dei possibili stati-credenza** che possono risultare da una data azione, tenendo conto anche delle percezioni future.

Durante la pianificazione, l’agente **non conosce ancora le percezioni future** che riceverà, ma deve comunque tenerne conto.  


---

# Agenti per ricerca online e ambienti sconosciuti
Finora abbiamo parlato di agenti che usano **ricerca offline**, cioè che **calcolano tutto il piano d’azione prima di iniziare ad agire**.  

Negli **ambienti reali**, però, questo approccio non sempre è possibile:  
l’ambiente può cambiare, le informazioni possono essere incomplete o il tempo per pianificare può essere limitato.  
In questi casi entra in gioco la **ricerca online**.

### 🧠 Cos’è la ricerca online
Nella **ricerca online**, l’agente **non pianifica tutto in anticipo**, ma alterna continuamente:
1. **Azione** – esegue un passo nell’ambiente;
2. **Osservazione** – percepisce il nuovo stato o le conseguenze dell’azione;
3. **Aggiornamento** – decide la prossima mossa in base a ciò che ha imparato.

La ricerca online è particolarmente efficace in:
- **ambienti dinamici o semidinamici**, dove lo stato del mondo cambia rapidamente e non c’è tempo per calcolare tutto in anticipo;
- **ambienti non deterministici**, dove le azioni possono produrre risultati diversi, e l’agente deve reagire alle situazioni reali che si verificano, invece di pianificare per tutte le possibilità teoriche.


>[!tip] PIANIFICAZIONE vs AZIONE
>C’è un compromesso importante: più un agente pianifica in anticipo, meno rischia di trovarsi in difficoltà; ma più pianifica, più tempo impiega prima di agire.
>
>Un buon agente deve quindi **bilanciare** il tempo speso a pianificare e quello speso ad agire.


### In ambienti sconosciuti
In un **ambiente sconosciuto**, l’agente **non conosce gli stati né gli effetti delle azioni**.  
Deve quindi imparare tutto **sperimentando**:
- ogni azione diventa un **test**,
- le osservazioni raccolte servono per **costruire progressivamente un modello** dell’ambiente.

Un esempio tipico è il **problema della costruzione di mappe**:  
un robot esplora un ambiente che non conosce, registrando passo dopo passo la posizione degli ostacoli e aggiornando la sua mappa interna.


### Come risolvere i problemi di ricerca online
Un **problema di ricerca online** si risolve attraverso tre attività fondamentali: 
- **elaborazione 
- **percezione** 
- **azione**.  
A differenza della ricerca offline, l’agente **non può conoscere in anticipo** il risultato di un’azione:  
non può cioè determinare **Risultato(s, a)** se non **trovandosi effettivamente nello stato `s` ed eseguendo l’azione `a`**.

In alcuni casi, l’agente può disporre di una **funzione euristica ammissibile h(s)**, che fornisce una stima della distanza tra lo stato corrente e uno stato obiettivo.

#### 🧩 Assunzioni per un problema di esplorazione
Nel contesto della ricerca online, si assumono le seguenti condizioni:
- Solo **lo stato corrente** è osservabile, mentre l’ambiente è **ignoto**.
- Non si conoscono **gli effetti** delle azioni né il **loro costo**.
- Gli **stati futuri** e le **azioni possibili** non sono noti a priori.
- L’agente deve eseguire **azioni esplorative** come parte della risoluzione del problema.

#### 🧠 Conoscenze dell’agente online nello stato s
Quando l’agente si trova in uno stato `s`, le sue conoscenze sono limitate a:
- le **azioni legali** nello stato attuale;
- il risultato **Risultato(s, a)**, ma solo **dopo aver eseguito l’azione `a`**;
- il **costo della mossa** $c(s, a, s^{'})$, anch’esso noto solo dopo l’esecuzione;
- il **Goal-Test(s)**, per verificare se lo stato è un obiettivo;
- la **stima della distanza** dal goal fornita dalla funzione euristica `h(s)`.

#### ⚙️ Obiettivo e costo della ricerca
Generalmente, lo scopo dell’agente è **raggiungere uno stato obiettivo minimizzando il costo complessivo del percorso**.  
Questo costo rappresenta **la somma effettiva dei costi delle azioni realmente eseguite**.

È prassi comune confrontare questo costo con quello che l’agente **avrebbe sostenuto conoscendo già l’intero spazio di ricerca** (cioè il cammino ottimo in un ambiente noto).  
Il rapporto tra questi due valori è chiamato **rapporto di competitività (competitive ratio)**, e idealmente dovrebbe essere **il più piccolo possibile**.

#### ⚠️ Limiti e problemi della ricerca online
Gli agenti di ricerca online sono **vulnerabili ai vicoli ciechi**, ossia a stati dai quali **non è più possibile raggiungere l’obiettivo**.  
Se l’agente **non conosce il significato delle azioni**, può compiere scelte che lo portano in situazioni **irreversibili** o da cui non può più uscire.

In generale, **nessun algoritmo può evitare i vicoli ciechi in tutti gli spazi degli stati**.  
Gli ambienti sono **esplorabili in modo sicuro** solo se:
- non esistono azioni irreversibili, e
- lo stato obiettivo è sempre raggiungibile.

Tuttavia, anche in questi casi, **non è garantito un rapporto di competitività limitato**, quindi la ricerca online può risultare comunque meno efficiente rispetto a una pianificazione offline completa.


## Agenti per ricerca online
Gli agenti online ad ogni passo decidono l'**azione da fare** (non il piano) e la eseguono.
- Si muove, esplora, scopre strada facendo.
- ES: DFS (è *locale* ma possiamo considerarla *online*)
	- una fattore fondamentale è il saper **tornare indietro (backtracking)** per provare altri rami.

Nel caso **offline** (come A* classico), l’agente conosce **tutta la mappa**: può pianificare dall’inizio alla fine senza muoversi davvero.  


### Ricerca locale online
Nella **ricerca online**, il valore della **funzione euristica** è conosciuto **solo dopo aver esplorato effettivamente uno stato**.  
- nel senso che, se io osservo `n` nodi non so, di ognuno, a priori, la stima rispetto all'obiettivo ma devo FISICAMENTE espandere quel nodo.

Come la ricerca in profondità, anche la **ricerca Hill Climbing** è locale: infatti espande solo gli stati vicini e **mantiene in memoria un solo stato per volta**.  
Per questo motivo, l’Hill Climbing può essere considerato **un algoritmo già online**.


### ⚠️ Limiti dell’Hill Climbing
Nonostante la sua natura locale, l’Hill Climbing **non è efficace per l’esplorazione**, perché:
- può **bloccarsi in un massimo locale**;
- non può utilizzare **riavvii casuali** come nella versione offline, poiché l’agente non ha la possibilità di “teletrasportarsi” in un nuovo stato iniziale.


### 🧩 Alternative ai riavvii casuali
Per superare questi limiti, si possono usare due varianti:
1. **Random Walk**  
    L’agente, in alcuni casi, sceglie **casualmente una delle azioni possibili** nello stato corrente.  
    Questo introduce una componente di casualità che può aiutarlo a uscire da massimi locali.
    
2. __Apprendimento Real-Time (LRTA)__  
    In alternativa, si può rendere l’Hill Climbing **più intelligente** aggiungendo **memoria e apprendimento** anziché casualità.  
    L’agente **aggiorna i valori euristici** man mano che esplora, rendendoli progressivamente più realistici.  
    Questo approccio è chiamato **LRTA*** (_Learning Real-Time A*_).


### ⚙️ Funzionamento di LRTA
L’algoritmo LRTA* simula il comportamento di A*, ma **in tempo reale** e **in modo locale**:
- valuta i nodi vicini e sceglie quello che sembra migliore
- aggiorna la **stima del costo** dello stato appena lasciato;
- poi sceglie la **mossa apparentemente migliore** in base alle stime correnti della funzione euristica `H`.  
    In questo modo l’agente impara progressivamente a valutare meglio i costi reali del percorso.


### 📊 Proprietà di LRTA
- È **completo** negli spazi **esplorabili in modo sicuro** (cioè senza azioni irreversibili).
- Nel **caso peggiore**, visita **ogni stato due volte**, ma in media è **più efficiente della ricerca in profondità online**.
- **Non è ottimale**, a meno che l’agente non disponga di **un’euristica perfetta**.


---

# Agenti logici
Gli **agenti logici** o **agenti basati sulla conoscenza** prendono decisioni utilizzando **un processo di ragionamento** che si basa su una **rappresentazione interna della conoscenza**.  
Questo significa che l’agente non agisce in modo puramente reattivo, ma **ragiona** sulle informazioni che possiede per decidere quali azioni eseguire.


### 🧩 Motivazione
Il mondo in cui opera un agente è generalmente **complesso, parziale e dinamico**.  
Per questo motivo:
- l’agente dispone solo di una **rappresentazione parziale e incompleta** del mondo reale;
- questa rappresentazione deve essere **sufficiente ai suoi scopi** (non serve conoscere tutto, ma solo ciò che è utile per agire correttamente);

Avere **maggiore conoscenza** del mondo è cruciale soprattutto quando:
- le osservazioni sono **parziali** (non tutto è visibile),
- oppure il mondo **cambia nel tempo**.   

In ambienti di questo tipo servono quindi:
- **linguaggi di rappresentazione della conoscenza** più espressivi,
- e **capacità inferenziali**, cioè la possibilità di **dedurre nuove informazioni** da quelle già note.


## 📚 Agenti basati sulla conoscenza (Knowledge-Based Agents)
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


### Requisito fondamentale
> Ogni risposta dell’agente deve essere **una conseguenza logica** di ciò che gli è stato detto in precedenza.  
> In simboli: se **KB ⊨ α**, allora α è logicamente conseguente da KB.


![[Pasted image 20251103142559.png]]
L’agente quindi:
1. **Osserva** l’ambiente (percezioni → formule logiche);
2. **Ragiona** deducendo nuove informazioni (inferenza logica);
3. **Agisce** nel mondo e aggiorna la KB.


### Costruzione di un agente basato su conoscenza
Un agente basato su conoscenza può essere
- **Dichiarativo:** si “dice” all’agente _cosa sapere_ (formule logiche esplicite).  
    ➜ più **modulare**, **manutenibile**, **spiegabile**.
- **Procedurale:** si “programma” direttamente il comportamento con codice.  
    ➜ meno flessibile e più difficile da modificare.


#### 🧮 Approccio procedurale (contrapposto)
L’**approccio procedurale**, invece, consiste nel **programmare direttamente** il comportamento dell’agente.  
In questo caso non si “spiega” all’agente cosa significa qualcosa, ma si **codifica nel programma** come deve agire in ogni situazione.


### 🧩 Ruolo della logica nei sistemi basati su conoscenza
La logica permette di implementare due funzioni fondamentali:
- **Rappresentazione:**  
    i fatti e le regole del mondo vengono espressi come **insiemi di frasi** in un linguaggio logico (ad esempio logica proposizionale o logica del primo ordine).
    
- **Ragionamento:**  
    l’agente utilizza la logica per **dedurre conseguenze logiche** a partire dai fatti e dagli assiomi presenti nella sua base di conoscenza.


### ⚙️ Componenti di un formalismo logico
Un formalismo per rappresentare la conoscenza si compone di tre parti fondamentali:
1. **Sintassi**  
    È il linguaggio logico utilizzato, definito da un **vocabolario di simboli** e da **regole** che stabiliscono come formare frasi (enunciati) valide.  
    Es.: “Se piove, allora la strada è bagnata” può essere scritto come $P \rightarrow Q$.
    
2. **Semantica**  
    Collega gli enunciati logici ai **fatti del mondo reale**.  
    Se un agente ha una formula nella sua KB, significa che **crede che il fatto corrispondente sia vero** nel mondo.  
    La semantica quindi definisce **quando un enunciato è vero o falso**.
    
3. **Meccanismo inferenziale**  
    È l’insieme delle **regole di inferenza** che consentono di **derivare nuovi fatti** a partire da quelli già noti.  
    In pratica, è ciò che permette all’agente di “ragionare” deduttivamente.


### Rappresentazione e mondo
- La **rappresentazione logica** produce **nuovi fatti** (inferenze) coerenti con la realtà.
- La **semantica** collega formule e mondo:
    - “verso il basso” → formule → fatti reali (interpretazione);
    - “verso l’alto” → nuovi fatti logici → nuovi aspetti veri del mondo.
![[Pasted image 20251112114547.png]]

### 🌍 Grounding: collegare logica e realtà
Un ultimo aspetto cruciale è il **grounding**, cioè il collegamento tra i **processi logici interni** dell’agente e **il mondo reale** in cui agisce.  

Questo legame viene creato dai **sensori**:
- ad esempio, nel mondo del Wumpus, se l’agente percepisce un odore, il sensore genera una formula logica come “C’è un odore nella cella attuale”.
    
- quella formula viene inserita nella KB e, quindi, è considerata **vera nel mondo reale**.

>[!tip] Le credenze sono il risultato di percezioni.

Il **significato** e la **verità** delle formule percettive dipendono dai processi di percezione e dalle regole sintattiche che le producono.

#### Esempio
![[Pasted image 20251112115810.png]]![[Pasted image 20251112115821.png]]


### Ragionamento non monotono
Nella **logica classica** vale la **monotonia**: se $KB ⊨ α$, allora anche $KB ∪ \{β\} ⊨ α$ 
- Se aggiungo una nuova informazione non modifico ciò che prima era vero

Nel ragionamento umano, invece, **nuove informazioni possono invalidare** conclusioni precedenti → **ragionamento non monotòno**.

> Esempio: “Gli uccelli volano; Tweety è un uccello ⟹ vola.”  
> Aggiungo: “Tweety è un pinguino” ⟹ la conclusione non vale più.  
> È tipico del **ragionamento per default** e dell’**assunzione di mondo chiuso**.


---


# Agenti logici
Gli **agenti logici** o **agenti basati sulla conoscenza** prendono decisioni utilizzando **un processo di ragionamento** che si basa su una **rappresentazione interna della conoscenza**.  
Questo significa che l’agente non agisce in modo puramente reattivo, ma **ragiona** sulle informazioni che possiede per decidere quali azioni eseguire.


### 🧩 Motivazione
Il mondo in cui opera un agente è generalmente **complesso, parziale e dinamico**.  
Per questo motivo:
- l’agente dispone solo di una **rappresentazione parziale e incompleta** del mondo reale;
- questa rappresentazione deve essere **sufficiente ai suoi scopi** (non serve conoscere tutto, ma solo ciò che è utile per agire correttamente);

Avere **maggiore conoscenza** del mondo è cruciale soprattutto quando:
- le osservazioni sono **parziali** (non tutto è visibile),
- oppure il mondo **cambia nel tempo**.   

In ambienti di questo tipo servono quindi:
- **linguaggi di rappresentazione della conoscenza** più espressivi,
- e **capacità inferenziali**, cioè la possibilità di **dedurre nuove informazioni** da quelle già note.


## 📚 Agenti basati sulla conoscenza (Knowledge-Based Agents)
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


### Requisito fondamentale
> Ogni risposta dell’agente deve essere **una conseguenza logica** di ciò che gli è stato detto in precedenza.  
> In simboli: se **KB ⊨ α**, allora α è logicamente conseguente da KB.


![[Pasted image 20251103142559.png]]
L’agente quindi:
1. **Osserva** l’ambiente (percezioni → formule logiche);
2. **Ragiona** deducendo nuove informazioni (inferenza logica);
3. **Agisce** nel mondo e aggiorna la KB.


### Costruzione di un agente basato su conoscenza
Un agente basato su conoscenza può essere
- **Dichiarativo:** si “dice” all’agente _cosa sapere_ (formule logiche esplicite).  
    ➜ più **modulare**, **manutenibile**, **spiegabile**.
- **Procedurale:** si “programma” direttamente il comportamento con codice.  
    ➜ meno flessibile e più difficile da modificare.


#### 🧮 Approccio procedurale (contrapposto)
L’**approccio procedurale**, invece, consiste nel **programmare direttamente** il comportamento dell’agente.  
In questo caso non si “spiega” all’agente cosa significa qualcosa, ma si **codifica nel programma** come deve agire in ogni situazione.


### 🧩 Ruolo della logica nei sistemi basati su conoscenza
La logica permette di implementare due funzioni fondamentali:
- **Rappresentazione:**  
    i fatti e le regole del mondo vengono espressi come **insiemi di frasi** in un linguaggio logico (ad esempio logica proposizionale o logica del primo ordine).
    
- **Ragionamento:**  
    l’agente utilizza la logica per **dedurre conseguenze logiche** a partire dai fatti e dagli assiomi presenti nella sua base di conoscenza.


### ⚙️ Componenti di un formalismo logico
Un formalismo per rappresentare la conoscenza si compone di tre parti fondamentali:
1. **Sintassi**  
    È il linguaggio logico utilizzato, definito da un **vocabolario di simboli** e da **regole** che stabiliscono come formare frasi (enunciati) valide.  
    Es.: “Se piove, allora la strada è bagnata” può essere scritto come $P \rightarrow Q$.
    
2. **Semantica**  
    Collega gli enunciati logici ai **fatti del mondo reale**.  
    Se un agente ha una formula nella sua KB, significa che **crede che il fatto corrispondente sia vero** nel mondo.  
    La semantica quindi definisce **quando un enunciato è vero o falso**.
    
3. **Meccanismo inferenziale**  
    È l’insieme delle **regole di inferenza** che consentono di **derivare nuovi fatti** a partire da quelli già noti.  
    In pratica, è ciò che permette all’agente di “ragionare” deduttivamente.


### Rappresentazione e mondo
- La **rappresentazione logica** produce **nuovi fatti** (inferenze) coerenti con la realtà.
- La **semantica** collega formule e mondo:
    - “verso il basso” → formule → fatti reali (interpretazione);
    - “verso l’alto” → nuovi fatti logici → nuovi aspetti veri del mondo.
![[Pasted image 20251112114547.png]]

### 🌍 Grounding: collegare logica e realtà
Un ultimo aspetto cruciale è il **grounding**, cioè il collegamento tra i **processi logici interni** dell’agente e **il mondo reale** in cui agisce.  

Questo legame viene creato dai **sensori**:
- ad esempio, nel mondo del Wumpus, se l’agente percepisce un odore, il sensore genera una formula logica come “C’è un odore nella cella attuale”.
    
- quella formula viene inserita nella KB e, quindi, è considerata **vera nel mondo reale**.

>[!tip] Le credenze sono il risultato di percezioni.

Il **significato** e la **verità** delle formule percettive dipendono dai processi di percezione e dalle regole sintattiche che le producono.

#### Esempio
![[Pasted image 20251112115810.png]]![[Pasted image 20251112115821.png]]


### Ragionamento non monotono
Nella **logica classica** vale la **monotonia**: se $KB ⊨ α$, allora anche $KB ∪ \{β\} ⊨ α$ 
- Se aggiungo una nuova informazione non modifico ciò che prima era vero

Nel ragionamento umano, invece, **nuove informazioni possono invalidare** conclusioni precedenti → **ragionamento non monotòno**.

> Esempio: “Gli uccelli volano; Tweety è un uccello ⟹ vola.”  
> Aggiungo: “Tweety è un pinguino” ⟹ la conclusione non vale più.  
> È tipico del **ragionamento per default** e dell’**assunzione di mondo chiuso**.


---

# Sintassi
La sintassi definisce quali sono le frasi legittime del linguaggio.
![[Pasted image 20251112132237.png]]

>[!tip] `|` indica OPPURE


### Esempi
![[Pasted image 20251112132535.png]]


# Semantica e mondi possibili (modelli)
La semantica riguarda **il significato delle frasi logiche**, ossia stabilisce quando una formula è vera o falsa rispetto a un certo mondo possibile, detto **interpretazione**.

>[!tip] INTERPRETAZIONE = assegnazione di verità alle variabili (vero o falso)

>[!tip] MODELLO = interpretazione che rende la formula vera.

## Conseguenza logica
Una formula `A` è conseguenza logica di KB se:
$$
𝐾
𝐵
⊨
𝐴
 ⇔ 
𝑀
(
𝐾
𝐵
)
⊆
𝑀
(
𝐴
)
$$
cioè: tutti i modelli che rendono vera KB rendono vera anche A.
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

![[Pasted image 20251112154349.png]]


## Equivalenza logica 
A === B $\iff$ A |= B e B|= A
![[Pasted image 20251112154446.png]]
![[Pasted image 20251112154455.png]]

# Validità e soddisfacibilità
Una formula `A`  è **VALIDA** se è vera in tutte le interpretazioni (`A` è detta anche *tautologia*) 
- `A` è valida se $\neg A$ NON è soddisfacibile    


Una formula `A` è **SODDISFACIBILE** se esiste (almeno) un'interpretazione in cui `A` è vera


# Inferenza
L’inferenza serve per **verificare se una formula è conseguenza logica** della base di conoscenza (KB).

Abbiamo tre metodi per farlo
### 🔹 1. _Model Checking_
È il metodo più semplice:
- si **enumerano tutti i possibili modelli** (cioè tutte le combinazioni di vero/falso per i simboli proposizionali);
- si controlla in quali modelli KB e A sono vere.  
    Se A è vera in **tutti** i modelli che rendono vera KB → allora KB ⊨ A.

👉 È il principio dietro le **tabelle di verità**.  


### 🔹 2. _Verifica della soddisfacibilità (SAT)_
Un modo equivalente per verificare la conseguenza logica è controllare se
> (KB ∧ ¬A) è **insoddisfacibile**  
> cioè **non esiste alcun modello** che la renda vera.
Se (KB ∧ ¬A) non può mai essere vera → vuol dire che A **segue logicamente** da KB.


### 🔹 3. Algoritmi citati
- **TT-entails** → usa tabelle di verità (controllo esaustivo dei modelli).
    ![[Pasted image 20251112155554.png]]
    
- **DPLL (Davis–Putnam–Logemann–Loveland)** → algoritmo più efficiente per testare la _soddisfacibilità_ (non è richiesto a lezione, solo da leggere).
    
- **WalkSAT** → metodo di _ricerca locale_ usato in SAT solvers per trovare rapidamente modelli (anche questo solo menzionato).


![[Pasted image 20251112155607.png]]

### Logica Proposizionale (PROP)
### Sintassi
- Simboli proposizionali: P, Q, R…
- Connettivi logici: ¬ (not), ∧ (and), ∨ (or), ⇒ (implica), ⇔ (equivalenza).
- Precedenza: ¬ > ∧ > ∨ > ⇒ > ⇔.
Esempi di formule:
- P ∧ Q
- ¬R ⇒ (P ∨ Q) 
### Semantica
- Ogni **modello** assegna True/False a ciascun simbolo.
- Le regole di verità:
    - ¬P è vera sse P è falsa.
    - P ∧ Q è vera sse entrambi sono veri.
    - P ⇒ Q è falsa solo se P è vera e Q è falsa.
    - True è sempre vera, False sempre falsa.
→ Possiamo usare **tabelle di verità** per calcolare il valore logico delle formule.


# 🔹 Logica dei Predicati del Primo Ordine (FOL)
La FOL estende la logica proposizionale introducendo:
- **Oggetti**, **relazioni**, **funzioni**, **quantificatori** (∀, ∃).  
    Esempio:
    - ∀x Uomo(x) ⇒ Mortale(x)
    - Uomo(Socrate)
    - ⇒ Mortale(Socrate)

# 🔹 Vantaggi della rappresentazione logica

|Vantaggio|Descrizione|
|---|---|
|**Modularità**|La conoscenza può essere riutilizzata per altri compiti.|
|**Raffinabilità**|È possibile aggiungere nuove regole o credenze.|
|**Manutenibilità**|Cambiare un fatto richiede modifiche locali.|
|**Trasparenza epistemologica**|Il sistema può spiegare perché conclude qualcosa.|


## Formula ben formata
Una formula ben formata è una formula che rispetta la semantica.


## Inferenza
Processo sintattico che permette di derivare informazioni a partire da quelle già note, seguendo le regole logiche.
- Processo sintattico = opera su espressione delle formule NON sul loro significato.
Si scrive $$KB \ ⊢ \ a$$ (“A si può derivare sintatticamente dalla KB usando le regole di inferenza”)

##### ✅ 1. Correttezza (soundness)
- Se **KB ⊢ A** allora **KB ⊨ A**  
- → tutto ciò che derivo è _davvero_ vero.  
- 👉 **Questo è sempre possibile**: basta scegliere regole valide.
##### ⚠️ 2. Completezza (completeness)
- Se **KB ⊨ A** allora **KB ⊢ A**  
- → tutto ciò che è logicamente conseguenza deve essere derivabile.
- 👉 **Questo NON è sempre possibile**  
- (in particolare nella logica del primo ordine).


## Metodi per eseguire le regole di inferenze
Le regole di deduzione naturale sono schemi deduttivi che permettono di _derivare nuove formule_ a partire da formule già presenti nella KB.
Un esempio è l **Modus Ponens** o anche detto eliminazione dell'implicazione 
![[Pasted image 20251116151857.png]]