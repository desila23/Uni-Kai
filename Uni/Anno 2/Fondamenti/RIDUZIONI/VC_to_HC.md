## Teorema (enunciato)

Nel testo, la riduzione usata è:

$$
\textbf{VERTEX COVER} \le_p \textbf{CICLO HAMILTONIANO (HC)},
$$

cioè si associa in tempo polinomiale a ogni istanza $\langle G,k\rangle$ di **VC** un grafo $G'$ tale che

$$
\langle G,k\rangle \in VC \Longleftrightarrow G' \in HC,
$$

e questo serve a provare che **HC è NP-completo**.

> Nota: nella pagina indicata non compare “$(HC \le VC)$” ma “$(VC \le HC)$”. Io qui sto riportando **solo** l’enunciato/formalizzazione presenti lì.

---

## Formalizzazione (tripla) di **CICLO HAMILTONIANO (HC)**

Il problema **HC** (“esiste un ciclo che visita tutti i vertici esattamente una volta?”) è formalizzato come tripla $\langle I,S,\pi\rangle$ così:

### Insieme delle istanze

$$
I_{HC} = \{\langle G = (V,E) \rangle :\ G \text{ è un grafo non orientato}\}.
$$

(Input: un grafo.)

### Insieme delle soluzioni possibili (certificati)

$$
S_{HC}(G) = \{\psi : V \to \{1,\dots,|V|\}\},
$$

cioè l’insieme degli **ordinamenti** dei nodi di $V$.

### Predicato

Posto $n = |V|$,

$$
\pi_{HC}(G,S_{HC}(G)) \equiv \exists \psi \in S_{HC}(G):\
\Big(\forall\, 1 \le i < n\, [ (\psi^{-1}(i), \psi^{-1}(i+1)) \in E ]\Big) \land (\psi^{-1}(n), \psi^{-1}(1)) \in E.
$$

Interpretazione: l’ordinamento $\psi$ descrive un ciclo che collega consecutivi e chiude sull’inizio, quindi è un **ciclo hamiltoniano**.

(Osservazione standard: il certificato è la sequenza $\langle v_1,\dots,v_n\rangle$ e la verifica è polinomiale, quindi $HC \in NP$.)

---

## Idea della dimostrazione (solo idea, senza dimostrazione)

Per provare la NP-completezza di **HC**, il testo costruisce una riduzione **da VC a HC**, cioè trasforma $\langle G,k\rangle$ in un grafo $G'$ tale che $G$ ha un vertex cover di taglia $k$ **se e solo se** $G'$ contiene un ciclo hamiltoniano.

*(Dimostrazione: omessa come richiesto.)*
