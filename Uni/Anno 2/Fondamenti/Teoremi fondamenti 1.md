# DISPENSA 3
## TEOREMA 3.1
>[!lemma] l $\subseteq \Sigma^{*}$ è decidibile $\iff$ L è accettabile e $L^C$ è accettabile

Sapendo che L e $L^{C}$ sono accettabili, allora esistono due macchine $T$ e $T^{C}$ che terminano se e solo se $x \in L$ e $x \in L^{C}$ (rispettivamente).

Creo una nuova macchina che simula IN ALTERNANZA entrambe le macchine (esegue una 
quintupla di una e poi dell'altra finché una delle due non accetta).

Dato che termina su ogni input, allora **l è decidibile**


## DEFINIZIONE 3.5
>[!tip] Siano $\Sigma$ e $\Sigma_{1}$ due alfabeti finiti: una funzione (parziale) $$f: \Sigma^{*} \rightarrow \Sigma_{1}^{*}$$è una funzione *calcolabile* se esiste una macchina di tipo TRASDUTTORE che, dato un input $x \in \Sigma^{*}$ termina con la stringa $f(x)$ scritta sul nastro di output se e solo se $f(x)$ è definita.

Nota come non sappiamo nulla quando l'input non appartiene al dominio


## TEOREMA 3.2
Sia $\Sigma$ un alfabeto finito e $L \subseteq \Sigma^{*}$ un linguaggio. La ***funzione caratteristica*** $$χ_{L}: \Sigma^{*} \rightarrow \{0,1\}$$di L è un funzione totale e calcolabile tale che, per ogni $x \in \Sigma^{*}$, $$χ_{L}(x) = \begin{cases} 1 & \text{se }  x \in L\\ \\
0 & \text{se } x \notin L
\end{cases}$$
Da qui deriva il teorema 
>[!lemma] Un linguaggio `L` è decidibile se e solo se la funzione $χ_L$ è calcolabile

1) ($\Rightarrow$) Dato che `L` è decidibile esiste una macchina `T` che termina su ogni input e tale che $$[o_{T}(x) = q_{a} \iff x\in L]$$ e quindi $$o_{T}(x) = \begin{cases} q_{a} & \text{se }  x \in L\\ \\
q_{r} & \text{se } x \notin L
\end{cases}$$
	Senza perdita di generalità diciamo che `T` usa un nastro e allora possiamo costruire una macchina `T'` a due nastri tale che
	- $N_{1}$ simula `T(x)`
	- Se la computazione termina in $q_{a} \rightarrow$ su $N_{2}$ scriviamo $1$
	- Altrimenti su $N_{2}$ scriviamo 0

2) ($\Leftarrow$) Qui la dimostrazione è identica a sopra
	- la macchina di tipo trasduttore che calcola $χ_L$ è `T` e usa due nastri
	- Costruiamo `T'` a due nastri 
		 - $N_{1}$ simula `T(x)`
		- Se la computazione termina in $1 \rightarrow$ su $N_{2}$ scriviamo $q_{a}$
		- Altrimenti su $N_{2}$ scriviamo $q_{r}$


## TEOREMA 3.3
>[!lemma] Se la funzione $f: \Sigma^{*} \rightarrow \Sigma_{1}^{*}$ è totale e calcolabile, allora il linguaggio $L_{f} = \Sigma^{*} \times \Sigma_{1}^{*}$ è decidibile.

Dato che $f$ è totale e calcolabile, allora esiste un trasduttore che per ogni $x \in \Sigma^{*}$ calcola $f(x)$.
A partire da questa macchina `T` (a un nastro) ne costruiamo un'altra a due nastri `T'` tale che
- su $N_{1}$ è scritto l'input $\langle x, y \rangle$ 
- su $N_{2}$ viene eseguita la computazione `T(x)` e quindi viene scritto $f(x) = z$
	- se $z = y$ allora `T'` accetta
	- se $z \ne y$ allora `T'` rigetta

TERMINA SU OGNI INPUT -> $L_f$ è decidibile.


## TEOREMA 3.4
>[!lemma] Sia $f: \Sigma^{*} \rightarrow \Sigma_{1}^{*}$ una funzione. Se il linguaggio $L_f = \Sigma^{*} \times \Sigma_{1}^{*}$ è decidibile, allora $f$ è calcolabile.

Dato che $L_{f}$ per HP è decidibile esiste un riconoscitore `T` tale che per ogni $x \in \Sigma^{*}$ e $y \in \Sigma_{1}^{*}$ $$o_{T}(x,y) \begin{cases} q_{A} & \text{se } y = f(x)
\\  q_{R} & \text{altrimenti}
\end{cases}$$
Senza perdita di generalità assumiamo che `T` utilizzi un nastro
A partire da `T` costruiamo `T'` di tipo trasduttore a 4 nastri che con input $x \in \Sigma^{*}$ sul primo nastro
1) scrive il valore $i = 0$ sul primo nastro
2) enumera tutte le stringhe $y \in \Sigma_{1}^{*}$ la cui lunghezza è pari al valore di `i`, simulando per ciascuna di essere la computazione `T(x,y)`. In pratica
	<font color="#4f81bd">a)</font> prende la prima stringa `y` di lunghezza `i` non ancora enumerata, e la scrive su $N_{2}$
	<font color="#548dd4">b)</font> simula $T(x,y)$ su $N_{3}$
	- se $T(x,y)$ termina in $q_{a}$ allora scrive su $N_{4}$ `y`
	- altrimenti torna al passo 2) (eventualmente incrementando il valore di `i` se la stringa appena controllata era l'ultima con $|y| = i$)

>[!example]- SCHEMA PER VISUALIZZARLO MEGLIO
>- N1: contatore `i`
>- N2: y (di lunghezza `i`)
>- N3: simulazione di `T(x,y)`
>- N4: output (scritto se `T(x,y) = q_a`)

Dato che `T` è decidibile allora <font color="#548dd4">b)</font> termina su ogni input.
>[!danger] MA ATTENZIONE: $T(x,y)$ ti dice solo se quella `y` scelta sia o la tua $f(x)$, però se NESSUNA $y$ corrisponde alla mia $f(x)$ la macchina `T'` non termina perché il contatore viene incrementato all'infinito.

Quindi possiamo dire che $f$ sia **calcolabile (parziale)** ma non totale.


