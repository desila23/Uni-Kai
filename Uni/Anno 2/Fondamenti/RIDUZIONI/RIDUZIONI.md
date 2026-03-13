# 3-SAT
## Teorema (NP-completezza di 3SAT)

**Problema 3SAT (formalizzazione come tripla $\langle I,S,\pi\rangle$).**

* **Insieme delle istanze**

$$
I_{3SAT} = \{ f : \{vero,falso\}^n \to \{vero,falso\} \ \text{tale che } f \text{ è in forma 3-CNF} \}.
$$

Cioè: $f$ è una formula in **forma congiuntiva normale** in cui ogni clausola ha **esattamente 3 letterali**.

* **Insieme delle soluzioni possibili (certificati)**

$$
S_{3SAT}(f) = \{(b_1,\dots,b_n) \in \{vero,falso\}^n\},
$$

cioè tutte le assegnazioni di verità alle variabili.

* **Predicato di accettazione**

$$
\pi_{3SAT}(f,S_{3SAT}) \equiv \exists (b_1,\dots,b_n) \in \{vero,falso\}^n : f(b_1,\dots,b_n) = vero,
$$

ossia esiste un’assegnazione che rende vera la formula (sostituendo $(x_i \mapsto b_i)$ e $(\neg x_i \mapsto \neg b_i)$).

**Teorema.** $(3SAT)$ è **NP-completo**.

---

## Idea della dimostrazione

