# ESERCIZIO 1
![[Pasted image 20250710190503.png]]
- La formula che cerchiamo è $T_{\text{trasmissione}} \ge 2 \cdot T_{\text{propagazione}}$
	Sapendo che
	- $T_{\text{trasmissione}} = \frac L R$
		- (L = lunghezza del pacchetto in bit, R = bitrate della rete)
	- $T_{\text{propagazione}} = \frac d v$
		- (d = distanza massima tra due interfacce, v = velocità del segnale nel mezzo)
- Sostituendo alla formula originale abbiamo $$\frac L R \ge \frac {2\cdot d} v$$
- ORA USA QUESTA FORMULA PER TROVARE QUELLO CHE TI CHIEDE IL PROF

SOLUZIONE (cerchiamo la `d`)
![[Pasted image 20250710191014.png]]

# ESERCIZIO 2
![[Pasted image 20250710191205.png]]
- Il catch di questo esercizio era capire che gli `ACK` sono cumulativi
	- se invio **5 segmenti** ma se ne **perdono 3**
	- i primi due ricevono un ACK 
	- metti caso viene perso il primo -> il secondo ACK **contiene anche informazioni sul primo segmento arrivato** E QUINDI il mittente può aggiornare la finestra.

# ESERCIZIO 3
![[Pasted image 20250710191231.png]]
- ANALIZZA IL GRAFICO SECONDO LE REGOLE CHE ABBIAMO USATO PER lo "slow start"
	Spiegazione visiva
	- **SALITA A CURVA** = slow start
	- **PICCOLA RICADUTA** = triplo `ACK` duplicato -> fast recovery 
	- **SALITA NORMALE** ->  congestion avoidance
	- **BRUSCA CADUTA che arriva fino a 1** = timeout scaduto -> si riparte dalla slow start

# ESERCIZIO 4 (TPC Reno)
![[Pasted image 20250710191532.png]]
- FORMULE DA RICORDARE
	![[Pasted image 20250710191638.png|center]]
	E ricorda che $W \approx W_{max}$
	Questa formula dà un risultato `SENZA UNITÀ DI MISURA`
	![[Pasted image 20250710191706.png|center]]
	Questa formula dà un risultato in `Mbps`
- Ricorda poi che a seguito di una perdita, la finestra $W_{max}$ viene dimezzata (prendi parte inferiore).
- Per calcolare il tempo impiegato per tornare alla dimensione massima $$\left(W_{max} - \frac {W_{max}} 2\right) \cdot RTT \rightarrow s$$