## TEOREMA 3.5
>[!lemma] Per ogni programma scritto in PASCALMINIMO esiste un trasduttore `T` che scrive sul nastro di output lo stesso valore fornito dal programma


## TEOREMA 3.6
>[!lemma] Per ogni macchina di turing deterministica `T` di tipo riconoscitore esiste un programma in PASCALMINIMO che, per ogni stringa `x`, se `T(x)` termina nello stato finale $q_{F} \in \{q_{A}, q_{R}\}$ allora il programma con input `x` restituisce $q_{F}$



---
# DISPENSA 5
## TEOREMA 5.1
>[!lemma] Sia Σ un alfabeto finito. Allora l’insieme Σ*, costituito da tutte le parole di lunghezza finita su Σ, è numerabile.

Poiché Σ è finito (es $|\Sigma| = n$), è possibile fissare una codifica binaria (es. $c : \Sigma \rightarrow \{ 0,1 \}^{\lceil log(n) \rceil}$) che associa a ogni simbolo di Σ una parola binaria di lunghezza fissa.

Ogni parola $p \in \Sigma^*$, essendo una sequenza finita di simboli di Σ, può essere codificata concatenando i codici binari dei suoi simboli. La stringa binaria così ottenuta identifica univocamente la parola di partenza.

Poiché l’insieme delle stringhe binarie finite è numerabile, segue che anche l’insieme delle parole su Σ è numerabile.

Pertanto, Σ* è numerabile.


## TEOREMA 5.2
>[!lemma] L'insieme $T$ delle macchine di Turing definite sull'alfabeto `{0,1}` e dotate di un singolo nastro (più eventuale nastro di output) è numerabile.

L'idea è prendere una macchina di Turing, codificare in binario il suo insieme degli stati (l'alfabeto già è in binario) e poi rappresentare il tutto tramite una parola $\beta_{t} \in \Sigma$ con $\Sigma = \{0, 1, ⊕, ⊗, −, f , s, d\}$
La parola è così descritta.
![[Pasted image 20260107155921.png]]

Dato che per due macchine di Turing diverse abbiamo
- o insieme degli stati diversi
- o insieme delle quintuple diverse
- o entrambi
allora $$\beta_{T} \ne \beta_{T^{'}}$$ e questo vale $\forall T, T^{'}$ nell'insieme della macchina di Turing, ovviamente con $T \ne T^{'}$

E per il teorema 5.1, sono numerabili.


Una volta trovata questa codifica, possiamo trasformare questa parola $\beta_{T}$ in un numero $\in N$ 
![[Pasted image 20260107160453.png]]


## TEOREMA 5.3
Sia $\Sigma$ un alfabeto e $L_{\Sigma}$ l'insieme dei linguaggi su $\Sigma$.
>[!lemma] Se $\Sigma$ è un alfabeto finito, allora l'insieme $\mathscr{L}_{\Sigma}$ non è numerabile.

![[Pasted image 20260107160927.png]]


## DEFINIZIONE 5.1
Sia $T \in \mathscr{T}_{Sigma}$ una macchia di Turing di tipo riconoscitore definita sull'alfabeto $\Sigma$. 
>[!definizione] Il linguaggio $$L_{A}(T) \in \mathscr{L}_{\Sigma}$$ è il sottoinsieme di $\Sigma^{*}$ delle parole accettate da T 

Osserviamo che per definizione $$\forall T \in \mathscr{T}_{\Sigma} \ \ \ \exists! \ L \in \mathscr{L}_{\Sigma} \ : \ L = L_{A}(T)$$ossia, per ogni macchina `T` di tipo trasduttore esiste un unico linguaggio `L` che la macchina accetta.

Però se noi sappiamo 
- dal teorema 5.3 che l'insieme del linguaggi non è numerabile 
- e dal teorema 5.2 che le macchine di Turing invece lo sono
Allora
>[!tip] COROLLARIO 5.1
>Esiste un linguaggio non accettabile.


## TEOREMA 5.4 (pag 4)

## TEOREMA 5.5 (pag 4-5)


## DEFINIZIONE 5.2
>[!definizione] Il linguaggio complemento $L^{C}$ di un linguaggio $L \subseteq \{0,1\}^{*}$ è il linguaggio di tutte e sole le parole non contenute in L $$L^{C} = \{0,1\}^{*} - L$$

## TEOREMA 5.6 
>[!lemma] Un linguaggio $L \subseteq \{0,1\}^{*}$ è decidibile se e soltanto se $L$ è accettabile e $L^{C}$ è accettabile.

1) (=>) se L è decidibile allora termina su ogni input, quindi vuol dire che se $x \in L$ allora `T` accetta e termina, se invece $x \notin L$ allora `T'` accetta e termina.
2) (<=) se entrambi i linguaggi sono accettabili allora esistono due macchina che li accettano. Se le eseguo alternate prima o poi una delle due accetterà.

## COROLLARIO 5.2
>[!tip] Un linguaggio $L \subseteq \{0,1\}^{*}$ è decidibile se e solo se $L^{C}$ è decidibile

## TEOREMI 5.7 e 5.8
![[Pasted image 20260107191855.png]]

## DEFINIZIONE 5.3 
![[Pasted image 20260107191916.png]]![[Pasted image 20260107192024.png]]

#### Diverse riduzioni utili
![[Pasted image 20260107193148.png]]
![[Pasted image 20260107193125.png]]


---

# Grammatica
![[Pasted image 20260108152335.png]]

## Gerarchia di Chomsky
$$G_{3} \subset G_{2} \subset G_{1} \subseteq \mathscr{D} \subset G_{0} = \mathscr{A}$$
>[!tip] $G_{1} \subset G_{0}$ e lo possiamo dimostrare con l'Halting problem, in quanto è un linguaggio accettato ma mai deciso.

### $G_{0}$
Contiene tutte le grammatiche formali (ossia tutte)

### $G_{1}$
Le `Grammatiche di tipo-1`, anche dette **grammatiche dipendenti dal contesto** (context-sensitive), che generano i linguaggi context-sensitive, hanno soltanto produzioni in cui la *lunghezza della parte **destra** è maggiore o uguale alla lunghezza della parte **sinistra***.
- $\alpha \rightarrow \beta$     con  $|\alpha| \le |\beta|$ 
>[!example] $aBa \rightarrow caC$ 

### $G_{2}$
Le `Grammatiche di tipo-2`, anche dette grammatiche **libere dal contesto** (context-free), che generano i linguaggi context-free possiedono solo produzioni la cui parte sinistra consiste solamente di un carattere non terminale

