
## 1. Problemi decisionali e linguaggi

Un **problema decisionale** è un problema con risposta *sì/no*.
Formalmente, un problema decisionale è rappresentabile come un linguaggio:

$$
L \subseteq \Sigma^*
$$

dove:
- $\Sigma$ è un alfabeto finito
- $x \in L$ significa che l’istanza $x$ è accettata (risposta *sì*)
- $x \notin L$ significa risposta *no*

---

## 2. La classe P

### Definizione formale

La **classe P** è l’insieme dei linguaggi decidibili da una **macchina di Turing deterministica**
in **tempo polinomiale** rispetto alla lunghezza dell’input.

$$
P = \{ L \mid \exists k \in \mathbb{N},\ \exists T \text{ MT det.} :
\forall x,\ dtime(T,x) \le |x|^k \}
$$

Equivalentemente: un problema è in P se esiste un **algoritmo deterministico**
che lo risolve in tempo $O(n^k)$ per qualche $k$.

---

### Trattabilità computazionale

La classe P è considerata la classe dei problemi **trattabili**.

Motivazione:
- il tempo polinomiale cresce lentamente
- il tempo esponenziale cresce troppo velocemente

Per ogni $k \in \mathbb{N}$ vale:

$$
n^k \ll 2^n \quad (n \to \infty)
$$

Quindi:
> un algoritmo esponenziale diventa inutilizzabile molto prima
> di uno polinomiale, anche con computer velocissimi.

---

### Chiusura per complemento

La classe P è chiusa per complemento:

$$
P = \text{co-}P
$$

Se un problema è in P, anche il suo complemento lo è.

---

## 3. Riducibilità polinomiale

### Definizione

Una **riduzione polinomiale** da $L_1$ a $L_2$ è una funzione:

$$
f : \Sigma_1^* \to \Sigma_2^*
$$

tale che:
1. $f$ è calcolabile in tempo polinomiale
2.
$$
x \in L_1 \iff f(x) \in L_2
$$

Intuizione:
- se $L_2$ è facile, allora anche $L_1$ è facile
- $L_1$ non è più difficile di $L_2$

---

## 4. Teorema 8.1 – Completezza di P (rispetto a $\le_p$)

### Enunciato

Sia $L \subseteq \Sigma^*$ tale che:
- $L \neq \varnothing$
- $L \neq \Sigma^*$
- $L \in P$

Allora **ogni linguaggio in P si riduce polinomialmente a $L$**.

Quindi:
$$
L \text{ è P-completo rispetto alle riduzioni polinomiali}
$$

---

### Dimostrazione (idea completa, come in dispensa)

Poiché $L$ è **non banale**, esistono:
$$
y \in L \qquad z \notin L
$$

Poiché $L \in P$, esiste una MT deterministica $T$ che decide $L$.
Essendo $L$ decidibile, $y$ e $z$ sono **effettivamente calcolabili**:
si enumerano le stringhe e si simula $T$ finché non si trova
una stringa accettata e una rifiutata.

Ora sia $L_1 \in P$ un qualunque linguaggio.
Definiamo la funzione:

$$
f(x)=
\begin{cases}
y & \text{se } x \in L_1 \\
z & \text{se } x \notin L_1
\end{cases}
$$

Allora:
$$
x \in L_1 \iff f(x) \in L
$$

La funzione $f$ è polinomiale perché:
- decidere $x \in L_1$ è polinomiale
- $y$ e $z$ sono costanti

Conclusione:
> tutti i problemi in P sono equivalenti rispetto alla riduzione polinomiale.

---

### Osservazione importante

La riduzione polinomiale è **troppo forte** per distinguere difficoltà interne a P.
Per questo si introduce la **LOGSPACE-riducibilità** (più restrittiva).

---

## 5. Il problema 2-SODDISFACIBILITÀ (2-SAT)

### Definizione

Una formula booleana è in **2-CNF** se:
- è una congiunzione di clausole
- ogni clausola contiene **esattamente due letterali**

Il problema **2-SAT** chiede se la formula è soddisfacibile.

---

### Definizione come tripla

$$
\langle I_{2SAT}, S_{2SAT}, \pi_{2SAT} \rangle
$$

- Istanze:
$$
I_{2SAT} = \{\langle f,X\rangle : f \text{ è 2-CNF su } X\}
$$

- Soluzioni candidate:
$$
S_{2SAT}(f,X) = \{a : X \to \{vero,falso\}\}
$$

- Predicato:
$$
\pi_{2SAT}(f,X,S) = \exists a \in S : f(a(X)) = vero
$$

---

### Clausole come vincoli

Ogni clausola:

$$
(l_1 \vee l_2)
$$

è equivalente a:

