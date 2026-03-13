## Teorema (riduzione polinomiale $HP \le_p LP$)

## Formalizzazione dei problemi

### Problema $HP$ (PERCORSO HAMILTONIANO)

Il problema è formalizzato dalla tripla

$$
HP = (I_{HP}, S_{HP}, \pi_{HP})
$$

#### Istanze

$$
I_{HP} =
\{ \langle G=(V,E), a, b \rangle :
G \text{ grafo non orientato},\ a,b \in V \}.
$$

#### Soluzioni

$$
S_{HP}(G,a,b) =
\{ p = \langle v_0,\dots,v_{|V|-1} \rangle :
\{v_0,\dots,v_{|V|-1}\} = V \}.
$$

#### Predicato

$$
\pi_{HP}(G,a,b,p) =
\begin{cases}
v_0 = a, \\
v_{|V|-1} = b, \\
\forall i\ (v_i, v_{i+1}) \in E, \\
\forall i \neq j\ v_i \neq v_j.
\end{cases}
$$

---

### Problema $LP$ (LONG PATH)

Il problema è formalizzato dalla tripla

$$
LP = (I_{LP}, S_{LP}, \pi_{LP})
$$

#### Istanze

$$
I_{LP} =
\{ \langle G=(V,E), a, b, k \rangle :
G \text{ grafo non orientato},\ a,b \in V,\ k \in \mathbb{N} \}.
$$

#### Soluzioni

$$
S_{LP}(G,a,b,k) =
\{ p = \langle v_0,\dots,v_h \rangle :
\{v_0,\dots,v_h\} \subseteq V \}.
$$

#### Predicato

$$
\pi_{LP}(G,a,b,k,p) =
\begin{cases}
v_0 = a, \\
v_h = b, \\
h \ge k, \\
\forall i\ (v_i, v_{i+1}) \in E, \\
\end{cases}
$$

---

## Enunciato

Esiste una funzione $f \in FP$ tale che, per ogni istanza

$$
\langle G,a,b \rangle \in I_{HP},
$$

valga

$$
\langle G,a,b \rangle \in HP
\iff
f(\langle G,a,b \rangle) = \langle G,a,b,|V|-1 \rangle \in LP.
$$

Quindi

$$
HP \le_p LP.
$$

---

## Idea della dimostrazione

Un percorso hamiltoniano da $a$ a $b$ è un percorso semplice che visita tutti i nodi del grafo,
quindi ha lunghezza almeno $|V|-1$.
L’idea è riutilizzare lo stesso grafo, fissare gli stessi estremi $a,b$
e porre

$$
k = |V|-1.
$$

In questo modo chiedere l’esistenza di un long path equivale a chiedere
l’esistenza di un percorso hamiltoniano.

---

## Dimostrazione

Sia

$$
\langle G=(V,E), a, b \rangle
$$

un’istanza di $HP$, con $|V| = n$.
Definiamo la funzione di riduzione

$$
f(\langle G,a,b \rangle) = \langle G,a,b,k \rangle
$$

con

$$
k = n-1.
$$

La funzione $f$ è chiaramente calcolabile in tempo polinomiale (costante).

---

### $(\Rightarrow)$

Se $\langle G,a,b \rangle \in HP$, allora esiste un percorso hamiltoniano

$$
p = \langle v_0,\dots,v_{n-1} \rangle
$$

con $v_0 = a$, $v_{n-1} = b$.
Tale percorso attraversa tutti i nodi senza ripetizioni e ha lunghezza $n-1$,
quindi soddisfa il predicato

$$
\pi_{LP}(G,a,b,n-1,p).
$$

Ne segue che

$$
\langle G,a,b,n-1 \rangle \in LP.
$$

---

### $(\Leftarrow)$

Se $\langle G,a,b,n-1 \rangle \in LP$, allora esiste un percorso semplice

$$
p = \langle v_0,\dots,v_h \rangle
$$

da $a$ a $b$ con $h \ge n-1$.
Poiché il grafo ha solo $n$ nodi e il percorso è semplice, deve valere $h=n-1$,
e quindi il percorso visita tutti i nodi esattamente una volta.

Dunque $p$ è un percorso hamiltoniano da $a$ a $b$ e

$$
\langle G,a,b \rangle \in HP.
$$

---

## Conclusione

Abbiamo mostrato una riduzione polinomiale

$$
HP \le_p LP.
$$

Poiché $HP$ è NP-completo e $LP \in NP$, segue che **LONG PATH è NP-completo**.
