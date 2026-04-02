---
aliases:
  - "Network Security: Discovery & Reconnaissance"
---
L'obiettivo di questo modulo è capire **come raggiungere un host** e mappare l'infrastruttura di rete di un target.

## Fondamenti di Rete (Recap Veloce)
Sotto ogni applicazione nel kernel è presente una **socket** che permette la comunicazione.

- **IP Address**: Identificativo univoco dell'host ("l'indirizzo del palazzo"). 
	- IPv4 (32 bit) vs IPv6 (128 bit).
	- Pubblici vs Privati (gestiti tramite **NAT** - Network Address Translation).
- **Porte**: Identificano il servizio specifico ("la porta dell'ufficio"). Range: `1-65535`.
	- `80` (HTTP), `443` (HTTPS), `22` (SSH).
- **Firewall**: Filtra il traffico (Allow/Deny) in base a criteri: IP sorgente/destinazione, porte e protocolli (TCP, UDP, ICMP).


## URL e Diagnostica
### Struttura di un URL
Un **URL** (Uniform Resource Locator) serve a localizzare una risorsa:
![[Pasted image 20260402194455.png]]

### Comandi di connettività
- `ping`: Verifica raggiungibilità e latenza (ICMP).
- `traceroute`: Mostra il percorso dei pacchetti verso la destinazione.
- `arp` / `ip neigh`: Visualizza la cache ARP (mappatura IP ↔ MAC).
- `ip` / `ifconfig`: Configurazione interfacce di rete.
- `route` / `ip route`: Visualizza la tabella di routing.


## Netcat (nc): Il "coltellino svizzero"
Tool potentissimo per leggere/scrivere dati attraverso connessioni di rete.
### Utilizzo comune
- **Connettersi a un servizio (Client)**:
  `nc <target> <port>` (es. `nc 1.1.1.1 80`)
- **Ascolto (Server)**:
  `nc -l -p <port>`
- **Supporto UDP**: aggiungere il flag `-u`.

### Opzioni Utili
- `-v`: Verbose mode (maggiori dettagli sulla connessione).
- `-n`: Disabilita la risoluzione DNS (più veloce, evita log DNS).
- `-e`: **Execute**. Esegue un programma e ne reindirizza l'input/output al client (usatissimo per creare *Bind/Reverse Shell*).


## DNS: Domain Name System
Il DNS è la soluzione al problema della scoperta degli host: traduce nomi umani (www.esempio.com) in indirizzi IP.

### Architettura
- **Gerarchica**: ROOT (`.`) → TLD (`.it`, `.com`) → 2nd Level (`uniroma2.it`).
- **Distribuita**: Nessun server ha l'intero database; ogni livello **delega** il successivo.
- **Zone**: Porzioni del namespace DNS gestite da un'autorità (es. il dipartimento `ing` può essere una zona di `uniroma2.it`).

### Componenti
1. **DNS Client**: L'applicazione (browser) che richiede un nome.
2. **DNS Resolver**: Software che interroga i server per conto del client.
3. **DNS Server**: Conserva i record della zona.

### Tipi di Query
- **Query Ricorsiva**: Il server interpellato si impegna a trovare la risposta definitiva, interrogando altri server se necessario.
- **Query Iterativa**: Se il server non ha la risposta, restituisce un **referral** (l'indirizzo di un altro server DNS che potrebbe sapere la risposta). Il richiedente deve fare una nuova query.

### Common Record Types (Fondamentali)
| Tipo | Descrizione |
| :--- | :--- |
| **A** | Indirizzo IPv4 dell'host. |
| **AAAA** | Indirizzo IPv6 dell'host. |
| **CNAME** | Alias (punta un nome a un altro nome). |
| **MX** | Mail Exchange (indica i server di posta). |
| **PTR** | Reverse Lookup (punta l'IP al nome host). |
| **NS** | Nameserver autoritativo per la zona. |
| **TXT** | Informazioni testuali (spesso usate per SPF, DKIM, verifica domini). |
| **SOA** | Info sulla zona (amministratore, seriale, tempi di refresh). |


## 5. Interagire con il DNS
### Risoluzione Locale (Linux)
Prima di interrogare i server remoti, Linux controlla:
1. `/etc/hosts`: File per mappature manuali IP-Nome.
2. Cache locale.

### Tool: DIG (Domain Information Groper)
È lo strumento standard per interrogare i server DNS.
```bash
dig <hostname>                     # Query standard (record A)
dig <hostname> <record-type>       # Specifica il tipo (MX, NS, ecc.)
dig @<dns-server> <hostname>       # Interroga un server specifico
dig @<dns-server> <hostname> ANY   # Prova a recuperare tutti i record disponibili
```
![[Pasted image 20260402194630.png]]


### Tool: host
Più semplice di dig, utile per lookup rapidi.
```bash
host -t ns google.com              # Trova i nameserver
host -t mx google.com              # Trova i mail server
```


## DNS Reconnaissance (Introduzione)
Tre approcci principali per mappare l'infrastruttura:
1. **Forward Lookup Bruteforce**: Tentare una lista di nomi comuni (`www`, `mail`, `dev`, `vpn`) per trovare sottodomini validi.
2. **Reverse Lookup Bruteforce**: Scansionare un range di IP cercando record **PTR** per scoprire nomi host interni.
   - *Nota dagli appunti*: Se scopro un IP tramite `whois`, posso iterare su quel range.
3. **DNS Zone Transfer (AXFR)**: L'attacco "perfetto". Si tenta di chiedere al server una copia completa della zona (tutti i record). Se non è configurato correttamente, rivela l'intera topologia di rete.

>[!tip] OSINT Discovery
>Per scoprire il range di indirizzi IP di un'organizzazione (es. Tor Vergata), si può usare il comando `whois <indirizzo_IP>` o `whois <dominio>`. Gli IP sono assegnati da enti come IANA/RIPE.












In questa parte del corso vedremo COME poter raggiungere un host (cosa che nel primo modulo davamo per assodato).

- sotto ogni applicazione è presente una so(r)cket

- VEDI LE VARIE FOTO CON I DUE PROCESSI NEL KERNEL

## Comandi
- `ping`
- `traceroute`
- `arp / ip neigh`
- `ip / ifconfig`
- `route / ip route`


## Come scopriamo gli host?
- attraverso l'indirizzo IP
	- può essere recuperato dal DNS

### Common record types
- A
- AAAA
- CNAME
- MX
- PTR 
- TXT


## Interagire col DNS
- `DIG nome_di_dominio`
	- se non scrivo nulla DIG chiama il suo DNS-server di riferimento
	- volendo possiamo anche specificare il DNS server da usare e l'ip che cerchiamo
	- VEDI FOTO
	- per usare ANY devo conoscere il name server

- `host`

## Sfruttare il DNS
Una volta ottenuto il DNS voglio sfruttarlo per ottenere più informazioni possibili da esso

### Se io conosco il nome di dominio
Posso provare a eseguire una sorta di attacco a dizionario.

### Se non conosco il nome di dominio
Itero con PTR

Come capire il range di indirizzi di tor vergata?
Sapendo che gli indirizzi IP sono assegnati da ICAAN, se io scopro un IP di un server di tor vergata posso usare il comando 
```
whois INDIRIZZO_IP
```
per scoprire il range 
- il `whois` può essere usato anche con nome di dominio, ecc... (VEDERE!!)

L'idea anche qui è automatizzare.

