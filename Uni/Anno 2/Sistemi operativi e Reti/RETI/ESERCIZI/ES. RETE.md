# PIANO DATI
### ESERCIZIO 1
![[Pasted image 20250708174251.png]]
1. Prendi i **numeri singolarmente** (142 - 251 - 209 - 3)
	- CODIFICALI IN **BINARIO**
	- SCRIVILI UNO DI FIANCO ALL'ALTRO 
		- se un numero si rappresenta con meno di 8 bit -> aggiungi `n` bit a 0 prima

2. a) Guarda la tabella ![[Pasted image 20250415150840.png|center|400]]
	Trova la classe di appartenenza dell'IP -> vedi "**maschera di sottorete**"
	
	b) Guarda "**parte della sottorete**" -> riscrivi i primi `/x` bit dell'IP + restanti `.0` e aggiungi alla fine `/x`
	
	c) Guarda "**parte della sottorete**" -> i primi `/x` bit dell'IP sono della rete, i restanti dell'Host
	
	d) Formula $2^{\text{PARTE CHE NON È x}}-2$ interfacce (`-2` perché escludiamo indirizzo della sottorete e broadcast)
	
	e) Poni tutto ciò che non è `/x` a `.255`


### ESERCIZIO 2
![[Pasted image 20250708175704.png]]
1. Ordina in base al numero di bit della sottorete simile
2. PUOI convertire i byte differenti dall'IP in binario
3. Confronta il numero ottenuto e **trova la corrispondenza maggiore**, sapendo che
	- `/24` -> devi confrontare i primi **24 bit** (o 3 byte)
	- `/18` -> devi confrontare i primi **18 bit** (o 2 byte + 2 bit)
	- ecc.


### ESERCIZIO 3
![[Pasted image 20250708180006.png]]
PARTIZIONAMENTO e *inizio* di INDIRIZZI DEI ROUTER
- **Raggruppa le sottoreti** -> trova tutti gli insiemi di host che comunicano senza passare per un router (quindi comunicano con switch)
- Per ogni sottorete usa le formule 
	- $2^{h}-2 \ge \#\text{interfacce}$ per trovare la parte di host
	- $\text{CIDR} = 32 - h$ per trovare il prefisso per la subnet

#### ALTRO ESERCIZIO SIMILE AL 3
![[Pasted image 20250713154934.png]]
1. Con 32 interfacce devi trovare lo `/x` massimo con questa formula $$2^{32-x} - 2 \ge \text{NUMERO INTERFACCE}$$
2. Segui questa foto
	![[Pasted image 20250713155247.png]]
>[!tip] ATTENZIONE: La prima sottorete va da `128` s `191`, la seconda da `192` a `255`

3. Segui questa foto
	![[Pasted image 20250713160459.png]]

### ESERCIZIO 4
![[Pasted image 20250708180447.png]]
1. Riporta in binario le **netmask** e vedi in che posizione si trova l'ultimo bit a `1` -> scrivi quindi `/x` (dove x è la posizione di quel bit)
2. Guardando a coppie/quaterne, traduci in binario solo i **byte diversi**
3. Ordina rispetto al prefisso
4. Controlla, tra i gruppi, **la sequenza di bit corrispondenti uguali E SOPRATTUTTO IL NEXHOP IDENTICO**
	![[Pasted image 20250713175250.png]]
	- Tipo qui posso raggruppare quelli in blu
	- Quelli in verde invece
		- i primi due e l'ultimo hanno lo stesso nexthop ma hanno 22 bit uguali -> li raggruppo e scrivo `/22`
		- il terzo ha il nexthop diverso, lo lascio solo
	- Quello in bianco non ha nessun compagno -> lo elimino
5. Scrivi la tabella risultante
	![[Pasted image 20250713175441.png]]


---

# PIANO DI CONTROLLO
## Dijsktra
![[Pasted image 20250713164744.png]]
Ad ogni passo vedi i vicini del nodo scelto e nel caso aggiorna la tabella.
Ad ogni iterazione, tira fuori il min![[Pasted image 20250713164902.png]]
QUI HO TIRATO FUORI B

Alla fine scrivi la tabella finale con i vari collegamenti
![[Pasted image 20250713165148.png]]


## Distance Vector
![[Pasted image 20250713165228.png]]
- Parti scrivendo i vari vettori con i collegamenti
![[Pasted image 20250713165311.png|220]]![[Pasted image 20250713165328.png|220]]![[Pasted image 20250713165350.png|220]]

