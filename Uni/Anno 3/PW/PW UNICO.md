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


---

## Git Branch
I branch rappresentano linee di sviluppo parallele e indipendenti all’interno dello stesso repository.

Ogni branch identifica uno stato del progetto in un determinato momento.  
Il branch principale è generalmente `main`, mentre i branch secondari vengono utilizzati per sviluppare modifiche senza alterare direttamente il ramo principale.

**Tecnicamente:**
- un branch è un **puntatore a un commit**
- cambiando branch cambi la versione del progetto

Al termine dello sviluppo, i branch secondari vengono integrati nel `main` tramite operazioni di merge.

![[Pasted image 20260317151850.png|center]]

---

## Idea
L’utilizzo dei branch consente di:
- isolare le modifiche
- lavorare in parallelo
- mantenere stabile il ramo principale

Ogni branch è tipicamente associato a una specifica funzionalità o modifica.  
L’integrazione avviene successivamente tramite merge.

**Best practice:**
- creare **un branch per ogni task**
- fare merge spesso → evita conflitti grandi alla fine


---

## Sintassi

###### Creazione di un nuovo branch:
```
git branch <nome>  
```

Crea un nuovo branch a partire dal commit corrente.


###### Cambio di branch:
```
git checkout <nome/id>  
```

Aggiorna la working directory allo stato del branch (o commit) selezionato.

⚠️ Puoi cambiare branch solo se hai salvato le modifiche:
- `git commit`
- oppure `git stash`


###### HEAD:
- rappresenta il puntatore al branch o commit corrente
- indica il contesto di lavoro attuale
- punta sempre al **commit corrente del branch attivo**


###### Salvataggio temporaneo:
```
git stash  
```

Salva le modifiche locali non committate e ripristina uno stato pulito.


###### Ripristino delle modifiche:
```
git stash pop  
```

Recupera l’ultimo stato salvato nello stash.

![[Pasted image 20260317152032.png]]

---

## Merge
Il merge è l’operazione che consente di integrare due branch.

### Fast forward
Si verifica quando il branch di destinazione non ha commit aggiuntivi rispetto a quello da integrare.
In questo caso:
- non viene creato un nuovo commit
- il puntatore del branch viene semplicemente avanzato

👉 storia lineare
![[Pasted image 20260317152123.png]]

### Merge commit
Si verifica quando i due branch hanno evoluzioni divergenti.

In questo caso:
- Git crea un nuovo commit di merge
- il commit ha due predecessori (uno per ciascun branch)

![[Pasted image 20260317152219.png]]

Qui entrambi i branch partono da `B`, ma evolvono in modo diverso.

>[!tip] Conflitti
I conflitti si verificano quando le stesse parti di uno o più file sono state modificate in entrambi i branch.
>
In questo caso:
>- Git segnala il conflitto
>- l’utente deve risolverlo manualmente
>
👉 Git lavora riga per riga  
👉 con file binari spesso NON riesce → devi scegliere una versione


---

## Pull
Il comando pull permette di aggiornare il repository locale con le modifiche presenti nel repository remoto.

È composto da:
- fetch → recupera gli aggiornamenti dal remoto
- merge → integra gli aggiornamenti nel branch locale


#### Caso senza modifiche locali (fast forward):
- il branch locale viene aggiornato direttamente
![[Pasted image 20260317152541.png]]

#### Caso con modifiche locali:
- viene eseguito un merge commit
![[Pasted image 20260317152604.png]]

## Rebase
Il rebase è un’alternativa al merge.

Consiste nel:
- prendere i commit locali
- applicarli sopra i commit più recenti del branch remoto

Effetto:
- storia lineare dei commit
- eliminazione dei merge commit

⚠️ Attenzione:
- il rebase **riscrive la history** → può creare problemi se condiviso

![[Pasted image 20260317152700.png]]

---

## .gitignore
File che indica a Git quali file o cartelle ignorare.

Serve per evitare di salvare:
- file temporanei
- file di build
- file sensibili
- cartelle come `node_modules/`



---

# CSS – Cascading Style Sheets
## Cos’è il CSS
Il CSS è uno **standard del W3C** usato per definire la **presentazione** dei documenti HTML (o XML).

