## Modifiche da fare se l'ambiente è parzialmente osservabile
Ipotizziamo tipo che l'esercizio sia tipo "a stanza buia"

1. ==PEAS==
	- Cambiano i sensori perché aggiungi anche il `fiuto`


2. ==PROPRIETÀ AMBIENTE==
	- Lo capisci dall'esercizio -> ma sappiamo che è PARZIALMENTE OSSERVABILE


3. ==TIPO DI AGENTE==
	- Credo sia sempre a obiettivo


4. ==DESCRIZIONE STATI==
	- STATO MONDO -> tutte le informazioni dell'ambiente
	- STATO SPAZIO DI RICERCA -> $S = (POS_{agente}, \ \text{VALORE-FUNZIONE-FIUTO})$ 
		- UTILE DIFFERENZIARLI
		
	- OBIETTIVI -> li vedi dall'esercizio
	
	- ==MODELLO DI TRANSIZIONE==
		- IDENTICO A QUELLO GIÀ VISTO **ma ricorda di usare lo stato dello spazio di ricerca corretto**


5. ==FUNZIONE AGENTE==
	- ALGORITMO RICERCA -> **HILL CLIMBING** e una volta trovata la sequenza di azione l'agente le esegue normalmente
	
	- EURISTICA -> $f: n \rightarrow \{1,..., 10\}$  
		- che trasforma la percezione del fiuto in un valore numerico che identifica quanto è forte l'odore in quello stato (cella)
		- SE IL VALORE RAGGIUNGE UNA CERTA SOGLIA VUOL DIRE CHE LÌ C'È IL FORMAGGIO


6. ==ARCHITETTURA==
	- PROGRAMMA AMBIENTE -> è identico ma cambiano le percezioni che vengono passate
		- SCRIVO SOLO COSA CAMBIA
```scss
function RUN-ENV(Update-Fn, state, agent, Performance-Fn) returns score

	loop do
		percezione = (POS_topo, VALORE-FIUTO) = GET-PERCEPTION(stato, agente)
		"RESTO UGUALE"
```

- PROGRAMMA AGENTE -> identico ma l'algoritmo di ricerca è **HILL CLIMBING**

- ALGORITMO RICERCA -> **HILL CLIMBING**
	![[Pasted image 20251028152145.png]]




