## GIT
Git è un **sistema di controllo di versione**.  
Serve per tenere traccia delle modifiche fatte ai file di un progetto nel tempo.

Permette di:
- salvare le versioni del codice
- tornare a versioni precedenti
- lavorare in gruppo senza sovrascrivere il lavoro degli altri

---

## Struttura di Git
Un progetto Git è diviso in tre parti principali.

**Repository**  
È il database del progetto.  
Qui Git salva tutta la storia delle modifiche.

**Working Tree (Working Directory)**  
È la cartella in cui lavori realmente.  
Qui modifichi i file del progetto.

**Index (Staging Area)**  
È un’area intermedia.  
Qui Git prepara i file che verranno salvati nel prossimo commit.

---

## Git è distribuito
Git è un **sistema di controllo di versione distribuito**.

Significa che **ogni sviluppatore ha una copia completa del repository in locale**, con tutta la cronologia delle modifiche.

Quindi:
- non dipende sempre dal server
- puoi lavorare anche **offline**

Questo è uno dei motivi per cui Git è veloce.

---

## 3. Workflow base (questo è importante)
Questo nelle slide c’è ma nei tuoi appunti non proprio.

Il flusso è:
1. Modifico i file nella **working directory**
2. Metto i file nello **staging area (index)**
3. Faccio il **commit**

Il commit salva uno **snapshot** (una fotografia) dei file nel repository.

---

## 4. Cosa permette Git
Puoi aggiungere questa parte perché sta nelle slide:

Git permette di:
- tenere traccia della **cronologia del codice**
- sapere **chi ha fatto una modifica**
- collaborare con altre persone
- distribuire il codice in ambienti diversi (test, produzione).

---

### Lavoro in locale
Git lavora **prima di tutto in locale**.

Quando vogliamo salvare una modifica nel repository locale usiamo:
```
commit
```
Il commit crea una nuova versione del progetto salvando lo stato dei file.

Quindi il flusso tipico è:
`Working Tree → Index → Commit → Repository`

---

### Condivisione del progetto
Se il progetto deve essere condiviso con altre persone si usano **repository remote**

Un esempio molto usato è **GitHub**.

Il repository remoto è una copia del progetto salvata su un server.

Da qui possiamo:
- scaricare il progetto
- inviare le modifiche fatte in locale


---

### Inviare modifiche al server
Per inviare le modifiche dalla repository locale al repository remoto si usa:

```
push
```

Il push manda i commit locali al server.

---

### Prendere modifiche dal server
Se altre persone hanno modificato il progetto, dobbiamo scaricare le loro modifiche.

Il comando è:
```
pull
```

Il pull è composto da due operazioni.

**Fetch**  
Scarica le modifiche dal server remoto ma **non modifica ancora i file locali**.

**Merge**  
Unisce le modifiche scaricate con il codice locale.

Questa operazione può essere **pericolosa**, perché se le modifiche sono incompatibili possono nascere **conflitti di merge** che devono essere risolti manualmente.

---


Ti faccio un riassunto chiaro **dalla slide 40 fino alla fine**. Ho tolto esempi inutili ma ho lasciato i concetti che possono uscire all’esame.

---

# Client Web 
Un **client web** è un software che invia **richieste HTTP ai server**.

Il client più comune è il **browser**.

Come funziona una richiesta:
1. L’utente inserisce un indirizzo nel browser
2. Il browser invia una **richiesta HTTP** al server
3. Il server trova il documento richiesto
4. Il server lo invia al browser
5. Il browser lo visualizza all’utente

![[Pasted image 20260312184131.png]]

Il browser quindi è il **cliente** del server.

I browser possono richiedere molti tipi di file:
- HTML
- immagini
- video
- audio
- script

Documenti uguali possono essere **visualizzati in modo leggermente diverso** da browser diversi.

---

# Server Web 
Un **server web** è un programma che:
1. aspetta una richiesta
2. cerca il file richiesto
3. lo invia al client

Il server comunica tramite **HTTP**.

Un server non è necessariamente un computer speciale: **qualsiasi computer può diventare server** se esegue un software server.

Server web famosi:
- Apache
- Nginx


---

# Server web locale
È possibile avviare un **server sul proprio computer**.

Esempio comando:
```
npx http-server
```
Questo avvia un server HTTP sulla **porta 8000**.

