# Cos’è una password
Una **password** è un **segreto condiviso tra due parti**:
- l’utente
- il servizio (server, sito, sistema)

Serve per **verificare l’identità dell’utente** durante il login.

### Processo di autenticazione
1. L’utente invia **username e password**.
2. Il servizio controlla se l’utente esiste nel database.
3. Confronta la password inserita con quella salvata.
4. Se coincidono → accesso consentito.

Il problema principale è **come salvare queste password nel database** in modo sicuro.

---

# Furto di identità
Le password sono spesso deboli perché gli utenti scelgono valori prevedibili, e se qualcuno scopre la password di un utente può **autenticarsi al suo posto**.

Responsabilità della sicurezza:
- **Utente** → deve scegliere password complesse
- **Servizio** → deve proteggerle nel database


---

# Problemi tipici delle password
## Password reuse (o Password overload)
Gli utenti usano **la stessa password su più siti**.

Conseguenza:
- se un sito poco sicuro viene violato 
- l’attaccante può usare quella password su servizi più importanti.

Questo si chiama **cross-site breach**.

## Charset limitato
Gli utenti usano solo caratteri comuni (lettere e numeri).
Questo riduce molto lo **spazio di ricerca** per un attaccante.

## Bassa entropia
Gli utenti scelgono password **facili da ricordare**, quindi prevedibili.

La casualità si misura con **entropia di Shannon**.
- stringa realmente casuale (o pseudo) → alta entropia
- parole umane → molto prevedibili

Per questo gli **attacchi a dizionario funzionano molto bene**.

## Prevedibilità
Gli utenti usano schemi prevedivili (hobby, nomi animali, ecc.).

Queste informazioni possono essere raccolte con:
- **OSINT**
- **SOCMINT** (social media intelligence)


---

# Creazione di wordlist
Gli attaccanti usano **liste di password candidate**.

Esistono liste pubbliche come:
- **SecLists**
- oppure possono crearle.


## Tool per generare wordlist
### Crunch
Genera password tramite **combinazioni matematiche**.
Possiamo decidere noi lunghezza e caratteri da utilizzare

Esempio:
```
crunch 8 8 0123456789
```
→ genera tutti i numeri di 8 cifre.


### CeWL (Custom Word List generator)
Crea una wordlist **analizzando un sito web**.
Serve per ottenere parole legate a una azienda:
- nomi dipendenti
- prodotti
- terminologia aziendale.


### Username-Anarchy
Genera **possibili username** partendo da nome e cognome.

Esempio per _Mario Rossi_:
```
m.rossi
marior
rossim
```


---

# Tipi di attacco alle password
## Attacchi online
Tentativi di login diretti sul servizio.

Tool principale: **Hydra**

Problemi:
- alta latenza di rete
- molto visibile nei log
- rischio di account lockout dopo un tot di tentativi
	- o vieni messo in attesa o addirittura bannato


## Attacchi offline
L’attaccante ruba il database degli **hash delle password**, poi prova a crackarli sul proprio hardware.

Tool principali:
- **Hashcat**
- **John the Ripper**

Vantaggi:
- velocità enorme (GPU)
- zero visibilità per la vittima

Prerequisito:
- è richiesto un accesso iniziale al database (es. SQL injection).


---

# Come proteggere le password
## Non salvare password in chiaro
Se fossero salvate in questo modo:
- amministratori potrebbero leggerle
- leak del database esporrebbe tutto.


## Soluzione: One-way hash function
La password viene trasformata in un **hash**.

Proprietà:
- dato l’hash non si può risalire alla password
- difficile trovare collisioni (due stringhe uguali).

Durante il login:
1. utente inserisce password
2. sistema calcola hash tramite la funzione scelta
3. confronta con quello salvato


## SALT
Il **salt** è una stringa casuale aggiunta alla password prima dell’hash.

![[Pasted image 20260312162234.png]]

```
hash = H(password || salt)              // '||' significa concatenazione
```

Serve per:
- evitare hash identici per password uguali
- impedire attacchi con **rainbow tables**.

Ogni utente ha un salt diverso.
![[Pasted image 20260312162602.png]]


## Cracking tools
1. si prende una password candidata (esempio: "password123" dalla wordlist) 
2. si calcola il suo hash con lo stesso algoritmo e salt
3. si confronta con l’hash rubato
4. se coincidono → hai trovato la password
![[Pasted image 20260312162939.png]]

---

# Password in Linux
File principali:
- `/etc/passwd`
	Contiene:
	- username
	- informazioni utente
	Ma **non contiene password** né **hashes**.
	![[Pasted image 20260312163327.png]]
	Le `x` che vedi sono un placeholder per coprire il nome utente


-  `/etc/shadow`
	Contiene:
	- hash password
	- salt
	- algoritmo
	È leggibile **solo da root**.
	![[Pasted image 20260312163052.png]]
	- `$id` -> algoritmo di hashing utilizzato
	- `$salt` -> il salt casuale aggiunto
	- `$hash` -> l'hash vero e proprio 
	
	![[Pasted image 20260312163442.png]]
	Qui se vedi non ci sono le `x`.
	
	Altre parti del risultato
	![[Pasted image 20260312163522.png]]![[Pasted image 20260312163528.png]]![[Pasted image 20260312163534.png]]


---

# Cracking delle password
Se un attaccante ottiene gli hash può usare strumenti di cracking.

## John the Ripper
Uno dei tool più diffusi, originariamente **CPU based**.

### Unshadow TOOL
`unshadow` è un tool utilizzato da John the Ripper
![[Pasted image 20260312164018.png]]
In pratica lui ha bisogno del contenuto sia di `/etc/passwd` che di `/etc/shadow` e con `unshadow` riesce a combinarli.


