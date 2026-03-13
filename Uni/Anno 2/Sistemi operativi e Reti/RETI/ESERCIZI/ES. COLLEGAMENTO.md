# ESERCIZIO 1
![[Pasted image 20250710172516.png]]Conta il numero di **1**
- pari -> aggiungi `0` alla fine
- dispari -> aggiungi `1` alla fine
SOLUZIONE
![[Pasted image 20250710173008.png]]

# ESERCIZIO 2
![[Pasted image 20250710172620.png]]
1. Conta i bit -> se dispari -> errore
2. La tecnica **bit di parità** serve per RILEVARE un errore, **NON** per **CORREGGERLO**

# ESERCIZIO 3
![[Pasted image 20250710172749.png]]
- Dividi in **gruppi da 4 bit**
- Metti i gruppi uno sotto l'altro
- Calcola Bit di parità sia per le **righe** che per le **colonne**
- Aggiungi alla fine il **bit di parità globale** -> conta TUTTI gli `1`, anche quelli di parità e metti `0` o `1`
- La soluzione saranno i bit di parità aggiunti
SOLUZIONE
![[Pasted image 20250710172950.png]]

# ESERCIZIO 4
![[Pasted image 20250710173035.png]]
- Metti i tre gruppi uno sotto l'altro (senza dividerli)
	- Il primo bit di entrambi i byte sono i bit di parità 
	- L'ultimo sono i bit di parità per tutte le colonne
- Trova l'errore confrontando righe e colonne CONTEMPORANEAMENTE
- Cambia il bit di parità della colonna
SOLUZIONE
![[Pasted image 20250710173223.png]]

# ESERCIZIO 5
![[Pasted image 20250710173253.png]]
- Dividi in gruppi da **sedici bit**
- Fai la somma (a coppie di gruppi)
- Se hai un riporto alla fine -> **sommalo all'inizio**
- Un volta fatte tutte le somme -> **complemento a 1** -> inverti tutti i bit
SOLUZIONE
![[Pasted image 20250710173409.png]]

# ESERCIZIO 5b
![[Pasted image 20250710173619.png]]
Converti in decimale e poi in binario (letteralmente)

| A   | 10  |
| --- | --- |
| B   | 11  |
| C   | 12  |
| D   | 13  |
| E   | 14  |
| F   | 15  |

# ESERCIZIO 6
![[Pasted image 20250710180310.png]]
- Aggiungo alla fine del numero tot `0` quanto è il **grado** (numero che sta dopo `CRC`)
- Prendo il generatore, lo metto all'inizio e eseguo lo XOR (stesso ragionamento della somma) 
	- RICORDA -> lo XOR **non ha il riporto**
- Se ho degli `0` all'inizio del numero ottenuto -> li levo e abbasso lo stesso numero di cifre dal numero originale.
SOLUZIONE
![[Pasted image 20250710180741.png]]

# ESERCIZIO 7
### 1. **Probabilità che il frame sia ricevuto senza errori**

$$P(S = 0) = (1 - p)^N$$
👉 Dipende fortemente da N e p. Per $p \ll 1$e N piccolo, questa probabilità è **vicina a 1**.

### 2. **Probabilità che il frame sia ricevuto con esattamente un errore**

$$P(S = 1) = \binom{N}{1} \cdot p \cdot (1 - p)^{N - 1} = Np(1 - p)^{N - 1}$$
👉 Cresce linearmente con `N`, ma solo se `p` è sufficientemente piccolo.

### 3. **Probabilità che il frame sia ricevuto con errori multipli (2 o più)**

$$P(S \geq 2) = 1 - P(S = 0) - P(S = 1)$$
👉 Questa è la parte più pericolosa per il bit di parità, come vediamo sotto.