Per accedere dal browser:
```
127.0.0.1:8000
```
127.0.0.1 è l’**indirizzo IP locale (localhost)**.


---

# Root del server e path
Il **server root** è la cartella principale del sito.

Da questa cartella vengono serviti tutti i file.

Quando scrivi un URL senza file specifico:
```
www.sito.it
```

il server cerca il file di default:
```
index.html
```


Il **path** indica dove si trova un file dentro la struttura del sito.
Esempio:
```
www.sito.it/immagini/logo.png
```
- `immagini` → cartella
- `logo.png` → file


---

# Architettura Full Stack Web 
Una web app completa ha tre livelli principali:
### 1. Client (frontend)
Tecnologie:
- HTML
- CSS
- JavaScript
- Browser

Gestisce **interfaccia e interazione con l’utente**.

### 2. Server (backend)
Tecnologie possibili:
- Node.js
- Nginx
- altri server applicativi

Gestisce:
- logica applicativa
- richieste HTTP
- comunicazione con database

### 3. Database
Serve per salvare i dati.

Esempi:
- MySQL
- MongoDB
   

---

# Organizzazioni che gestiscono Internet
Tre enti principali:

**IETF (Internet Engineering Task Force)**  
→ definisce gli standard dei protocolli internet.

**ICANN**  
→ gestisce i nomi di dominio e i TLD.

**W3C (World Wide Web Consortium)**  
→ definisce gli standard del Web (HTML, CSS ecc.).


---

# Cosa contiene una pagina web 
Una pagina web è composta da tre tecnologie principali.
### HTML
Definisce la **struttura del contenuto**.

Esempio:
- titoli
- paragrafi
- immagini
- link

### CSS
Definisce lo **stile grafico**.
- colori
- layout
- font

### JavaScript
Aggiunge **interattività**.
- animazioni
- pulsanti
- richieste al server


---

# Markup HTML
Un documento HTML è composto da **tag**.

Esempio:
```
<body> ... </body>
```

I tag:
- non sono visibili nel browser
- definiscono la struttura della pagina

Tipi di tag:
**Tag con apertura e chiusura**
```
<p>testo</p>
```

**Tag singoli**
```
<img>
<hr>
```


---

# Immagini e file esterni
Quando il browser trova elementi come:
```
<img>
```
fa **una nuova richiesta HTTP** per scaricare il file.

Una pagina web quindi è spesso composta da molti file:
- HTML
- CSS
- immagini
- script

Il browser li scarica separatamente.


---

# HTML: definizione
HTML significa: **HyperText Markup Language**

È il linguaggio standard per creare pagine web.

Caratteristiche:
- definisce la struttura dei documenti
- usa collegamenti ipertestuali
- è standardizzato dal **W3C**.


---

# Elementi in HTML
Tutto ciò che si trova tra tag
![[Pasted image 20260312184333.png]]


---

# Tag annidati
I tag HTML possono essere **annidati**.

Esempio corretto:
![[Pasted image 20260312184344.png]]

Se l’ordine è sbagliato si crea un **annidamento scorretto**.
![[Pasted image 20260312184350.png]]


---

# Attributi HTML
Alcuni tag hanno **attributi**.

Struttura:
```
chiave="valore"
```

Esempi:
![[Pasted image 20260312184423.png]]


```
<img src="food.gif" alt="food illustration">
```
- `src` → file immagine
- `alt` → testo alternativo

>[!tip] USA LE VIRGOLETTE!


---

# Elementi vuoti
Alcuni elementi hanno **solo il tag di apertura**.

Esempi:
```
<br>
<img>
```

Non hanno contenuto interno.


---

# Struttura di un documento HTML 
Un documento HTML ha questa struttura base:
```
<!DOCTYPE html>
<html>

<head>
</head>

<body>
</body>

</html>
```
![[Pasted image 20260312184738.png]]

### DOCTYPE
Dichiara il tipo di documento HTML.
Serve al browser per sapere **come interpretare il codice**.
![[Pasted image 20260312184752.png]]

### head
Contiene informazioni sulla pagina:
- titolo
- metadati
- charset
- collegamenti a CSS

Non è visibile nella pagina.

### title
Definisce il **titolo della pagina**.

È importante perché:
- appare nella barra del browser
- è usato nei preferiti
- è usato dai motori di ricerca

### body
Contiene **tutto il contenuto visibile della pagina**:
- testo
- immagini
- link
- tabelle
- video