>[!example] $A \rightarrow \alpha$ con $\alpha \in (V_{T} \cup V_{n})^{*}$ 

#### **VIENE CALCOLATO DA UN PDA**

### $G_{3}$
Le `Grammatiche di tipo-3`, anche dette **grammatiche regolari**, che generano i linguaggi regolari, dispongono solo di produzioni la cui parte sinistra consiste di un singolo carattere non terminale e la cui parte destra consiste di un singolo simbolo terminale, che può essere seguito (o
preceduto, ma non entrambe le forme nella stessa grammatica) da un singolo carattere non terminale

>[!example] $A \rightarrow aB$ (e rimarrà sempre non terminale - terminale)


## TEOREMA G1
Sapendo che solo $G_0$ può generare $\epsilon$.
>[!lemma] Sia `G` una grammatica di tipo $t>0$ e sia $G^{'}$ la grammatica ottenuta
>- aggiungendo a `G` un nuovo non terminale $S^{'}$ che sarà l'assioma in $G^{'}$
>- inserendo la produzione $S^{'} \rightarrow \epsilon$
>- inserendo la produzione $S^{'} \rightarrow S$
>
>Allora $$L(G^{'}) = L(G) \cup \{\epsilon\}$$

Quindi se applico $S^{'} \rightarrow S$ allora genero $L(G)$, se invece applico $S^{'} \rightarrow \epsilon$ genero la parola vuota.


## TEOREMA $G_{2}$
>[!lemma] Sia `G` una grammatica di tipo t > 1 e sia G’ la grammatica ottenuta aggiungendo a G un numero qualsiasi di 𝜀-produzioni.
Allora, $$L(G^{’}) = L(G) ∪ {𝜀}$$

Questo vale solo per grammatiche di TIPO 2 e 3.


## TEOREMA $G_{3}$
>[!lemma] Per ogni grammatica `G` di tipo 0 esiste una grammatica `G’` ottenuta aggiungendo a una grammatica di tipo 1 opportune 𝜀 −produzioni tale che $$L(G) = L(G^{’})$$

In pratica se aggiungo a una grammatica DI TIPO 1 tante $\epsilon$-produzioni allora genero una grammatica DI TIPO 0.


## TEOREMA $G_{4}$
>[!lemma] Per ogni linguaggio accettabile L esiste una grammatica (di tipo 0) G tale che $$L = L(G)$$


## TEOREMA $G_{5}$        
>[!lemma] Per ogni grammatica G esiste una macchina di Turing che accetta `L(G)`


## $NT_{G}^{'}$ che decide i linguaggi generati da $G_{1}$
![[Pasted image 20260109112457.png]]

>[!tip] La macchina $NT_{G}^{'}$ viene creata a partire da $NT_{G}$ (che aveva solo i primi 3 nastri).
>Il problema di $NT_{G}$ è che accettava i linguaggi, ora con $N_{4}$ e $N_{5}$ evitiamo che la macchina vada in loop, infatti
>- se la parola scritta su $N_{2}$ coincide con quella sul primo -> accetta
>- se la parola su $N_{2}$ non contiene alcun non terminale o non posso più applicare produzioni -> rigetta
>- se il valore su $N_{5}$ è maggiore del valore su $N_{4}$, allora abbiamo generato più parole rispetto a quelle possibili -> rigetta

>[!example]- LA MACCHINA TERMINA SU OGNI INPUT E QUINDI DECIDE.
Per vederlo vediamo un caso in cui rigetta
>- sia x una parola in input che non appartiene a L(G), e y un certo passo della produzione
>    - NTG1 prima o poi rigetterà per i seguenti motivi
>        - o y ha solo caratteri terminali e $y \ne x$ 
>        - o y è più grande di x 
>        - se y ha ancora caratteri non terminali
>        - avrò una crescita di y e rientrerò possibilmente in 1 o 2 
>            - oppure ho superato le produzioni possibili 
>    - possiamo vedere che NTG1 terminerà sempre

## TEOREMA $G_6$ e corollario
>[!lemma] Per ogni grammatica di tipo uno $G$ esiste una macchina di Turing che **decide** $L(G)$

Da cui deriva il seguente corollario
>[!tip] L'insieme dei linguaggio di tipo 1 è un sottoinsieme dei linguaggi decidibili (o ricorsivi)
>Si veda gerarchia di Chomsky


## PUMPING LEMMA
È una proprietà soddisfatta dai linguaggi di tipo 2 (context-free), MA È UNA CONDIZIONE NECESSARIA MA NON SUFFICIENTE.

>[!lemma] PUMPING LEMMA
>Per ogni linguaggio context free `L` esiste un intero $p_{L} > 0$ (dipendente da `L`) tale che per ogni parola $z \in L$, se $|z| \ge p_{L}$ allora esistono cinque parole
>- `u`
>- `v`
>- `w`
>- `x`
>- `y`
>tali che
>1. `z = u v w x y`
>2. `|vwx|` $\le p_{L}$
>3. `|vx|` $\ge 1$ (almeno una delle due NON vuota)
>4. $u v^{h} w x^{h} y$ è in `L` per ogni $h \ge 0$

Visto che è necessaria ma non sufficiente la usiamo al negativo.
- SE UN LINGUAGGIO NON LA RISPETTA, NON È CONTEXT FREE.

>[!tip] Esempio
>![[Pasted image 20260109121748.png]]
>Ricorda che visto che devono avere le stesse identiche leggere, se lo pompo
>- potrei avere solo `a` o solo `b` o solo `c`
>- potrei avere `a` e `b` MA NON `c`
>- potrei avere `b` e `c` MA NON `a`

### Chiusura per grammatiche di tipo 2
#### Unione
Se $L_{1}$ e $L_{2}$ sono due linguaggio context-free, allora $$L_{1}\cup L_{2}$$è context-free
![[Pasted image 20260109123949.png]]

#### Intersezione
Se $L_{1}$ e $L_{2}$ sono due linguaggio context-free, allora NON È DETTO CHE $$L_{1}\cap L_{2}$$sia context-free.
![[Pasted image 20260109124024.png]]

## TEOREMA $G_7$ E $G_8$
>[!lemma]  l'insieme del linguaggi context-free È CHIUSA rispetto all'unione

>[!lemma] l'insieme dei linguaggi context-free NON È CHIUSA rispetto all'intersezione


## PDA
Modello strettamente meno potente di una mdT, che DECIDE i linguaggi di tipo 2 
- perché $G_{2} \subset G_{1}$

### Definizione
È definito da una SETTUPLA $$\langle \Sigma, \Gamma, Z_{0}, Q, Q_{F}, q_{0}, \delta \rangle$$

- $\Sigma$ = alfabeto di input (per $N_{1}$)
- $\Gamma$ = alfabeto per la pila ($N_{2}$)
- $Z_{0}$ = simbolo iniziale che va scritto SOLO sul secondo nastro
- $Q$ = insieme degli stati
- $q_{0}$ = stato iniziale 
- $Q_{F}$ = insieme distati finali 
- $\delta$ = *funzione di transizione* 
	SCEGLIE DA UN INSIEME -> non deterministico

### Componenti minime di un PDA
Un **PDA** usa **2 nastri**
### 1. Primo nastro (input)
- contiene l’input `x`
- è **di sola lettura**
- la testina:
    - può restare ferma
    - o muoversi **solo a destra**

### 2. Secondo nastro (la pila)
- inizialmente contiene solo `Z₀` (simbolo di fondo)
- segue politica **LIFO**
- si può:
    - leggere il simbolo in cima
    - cancellarlo (pop)
    - scrivere una parola `γ ∈ Γ*` (push)
- la testina è sempre sulla **cima della pila**

### Stato del PDA
Lo stato è una **tripla**:
```
(q, x, γ)
```
- `q` stato interno
- `x` parte di input ancora da leggere
- `γ` contenuto della pila

### Funzione di transizione (forma essenziale)
```
δ : Q × (Σ ∪ {ε}) × Γ → P(Q × Γ*)
```
Vuol dire:
- guarda:
    - lo stato `q`
    - il simbolo di input (oppure `ε`)
    - il simbolo in cima alla pila
- sceglie **non deterministicamente**:
    - un nuovo stato
    - cosa scrivere sulla pila


>[!tip]- Mossa del PDA (idea chiave)
Da uno stato:
>```
(q₁, a x, Z β)
>```
può andare a:
>
>```
(q₂, x, γ β)
>```
>
>se:
>- legge `a` **oppure** `ε`
>- rimuove `Z` dalla pila
>- scrive `γ` sulla pila (anche `ε`)
>- entra nello stato `q₂`

### $\epsilon$-regole, Cosa succede quando abbiamo una $\epsilon$?

| ε dove compare                          | Significato                                                                                                                             |
| --------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| nel **risultato** (a dx della freccia)  | consumo il valore presente sulla pila (pop)                                                                                             |
| nell’**argomento** (a sx della freccia) | la transizione dipende solo dallo stato e dal simbolo in cima alla Pila (in pratica non mi interessa sapere cosa sto leggendo in input) |

### Perché le ε-regole sono pericolose
Se ho delle $\epsilon$-regole significa che posso effettuare operazioni all'infinito.
Il che vuol dire
- SE HO DELLE $\epsilon$-regole -> potrei entrare in loop -> LINGUAGGIO ACCETTABILE
- SE NON LE HO -> consumo sempre l'input -> LINGUAGGIO DECIDIBILE


### Due tipi di accettazione
#### 1. Per stato finale
Se durante una transizione arrivo ad uno stato finale, e si scrive $$⟨q_{0}​,x,Z_{0}​⟩⊢^{∗}⟨q_{F}​,ε,γ⟩$$con$$q_{F}​∈Q_{F}​ \ \ \ \ \ γ∈Γ^{∗}$$
##### Esempio 1: PDA che accetta per pila vuota
Costruiamo un PDA $$〈 \{a,b\}, \ \{Z_{0}, A, B\}, \ Z_{0} , \ \{q_{0} , q_{1} \} , \ \varnothing, \ q_{0} , \ δ 〉$$che riconosce **PER PILA VUOTA** (lo riconosci dal simbolo $\varnothing$) il linguaggio $L_{PPAL}$ delle parole palindrome pari sull'alfabeto $\{a,b\}$ 
![[Pasted image 20250412104255.png]]


#### 2. Per pila vuota
Se la pila è vuota $$⟨q_{0}​,x,Z_{0}​⟩⊢^{∗}⟨q_{F}​,ε,ε⟩$$
##### Esempio 2: PDA che accetta per stato finale
Ora, costruiamo un PDA $$〈 \{a,b\}, \ \{Z_{0}, A, B\}, \ Z_{0} , \ \{q_{0} , q_{1}, q_{2} \} , \ \{q_{2}\}, \ q_{0} , \ δ 〉$$che riconosce **PER STATO FINALE** ($q_{2}$) il linguaggio $L_{PPAL}$ delle parole palindrome pari sull'alfabeto $\{a,b\}$ 

Qui la costruzione è identica a prima, con alcune cosa modificate
![[Pasted image 20250412105811.png]]



## 🔑 Nomi dei linguaggi
- $L(\mathcal{M})$: linguaggio accettato per **stato finale**
- $N(\mathcal{M})$: linguaggio accettato per **pila vuota**


## TEOREMI $G_{10}$ E $G_{11}$
I linguaggi context-free sono decidibili perché sono un sottoinsieme dei linguaggi di tipo 1; tuttavia, gli automi a pila non sono decisori in generale, ma accettano esattamente la classe dei linguaggi context-free.

>[!lemma] Per ogni linguaggio L, esiste un PDA M che accetta L per pila vuota se e soltanto se esiste un PDA M’ che accetta L per stato finale

>[!lemma] Un linguaggio L è context-free se e soltanto se esiste un PDA M che accetta L


## TEOREMA $G_{12}$
Esistono degli automi a pila DETERMINISTICI (meno potenti dei classici PDA, che sono non deterministici)
>[!lemma] L'insieme dei linguaggi accettati da automi a pila deterministici è un sottoinsieme proprio dei linguaggi context-free


## TEOREMA $G_{13}$
Sia $L_{A}$ l’insieme delle grammatiche di tipo 2 ambigue.
>[!lemma] Il linguaggio $L_{A}$ è non decidibile


## Grammatiche di tipo 3
Anche qui si utilizza il Pumping lemma per dimostrare se un linguaggio NON è di tipo 3 (quindi non è regolare).
Scrivo solo i punti che si differenziano
1. `z = u v w`
2. `|u v|` $\le p_{L}$
3. `|v|` $\ge 1$
4. $u v^{h} w$ è in `L` per ogni $h \ge 0$

CONDIZIONE NECESSARIA MA NON SUFFICIENTE.

## TEOREMA $G_{14}$
>[!lemma] Per ogni ASFD 
>$$A = \langle \Sigma, Q, q_{0}, Q_{F}, \delta \rangle$$ esiste una grammatica $$G_{A} = \langle V_{T}, V_{N}, P, S \rangle$$tale che $$L(A) = L(G_{A})$$



---

## Misure di complessità
Sono delle funzioni `c` che associano un valore numerico ad una macchina di Turing T e ad un suo input, definiscono quindi il "costo".

#### Devono rispettare due proprietà (Assiomi di Blum)
1. `c` è definita per TUTTE E SOLE LE COMPUTAZIONI CHE TERMINANO
2. `c` deve essere calcolabile
	- deve esistere una $\mathscr{M}$ che, ricevendo in input una macchina `T` e un suo input `x`, calcola `c(T, x)` OGNI VOLTA che `c(T, x)` è definita (ossia quando termina).


### Misure deterministiche
![[Pasted image 20250423174254.png]]
SONO PARZIALI
#### Dimostriamo che `dtime` e `dspace` rispettano gli Assiomi
1) `dtime` e `dspace` sono definite solo per le computazioni che terminano (vedi parte in rosa)
2) `dtime` è calcolabile
	1) prendiamo la macchina Universale e creiamo $U_{dtime}$
	2) dotiamo `U` di un nuovo nastro $N_{5}$
	3) ogni volta che eseguiamo una quintupla, scriviamo su $N_{5}$ un `1` e spostiamo la testina a `dx`
	4) SE LA COMPUTAZIONE TERMINA, su $N_{5}$ ho il numero esatto di passi (istruzioni) eseguiti
3) `dspace` è uguale

### Misure non Deterministiche
![[Pasted image 20250423182614.png]]SONO PARZIALI.

## TEOREMI 6.1
>[!lemma] TEOREMA 6.1 (caso deterministico)
>Sia `T` una macchina di Turing deterministica, definita su un alfabeto $Σ$ (non contenente il simbolo $\square$) e un insieme degli stati `Q`.
>e sia $x ∈ Σ^{∗}$ tale che `T(x)` **termina**. Allora, $$\text{dspace(T,x)} \le \text{dtime(T,x)} \le \text{dspace(T,x)} \cdot |Q| \cdot (|\Sigma| + 1)^{\text{dspace(T,x)}}$$

La prof definisce il termine dopo $\le$ come **il numero di stati globali possibili di `T` nel caso in cui non più di `dspace(T,x)` celle del nastro vengano utilizzate dalla computazione `T(x)`.

Se andiamo a punti
1) $\text{dspace(T,x)} \le \text{dtime(T,x)}$ -> perché se la macchina utilizza `dspace(T, x)` celle di memoria allora le ha dovute quantomeno leggere
2) $\text{dtime(T,x)} \le \text{dspace(T,x)} \cdot |Q| \cdot (|\Sigma| + 1)^{\text{dspace(T,x)}}$ -> il tempo impiegato non può mai essere maggiore rispetto AL NUMERO MASSIMO DI STATI GLOBALI
	Perché se lo fosse, vuol dire che siamo entrati in un loop (e quindi la macchina non termina, COSA CHE NON PUÒ ACCADERE PER GLI ASSIOMI.)
	![[Pasted image 20250423195411.png|center]]

