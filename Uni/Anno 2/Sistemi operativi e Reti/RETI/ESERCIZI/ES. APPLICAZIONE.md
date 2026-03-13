### Ritardo end-to-end
$$Ritardo_{e2e​}=T_{tx}​+T_{prop​}+T_{queue}​+T_{proc}​$$
- Ritardo di trasmissione
	- Tempo per **inviare tutti i bit** di un pacchetto sul canale.
	- $T_{trasm}​=L/C​$
		- Dimensione/velocità del collegamento

- Ritardo di propagazione
	- Tempo per il **primo bit** a viaggiare da mittente a destinatario.
	- $T_{prop}​=d/v​$
		- distanza/velocità

- Ritardo di elaborazione
	- Tempo che un nodo (es. router) impiega per **analizzare, controllare e instradare** il pacchetto.
	- fornito dal prof


- Ritardo di accodamento (se presente)
	- Tempo che un pacchetto aspetta **in coda nel router o nodo**, in attesa che il link si liberi.
	- $T_{queue​}=inizio \ trasmissione \ effettiva−tempo \ di \ arrivo \ al \ nodo$
### Router
se un router ha politica FIFO con store and forward semplicemente può salvare nel buffer tutti i pacchetti che vuole e li invia con logistica FIFO, ovviamente rispettando sempre il fatto che può inviare su un link un pacchetto per volta o anche ricevere

### Conversioni
Si usa il **prefisso decimale**:

| Simbolo | Nome | Valore              |
| ------- | ---- | ------------------- |
| k       | kilo | 10³ = 1.000         |
| M       | mega | 10⁶ = 1.000.000     |
| G       | giga | 10⁹ = 1.000.000.000 |

### stimare il ritardo con tanti pacchetti

$$Ritardo totale≈τ1​+τ2​+τ3​+\frac{D}{\min_i(C_i)}$$
dove rispettivamente abbiamo

| Termine                               | Significato                                                                                |
| ------------------------------------- | ------------------------------------------------------------------------------------------ |
| $\tau_1 + \tau_2 + \tau_3τ1​+τ2​+τ3​$ | Somma dei **ritardi di propagazione** su ogni tratto                                       |
| $\frac{D}{\min(C_i)}​$                | Tempo necessario a **trasmettere tutto il file D bit**, limitato dalla **banda più lenta** |
Insomma quando si hanno tanti pacchetti si può fare sta roba



---

# ESERCITAZIONE
### ESERCIZIO 1
![[Pasted image 20250328172721.png]]
##### a)
DATI:
- NO ritardo di elaborazione e propagazione
- 1 pacchetto da 6000 byte -> $6000 \times 8$ bit = $48 \times 10^{3}$ bit
- $C = 1 \frac {Mbit} s$ -> $10^{6} \frac {bit} s$  

RISOLUZIONE 
Tempo per arrivare ad ogni router $$\frac {48 \times 10^{3}} {10^{6}} \frac {bit} {\frac {bit} s} = 48 \times 10^{-3} \ s = 48 \ ms$$Dato che sono due router + $h_{2}$ deve passare per 3 collegamenti quindi $$3 \times 48 \ ms = 144 \ ms$$
##### b)
DATI:
- NO ritardo di elaborazione e propagazione
- 4 pacchetto da 1500 byte -> $1500 \times 8$ bit = $12 \times 10^{3}$ bit
- $C = 1 \frac {Mbit} s$ -> $10^{6} \frac {bit} s$  

RISOLUZIONE
Tempo che impiega un pacchetto ad arrivare al router $$\frac {12 \times 10^{3}} {10^{6}} \frac {bit} {\frac {bit} s}= 12 \times 10^{-3} \ s = 12 \ ms$$Dato che ci sono due router + $h_2$ abbiamo $$3 \times 12 \ ms = 36 \ ms$$Quindi ogni pacchetto IMPIEGA IN TOTALE 36 secondi però quando un pacchetto arriva ad un router il successivo parte, quindi abbiamo 
![[Pasted image 20250328175244.png]]

---

### ESERCIZIO 2
![[Pasted image 20250328191105.png]]

Risoluzione 
![[Pasted image 20250328191124.png]]

---

### ESERCIZIO 3
![[Pasted image 20250328195512.png]]

RISOLUZIONE
![[Pasted image 20250328195440.png]]


# Throughput end-to-end
![[Pasted image 20250311150315.png]]
- Dove in $\frac R x$, la `x` corrisponde alle connessioni totali e non agli host totali.


# Utilization
DA PARTE DEL SERVER ($R_{s}$)
![[Pasted image 20250713123732.png]]
Quindi in pratica $$\frac {\text{COLLO DI BOTTIGLIA}} {R_{s}}$$

DA PARTE DEL CLIENT ($R_c$) $$\frac {\text{COLLO DI BOTTIGLIA}} {R_{c}}$$

DA PARTE DEL COLLEGAMENTO CONDIVISO (a partire dal server) $$\frac {\text{COLLO DI BOTTIGLIA} \cdot \text{NUMERO DI SERVER}} R$$
