## Teorema (riduzione polinomiale $HC \le_p TSP$)

## Formalizzazione dei problemi

### Problema $HC$ (CICLO HAMILTONIANO)

Il problema è formalizzato dalla tripla

$$
HC = (I_{HC}, S_{HC}, \pi_{HC}).
$$

(La formalizzazione è già stata data in precedenza; qui $HC$ è usato come sorgente della riduzione.)

---

### Problema $TSP$ (COMMESSO VIAGGIATORE, versione decisionale)

Il problema è formalizzato dalla tripla

$$
TSP = (I_{TSP}, S_{TSP}, \pi_{TSP}).
$$

#### Istanze

$$
I_{TSP} =
\{ \langle G=(V,E), w, k \rangle :
G \text{ grafo completo non orientato} \land
w : E \to \mathbb{R}^+ \land
k \in \mathbb{R}^+
\}.
$$

(Qui $w$ assegna un peso a ogni arco e $k$ è la soglia di costo.)

---

#### Certificati

$$
S_{TSP}(G,w,k) = \{ E_0 \subseteq E \}.
$$

(Il certificato è un sottoinsieme di archi.)

---

#### Predicato

$$
\pi_{TSP}(G,w,k,S_{TSP}) =
\exists E_0 \in S_{TSP}(G,w,k):
\begin{cases}
|E_0| = |V|, \\
\forall v \in V\ \exists u,z \in V :
(u,v) \in E_0 \land (v,z) \in E_0, \\
\sum_{e \in E_0} w(e) \le k.
\end{cases}
$$

(Cioè $E_0$ seleziona un ciclo hamiltoniano e il suo peso totale è $\le k$.)

---

## Enunciato

Esiste una trasformazione polinomiale $f$ tale che, per ogni istanza $\langle G \rangle$ di $HC$,

$$
\langle G \rangle \in HC
\iff
f(\langle G \rangle) \in TSP.
$$

Quindi

$$
HC \le_p TSP.
$$

---

## Idea della dimostrazione

Dato $G=(V,E)$, costruiamo un grafo completo

$$
\hat{G} = (V, \hat{E})
$$

sugli stessi nodi e definiamo i pesi come segue:

- peso $1$ sugli archi che esistono già in $G$;
- peso $2n$ sugli archi aggiunti (non presenti in $G$), dove $n=|V|$.

Poniamo $k=n$. Allora:

- se $G$ ha un ciclo hamiltoniano, in $\hat{G}$ esiste un ciclo di costo esattamente $n$ usando solo archi “buoni”;
- se $G$ non ha un ciclo hamiltoniano, ogni ciclo hamiltoniano in $\hat{G}$ deve usare almeno un arco “cattivo”, e quindi il costo totale supera $n$.

---

## Dimostrazione

Sia $\langle G=(V,E) \rangle$ un’istanza di $HC$ e sia $n=|V|$.
Definiamo:

$$
f(\langle G \rangle) = \langle \hat{G}=(V,\hat{E}), w, n \rangle,
$$

dove

$$
\hat{E} = \{(u,v) : u,v \in V,\ u \neq v\}
$$

(grafo completo) e, per ogni $(u,v) \in \hat{E}$,

$$
w(u,v) =
\begin{cases}
1 & \text{se } (u,v) \in E, \\
2n & \text{se } (u,v) \in \hat{E} \setminus E.
\end{cases}
$$

La costruzione è polinomiale in $|G|$.

---

### $(\Rightarrow)$

Se $G$ contiene un ciclo hamiltoniano, lo stesso insieme di archi $E_0$ è un certificato valido anche in $\hat{G}$.
Tutti gli archi di $E_0$ appartengono a $E$, quindi hanno peso $1$.
Poiché $|E_0|=n$, si ha

$$
\sum_{e \in E_0} w(e) = n \le n,
$$

e dunque

$$
\langle \hat{G}, w, n \rangle \in TSP.
$$

---

### $(\Leftarrow)$

Se $G$ non contiene cicli hamiltoniani, allora qualunque sottoinsieme
$E_0 \subseteq \hat{E}$ che soddisfa i vincoli strutturali di $\pi_{TSP}$
deve contenere almeno un arco in $\hat{E} \setminus E$, che ha peso $2n$.
Gli altri $n-1$ archi hanno peso almeno $1$, quindi

$$
\sum_{e \in E_0} w(e) \ge 2n + (n-1) > n.
$$

Ne segue che

$$
\langle \hat{G}, w, n \rangle \notin TSP.
$$

---

## Conclusione

Abbiamo mostrato che

$$
\langle G \rangle \in HC
\iff
f(\langle G \rangle) \in TSP,
$$

e quindi

$$
HC \le_p TSP.
$$