>[!lemma] TEOREMA 6.1 (caso non deterministico)
>Sia `NT` una macchina di Turing non deterministica, definita su un alfabeto $Σ$ (non contenente il simbolo $\square$) e un insieme degli stati `Q`.
>e sia $x ∈ Σ^{∗}$ tale che `NT(x)` **accetta/termina**. Allora, $$\text{nspace(NT,x)} \le \text{ntime(NT,x)} \le \text{nspace(NT,x)} \cdot |Q| \cdot (|\Sigma| + 1)^{\text{nspace(NT,x)}}$$


## TEOREMI 6.2
>[!lemma] TEMPO
>Se un linguaggio $L \subseteq \Sigma^{*}$ è accettato da una macchina di Turing **non deterministica** $NT$ entro tempo $f(|x|)$ allora **L è decidibile** 

L'idea è 
- partire da $NT$, costruire $NT_{1}$ con un 3 nastri
- calcoliamo $f(|x|)$ e la scriviamo sul nastro 3
- sul nastro 2 simuliamo $NT$
	- SE ACCETTA PRIMA DI $f(|x|)$ passi -> accetta
	- SE RIGETTA PRIMA DI $f(|x|)$ passi -> rigetta
	- SE NON TERMINA ENTRO $f(|x|)$ passi -> rigetta