### John the Ripper supporta
#### 1. Single crack
Prova password basate su username.

Esempio:
```
admin123
admin2000
nimda
```
![[Pasted image 20260312164240.png]]

#### 2. Dictionary attack
Usa una wordlist di password comuni.

Esempio:
```
john -w=/path/to/wordlist.txt hashesFile
```
![[Pasted image 20260312164353.png]]

### 3. Incremental (brute force)
Prova tutte le combinazioni possibili.
![[Pasted image 20260312164429.png]]

### 4. Custom rules
Permette di creare **regole di trasformazione** sulle wordlist.

![[Pasted image 20260312164453.png]]

>[!tip]- Esempio:
>![[Pasted image 20260312164523.png]]![[Pasted image 20260312164533.png]]![[Pasted image 20260312164540.png]]


---

# Hashcat
Tool molto veloce che sfrutta la **GPU**.

Esempio attacco dizionario:
![[Pasted image 20260312164617.png]]![[Pasted image 20260312164628.png]]![[Pasted image 20260312164637.png]]


---

# Cracking password di file compressi
![[Pasted image 20260312164658.png]]


---

# Attacchi online con Hydra
![[Pasted image 20260312164848.png]]


Esempio con spiegazione di parametri principali
![[Pasted image 20260312164950.png]]


---

# Windows e Active Directory
**Active Directory (AD)** è il sistema centrale di gestione identità in Windows.

Il **Domain Controller**:
- autentica utenti
- applica politiche di sicurezza.

Se un hash di **Domain Admin** viene compromesso → l’attaccante può accedere a tutta l’infrastruttura.


---

# Hash in Windows
Bisogna distinguere:
1. **Protocollo di autenticazione**
2. **Algoritmo di hash**

>[!tip]- SAM (Security Accounts Manager), utile per dopo
Database Windows che contiene gli hash delle password.
>
Non può essere copiato direttamente mentre il sistema è attivo.
>
Può essere estratto tramite:
>
![[Pasted image 20260312165402.png]]
>
Oppure con tool come:
>- mimikatz
>- fgdump
>- wce.


## Algoritmi di HASH
### LM Hash
Algoritmo molto vecchio.
- usato negli anni 80
- ancora presente per compatibilità.

È salvato in:
- SAM
- **NTDS.dit**: il database principale su un Domain Controller

Esempi di crack
![[Pasted image 20260312165503.png]]


### NT Hash
Algoritmo moderno usato da Windows.

Salvato in:
- SAM
- NTDS.dit (Active Directory)

Può essere usato in attacchi **Pass-the-hash**

>[!tip]- Pass-the-hash
>Quando ti autentichi a un servizio Windows:
>1. il client usa **l’hash della password**
>2. il server verifica quell’hash
>
Il punto importante:
>⚠️ spesso **la password non viene mai inviata**, ma viene usato **direttamente l’hash**.
>
>Se un attaccante ottiene l’NT hash, può fare login **usando direttamente quello** (questo perché NT hash non è salted).
>
>Non deve sapere la password.
>
>Quindi l'attacco Pass-the-hash funziona così:
>1️. l’attaccante compromette una macchina  
>2. estrae gli hash (es. con **mimikatz**)  
>3️. usa quegli hash per autenticarsi su altri sistemi
>
>senza mai conoscere la password.
>
>IL TUTTO È ANCORA PIÙ GRAVE CON SSO
>**SSO = Single Sign On**
Significa che:
una volta autenticato → puoi accedere a molti servizi.

Esempio di Dumping
![[Pasted image 20260312170313.png]]


Esempio di Cracking
![[Pasted image 20260312170339.png]]


## Protocollo di autenticazione
### Net-NTLM
Protocollo di autenticazione di rete.

Versioni:
#### 1. NTLMv1
Vecchio protocollo che non invia la password ma funziona con **challenge-response**:
1. il **server manda una challenge** (numero casuale)
2. il **client usa l’NT hash della password** per calcolare una risposta
3. il server verifica la risposta.
![[Pasted image 20260312171024.png]]
Quindi la password **non viaggia in rete**.

##### Come viene rubato
Un attaccante può **intercettare l’handshake** con attacchi tipo:
- **Man-in-the-Middle**
- **LLMNR / NBT-NS poisoning**

Tool tipico:
Responder
L’attaccante cattura l’hash di risposta.

##### Perché è vulnerabile
**NTLMv1 è matematicamente debole.**

Quindi la challenge-response catturata può essere:
- **crackata rapidamente**
- oppure usata in altri attacchi.

![[Pasted image 20260312170833.png]]


#### 2. NTLMv2
Più sicuro, in quanto usa un **algoritmo HMAC-MD5** più robusto e incorpora challenge di lunghezza variabile (includendo anche, per esempio, timestamps sull'ora attuale).
![[Pasted image 20260312171036.png]]

HA LE STESSE VURNERABILITÀ E METODO DI CATTURA DELLA v1

##### Handshake di NTLMv2
![[Pasted image 20260312171130.png]]
![[Pasted image 20260312171143.png]]
![[Pasted image 20260312171151.png]]
	Qui vengono inviati anche `CC` e `CC*` così il server può ricalcolare `LMV2` E `NTv2`

##### Esempio di cattura
![[Pasted image 20260312171238.png]]


---

# Poisoning attack (LLMNR/NBT-NS)
Attacco tipico:
1. utente cerca server inesistente
2. DNS fallisce
3. il PC manda richiesta broadcast
4. attaccante intercetta la richiesta e risponde fingendosi server
5. l’utente invia handshake NTLM
6. l’attaccante cattura l’hash.

Poi l’hash può essere:
- crackato offline
- usato per relay attack.

![[Pasted image 20260312171259.png]]







