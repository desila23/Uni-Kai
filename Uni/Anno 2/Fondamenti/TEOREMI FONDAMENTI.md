# LEZIONE 7
- 3.1
>[!lemma] $L \subseteq \Sigma^{*}$ è decidibile $\iff$ $L$ è accettabile $\land$ $L^{C}$ è accettabile.

>[!tip] Siano $\Sigma$ e $\Sigma_{1}$ due alfabeti finiti: una funziona (parziale) $$f: \Sigma^{*} \rightarrow \Sigma_{1}^{*}$$è una funzione *calcolabile* se esiste una macchina di tipo TRASDUTTORE che, dato un input $x \in \Sigma^{*}$ termina con la stringa $f(x)$ scritta sul nastro di output se e solo se $f(x)$ è definita.

- 3.2
>[!lemma] $\chi_{L}$ è calcolabile $\iff$ $L$ è decidibile.

- 3.3 (prima dimostrazione del 3.2)
>[!lemma] se `f` è calcolabile <u>e totale</u> $\Rightarrow$ $L_{f}$ è **decidibile**

- 3.4 (seconda dimostrazione del 3.2)
>[!lemma] se $L_{f}$ è decidibile $\Rightarrow$ `f` è **calcolabile**

# LEZIONE 8
- teorema sui numeri reali (no dimostrazione)

>[!lemma] Per ogni programma scritto in PASCALMINIMO esiste un trasduttore `T` che scrive sul nastro di output lo stesso valore fornito dal programma

>[!lemma] Per ogni macchina di turing deterministica `T` di tipo riconoscitore esiste un programma in PASCALMINIMO che, per ogni stringa `x`, se `T(x)` termina nello stato finale $q_{F} \in \{q_{A}, q_{R}\}$ allora il programma con input `x` restituisce $q_{F}$


>[!lemma] Sia Σ un alfabeto finito. Allora l’insieme Σ*, costituito da tutte le parole di lunghezza finita su Σ, è numerabile.

>[!lemma] L'insieme $T$ delle macchine di Turing definite sull'alfabeto `{0,1}` e dotate di un singolo nastro (più eventuale nastro di output) è numerabile.

## TEOREMA 5.3
>[!lemma] Se $\Sigma$ è un alfabeto finito, allora l'insieme $\mathscr{L}_{\Sigma}$ non è numerabile.

## DEFINIZIONE 5.1
>[!definizione] Il linguaggio $$L_{A}(T) \in \mathscr{L}_{\Sigma}$$ è il sottoinsieme di $\Sigma^{*}$ delle parole accettate da T 

## TEOREMA 5.4
>[!lemma] TEOREMA: $L_{h}$ (HALTING PROBLEM) è accettabile

## TEOREMA 5.5
>[!lemma] $L_{h}$ NON è decidibile

## TEOREMA 5.6 
>[!lemma] Un linguaggio $L \subseteq \{0,1\}^{*}$ è decidibile se e soltanto se $L$ è accettabile e $L^{C}$ è accettabile.

## COROLLARIO 5.2
>[!tip] Un linguaggio $L \subseteq \{0,1\}^{*}$ è decidibile se e solo se $L^{C}$ è decidibile

## TEOREMI 5.7 e 5.8
![[Pasted image 20260107191855.png]]

## DEFINIZIONE 5.3 
![[Pasted image 20260107191916.png]]![[Pasted image 20260107192024.png]]