TERMINA SU OGNI INPUT (forzatamente) -> decide.


>[!lemma] Teorema 6.2 (spazio)
Sia `f : ℕ → ℕ` una **funzione totale calcolabile**.  
Se un linguaggio `L ⊆ Σ*` è **accettato da una macchina di Turing non deterministica** `NT` tale che, per ogni `x ∈ L`, vale: `nspace(NT, x) ≤ f(|x|)` -> allora `L` è **decidibile**.
>
Dimostrazione analoga e non va fatta!


---

# Classi di complessità
Un linguaggio `L` appartiene all'insieme caratterizzato dall'efficienza temporale individuata dalla funzione totale e calcolabile `f` se
- esiste una `T` che decide (o accetta `L`)
- e che, per ogni input `x` sull'alfabeto di `L` $$o_{T}(x) = O(f(|x|))$$
Stesso discorso vale per quella spaziale

### Classi di complessità DETERMINISTICHE
#### DTIME -> efficienza temporale nel caso deterministico
Data `f` totale e calcolabile
![[Pasted image 20260110153101.png]]ATTENZIONE: 
- <font color="#245bdb">dtime</font> (minuscolo) è la **misura di complessità**, ossia, una <u>funzione</u>
- <font color="#ff0000">DTIME</font> (MAIUSCOLO) è una **classe di complessità**, ossia, un <u>insieme</u>

#### DSPACE -> efficienza spaziale nel caso deterministico
Data `f` totale e calcolabile
![[Pasted image 20260110153116.png]]

