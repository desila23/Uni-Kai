#### AGENTI REATTIVI=WUMPUS
#### 8 regine
![[Pasted image 20251116165303.png|center]]
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