1. $(3SAT \in NP)$ perché è solo una restrizione di $(SAT)$ (le istanze di $(3SAT)$ sono un sottoinsieme di quelle di $(SAT)$).
2. Per la NP-completezza, si costruisce una **riduzione polinomiale** $(SAT \le_p 3SAT)$: data una formula CNF $(f = \{c_1,\dots,c_m\})$, si trasforma ogni clausola $(c_j)$ in un insieme $(C_j)$ di clausole **a 3 letterali**, in modo che $(c_j)$ sia soddisfacibile **se e solo se** lo è l’intero $(C_j)$ (sulla stessa assegnazione, estesa alle nuove variabili). Poi si pone $(f' = \bigcup_{j=1}^m C_j)$, che è 3-CNF, e vale:

$$
f \in SAT \iff f' \in 3SAT.
$$

---

## Dimostrazione

### 1) $(3SAT \in NP)$

Osservato che $(I_{3SAT} \subseteq I_{SAT})$, e sapendo che $(SAT \in NP)$, segue immediatamente $(3SAT \in NP)$.

### 2) Riduzione $(SAT \le_p 3SAT)$

Sia $(f \in I_{SAT})$ una formula CNF sulle variabili $(X = \{x_1,\dots,x_n\})$, vista come insieme di clausole

$$
f = \{c_1,\dots,c_m\}.
$$

Costruiamo $(f')$ trasformando ogni clausola $(c_j)$ in un insieme $(C_j)$ di clausole a 3 letterali tale che:

$$
(\exists a \ \text{che soddisfa } c_j) \Longleftrightarrow (\exists a' \ \text{estensione di } a \ \text{che soddisfa tutte le clausole in } C_j).
$$

Poi definiamo:

$$
f' = \bigcup_{j=1}^m C_j,
$$

che è 3-CNF.

Ora descriviamo $(C_j)$ in base al numero di letterali in $(c_j)$.

#### Caso A: $(c_j)$ ha 1 letterale, $(c_j = \ell)$

Introduciamo due nuove variabili $(Y_j = \{y_{j1},y_{j2}\})$ e poniamo:

$$
C_j = \{(\ell \vee y_{j1} \vee y_{j2}), (\ell \vee \neg y_{j1} \vee y_{j2}), (\ell \vee y_{j1} \vee \neg y_{j2}), (\ell \vee \neg y_{j1} \vee \neg y_{j2})\}.
$$

Allora tutte le clausole in $(C_j)$ sono soddisfatte **se e solo se** $(\ell)$ è vero.

#### Caso B: $(c_j)$ ha 2 letterali, $(c_j = \ell_1 \vee \ell_2)$

Introduciamo una nuova variabile $(Y_j = \{y_j\})$ e poniamo:

$$
C_j = \{(\ell_1 \vee \ell_2 \vee y_j), (\ell_1 \vee \ell_2 \vee \neg y_j)\}.
$$

Le due clausole sono soddisfatte **se e solo se** $(\ell_1)$ oppure $(\ell_2)$ è vero.

#### Caso C: $(c_j)$ ha 3 letterali, $(c_j = \ell_1 \vee \ell_2 \vee \ell_3)$

È già in 3-CNF, dunque:

$$
C_j = \{c_j\}.
$$

#### Caso D: $(c_j)$ ha $(k \ge 4)$ letterali, $(c_j = \ell_1 \vee \ell_2 \vee \cdots \vee \ell_k)$

Introduciamo nuove variabili $(Y_j = \{y_{j1},\dots,y_{j,k-3}\})$ e spezzettiamo la clausola in una catena:

$$
C_j = \{(\ell_1 \vee \ell_2 \vee y_{j1}), (\neg y_{j1} \vee \ell_3 \vee y_{j2}), \dots, (\neg y_{j,k-3} \vee \ell_{k-1} \vee \ell_k)\}.
$$

### 3) Correttezza della trasformazione e complessità

Per costruzione, un’assegnazione soddisfa $(f)$ **se e solo se** (estesa alle nuove variabili) soddisfa $(f')$Quindi:
$$
f \in SAT \iff f' \in 3SAT
$$

Inoltre, la costruzione di ciascun $(C_j)$ richiede tempo **lineare** nel numero di letterali di $(c_j)$, e complessivamente $(f')$ si costruisce in tempo proporzionale a $n \cdot m$ e dunque in tempo $O(|f|^{2})$.

### 4) Conclusione

Abbiamo una riduzione polinomiale $(SAT \le_p 3SAT)$; poiché $(3SAT \in NP)$, segue che $(3SAT)$ è **NP-completo**.


---

# VERTEX COVER
### Teorema (enunciato)

**VERTEX COVER (VC)** è NP-completo.

**Formalizzazione del problema (tripla)**  
Un’istanza è una coppia grafo-soglia:

$$
I_{VC} = \{\langle G=(V,E),k\rangle : G \text{ grafo non orientato},\ k \in \mathbb{N}^+\}.
$$

Le **soluzioni possibili** sono sottoinsiemi di vertici:

$$
S_{VC}(G,k) = \{V' \subseteq V\}.
$$

Il **predicato** di accettazione richiede che $V'$ copra tutti gli archi e sia “piccolo”:

$$
\pi_{VC}(G,k,S_{VC}) = \exists V' \subseteq V : |V'| \le k \ \land \ \forall (u,v) \in E, [u \in V' \ \lor \ v \in V'].
$$



**(1) $VC \in NP$.**  
Un certificato è $V' \subseteq V$; verificare $|V'| \le k$ e che ogni arco abbia almeno un estremo in $V'$ è polinomiale (nel testo: $O(|E||V|)$).

---

### Idea della dimostrazione

Per provare NP-completezza si riduce **3SAT** a **VC** costruendo, da una formula 3-CNF $\varphi$, un grafo $G$ che “simula” scelte di verità e soddisfacibilità tramite **gadget**:

* **gadget-variabile**: per ogni $x_i$ un arco $(u_i, \neg u_i)$, costringendo a scegliere almeno uno dei due (interpretabile come assegnare vero/falso);
* **gadget-clausola**: per ogni clausola un triangolo, che richiede almeno 2 vertici per coprirne gli archi;
* archi di collegamento tra vertici di clausola e il nodo del letterale corrispondente, per imporre coerenza tra “clausola soddisfatta” e scelta nei gadget-variabile.

Si pone poi

$$
k = n + 2m
$$

(dove $n$ = numero di variabili, $m$ = numero di clausole) e si mostra:

$$
\varphi \text{ soddisfacibile } \Longleftrightarrow G \text{ ammette un vertex cover di taglia } \le n + 2m.
$$

---

### Dimostrazione

**Riduzione ($f : I_{3SAT} \to I_{VC}$).**  
Sia $\varphi$ in 3-CNF su $X = \{x_1,\dots,x_n\}$ con $\varphi = \{c_1,\dots,c_m\}$ e  
$c_j = \ell_{j1} \vee \ell_{j2} \vee \ell_{j3}$. Costruiamo $G = (V,E)$ così:

1. **Per ogni variabile $x_i$**: aggiungi due nodi $u_i, \neg u_i$ e l’arco $(u_i, \neg u_i)$ (gadget-variabile).
2. **Per ogni clausola $c_j$**: aggiungi tre nodi $v_{j1}, v_{j2}, v_{j3}$ e gli archi del triangolo $(v_{j1},v_{j2}), (v_{j2},v_{j3}), (v_{j3},v_{j1})$ (gadget-clausola).
3. **Collegamenti letterali**: per ogni letterale $\ell_{ji}$ collega $v_{ji}$ al nodo che rappresenta quel letterale:
   - se $\ell_{ji} = x_h$ aggiungi $(v_{ji}, u_h)$;
   - se $\ell_{ji} = \neg x_h$ aggiungi $(v_{ji}, \neg u_h)$.
4. Poni **$k = n + 2m$**.  
   La costruzione è polinomiale (nel testo: $O(nm)$).

**Osservazione chiave (taglia minima).**  
Ogni vertex cover di $G$ ha cardinalità almeno $n + 2m$: serve almeno 1 vertice per ciascun arco $(u_i, \neg u_i)$ (quindi almeno $n$) e almeno 2 vertici per ciascun triangolo di clausola (quindi almeno $2m$).  
Dunque “$\le n + 2m$” equivale a “$= n + 2m$” e implica: esattamente 1 nodo per gadget-variabile ed esattamente 2 nodi per gadget-clausola.

---

#### (⇒) Se esiste un vertex cover $V'$ con $|V'| = n + 2m$, allora $\varphi$ è soddisfacibile.

Poiché $V'$ usa **esattamente un** nodo per ogni coppia $(u_h, \neg u_h)$, definiamo un’assegnazione $a$ ponendo:

$$
a(x_h) = \text{vero} \Longleftrightarrow u_h \in V'.
$$

Consideriamo una clausola $c_j$. Nel triangolo $C_j$ stanno **esattamente due** nodi in $V'$, quindi **uno** tra $v_{j1}, v_{j2}, v_{j3}$ resta fuori.  
Il nodo fuori implica che l’arco di collegamento incidente su quel $v_{ji}$ non è coperto dal lato clausola; siccome $V'$ è un vertex cover, quell’arco deve essere coperto dal lato variabile, cioè dal nodo-letterale adiacente (uno tra $u_h$ o $\neg u_h$). Chiamiamo tale nodo $y_j$.  
Per come abbiamo definito $a$, il fatto che $y_j \in V'$ corrisponde a rendere vero il letterale associato in $c_j$. Quindi ogni clausola ha almeno un letterale vero, e dunque $a \models \varphi$.

---

#### (⇐) Se $\varphi$ è soddisfacibile, allora esiste un vertex cover $V'$ con $|V'| = n + 2m$.

Sia $a$ un’assegnazione che soddisfa $\varphi$. Costruiamo:

* $V'_X$: per ogni variabile $x_i$, scegli $u_i$ se $a(x_i) = \text{vero}$, altrimenti scegli $\neg u_i$. (Così copriamo ogni arco $(u_i, \neg u_i)$ con 1 nodo.)
* Per ogni clausola $c_j$, scegli un nodo $y_j \in \{v_{j1}, v_{j2}, v_{j3}\}$ corrispondente a un letterale vero sotto $a$ (esiste perché $a \models \varphi$). Poi metti nel cover gli altri due nodi del triangolo:

$$
V'_j = \{v_{j1}, v_{j2}, v_{j3}\} \setminus \{y_j\}.
$$

Infine poni:

$$
V' = V'_X \cup \bigcup_{j=1}^m V'_j.
$$

Allora $|V'| = n + 2m$. Gli archi interni ai triangoli sono coperti da $V'_j$ (2 nodi bastano).  
Gli archi di collegamento dai nodi di clausola al nodo-letterale sono coperti perché: se il nodo di clausola è tra i due scelti, l’arco è coperto dal lato clausola; se è $y_j$ (non scelto), allora il suo letterale è vero e quindi il corrispondente nodo nel gadget-variabile è in $V'_X$, coprendo l’arco.  
Ne segue che $V'$ è un vertex cover.

---

**Conclusione.**  
Abbiamo costruito una riduzione polinomiale $(3SAT \le_p VC)$ e già sappiamo $(VC \in NP)$; quindi **VC è NP-completo**.


---

# INDIPENDENT SET
## Teorema (enunciato)

**Problema INDEPENDENT SET (IS)** (formalizzazione come tripla $\langle I,S,\pi\rangle$).

* **Insieme delle istanze**

$$
I_{IS} = \{\langle G=(V,E),k\rangle : G \text{ grafo non orientato},\ k \in \mathbb{N}\}.
$$

(Input: un grafo e una soglia $k$).

* **Insieme delle soluzioni possibili (certificati)**

$$
S_{IS}(G,k) = \{ I \subseteq V \}.
$$

(Candidato: un sottoinsieme di vertici).

* **Predicato di accettazione**

$$
\pi_{IS}(G,k,S_{IS}) \equiv \exists I \subseteq V : |I| \ge k \ \land \ \forall u,v \in I, [(u,v) \notin E].
$$

(Validità: $I$ è grande almeno $k$ ed è **indipendente**, cioè non contiene estremi di uno stesso arco).

**Teorema.** $(IS)$ è **NP-completo** (in particolare, $(VC \le_p IS)$).

---

## Idea della dimostrazione

1. $(IS \in NP)$: un certificato è $I \subseteq V$ e si verifica in tempo polinomiale che $|I| \ge k$ e che non esistono archi tra coppie di vertici in $I$.

2. Per la completezza si usa l’equivalenza fondamentale:

$$
V' \subseteq V \text{ è un vertex cover } \Longleftrightarrow V \setminus V' \text{ è un insieme indipendente}.
$$

Quindi da un’istanza $\langle G,k\rangle$ di $(VC)$ basta passare a $\langle G, |V|-k \rangle$ di $(IS)$:  
“coprire tutti gli archi con $\le k$ vertici” è lo stesso che “lasciare fuori $\ge |V|-k$ vertici senza archi tra loro”.

---

## Dimostrazione

### 1) $(IS \in NP)$

Dato un certificato $I \subseteq V$, si controlla $|I| \ge k$ e che per ogni coppia $u,v \in I$ valga $(u,v) \notin E$ in tempo polinomiale (nel testo: $O(|E||V|^2)$). Quindi $(IS \in NP)$.

### 2) Riduzione polinomiale $(VC \le_p IS)$

Consideriamo un grafo non orientato $G=(V,E)$ e un sottoinsieme $V' \subseteq V$. Mostriamo prima l’equivalenza chiave:

* (**Se**) $V'$ è un vertex cover, allora nessun arco può avere **entrambi** gli estremi in $V \setminus V'$; dunque per ogni $u,v \in V \setminus V'$ si ha $(u,v) \notin E$, cioè $V \setminus V'$ è indipendente.
* (**Solo se**) Se $V \setminus V'$ è indipendente, allora non esiste alcun arco con entrambi gli estremi fuori da $V'$; quindi per ogni $(u,v) \in E$ deve valere $u \in V'$ oppure $v \in V'$, cioè $V'$ è un vertex cover.

A questo punto definiamo la funzione di riduzione:

$$
f(\langle G=(V,E),k \rangle) = \langle G=(V,E), |V|-k \rangle.
$$

**Correttezza.**

$$
\langle G,k \rangle \in VC
\Longleftrightarrow
\exists V' \subseteq V : |V'| \le k \text{ e } V' \text{ vertex cover}
$$

$$
\Longleftrightarrow
\exists I = V \setminus V' : |I| = |V| - |V'| \ge |V| - k \text{ e } I \text{ indipendente}
$$

$$
\Longleftrightarrow
f(\langle G,k \rangle) = \langle G, |V|-k \rangle \in IS.
$$

L’algoritmo $f$ è chiaramente polinomiale (non modifica $G$, calcola solo $|V|-k$).

### 3) Conclusione

Abbiamo $(VC \le_p IS)$ e $(IS \in NP)$; poiché $(VC)$ è NP-completo, segue che **$(IS)$ è NP-completo**.


---

# CLIQUE
## Teorema (NP-completezza di **CLIQUE** via riduzione da **INDEPENDENT SET**)

### Enunciato (con formalizzazione del problema)

**CLIQUE (CL)**: dato un grafo non orientato $G=(V,E)$ e un intero $k \in \mathbb{N}$, decidere se esiste una *clique* di cardinalità almeno $k$.

Formalmente, il problema è descritto dalla tripla:

* **Insieme delle istanze**

$$
I_{CL} = \{\langle G=(V,E),k\rangle : G \text{ grafo non orientato},\ k \in \mathbb{N} \}.
$$

* **Insieme delle soluzioni possibili (certificati)**

$$
S_{CL}(G,k) = \{ C \subseteq V \}.
$$

* **Predicato**

$$
\pi_{CL}(G,k,S_{CL}(G,k)) \equiv \exists C \in S_{CL}(G,k) : |C| \ge k \ \wedge \ \forall u,v \in C \;[(u,v) \in E].
$$

Inoltre $(CL \in NP)$ (verifica polinomiale del certificato $C$).

**Teorema:** $(CL)$ è **NP-completo**.

---

### Idea della dimostrazione

Riduciamo **INDEPENDENT SET (IS)** a **CLIQUE** usando il **grafo complemento**: in un grafo, un insieme di vertici è indipendente se e solo se, nel complemento, gli stessi vertici formano una clique. Quindi “indipendenza in $G$” $\Longleftrightarrow$ “completezza in $G^c$”.

---

### Dimostrazione

1. **Costruzione della riduzione.**  
   Dato $\langle G=(V,E),k\rangle$ istanza di $(IS)$, costruiamo il **grafo complemento**

$$
G^c = (V,E^c) \quad \text{dove} \quad (u,v) \in E^c \iff (u,v) \notin E
$$

(per ogni coppia $u,v \in V$).  
Definiamo la funzione di riduzione:

$$
f(G,k) = \langle G^c, k \rangle.
$$

2. **Correttezza ($\Leftrightarrow$).**  
   Per definizione di complemento, un sottoinsieme $U \subseteq V$ è **indipendente in $G$** se e solo se **ogni coppia** di nodi in $U$ *non* è collegata in $G$, cioè *è* collegata in $G^c$; dunque

$$
U \text{ è independent set in } G \iff U \text{ è clique in } G^c.
$$

Ne segue:

$$
G \text{ contiene un independent set } I \text{ con } |I| \ge k
\iff
G^c \text{ contiene una clique } C \text{ con } |C| \ge k,
$$

quindi

$$
\langle G,k \rangle \in IS \iff f(G,k) \in CL.
$$

3. **Complessità.**  
   La costruzione di $G^c$ (stesso $V$, archi complementari) e quindi di $f(G,k)$ richiede tempo polinomiale (nel testo: lineare rispetto alla lunghezza dell’istanza).

4. **Conclusione.**  
   Poiché $(IS)$ è NP-completo (dal paragrafo precedente) e $(IS \le_p CL)$ tramite $f$, e inoltre $(CL \in NP)$, allora $(CL)$ è **NP-completo**.


---

## Teorema (enunciato)

**Problema DOMINATING SET (DS)** è **NP-completo**.

### Formalizzazione del problema (tripla $\langle I,S,\pi \rangle$)

#### Insieme delle istanze

$$
I_{DS} = \{\langle G=(V,E),k\rangle : G \text{ grafo non orientato},\ k \in \mathbb{N}^+ \}.
$$

(Input: un grafo e una soglia $k$.)

#### Insieme delle soluzioni possibili (certificati)

$$
S_{DS}(G,k) = \{ D \subseteq V \}.
$$

(Candidato: un sottoinsieme di vertici.)

#### Predicato di accettazione

$$
\pi_{DS}(G,k,S_{DS}) \equiv \exists D \subseteq V : |D| \le k \ \land \ \forall u \in V \setminus D \ \exists v \in D : (u,v) \in E.
$$

(Validità: ogni vertice non scelto è adiacente a qualche vertice scelto.)

---

### Appartenenza a NP

Un certificato $D$ si verifica in tempo polinomiale controllando $|D| \le k$ e, per ogni $u \in V \setminus D$, l’esistenza di un vicino in $D$.  
Quindi $(DS \in NP)$.

---

## Idea della dimostrazione

Si dimostra la NP-completezza riducendo **VERTEX COVER (VC)** a **DOMINATING SET (DS)**.

Data un’istanza $\langle G=(V,E),k \rangle$ di $(VC)$, si costruisce un grafo $H$ aggiungendo un nodo per ogni arco di $G$ e collegandolo ai suoi estremi. L’idea è che:

- un vertex cover di $G$ domina tutti i nuovi nodi (che rappresentano archi);
- viceversa, un dominating set di $H$ può essere trasformato in uno che usa solo vertici “originali”, i quali allora formano un vertex cover di $G$.

La soglia resta $k$.

---

## Dimostrazione

### Riduzione $f : VC \le_p DS$

Sia $\langle G=(V,E),k \rangle$ un’istanza di **VERTEX COVER**.  
Senza perdita di generalità, assumiamo che $G$ non abbia nodi isolati (gli isolati non influiscono sull’esistenza di un vertex cover).

Costruiamo il grafo $H=(W,F)$ come segue.

#### Vertici

$$
W = V \cup X, \quad \text{dove } X = \{ x_e : e \in E \}.
$$

Cioè, per ogni arco $e$ di $G$ aggiungiamo un nuovo vertice $x_e$.

#### Archi

$$
F = E \cup \{ (u,x_e),(v,x_e) : e=(u,v) \in E \}.
$$

Ogni nuovo vertice $x_e$ è adiacente esattamente ai due estremi dell’arco $e$.

#### Soglia

$$
k' = k.
$$

La costruzione è chiaramente polinomiale.

---

### Correttezza della riduzione

#### $(\Rightarrow)$

Se $G$ ha un vertex cover $V' \subseteq V$ con $|V'| \le k$, allora $H$ ha un dominating set di cardinalità $\le k$.

Poniamo $D = V'$. Mostriamo che $D$ domina $H$.

- Se $u \in V \setminus D$, poiché $G$ non ha nodi isolati, esiste un arco $(u,v) \in E$. Essendo $V'$ un vertex cover, $v \in V' = D$, quindi $u$ è dominato.
- Se $x_e \in X$ con $e=(u,v)$, allora almeno uno tra $u$ o $v$ appartiene a $V'$; dunque $x_e$ è adiacente a un nodo in $D$.

Quindi $D$ è un dominating set di $H$ e $|D| \le k$.

---

#### $(\Leftarrow)$

Se $H$ ha un dominating set $D$ con $|D| \le k$, allora $G$ ha un vertex cover di cardinalità $\le k$.

Osserviamo che, se $D$ contiene un nodo $x_e \in X$ (con $e=(u,v)$), allora possiamo sostituirlo con $u$ oppure con $v$:

$$
D' = (D \setminus \{x_e\}) \cup \{u\}
$$

Il nuovo insieme domina ancora $H$ e non aumenta la cardinalità.  
Iterando, otteniamo senza perdita di generalità un dominating set $D \subseteq V$.

Mostriamo ora che $D$ è un vertex cover di $G$.  
Sia $e=(u,v) \in E$. Il nodo $x_e$ deve essere dominato da $D$; ma $x_e$ è adiacente solo a $u$ e $v$.  
Dunque $u \in D$ oppure $v \in D$. Questo vale per ogni arco $e$, quindi $D$ copre tutti gli archi di $G$.

---

## Conclusione

Abbiamo costruito una riduzione polinomiale $VC \le_p DS$ e visto che $(DS \in NP)$.  
Poiché $(VC)$ è NP-completo, segue che **DOMINATING SET è NP-completo**.


---

# 3-COLORABILITÀ
## Teorema (enunciato)

**Teorema.** Il problema **3-COLORABILITÀ** è **polinomialmente riducibile** a **3-SAT**, cioè

$$
3\text{-COLOR} \le_p 3SAT.
$$

In particolare, esiste una funzione calcolabile in tempo polinomiale che associa a ogni grafo $G$ una formula booleana $f_G$ in 3-CNF tale che:

$$
G \text{ è 3-colorabile } \Longleftrightarrow f_G \in 3SAT.
$$

---

## Formalizzazione del problema 3-COLORABILITÀ (tripla $\langle I,S,\pi\rangle$)

### Insieme delle istanze

$$
I_{3COL} = \{\, G = (V,E) \mid G \text{ grafo non orientato} \,\}.
$$

(Input: un grafo.)

### Insieme delle soluzioni possibili (certificati)

$$
S_{3COL}(G) = \{\, c : V \to \{1,2,3\} \,\}.
$$

(Una colorazione che assegna a ogni vertice uno dei tre colori.)

### Predicato di accettazione

$$
\pi_{3COL}(G, S_{3COL}) \equiv \exists c : V \to \{1,2,3\}\ \text{tale che}\ \forall (u,v) \in E,\ c(u) \neq c(v).
$$

(Validità: vertici adiacenti ricevono colori diversi.)

Interpretazione: l’istanza specifica **il grafo**, la soluzione candidata è **una colorazione**, e il predicato verifica che la colorazione sia **propria** usando al più tre colori.