### Classi di complessità NON DETERMINISTICHE
#### NTIME -> efficienza temporale nel caso NON DETERMINISTICO
Data `f` totale e calcolabile
![[Pasted image 20260110153142.png]]
#### NSPACE -> efficienza spaziale nel caso NON DETERMINISTICO
Data `f` totale e calcolabile
![[Pasted image 20260110153219.png]]

### COMPLEMENTI DELLE CLASSI DI COMPLESSITÀ
![[Pasted image 20260110153304.png]]

## TEOREMA 6.8
>[!lemma] Teorema 6.8
>![[Pasted image 20250424183845.png]]

La dimostrazione è facile perché una macchina deterministica è una particolare macchina non deterministica con grado di non determinismo pari a `1`.

O se pensi a un albero, un ramo di un albero NON DETERMINISTICO rappresenta la computazione di una macchina DETERMINISTICA.


## TEOREMA 6.9
>[!lemma] Teorema 6.9
>![[Pasted image 20250424185029.png]]

Ricordati questa formula qui $$\text{dspace(T,x)} \le \text{dtime(T,x)} \le \text{dspace(T,x)} \cdot |Q| \cdot (|\Sigma| + 1)^{\text{dspace(T,x)}}$$e nota come `dtime(T, x)` è compreso tra entrambi i `dspace`, CREDO che la dimostrazione usi questa caratteristica.


## TEOREMA 6.10
>[!lemma] Teorema 6.10
>![[Pasted image 20250424192810.png]]


## TEOREMA 6.11
>[!lemma] Teorema 6.11 – Relazioni tra classi e loro complementi
![[Pasted image 20250425115346.png]]

Ricordiamo che le classi deterministiche DECIDONO i linguaggi, il che vuol dire che terminano su ogni input.
Allora partendo da un linguaggio in `DTIME` (o `DSPACE`), basta invertire gli stati di accettazione e rigetto senza modificare altro.


## TEOREMA 6.12
![[Pasted image 20250425120834.png]]


## TEOREMA 6.13 - GAP THEOREM
>[!lemma] Teorema 6.13 - Gap Theorem 
> ![[Pasted image 20250425125730.png]]

### Funzioni time e space constructible
Queste funzioni sono funzioni che possono essere "costruite" da una macchina di Turing entro le stesse risorse che rappresentano.

#### TIME-CONSTRUCTIBLE
Una funzione `f(n)` è **time-constructible** se **esiste una macchina di Turing** che, dato `n` scritto in **notazione unaria** riesce a calcolare **calcolare `f(n)`** (sempre in unario) entro **tempo** $O(f(n))$.

#### SPACE-CONSTRUCTIBLE
Una funzione `f(n)` è **space-constructible** se **esiste una macchina di Turing** può calcolare `f(n)` (in unario), **usando al massimo** $O(f(n))$ **celle di nastro**.


>[!tip] LA FUNZIONE DEL GAP THEOREM **non è time-constructible**


## TEOREMA 6.14
>[!lemma] Teorema 6.14 - Teorema di gerarchia spaziale
>![[Pasted image 20250425133201.png]]


## TEOREMA 6.15
>[!lemma] Teorema 6.15 - Teorema di gerarchia temporale
>![[Pasted image 20250425133239.png]]


## TEOREMA 6.16
>[!lemma] Teorema 6.16
>![[Pasted image 20250430172027.png]]

Qui usiamo lo stesso ragionamento del teorema 6.2
- Abbiamo una macchina `NT` che accetta `L`, tale che $$ntime(NT, x) \le c \cdot f(|x|)$$con `f` time constructible
- Costruisco `NT'` a 3 nastri, che decide L
	1) Input su $N_{1}$
	2) scrive `|x|` su $N_{2}$
	3) calcola $c \cdot f(n)$ e la scrive su $N_{3}$
	4) Invoca $NT(x)$ per simulare tutte le computazioni non deterministiche
		- ogni volta che un ramo esegue un passo, `NT'` controlla se su $N_{3}$ ci sono ancora degli `1`
			- se non ci sono RIGETTA
	5) Se una computazione accetta -> ACCETTA
	6) Se tutte le computazioni rigettano -> RIGETTA

>[!question] Quanto tempo usa `NT’`?
>- Per calcolare $f(∣x∣)$ (in unario): serve $O(f(∣x∣))$ tempo, perché $f$ è <font color="#f79646">time-constructible</font>.
>- Per simulare tutte le computazioni entro $c \cdot f(|x|)$ passi: $O(f(∣x∣))$
>
>✅ Totale: $O(f(∣x∣))$


## TEOREMA 6.17
>[!lemma] Teorema 6.17 
>![[Pasted image 20250430182029.png]]

Cioè:  
>  Se un linguaggio è **decidibile in tempo non deterministico $f(n)$**, allora è anche decidibile **deterministicamente** in **tempo esponenziale** in $f(n)$.

🧠 **Cosa significa e perché è importante**
> Questo teorema ti risponde: **al massimo tempo $2^{O(f(n))}$**.  
> (Non sappiamo se basta meno, ma almeno abbiamo un limite superiore!)


## SPECIFICHE CLASSI DI COMPLESSITÀ
![[Pasted image 20260111104745.png]]
>[!tip] LE FUNZIONI SONO TUTTE TIME CONSTRUCTIBLE quindi le classi non deterministiche sono di linguaggi DECISI in tempo non deterministico.

## TEOREMA 6.18
>[!lemma] Teorema 6.18 
>$$\text{P} \subset \text{EXPTIME}$$

## TEOREMA 6.19
>[!lemma] Teorema 6.19
>$$\text{PSPACE} = \text{NPSPACE}$$


##### Definizione 6.3:
Sia $\mathcal{C}$ una classe di complessità di linguaggi e sia $\preceq_\pi$ una generica $\pi$-riduzione.
Un linguaggio $L \subseteq \Sigma^*$ è $\mathcal{C}$-completo rispetto alla $\pi$-riducibilità se:
a) $L \in \mathcal{C}$ e
b) per ogni $L' \in \mathcal{C}$ vale $L' \preceq_\pi L$.
- un linguaggio che è C completo ci serve per separare le classi di complessità e definire se un linguaggio appartiene o meno a una certa classe C chiusa

##### Definizione 6.4:
Una classe di complessità $\mathcal{C}$ è chiusa rispetto a una generica $\pi$-riduzione se,
per ogni coppia di linguaggi $L_1$ e $L_2$ tali che
$L_1 \preceq_\pi L_2$ e $L_2 \in \mathcal{C}$, si ha garantito che $L_1 \in \mathcal{C}$.


