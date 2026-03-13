## 📘 Linguaggi decidibili e calcolabilità
- [x] Teorema 3.1 – Linguaggi decidibili ⇔ linguaggio e complemento accettabili
- [x] Definizione 3.5 – Funzione (parziale) calcolabile tramite MT trasduttore
- [x] Teorema 3.2 – Linguaggio decidibile ⇔ funzione caratteristica calcolabile
- [x] Teorema 3.3 – Funzione totale calcolabile ⇒ linguaggio L_f decidibile
- [x] Teorema 3.4 – Linguaggio L_f decidibile ⇒ funzione calcolabile (parziale)
- [ ] Teorema 3.5 – Programmi PASCALMINIMO simulabili da MT trasduttore
- [ ] Teorema 3.6 – MT riconoscitore simulabile in PASCALMINIMO

## ⛔ Halting Problem e numerabilità
- [x] Teorema 5.1 – Σ* è numerabile
- [x] Teorema 5.2 – Insieme delle MT su {0,1} è numerabile
- [x] Teorema 5.3 – Insieme dei linguaggi su Σ non numerabile
- [x] Corollario 5.1 – Esiste un linguaggio non accettabile
- [x] Definizione – Linguaggio di Halting $L_H$
- [x] Teorema 5.4 – Halting Problem accettabile
- [x] Teorema 5.5 – Halting Problem non decidibile
- [x] Teorema 5.6 – Decidibilità ⇔ accettabilità di L e del complemento
- [ ] Corollario 5.2 – Linguaggio decidibile ⇔ complemento decidibile
- [x] Definizione 5.3 – Riducibilità many-one

## 📚 Grammatiche
- [x] Teorema G1 – Introduzione controllata della produzione ε
- [x] Teorema G2 – ε-produzioni aggiungono solo la parola vuota
- [x] Teorema G3 – Grammatiche tipo 1 possono simulare tipo 0
- [x] Teorema G4 – Linguaggi accettabili ⇔ grammatiche tipo 0
- [x] Teorema G5 – Da grammatica a macchina di Turing accettante
- [x] Teorema G6 – Grammatiche tipo 1 ⇒ linguaggi decidibili
	- [x] MACCHINA DI TURING NTG1
- [x] Pumping Lemma – Linguaggi context-free
- [x] Teorema G7 – CFL chiusi rispetto all’unione
- [x] Teorema G8 – CFL non chiusi rispetto all’intersezione
- [x] Teorema G9 – CFL non chiusi rispetto al complemento
- [x] Teorema G10 – PDA: pila vuota ⇔ stato finale
- [x] Teorema G11 – Linguaggio context-free ⇔ esiste un PDA
- [x] Teorema G12 – DPDA ⊂ CFL
- [x] Teorema G13 – Ambiguità delle grammatiche CFL non decidibile
- [x] Pumping Lemma – Linguaggi regolari
- [x] Teorema G14 – ASFD ⇔ grammatica regolare

## ⏱️ Complessità
- [x] Assiomi di Blum -- `c` definita e `c` calcolabile 
- [x] Definizione – dtime, dspace, ntime, nspace
- [x] Teorema 6.1 – Relazione tempo/spazio (deterministico e non)
	DIMOSTRAZIONE un po' a parole
- [x] Teorema 6.2 – Tempo/spazio non deterministico ⇒ decidibilità
	DIMOSTRAZIONE un po' a parole (sullo spazio è analoga)
- [x] Definizione insiemi – DTIME, DSPACE, NTIME, NSPACE, e i complementi
- [x] Teorema 6.8 – DTIME ⊆ NTIME e DSPACE ⊆ NSPACE
	DIMOSTRAZIONE DI UNA FRASE
- [x] Teorema 6.9 – DTIME ⊆ DSPACE e NTIME ⊆ NSPACE
	DIMOSTRAZIONE DI UNA FRASE
- [x] Teorema 6.10 – Limiti esponenziali tempo/spazio
- [x] Teorema 6.11 – Chiusura rispetto al complemento (tempo/spazio)
	DIMOSTRAZIONE DI UNA FRASE
- [x] Teorema 6.12 – Inclusione per funzioni limite
- [x] Teorema 6.13 – Gap Theorem
- [x] Definizione 6.1 – Funzione time-constructible
- [x] Definizione 6.2 – Funzione space-constructible
- [x] Teorema 6.14 – Gerarchia spaziale
- [x] Teorema 6.15 – Gerarchia temporale
- [x] Teorema 6.16 – f time constructible L è decidibile in NTIME
	- [x] DIMOSTRAZIONE 
- [x] Teorema 6.17 – Relazioni tra classi temporali/spaziali
	DIMOSTRAZIONE

## 🧠 Classi di complessità
- [x] P
- [ ] NP
- [ ] coP
- [ ] coNP
- [x] PSPACE
- [x] NPSPACE
- [x] EXPTIME
- [ ] NEXPTIME
- [x] FP
- [x] Definizione 6.3 
- [x] Definizione 6.4
- [x] Teorema 6.18 – P ⊂ EXPTIME
- [x] Teorema 6.19 – PSPACE = NPSPACE
- [x] Teorema 6.20 – Completezza e riduzioni
- [x] Teorema 6.21 – P chiusa per riduzioni polinomiali
	DIMOSTRAZIONE
- [x] Teorema 6.22 – Chiusura di NP, EXPTIME, NEXPTIME
	DIMOSTRAZIONE A PAROLE
- [x] Corollario 6.4 – Se P ≠ NP allora NP-completi ∉ P
- [x] Teorema 6.23 – Se coNP ≠ NP allora P ≠ NP
- [x] Teorema 6.24 – coNP chiusa per riduzioni polinomiali
	DIMOSTAZIONE A PAROLE
- [x] Teorema 6.25 – NP-completezza ⇔ coNP-completezza del complemento
	DIMOSTRAZIONE
- [x] Teorema 6.26 – NP ∩ coNP con completo ⇒ NP = coNP
	DIMOSTRAZIONE

## 🛎️ RIDUZIONI
- [ ] Riduzione 3-SAT ≤ SAT 
- [ ] Riduzione VERTEX COVER ≤ 3-SAT 
	RIVEDERE PER ACCORCIARE
- [ ] Riduzione INDEPENDENT SET ≤ VERTEX COVER 
- [ ] Riduzione CLIQUE ≤ INDEPENDENT SET 
- [ ] Riduzione DOMINATING SET ≤ VERTEX COVER 
- [ ] Riduzione 3-SAT ≤ 3-COLORABILITÀ 
- [ ] Riduzione VERTEX COVER ≤ CICLO HAMILTONIANO 
- [ ] Riduzione CICLO HAMILTONIANO ≤ PERCORSO HAMILTONIANO 
- [ ] Riduzione PERCORSO HAMILTONIANO ≤ LONG PATH
- [ ] Riduzione CICLO HAMILTONIANO ≤ COMMESSO VIAGGIATORE (TSP) 




Gentile Professoressa,

come da sua richiesta le scrivo per indicarle il contatto email su cui poter inviare il mio esito dell’esame.  
Sono la matricola 0348324.

La ringrazio e resto in attesa.  
Cordiali saluti
Samuele De Santis.