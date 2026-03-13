---
aliases:
  - "OPZIONALE: topolino PARZIALMENTE"
---
## 1. PEAS
**P – Performance**
- Obiettivo dell'agente + minimizzazione del costo totale

**E – Environment**
- SCRIVI L'AMBIENTE COME LO LEGGI NEL TESTO (se è una griglia lasciala griglia)
- AGENTE E OBIETTIVO OCCUPERANNO UNA POSIZIONE

**A – Attuatori**
- Descrivi gli attuatori + a cosa servono

**S – Sensori**
- Descrivi i sensori + a cosa servono

---

## 2. Tipo di ambiente e agente
**Ambiente**
- parzialmente osservabile  
- deterministico  
- statico  
- discreto  
- sequenziale  
- singolo agente

**Agente**
- basato su obiettivo  
- pianificazione online (aggiorna la mappa mentre si muove)
- DATO CHE ambiente = {compl. oss, statico, deterministico} ALLORA DUE FASI 
	- PIANIFICAZIONE
	- ESECUZIONE

---

## 3. Stato e spazio degli stati
**STATO DEL MONDO**: descrizione completa ambiente in un dato momento. N-UPLA `<ELEMENTI>`
- le varie posizioni scrivile $P = (x,y)$ con $x, y \in [1, ..., n]$ tranne per ostacoli
- le liste invece $Lista = \{(x_{1}, y_{1}), (x_{2}, y_{2}),  ..., (x_{k}, y_{k})\}$

**STATO SPAZIO RICERCA**: descrizione delle caratteristiche utili per la ricerca, ASTRAZIONE utilizzata dall'alg.

GENERALMENTE NON LI DIFFERENZIO.

**STATO INIZIALE**: prendi la tupla di "stato spazio ricerca" e metti le informazioni necessarie

**STATI FINALE**: prendi la tupla di "stato spazio ricerca" e metti le informazioni necessarie

---

## 4. Modello di transizione e costo
Di solito distinguiamo in due azioni
1) AZIONI DI MOVIMENTO
	- $a = move((x,y), (x^{'}, y^{'}) \ | \ \{(x^{'}, y^{'}) \in conf((x,y))\})$
		dove `conf(x,y)` sono tutti i nodi collegati a `(x,y)`
	con possibili movimenti $\{sx, dx, su, giù \}$ 
	Il risultato di tale azione sarà $$Result(s,a) = s^{'} = <(x^{'}_{g}, y^{'}_{g}), \ (x_{t}, y_{t}), \ \text{Lista-Ostacoli}>$$
	Questa funzione di transizione genera, partendo da uno stato `s` e applicando un'azione `a`, un nuovo stato `s'` se e solo se quello stato è raggiungibile (ossia se non è un ostacolo).

2) AZIONI DELL'AGENTE
	- $a = azione()$
	- $Result(s,a) = s^{'} = < (x_{g}, y_{g}), NULL, \ \text{Lista-Ostacoli}>$

**FUNZIONE DI COSTO** $$c(s, a, s^{'})$$Specifica il costo di ogni azione E SPECIFICA IL COSTO TOTALE (somma dei costi delle transizioni).



---

## 5. Algoritmo di ricerca
GENERALMENTE uso `A*`, in quanto troverà il cammino di costo minimo in maniera efficiente.
>[!tip] SE NEL PEAS HAI UNA GRIGLIA
>Ai fini della pianificazione, l’ambiente descritto come griglia viene astratto in un grafo di ricerca.
Ogni nodo del grafo rappresenta una cella della griglia e gli archi rappresentano le possibili transizioni tra celle adiacenti.

Tale algoritmo è
- COMPLETO -> sempre soluzione se esiste e se vale che $g(n) \ge d(n) \cdot \epsilon$
- OTTIMALE -> espande prima i nodi con `f(n)` minore

Funzione di valutazione $f(n) = g(n) + h(n)$
- `g(n)` -> COSTO DEL CAMMINO CALCOLATO FINORA
- `h(n)` -> EURISTICA (stima)
	- AMMISSIBILE -> non sovrastima
	- MONOTONA -> non decresce mai $h(n) \le c(n, n^{'}) + h(n^{'})$

EURISTICA = MANHATTAN DISTANCE $$h_{man} = |nodo.x - goal.x| + |nodo.y - goal.y|$$