### Relazioni di inclusione
![[Pasted image 20260111104935.png]]
Andiamo in ordine.
#### $P \subseteq NP$ e $PSPACE \subseteq NPSPACE$
Derivano dal teorema 6.8, infatti sapendo che per ogni $f: N \rightarrow N$ totale e calcolabile $$DTIME[f(n)] \subseteq NTIME[f(n)]$$                                                                               e$$DSPACE[f(n)] \subseteq NSPACE[f(n)]$$perché basta prendere una NT e simulare grado di non determinismo a `1`.

Allora queste condizioni valgono anche per le unioni $$U_{n \in N} \ DTIME[f(n)] \ \subseteq \ U_{n \in N} \ NTIME[f(n)]$$                                                                               e $$U_{n \in N} \ DSPACE[f(n)] \ \subseteq \ U_{n \in N} \ NSPACE[f(n)]$$
che corrispondono a `P`, `NP` e `PSPACE`, `NPSPACE`.


#### $P \subseteq PSPACE$ e $NP \subseteq NPSPACE$
Derivano dal teorema 6.9, infatti sapendo che per ogni $f: N \rightarrow N$ totale e calcolabile  $$DTIME[f(n)] \subseteq DSPACE[f(n)]$$                                                                              e$$NTIME[f(n)] \subseteq NSPACE[f(n)]$$

Questo perché in $(f(n))$ passi la macchina può visitare al più $(f(n))$ celle di nastro.  
Quindi lo spazio usato è al più $(f(n))$.  
Questo vale sia nel caso deterministico che non deterministico.

Allora questo vale anche per le unioni.


#### $PSPACE \subseteq EXPTIME$ e $NPSPACE \subseteq NEXPTIME$
Derivano dal teorema 6.10, infatti sapendo che per ogni $f: N \rightarrow N$ totale e calcolabile $$DSPACE[f(n)] \subseteq DTIME[2^{O(f(n))}]$$                                                                              e$$NSPACE[f(n)] \subseteq NTIME[2^{O(f(n))}]$$
Una macchina che usa spazio $(f(n))$ ha al più $(2^{O(f(n))})$ configurazioni.  
Simulando tutte le configurazioni possibili, si ottiene una simulazione in tempo esponenziale.  
Lo stesso argomento vale per le macchine non deterministiche.

Allora questo vale anche per le unioni.


#### $NP \subseteq EXPTIME$
Deriva dal teorema 6.17, infatti sappiamo che per ogni funzione time constructible $f: N \rightarrow N$ $$NTIME[f(n)] \subseteq DTIME[2^{O(f(n))}]$$
Una macchina non deterministica in tempo $(f(n))$ ha un albero di computazione con profondità $(f(n))$.  
Il numero di rami è esponenziale in $(f(n))$.  
Una macchina deterministica può esplorare tutto l’albero in tempo esponenziale.

E questo vale anche per le unioni.


### CLASSI COMPLEMENTO
![[Pasted image 20260111120401.png]]
#### COROLLARIO 6.3
Dal corollario 6.11 sappiamo che le classi deterministiche sono chiuse rispetto al complemento.
Allora $$coP = P$$
>[!tip] Anche se dal teorema 6.16 sappiamo che in NP abbiamo linguaggi decidibili, NON possiamo comunque affermare che $NP = coNP$
>Questo perché invertendo gli stati di accettazione e rigetto, la verifica della nuova macchina richiederebbe tempo ESPONENZIALE deterministico


## Classe di complessità di funzioni: la classe FP
`FP` è la classe delle funzioni calcolabili in tempo deterministico polinomiale: $$FP = \bigcup_{k \in N}\{f: \Sigma_{1}^{*} \rightarrow \Sigma_{2}^{*} : \exists \text{ una macchina di Turing deterministica T che calcola f}$$                                                                              e$$\forall x \in \Sigma_{1}^{*} [dtime(T, x) \in O(n^{k})]\}$$

## Riduzioni
Qui ci occupiamo di stabilire un metodo per capire se, partendo da $$C_{1} \subseteq C_{2}$$possiamo affermare se sono uguali o no.

>[!tip] Usiamo riduzioni e linguaggi completi come *candidati separatori*

### Riduzione $\pi$
È una riduzione funzionale, con qualche vincolo $\pi$

### DEFINIZIONE 6.4: Chiusura
Una classi di complessità `C` è chiuse rispetto ad una generica $\pi-riduzione$ se, per ogni coppia di linguaggi $L_{1}$ e $L_{2}$, tali che $L_{1} \preceq_{\pi} L_{2}$ e $L_{2} \in C$, si ha che $L_{1}\in C$


### DEFINIZIONE 6.3: Linguaggio C-completo
Un linguaggio `L` è **C-completo** (rispetto a $\pi$) se:
1. $L \in C$
2. per ogni $L^{'} \in C$, vale $L^{'} \preceq_{\pi} L$