Serve a:
- separare **contenuto (HTML)** da **stile (CSS)**
- permettere **più rappresentazioni dello stesso documento**
- garantire maggiore **coerenza tra browser**

👉 Il browser combina HTML + CSS per generare la pagina finale.

## Come funziona CSS
- HTML → struttura
- CSS → presentazione
- Browser → unisce i due

![Image](https://www.pcdazero.it/images/web01/VSC_10/codice-css.png)


## Dove scrivere il CSS
### 1. External Style Sheet
- file `.css` esterno
- collegato con `<link>` nell’`<head>`
```html
<link rel="stylesheet" href="style.css">
```
✔ soluzione migliore (riuso, pulizia)

### 2. Internal Style Sheet
- dentro `<style>` nell’`head`
```html
<style>
  body { background: white; }
</style>
```
✔ utile per pagine singole

### 3. Inline
- all'interno degli elementi con l’attributo `style`
```html
<h1 style="color:red;">Titolo</h1>
```
❌ da evitare (sporco, poco manutenibile)  
✔ usato solo per override mirati


## Elemento `<link>`
Serve per collegare risorse esterne:
- CSS
- favicon
```html
<link rel="icon" href="icon.png">
```

## Struttura di una regola CSS
```css
h1 {
  color: green;
  font-size: 32px;
}
```
- `h1` → selettore
- `color: green;` → dichiarazione
- `font-size: 32px`; -> dichiarazione
- `color` / `font-size` → proprietà
- `green` / `32px` → valore

Il selettore dice al browser dove applicare quelle determinate regole.


## Selettori CSS
### 1. Selettore di elemento
Seleziona tutti gli elementi di un tipo
```css
p { 
	color: red; 
}
```

### 2. Selettore di classe
```css
.verde { 
	color: green; 
}
p.verde { 
	color: green; 
}
```

Nell'HTML
```html
<p>...</p> -> sarà rosso + 18px

<p class="verde">...</p> -> sarà verde + 20px
```
✔ riutilizzabile su più elementi

### 3. Selettore id
```css
#intro { 
	color: blue; 
}
```

Nell'HTML
```html
<p id="intro"></p>
```
✔ identifica **un solo elemento**


### Confronto
- elemento → generico
- classe → medio
- id → specifico

## Selettori composti (relazioni DOM)
![[Pasted image 20260319172628.png]]

### Tipi principali
- Discendenti
```css
A B
```

- Figli diretti
```css
A > B
```

- Fratello adiacente
```css
A + B
```

- Fratelli generici
```css
A ~ B
```

## Pseudo-classi
Definiscono uno **stato** dell’elemento
```css
a:hover { 
	color: red; 
}

input:focus { 
	border: 2px solid blue; 
}
```

✔ esempi:
- `:hover`
- `:focus`
- `:visited`
- `:nth-child()`

## Pseudo-elementi
Agiscono su **parti dell’elemento**
```css
p::first-letter { font-size: 2em; }
```

✔ esempi:
- `::before`
- `::after`
- `::first-letter`

## Selettori di attributo
```css
a[target="_blank"] { color: red; }
img[alt] { background: grey; }
```

✔ utile quando non vuoi usare classi

## Ereditarietà
Alcune proprietà vengono ereditate dai figli.

Esempio:
- `color` → sì
- `border` → no

👉 non tutte le proprietà si propagano

![[Pasted image 20260319172922.png]]
>[!tip] SARÀ ROSSO
>L'id ha QUASI sempre la differenza.


## Conflitti tra regole
Più regole possono colpire lo stesso elemento.

Il browser decide:
1. **specificità**
2. **ordine** -> ULTIMA VINCE
	![[Pasted image 20260319173000.png]]


## IMPORTANTISSIMO - Cascade (Cascata)
Algoritmo che combina gli stili da:
- browser (default)
- autore (tu)
- utente (es. estensioni)

👉 risolve i conflitti tra regole
#### ORDINE
![[Pasted image 20260319125634.png]]
Se stai in basso hai la precedenza rispetto. a chi sta in alto
Se il browser mette `!important` ha la precedenza assoluta MA SE IO USO L'INLINE LO INCULO.

## !important
```css
color: red !important;
```

✔ forza una regola  
❌ da evitare quasi sempre


## Specificità
Ogni selettore ha un peso:
```
[a, b, c, d]
```
- a → inline (1 o 0)
- b → numero di id
- c → classi / pseudo-classi / attributi
- d → elementi

👉 confronto da sinistra a destra

### Regola base
```
id > classe > elemento
```


## Esempio
```css
p { 
	color: green; 
}

.note { 
	color: blue; 
}

#intro { 
	color: red; 
}
```

```html
<p id="intro" class="note">Testo</p>
```

👉 risultato: **rosso** (vince id)


---

# FONT (CSS)

## Tipi di font
I font si dividono in:
### Font specifici
- hanno un nome preciso  
    → es: `Arial`, `Times New Roman`
- funzionano **solo se installati nel sistema**

### Font generici
- famiglie standard  
    → `serif`, `sans-serif`, `monospace`, `cursive`, `fantasy`
- usati come **fallback**

---

## Famiglie di font
I font vengono raggruppati in famiglie:
- `serif`
- `sans-serif`
- `monospace`
- `cursive`
- `fantasy`

👉 `monospace`  
tutti i caratteri hanno **stessa larghezza**

---

## Dipendenza dal sistema
I font:
- dipendono dal **sistema operativo**
- funzionano solo se installati

👉 browser diversi → risultati diversi

---

## Font stack (IMPORTANTISSIMO)
Si usa una lista di font in ordine.

Il browser:
- prova il primo
- se non c’è → passa al successivo

Alla fine:
- sempre una **famiglia generica**
```css
body {  
    font-family: Arial, Helvetica, sans-serif;  
}
```

---

## Importare font
### 1. Locali
- presenti nel progetto

### 2. Esterni
- es: Google Fonts

### 3. `@font-face`
Permette di caricare font personalizzati
```css
@font-face {  
    font-family: 'Roboto';  
    src: url('Roboto-Light-webfont.woff') format('woff');    
}
```
👉 formato più usato: `.woff`

Dopo:
```css
body {
    font-family: 'Roboto', sans-serif;
}
```

---

## Font size
Specifica la dimensione del testo

### Valori relativi
- `%` → rispetto al genitore
- `em` → multiplo del font corrente  
    ✔ più flessibili

### Valori assoluti
- `px` → dimensione fissa  
    ❌ meno adattabile

---

## Font weight e style
### font-weight
- spessore del testo
- valori:
    - `normal`
    - `bold`
    - numerici (100–900)

### font-style
- stile del testo
- valori:
    - `normal`
    - `italic`

---

## Shorthand `font`
Permette di scrivere tutto in una riga

👉 ordine:
- style
- weight
- size / line-height
- family

```css
p {  
    font: italic bold 16px/1.5 Arial, sans-serif;  
}
```

---

# TESTO E COLORI
## Colore testo
```css
color: red;
```
👉 proprietà **ereditata**

### Formati colore
- nome
    ```css
    color: red;
    ```
- esadecimale
    ```css
    color: #336699;
    ```
- rgb
    ```css
    color: rgb(51, 102, 153);
    ```
- rgba (con trasparenza)
    ```css
    color: rgba(51, 102, 153, 0.5);
    ```

---

## text-align
Allineamento orizzontale

Valori:
- `left`
- `right`
- `center`
- `justify`

```css
p {  
    text-align: center;  
}
```

---

## text-decoration
Decorazioni del testo

Valori:
- `none`
- `underline`
- `overline`
- `line-through`

```css
a {  
    text-decoration: none;  
}
```

---

## text-transform
Modifica maiuscole/minuscole

Valori:
- `uppercase`
- `lowercase`
- `capitalize`

```css
h1 {  
    text-transform: uppercase;  
}
```

---

## text-indent
Indentazione prima riga

Valori:
- `px`
- `em`
- `%`

```css
p {  
    text-indent: 2em;  
}
```

---

## text-shadow
Aggiunge ombra al testo
👉 parametri:
- offset-x
- offset-y
- blur
- colore

```css
h1 {  
    text-shadow: 2px 2px 5px gray;  
}
```


---