- ITERAZIONE 1
	- Prendi le righe dai vari vettori, e inseriscile come righe del vettore che vuoi calcolare 
		- SE NELLA RIGA C'È SCRITTO AD ESEMPIO `2(x)` e il vettore che vuoi riempire è proprio `x`, in corrispondenza di quello metterai `+inf`
	![[Pasted image 20250713165534.png]]
	- Applica poi le formule `min{}` per capire se conviene cambiare percorso o meno

- L'ALGORITMO TERMINA SE HO DUE ITERAZIONI IDENTICHE CONSECUTIVE.


---

## 🧪 **Obiettivo generale**
> Imparare a usare `ping` in modo avanzato per:

- Verificare la raggiungibilità di un host
- Calcolare l’**RTT** (Round Trip Time)
- Studiare pacchetti ICMP e opzioni di invio
- Capire l'effetto del **TTL**, del **timeout** e della **dimensione del pacchetto**


## ✅ **Esercizio 1 – ping base + Wireshark**
- Si esegue `ping www.google.it`, si interrompe con `CTRL+C`.
- Viene inviato ogni secondo un pacchetto ICMP **Echo Request**.
- Ogni risposta è un **Echo Reply**, che include:
    - Numero sequenza (`icmp_seq`)
    - Tempo di ritorno (`time`)
    - TTL (dal pacchetto IP)
- In **Wireshark** si filtra con `icmp` per vedere i pacchetti.
- Obiettivo: capire cosa succede durante un ping e cosa contengono i pacchetti ICMP.

## ✅ **Esercizio 2 – Opzione `-c` (count)**
- `ping -c 1 www.google.it`
- Invia un solo pacchetto.
- Serve per fare test brevi o in script automatici.
- Si osservano le statistiche complete con un solo scambio.

## ✅ **Esercizio 3 – Opzione `-w` (deadline)**
- `ping -w 3 www.google.it`
- Esegue ping per **al massimo 3 secondi**, indipendentemente dal numero di pacchetti.
- Ping invia un pacchetto ogni secondo → si ricevono 3 pacchetti prima dello stop.

## ✅ **Esercizio 4 – Opzione `-i` (intervallo)**
- `ping -i 1.495 -w 3 www.google.it`
- Cambia l’intervallo tra un pacchetto e il successivo.
- Serve a simulare **invii più frequenti o più lenti**.
- Se combinato con `-w`, può causare **perdita di pacchetti** perché non si lascia tempo sufficiente alla risposta.

## ✅ **Esercizio 5 – Combinazione `-i -c -w`**
- `ping -i 1.495 -c 3 -w 3 www.google.it`
- Invia 3 pacchetti ma scade a 3 secondi → **non fa in tempo a ricevere l’ultimo ACK**.
- Mostra che il timeout è importante anche se i pacchetti sono stati inviati correttamente.

## ✅ **Esercizio 6 – Opzione `-W` (timeout risposta)**
- `ping -W 1 -c 1 www.google.it`: aspetta **1 secondo** per la risposta.
- `ping -W 0.01 -c 1 www.google.it`: timeout troppo basso → **perdita pacchetto**.
- Mostra come un RTT alto può portare a **false perdite** se il timeout è troppo breve.

## ✅ **Esercizio 7 – Opzione `-s` (dimensione dati ICMP)**
- `ping -s 10 www.google.it`
- Cambia la dimensione del payload ICMP (non del pacchetto IP totale).
- Sotto i 16 byte, **ping non può calcolare l’RTT** perché manca il timestamp.
- Utile per testare **quanto i dati influenzano la risposta**.

## ✅ **Esercizio 8 – Opzione `-t` (TTL - Time To Live)**
- `ping -t 11`: limita il TTL → pacchetto viene **fermato da un router intermedio**.
- Il router invia un messaggio ICMP "Time Exceeded".
- `ping -t 12`: pacchetto **raggiunge la destinazione**.
- Serve a determinare quanti **hop** ci sono tra sorgente e destinazione (come fa `traceroute`).

## 📌 **Concetti chiave che si imparano**
- Differenza tra opzioni `-c`, `-w`, `-W`, `-i`, `-s`, `-t`
- Formato dei messaggi ICMP
- Analisi con Wireshark
- **Interpretazione dell’RTT**, del TTL, del timeout
- Come controllare l’exit code di `ping` (`echo $?`)