# LEZIONE 13
>[!lemma] Teorema G1
>SIa G una grammatica di tipo $t > 0$ e sia G' la grammatica ottenuta 
>- aggiungendo a $G$ un nuovo non terminale $S'$ che sarà l'assioma in $G'$
>- inserendo la produzione $S' \rightarrow \epsilon$
>- inserendo la produzione $S' \rightarrow S$
$\Rightarrow L(G') = L(G) \cup \{\epsilon\}$ 
>
Possiamo leggere il precedente teorema nel modo seguente: in una grammatica di tipo t > 0 la produzione S → 𝜀 è permessa, ma solo         se S non appare nel lato destro di alcuna produzione.

>[!lemma] Teorema G2
>Sia G una grammatica di tipo $t > 1$ e sia G' una grammatica ottenuta aggiungendo a $P$ un numero arbitrario di $\epsilon$-produzioni.
>
>$\Rightarrow L(G') = L(G) \cup \{\epsilon\}$
>
>In parole semplici:
>- Aggiungere ε-produzioni **aggiunge solo la parola vuota** al linguaggio generato.
>- Non cambia altro.

>[!lemma] Teorema G3
>$\forall \ G_{0}$ di tipo 0
>$\exists \ G'$ ottenuta aggiungendo a una grammatica di tipo 1 opportune $\epsilon$-produzioni tali che $$L(G) = L(G')$$
>
>✅ Cioè: **se ti muovi con attenzione**, anche una grammatica **di tipo 1** può generare lo stesso linguaggio di una grammatica generale di tipo 0 — **ma le ε-produzioni devono essere gestite in modo controllato**, non messe “a caso”.

# LEZIONE 14
>[!lemma] Teorema G4
>$\forall$ linguaggio accettabile $L$ esiste una grammatica G (di tipo 0) tale che $$L = L(G)$$
>
>Si legge: "Per ogni linguaggio accettabile L, esiste una grammatica G di tipo 0 tale che il linguaggio generato da G è esattamente L."

# LEZIONE 15
>[!lemma] Teorema G.5
Per ogni grammatica G esiste una macchina di Turing che accetta L(G).
>
>Ossia:
>$\forall$ grammatica $G$ $\exists \ T$ : $L(G)$ è il linguaggio accettato da $T$
>
>Avendo $G = <V_{N}, V_{T}, P_{G}, S>$	ABBIAMO CHE  $\forall \ x \ \exists \ V_{T}^{*} \ [o_{T}(x) = q_{A} \iff L(G)]$
## $NT_{G}^{'}$ che decide i linguaggi generati da $G_{1}$
![[Pasted image 20260109112457.png]]


# LEZIONE 16
>[!lemma] TEOREMA G.6 
>Per ogni grammatica $G$ di tipo 1, esiste una macchina di Turing che **decide** $L(G)$


# LEZIONE 17
>[!lemma] Pumping Lemma
>Per ogni linguaggio $L \in G_{2}$ esiste una costante (che dipende esclusivamente dal linguaggio L), definita come $p_{L} > 0$ (di tipo intero) tale che per ogni parola $z \in L$ se $|z| \ge p_{L}$ allora esistono 5 parole
>- `u`
>- `v`
>- `w`
>- `x`
>- `y`
>tali che
>1. `z = u v w x y` (ossia z puoi scriverlo come concatenazione delle cinque parole)
>2. `|v w x|` $\le p_{L}$
>3. `|v x|` $\ge 1$ ($v$ e $x$ NON POSSONO ESSERE ENTRAMBE VUOTE)
>4. $u \ v^{h} \ w \ x^{h} \ y$ è in L per ogni h ≥ 0.

>[!lemma] TEOREMA G.7
> L’insieme dei linguaggi context-free **è chiusa rispetto all’unione**.
> 
> Nel senso che, se sono nell'insieme dei linguaggi context-free e eseguo l'unione, rimango in questo insieme.

>[!lemma] TEOREMA G.8
>L’insieme dei linguaggi context-free **non è chiusa rispetto all’intersezione**

>[!lemma] TEOREMA G.9
>L’insieme dei linguaggi context-free **non è chiusa rispetto al complemento**

>[!lemma] TEOREMA G.10
>Per ogni linguaggio L, esiste un PDA M che accetta L per pila vuota se e soltanto se esiste un PDA M’ che accetta L per stato finale.

>[!lemma] TEOREMA G.11
>Un linguaggio L è context-free  se e soltanto se esiste un PDA M che accetta L.


# LEZIONE 18
>[!lemma] TEOREMA G.12
> L’insieme dei linguaggi accettati da automi a pila deterministici è un sottoinsieme proprio ($\subset$) dei linguaggi context-free
> 
> In altri termini, *gli automi a pila deterministici sono ‘’strettamente meno potenti’’ di quelli non deterministici*.

>[!lemma] Teorema G.13
>sia $L_{A}$ l’insieme delle grammatiche di tipo 2 ambigue -> **il linguaggio** $L_{A}$ **è non decidibile**.
>
>Ciò significa che non esiste un algoritmo che, data una grammatica G di tipo 2 decide se G è ambigua.


# LEZIONE 19
>[!lemma] Il linguaggio accettato da un ASFD $A = \langle \Sigma, Q, q_0, Q_F, \delta \rangle$ è l'insieme delle parole accettate da A, ossia $$L(A) = \{x \in \Sigma^{*} : (q_{0}, \ x) \vdash^{*} (q, \ \square) \ \ \ \text{con q} \in Q_{F}\}$$o equivalentemente $$L(A) = \{x \in \Sigma^{*} : \delta^{*}(q_{0}, \ x) \in Q_{F}\}$$

>[!lemma] L(A) È IL LINGUAGGIO DECISO DA A

## Pumping lemma per $G_{3}$
Anche qui si utilizza il Pumping lemma per dimostrare se un linguaggio NON è di tipo 3 (quindi non è regolare).
Scrivo solo i punti che si differenziano
1. `z = u v w`
2. `|u v|` $\le p_{L}$
3. `|v|` $\ge 1$
4. $u v^{h} w$ è in `L` per ogni $h \ge 0$


>[!lemma] TEOREMA G.14
 Per ogni ASFD $A = \langle Σ, Q, q , QF, 𝛿 \ \rangle$ esiste una grammatica $GA= \langle 𝑉, 𝑉 , P, S \rangle$  tale che $$L(A) = L(GA)$$
> ##### ✏️ Cosa significa?
Ogni **automa a stati finiti** può essere tradotto in una **grammatica regolare** equivalente.


# LEZIONE 20
>[!lemma] Teorema G.15
>Per ogni grammatica regolare $G = \langle V_N, V_T, P, S \rangle$ 
>esiste un ***ASFND*** $A_G = \langle \Sigma, Q, q_0, Q_F, \delta \rangle$ tale che $$L(G) = L(A_{G})$$

>[!lemma] Teorema G.16
>Per ogni *ASFND* $N A = \langle \Sigma, Q, q_{0}, Q_{F}, \delta \rangle$ esiste un ASFD $A = \langle \Sigma, Q_{D}, q_{0D}, Q_{FD}, \delta_{D} \rangle$ 
>tale che $$L(NA) = L(A)$$ 

>[!lemma] Teorema G.17
>La classe dei linguaggi regolari coincide con la classe dei linguaggi decisi da automi a stati finiti deterministici.

>[!lemma] Teorema G.18
>Un linguaggio è generato da una grammatica di tipo 3 $\iff$ **esso è definito da una espressione regolare**.


# LEZIONE 21
>[!lemma] TEOREMA 6.1 (caso deterministico)
>Sia `T` una macchina di Turing deterministica, definita su un alfabeto $Σ$ (non contenente il simbolo $\square$) e un insieme degli stati `Q`.
>e sia $x ∈ Σ^{∗}$ tale che `T(x)` **termina**. Allora, $$\text{dspace(T,x)} \le \text{dtime(T,x)} \le \text{dspace(T,x)} \cdot |Q| \cdot (|\Sigma| + 1)^{\text{dspace(T,x)}}$$

>[!lemma] TEOREMA 6.1 (caso non deterministico)
>Sia `NT` una macchina di Turing non deterministica, definita su un alfabeto $Σ$ (non contenente il simbolo $\square$) e un insieme degli stati `Q`.
>e sia $x ∈ Σ^{∗}$ tale che `NT(x)` **accetta/termina**. Allora, $$\text{nspace(NT,x)} \le \text{ntime(NT,x)} \le \text{nspace(NT,x)} \cdot |Q| \cdot (|\Sigma| + 1)^{\text{nspace(NT,x)}}$$
>
NON VA FATTA LA DIMOSTRAZIONE!!!!!!!!!

>[!lemma] Teorema 6.2 (tempo)
>Se un linguaggio $L \subseteq \Sigma^*$ è **accettato** da una macchina di Turing **non deterministica** $NT$ **entro tempo** $f(|x|)$, allora **L è decidibile**.

>[!lemma] Teorema 6.2 (spazio)
Sia `f : ℕ → ℕ` una **funzione totale calcolabile**.  
Se un linguaggio `L ⊆ Σ*` è **accettato da una macchina di Turing non deterministica** `NT` tale che, per ogni `x ∈ L`, vale: `nspace(NT, x) ≤ f(|x|)` -> allora `L` è **decidibile**.
>
Dimostrazione analoga e non va fatta!


# LEZIONE 22

>[!lemma] Teorema 6.8
>![[Pasted image 20250424183845.png]]

>[!lemma] Teorema 6.9
>![[Pasted image 20250424185029.png]]

>[!lemma] Teorema 6.10
>![[Pasted image 20250424192810.png]]

>[!lemma] Teorema 6.11 – Relazioni tra classi e loro complementi
![[Pasted image 20250425115346.png]]

>[!lemma] Teorema 6.12 
>![[Pasted image 20250425120834.png]]

>[!lemma] Teorema 6.13 - Gap Theorem 
> ![[Pasted image 20250425125730.png]]

**Definizione 6.1**
Una funzione totale calcolabile $f : \mathbb{N} \to \mathbb{N}$ è _time-constructible_ se esiste una macchina di Turing $T$ di tipo trasduttore che, preso in input un intero $n$ espresso in notazione unaria (ossia come sequenza di $n$ simboli `1`), scrive sul nastro di output il valore $f(n)$ in unario e impiega  $dtime(T,n) \in O(f(n))$, cioè lo stesso ordine di tempo del risultato $f(n)$.

**Definizione 6.2**
Una funzione totale calcolabile $f : \mathbb{N} \to \mathbb{N}$ è _space-constructible_ se esiste una macchina di Turing $T$ di tipo trasduttore che, preso in input il valore $n$ espresso in notazione unaria, scrive sul nastro di output il valore $f(n)$ in unario e  $dspace(T,n) \in O(f(n))$.

>[!lemma] Teorema 6.14 - Teorema di gerarchia spaziale
>![[Pasted image 20250425133201.png]]


# LEZIONE 23
>[!lemma] Teorema 6.16
>![[Pasted image 20250430172027.png]]

>[!lemma] Teorema 6.17 
>![[Pasted image 20250430182029.png]]

>[!lemma] Teorema 6.15 - Teorema di gerarchia temporale
>![[Pasted image 20250430190834.png]]

>[!lemma] Teorema 6.18 
>$$\text{P} \subset \text{EXPTIME}$$

>[!lemma] Teorema 6.19
>$$\text{PSPACE} = \text{NPSPACE}$$


# LEZIONE 24


>[!lemma] Teorema 6.20
>Siano $\mathcal{C}$ e $\mathcal{C}_0$ due classi di complessità tali che $\mathcal{C}_0 \subseteq \mathcal{C}$.  
Se $\mathcal{C}_0$ è chiusa rispetto a una $\pi$-riduzione, allora:
>- Per ogni linguaggio $L$ che è $\mathcal{C}$-completo rispetto a $\pi$, si ha che: $$
> L \in \mathcal{C}_0 \iff \mathcal{C}_0 = \mathcal{C}
> $$

>[!lemma] TEOREMA 6.21
>Se 
>- $L_{1} ≼ L_{2}$  
>- e  $L_{2} \in P$  
>- $\ \Rightarrow \ L_{1} \in P$ 
>
>Ossia, il teorema dice che la classe P è chiusa rispetto alla riducibilità polinomiale.


# LEZIONE 25
>[!lemma] Le classi `NP`, `PSPACE`, `EXPTIME`, `NEXPTIME`.

## COROLLARIO 6.4
Se $P \ne NP$ allora, per ogni linguaggio $NP-completo \ \ L$, $L \notin P$

## TEOREMA 6.23
>[!lemma] Se $coNP \ne NP$, allora $P \ne NP$

>[!lemma] TEOREMA 6.24
>![[Pasted image 20250508172735.png]]

>[!lemma] TEOREMA 6.25
>Un linguaggio $L$ è $NP$-completo $\iff$ il suo complemento $L^{C}$ è $coNP$-completo

>[!lemma] TEOREMA 6.26
![[Pasted image 20250508183849.png]]