## TEOREMA 6.20
>[!lemma] Teorema 6.20
>Siamo `C` e `C'` due classi di complessità tali che $C^{'} \subseteq C$.
Se `C'` è chiusa rispetto a una $\pi-riduzione$ allora, per ogni linguaggio `L` che sia $C-completo$ rispetto a tale riduzione $$L \in C^{'} \iff C = C^{'}$$ 
###### DIMOSTRAZIONE
Banalmente, se $\mathcal{C} = \mathcal{C}'$ allora $L \in \mathcal{C}'$.
- Viceversa, supponiamo che $L \in \mathcal{C}'$. Poiché $L$ è $\mathcal{C}$-completo rispetto alla $\pi$-riducibilità, allora, per ogni linguaggio $L' \in \mathcal{C}$, vale che
    - $L' \preceq_\pi L$
- Poiché $\mathcal{C}'$ è chiusa rispetto alla $\pi$-riduzione, questo implica che, per ogni $L' \in \mathcal{C}$, risulta
    - $L' \in \mathcal{C}'$
        - Quindi $\mathcal{C} = \mathcal{C}'$.

![[Pasted image 20260111153027.png]]

## TEOREMA 6.21
>[!lemma] La classe `P` è chiusa rispetto alla riducibilità polinomiale.
###### DIMOSTRAZIONE
Siano $L_{1} \subseteq \Sigma_{1}^{*}$ e $L_{2} \subseteq \Sigma_{2}^{*}$ due linguaggi tali che $$L_{1} \preceq L_{2} \ \ \ e \ \ \ L_{2}\in P$$Indichiamo con $f: \Sigma_{1} \rightarrow \Sigma_{2}$ la funzione in **FP** che riduce $L_{1}$ a $L_{2}$ e siano 
- $T_{f}$ la macchina di turing (trasduttore) che calcola `f` in tempo polinomiale
	- ha 2 nastri e su $N_{2}$ scrive l'output
- $T_{2}$ la macchina deterministica (riconoscitore) che decide $L_{2}$ in tempo polinomiale
	- ha un nastro

Poiché $T_{f}$ e $T_{2}$ operano in tempo polinomiale, esistono $h, k \in N$ tali che, per ogni $x \in \Sigma_{1}^{*}$ e per ogni $y \in \Sigma_{2}^{*}$, $$dtime(T_{f}) \le |x|^{h} \ \ \ e \ \ \ dtime(T_{2}, y) \le |y|^{k}$$
Creiamo ora una nuova macchina $T_{1}$ che simula $T_{f}$ e $T_{2}$ e che decide $L_{1}$.
$T_{1}$ dispone di due nastri
- su $N_{1}$ è scritto l'input $x \in \Sigma_{1}$

$T_{1}$ opera in due fasi
1) Simula $T_{f}(x)$ e scrive l'output ($f(x))$ su $N_{2}$
2) Simula $T_{2}(f(x))$ su $N_{2}$
	- SE $T_{2}(f(x))$ ACCETTA -> $T_{1}(x)$ ACCETTA
	- SE $T_{2}(f(x))$ RIGETTA -> $T_{1}(x)$ RIGETTA

Dato che $f$ è una riduzione da $L_{1}$ a $L_{2}$, allora $$f(x) \in L_{2} \iff x \in L_{1}$$e visto che $T_{1}$ termina su ogni input (perché $T_2$ termina sempre) -> $T_{1}$ DECIDE il linguaggio.

###### COSTO
- $T_{f}(x)$ richiede $dtime(T_{f}, x) \le |x|^{h}$ passi
- $T_{2}(x)$ richiede $dtime(T_{2}, f(x)) \le |f(x)^{k}|$
- QUINDI $$dtime(T_{1}, x) \le |x|^{h} + |f(x)|^{k}$$
Dato che $dtime(T_{f}, x) \le |x|^{h}$e $T_{f}$ deve almeno scrivere il suo output $f(x)$, allora $$|f(x)| \le |x|^{h}$$e quindi $$dtime(T_{1}, x) \le |x|^{h} + |f(x)|^{k} \le |x|^{h} + (|x|^{h})^{k} = |x|^{h} + |x|^{hk}$$e poiché `h` e `k` sono costanti, questo prova che $$L_{1} \in P$$

## TEOREMA 6.22
>[!lemma] Le classi `NP`, `PSPACE`, `EXPTIME`, `NEXPTIME`.
###### DIMOSTRAZIONE
Se dovessi riscrivere la dimostrazione del Teorema 6.21 per il Teorema 6.22, devi:
1) Sostituire “macchina deterministica” con:
	- non deterministica (per NP, NEXPTIME)
	
2) Sostituire il bound: da polinomiale
	- a polinomiale / spazio polinomiale / esponenziale
	
3) Rifare l’ultimo conto delle risorse (tempo o spazio)
4) Lasciare immutata: 
	- la costruzione
	- l’argomento sulla lunghezza di $𝑓(𝑥)$


## COROLLARIO 6.4
Se $P \ne NP$ allora, per ogni linguaggio $NP-completo \ \ L$, $L \notin P$


## SECONDA CONGETTURA
$$coNP \ne NP$$
## TEOREMA 6.23
>[!lemma] Se $coNP \ne NP$, allora $P \ne NP$


## TEOREMA 6.24
>[!lemma] La classe `coNP` è chiusa rispetto alla riducibilità polinomiale.
###### DIMOSTRAZIONE
Siano $L_{1} \preceq L_{2}$ e sia $L_{2} \in coNP$.
Complementiamo $L_{1}$ e $L_{2}$ (così che sicuramente $L_{2} \in NP$) e utilizziamo la stessa dimostrazione per `NP`.


## TEOREMA 6.25
>[!lemma] Un linguaggio $L$ è `NP-completo` $\iff$ $L^{C}$ è `coNP-completo`
###### DIMOSTRAZIONE
(=>)
1) Passo 1 -- appartenenza
	- (L) è NP-completo ⇒ ($L \in NP$)
	- quindi ($L^c \in coNP$)

2) Passo 2 -- difficoltà (completezza)
	Prendi **un qualunque** linguaggio ($L' \in coNP$).  
	Allora:
	- ($L'^c \in NP$)
	
	Poiché (L) è NP-completo: $$L'^c \le_p L$$cioè esiste una funzione polinomiale (f) tale che:  $$  
x \in L'^c \iff f(x) \in L  
$$
	Ora complementi entrambi i lati:  $$  
x \in L' \iff f(x) \in L^c  
$$
	Quindi:  
$$  
L' \le_p L^c  
$$
Vale per ogni ($L' \in coNP$).  
Conclusione:
- ($L^c$) è **coNP-completo**.


(=>) È IDENTICA


## Teorema 6.26:
>[!lemma] Se esiste un linguaggio $L$ NP-completo tale che $L ∈ NP ∩ coNP$, allora $NP=coNP$
###### DIMOSTRAZIONE
Supponiamo che esista un linguaggio $L$ NP-completo con $L \in NP \cap coNP$

Poiché $L \in coNP$, il suo complemento $L^c$ appartiene a $NP$. Inoltre, dal Teorema 6.25, essendo L NP-completo, segue che $L^C$ è **coNP-completo**. Pertanto, per ogni linguaggio $L' \in coNP$, vale $L' \preceq_p L^c$. 
Poiché NP è chiusa rispetto alle riduzioni polinomiali e $L^c \in NP$, segue che $L' \in NP$.
Dunque:
- $coNP \subseteq NP$

Per l’inclusione opposta, poiché $L$ è NP-completo, 
- per ogni $L'' \in NP$ vale $L'' \preceq_p L$ Essendo $L \in coNP$ e 
- poiché $coNP$ è chiusa rispetto alle riduzioni polinomiali, segue che $L'' \in coNP$ Quindi:
- $NP \subseteq coNP$
Le due inclusioni implicano:
- $NP=coNP$
