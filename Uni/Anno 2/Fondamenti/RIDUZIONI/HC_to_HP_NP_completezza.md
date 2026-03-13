## Teorema (riduzione polinomiale $HC \le_p HP$ e NP-completezza di $HP$)

### Problema $HC$ (CICLO HAMILTONIANO)

#### Istanze

$$
I_{HC} = \{ \langle G=(V,E) \rangle : G \text{ grafo non orientato} \}.
$$

#### Soluzioni

$$
S_{HC}(G) = \{ \psi : V \to \{1,\dots,|V|\} \}.
$$

(Ordinamenti dei nodi.)

#### Predicato

$$
\pi_{HC}(G,S_{HC}(G)) =
\exists \psi \in S_{HC}(G)
$$

tale che $\psi$ induce un ciclo che visita ogni nodo una sola volta  
(adiacenze consecutive + chiusura).

---

### Problema $HP$ (PERCORSO HAMILTONIANO)

#### Istanze

$$
I_{HP} =
\{ \langle G=(V,E),u,v \rangle :
G \text{ grafo non orientato } \land u,v \in V \}.
$$

#### Soluzioni

$$
S_{HP}(G,u,v) =
\{ \psi : V \to \{1,\dots,|V|\} :
\psi(1)=u \land \psi(n)=v \}.
$$

(Ordinamenti con estremi fissati.)

#### Predicato

$$
\pi_{HP}(G,u,v,S_{HP}(G,u,v)) =
\exists \psi \in S_{HP}(G,u,v) :
\forall 1 \le i < n,
(\psi^{-1}(i),\psi^{-1}(i+1)) \in E.
$$

---

### Enunciato

Esiste una funzione $f \in FP$ tale che, per ogni
$\langle G \rangle \in I_{HC}$,

$$
\langle G \rangle \in HC
\iff
f(\langle G \rangle)=\langle G',x,y \rangle \in HP.
$$

Quindi

$$
HC \le_p HP
$$

e, poiché $HP \in NP$, segue che $HP$ è **NP-completo**.

---

## Idea della dimostrazione

Dato un grafo $G$ (istanza di $HC$), “rompiamo” un possibile ciclo hamiltoniano
trasformandolo in un percorso hamiltoniano in un grafo $G'$ ottenuto aggiungendo
due nuovi nodi $x$ e $y$.

- Il nodo $x$ è collegato a un solo nodo $u \in V$, costringendo $u$ a essere
  l’inizio del percorso;
- il nodo $y$ è collegato esattamente ai vicini di $u$, così l’ultimo nodo del
  percorso deve essere un vicino di $u$, permettendo di richiudere il percorso
  in un ciclo in $G$.

---

## Dimostrazione

Sia $\langle G=(V,E) \rangle$ un’istanza di $HC$.
Senza perdita di generalità, assumiamo $G$ connesso.

### Costruzione della riduzione $f$

Fissiamo un nodo $u \in V$ e introduciamo due nuovi nodi $x,y \notin V$.
Definiamo l’istanza di $HP$ come

$$
\langle G'=(V',E'),x,y \rangle,
$$

dove

$$
V' = V \cup \{x,y\}, \qquad
E' = E \cup E_x \cup E_y,
$$

con

$$
E_x = \{(x,u)\}, \qquad
E_y = \{(y,v) : v \in V \land (u,v) \in E\}.
$$

In altre parole, $x$ è adiacente solo a $u$ e $y$ è adiacente a tutti e soli i
vicini di $u$ in $G$.
La costruzione è chiaramente polinomiale.

---

### $(\Rightarrow)$

Supponiamo che $G$ contenga un ciclo hamiltoniano
$\psi=(v_1,\dots,v_n)$ con $n=|V|$.
Possiamo assumere $u=v_1$ riordinando ciclicamente $\psi$.

Nel ciclo, $v_n$ è adiacente a $u$, quindi $(u,v_n) \in E$ e per definizione
$(y,v_n) \in E_y \subseteq E'$.
Inoltre $(x,u) \in E'$.

Allora la sequenza

$$
(x, v_1=u, v_2, \dots, v_n, y)
$$

è un percorso hamiltoniano in $G'$ da $x$ a $y$.

---

### $(\Leftarrow)$

Supponiamo che $G'$ contenga un percorso hamiltoniano

$$
\psi=(x,v_1,\dots,v_n,y)
$$

con $n=|V|$.
Poiché $u$ è l’unico vicino di $x$ in $G'$, deve essere $v_1=u$.
Inoltre $(v_n,y) \in E'$ implica $(u,v_n) \in E$.

Quindi

$$
(u=v_1, v_2, \dots, v_n)
$$

è un ciclo hamiltoniano in $G$.

---

## Conclusione

Abbiamo mostrato

$$
\langle G \rangle \in HC
\iff
\langle G',x,y \rangle \in HP,
$$

con $f$ calcolabile in tempo polinomiale.
Dunque

$$
HC \le_p HP
$$

e **$HP$ è NP-completo**.
