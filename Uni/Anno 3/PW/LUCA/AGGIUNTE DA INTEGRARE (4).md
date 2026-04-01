### domanda tipica da esame
#### BOX MODEL
- le proprietà CSS si applicano al **box dell'elemento**
    - ogni elemento HTML occupa un rettangolo (box)
    - il box rappresenta **come l'elemento viene renderizzato nella pagina**
- la dimensione del box dipende da più componenti
    - si può visualizzare usando un bordo:
        ```css
        div {  
        	border: 1px solid black;  
        }
        ```
    - si può modificare con `width` e `height`
        - ATTENZIONE:
        - `width` e `height` rappresentano **solo l’area del contenuto**
        - la dimensione reale del box è:
        `dimensione totale = content + padding + border + margin`
- *STRUTTURA DEL BOX*
	- ogni elemento è composto da **4 aree**
	- ogni area ha lati: **top, right, bottom, left**
1. **AREA DEL CONTENUTO (content)**
- è la parte interna dove si trova il contenuto (testo, immagini, ecc.)
- è l’area controllata da:
    - `width`
    - `height`
```css
div {  
	width: 200px;  
	height: 100px;  
}
```
- tutto il resto (padding, border, margin) si aggiunge **intorno**
2. AREA DEL PADDING
- è lo spazio tra contenuto e bordo
- serve a creare **spazio interno**
```css
div {  
	padding: 10px;  
}
```
- proprietà:
    - `padding-top`, `padding-right`, `padding-bottom`, `padding-left`
- shorthand:
	- `padding: top right bottom left;`
3. **AREA DEL BORDER**
- è il bordo che circonda padding + contenuto
- serve sia visivamente che per il layout
```css
div {  
	border: 2px solid black;  
}
```
- proprietà:
    - `border-width`
    - `border-style` → solid, dashed, double…
    - `border-color`
- shorthand:
	- `border: 2px solid red;`
4. **AREA DEL MARGINE (margin)**
- è lo spazio esterno tra elementi
- separa un box dagli altri
```css
div {  
	margin: 20px;  
}
```
- proprietà:
    - `margin-top`, `margin-right`,  `margin-bottom`, `margin-left`
- shorthand:
	- `margin: top right bottom left;`
		- `margin: 10px 20px 10px 20px;`
- tutte queste aree sono visibili nei `DevTools` del browser
    - sezione **Computed / Box Model**
    - utile per debug layout
![[Pasted image 20260401100105.png]]

- *AREA VISIBILE*
	- quando si parla di **area visibile**
	    - si intende **come il browser mostra il box**
	    - cioè la combinazione di:
	        - contenuto, padding, border
		- il margine NON è visibile (è spazio esterno)
- *BOX SIZING*
	- è una proprietà introdotta in **CSS3**
	- permette di controllare **come vengono calcolate le dimensioni del box**
```CSS
box-sizing: content-box | border-box;
```
- *CONTENT-BOX (default)*
- è il comportamento **di default**
- `width` e `height` si riferiscono **solo al contenuto**
	- `dimensione totale = width + padding + border`
- il box **cresce** aggiungendo padding e border
```CSS
div {  
	width: 200px;  
	padding: 20px;  
	border: 5px solid black;  
}
```
➡ larghezza reale = **200 + 40 + 10 = 250px**
- se è presente height sarà sommato anche quello per l'altezza, in questo caso si calcola solo la larghezza
- *BORDER-BOX*
	- `width` e `height` includono:
	    - contenuto
	    - padding
	    - border
	- `dimensione totale = width (rimane fissa)`
- il contenuto si **riduce automaticamente** per far spazio a padding e border
```css
div {  
	box-sizing: border-box;  
	width: 200px;  
	padding: 20px;  
	border: 5px solid black;  
}
```
➡ larghezza totale = **sempre 200px**
- con `content-box` è difficile gestire layout precisi
- con `border-box`:
    - le dimensioni sono **prevedibili**
    - molto usato nei layout responsive
*MARGINI E INLINE*
- gli elementi **inline** (tipo `span` oppure `a`):
    - ignorano `margin-top` e `margin-bottom`
        - funziona solo`margin-left` , `margin-right`
    - elementi **replaced** (ad esempio il tag `img`)
        - accettano anche top e bottom
*COLLASSO DEI MARGINI*
- succede tra margini verticali (top/bottom)
👉 se due margini si incontrano:
viene preso solo il valore maggiore
Esempio:
```css
div1 { margin-bottom: 30px; }  
div2 { margin-top: 20px; }
```
➡ distanza reale = **30px (non 50)**
![[Pasted image 20260331121034.png]]
- i margini possono avere valori negativi
    - l’elemento si **sposta verso l’interno** rispetto alla posizione normale
    - può **sovrapporsi** ad altri elementi
		- uso:
		    - aggiustamenti fini del layout
		    - effetti particolari (overlap)
*OVERFLOW*
- controlla cosa succede quando il contenuto **esce dal box**
👉 NON riguarda solo il padding, ma il contenuto che “sborda”
```css
overflow: visible;  /* default */  
overflow: hidden;  
overflow: scroll;  
overflow: auto;
```
- `visible` (default)
    - il contenuto esce dal box
- `hidden`
    - il contenuto in eccesso viene **tagliato**
- `scroll`
    - barre di scorrimento sempre visibili
- `auto`
    - scroll solo se necessario
##### Background
- permette di controllare lo **sfondo di un elemento**
- si applica al box (contenuto + padding)
*PROPRIETÀ PRINCIPALI*
- `background-color:color`
- `opacity: valore;`
- `background-image: url("img.png");  `
- `background-repeat: repeat|no-repeat|repeat-x|repeat-y;` 
	- controlla se l’immagine si ripete (tiling)
- `background-position: center|top left|50% 50%;`  
- `background-attachment: scroll|fixed;`
	- controlla il comportamento durante lo scroll
	- `fixed` → sfondo fisso mentre la pagina scorre
- `background: url("img.png") no-repeat center fixed;`
	- shorthand del background