$$
(\neg l_1 \Rightarrow l_2) \wedge (\neg l_2 \Rightarrow l_1)
$$

Assegnare un valore a un letterale può **forzare** altri letterali.

---

## 6. Algoritmo A:2SAT (Tabella 8.1)

### Strutture dati

- **XA**: variabili assegnate definitivamente
- **LA**: letterali assunti veri nel tentativo corrente
- **LV**: letterali che propagano vincoli
- **contradd**: flag di contraddizione
- **g**: formula residua

---

### Pseudocodice A:2SAT (PascalMinimo)

```
XA ← ∅
contradd ← falso
i ← 1

while (i ≤ n AND contradd = falso) do
  if (xi ∉ XA) then
     LA ← {xi}
     LV ← {xi}
     g ← f \ clausole soddisfatte da xi

     while (LV ≠ ∅ AND contradd = falso) do
        estrai lh da LV
        for ogni clausola c in g do
           if (c = (¬lh ∨ ls)) then
              if (¬ls ∉ LA) then
                 LA ← LA ∪ {ls}
                 LV ← LV ∪ {ls}
                 g ← g \ clausole soddisfatte da ls
              else
                 contradd ← vero
              end if
           end if
        end for
     end while

     if (contradd = vero) then
        contradd ← falso
        LA ← {¬xi}
        LV ← {¬xi}
        g ← f \ clausole soddisfatte da ¬xi
        ... stessa propagazione ...
     end if

     if (contradd = falso) then
        XA ← XA ∪ variabili comparse in LA
        f ← g
     end if
  end if
  i ← i + 1
end while

if (contradd = vero) then rigetta else accetta
```

---

### Complessità di A:2SAT

- ciclo esterno: al più $n$ iterazioni
- propagazione: al più $2n$ passi
- scansione delle clausole: al più $m$

Conclusione:
$$
\text{A:2SAT è polinomiale} \Rightarrow 2\text{-SAT} \in P
$$

---

## 7. Il problema 2-COLORABILITÀ

### Definizione

Dato un grafo non orientato $G=(V,E)$, è **2-colorabile** se esiste:

$$
c : V \to \{1,2\}
$$

tale che:

$$
(u,v) \in E \Rightarrow c(u) \neq c(v)
$$

---

## 8. Riduzione 2-COLORABILITÀ → 2-SAT

### Codifica

Per ogni vertice $u$ introduciamo:
$$
x_u \equiv (c(u)=1)
$$

Per ogni arco $(u,v)$ imponiamo:
$$
x_u \neq x_v
$$

---

### Traduzione in 2-CNF

$$
x_u \neq x_v \iff (x_u \vee x_v) \wedge (\neg x_u \vee \neg x_v)
$$

---

### Formula finale

$$
f(G) = \bigwedge_{(u,v) \in E}
\Big[(x_u \vee x_v) \wedge (\neg x_u \vee \neg x_v)\Big]
$$

Conclusione:
$$
2\text{-COLORABILITÀ} \in P
$$

---

## 9. Trasformazione in CNF

### Teorema 8.2

Data una formula booleana $f$ con soli operatori $\wedge,\vee,\neg$,
esiste un algoritmo polinomiale che produce una formula $f'$ in CNF tale che:

$$
f' \text{ è soddisfacibile} \iff f \text{ è soddisfacibile}
$$

La trasformazione è **equisoddisfacibile**, non equivalente.

---

## 10. Algoritmi A:toCNF e CNF-RIC

### A:toCNF

```
C ← ∅
Z ← ∅
CNF-RIC(f, C, Z)
Output: C
```

---

### CNF-RIC

```
if g è disgiunzione di letterali:
    D ← D ∪ {g}

else if g = ¬g1:
    g2 ← DeMorgan(g1)
    CNF-RIC(g2, D, Z)

else if g = g1 ∧ g2:
    CNF-RIC(g1, D, Z)
    CNF-RIC(g2, D, Z)

else if g = g1 ∨ g2:
    crea nuova variabile y_p
    CNF-RIC(g1, D1, Z)
    aggiungi y_p a ogni clausola di D1
    CNF-RIC(g2, D2, Z)
    aggiungi ¬y_p a ogni clausola di D2
```

---

## 11. Complessità di CNF-RIC

Definendo $TRIC(f)$ come il numero di passi dell’algoritmo,
si dimostra per induzione che:

$$
TRIC(f) \le 5|f|^2
$$

Conclusione:
> la trasformazione in CNF è polinomiale.

---

## Conclusione generale

- **P** = classe dei problemi trattabili
- **2-SAT ∈ P**
- **2-COLORABILITÀ ∈ P**
- ogni formula booleana può essere trasformata in CNF in tempo polinomiale
