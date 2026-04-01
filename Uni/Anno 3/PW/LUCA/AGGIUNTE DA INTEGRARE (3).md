# CSS: Box Model e Proprietà del Box
### Concetti Fondamentali
Ogni elemento in una pagina HTML viene renderizzato come un **box rettangolare**. 
- Le proprietà CSS definiscono le dimensioni, i bordi e lo spazio attorno a questi box.
- Il selettore universale `*` può essere utilizzato per applicare proprietà a **tutti** gli elementi della pagina (spesso usato per i reset di margini e padding).
- Per visualizzare i confini di un box durante il debug, è utile applicare temporaneamente un bordo:
  ```css
  div { 
	  border: 1px solid black; 
}
  ```


### Struttura del Box Model
Il box è composto da **4 aree concentriche**. Ogni area ha quattro lati: `top`, `right`, `bottom`, `left`.

#### A. Area del Contenuto (Content)
È la parte interna dove appare il testo o l'immagine.
- Controllata da `width` e `height`.

#### B. Area del Padding (Spazio Interno)
Spazio tra il contenuto e il bordo. Prende il colore di sfondo dell'elemento.
- **Shorthand:** `padding: [top] [right] [bottom] [left];` (es. `padding: 10px 20px 10px 20px;`)
- Se si usano meno valori:
    - 1 valore: tutti i lati.
    - 2 valori: top/bottom e left/right.

#### C. Area del Bordo (Border)
Circonda padding e contenuto.
- **Proprietà specifiche:**
    - `border-style`: `none` (default), `solid`, `dotted`, `dashed`, `double`, `groove`, `ridge`, `inset`, `outset`.
    - `border-width`: `thin`, `medium`, `thick` o valori in `px`/`em`.
    - `border-color`: nomi colore o valori RGB/HEX.
- **Shorthand:** `border: [width] [style] [color];` (es. `border: 2px solid red;`)
- È possibile definire singoli lati: `border-left`, `border-top`, ecc.

#### D. Area del Margine (Margin)
Spazio esterno che separa il box dagli altri elementi. È sempre trasparente.
- **Shorthand:** `margin: [top] [right] [bottom] [left];`
- **Valori negativi:** Si possono usare per spostare o sovrapporre elementi.


### Box Sizing: Calcolo delle Dimensioni
La proprietà `box-sizing` (introdotta in CSS3) determina come il browser calcola la larghezza e l'altezza totale.

| Proprietà | Descrizione | Calcolo Larghezza Totale |
| :--- | :--- | :--- |
| **`content-box`** (Default) | `width` e `height` si riferiscono solo al contenuto. | `width + padding + border` |
| **`border-box`** | `width` e `height` includono padding e border. | `width` (rimane fissa) |

**Esempio pratico (dalle slide):**
Un elemento con `width: 500px`, `padding: 20px` e `border: 2px`:
- Con `content-box`: Larghezza totale = $20+2+500+2+20 = \mathbf{544px}$.
- Con `border-box`: Larghezza totale = $\mathbf{500px}$ (il contenuto si restringe a $456px$).

![[Pasted image 20260401101607.png]]


### Comportamenti Particolari dei Margini
#### A. Collasso dei Margini (Margin Collapse)
Succede solo tra i margini **verticali** (top e bottom) di elementi adiacenti nel flusso normale.
- Quando si incontrano, non si sommano: viene preso solo il **valore maggiore**.
- **Eccezioni (Non collassano):** Elementi con `float`, `position: absolute` o elementi che non appartengono al flusso normale.

![[Pasted image 20260331121034.png]]

#### B. Elementi Inline
- Gli elementi **inline** (es. `<span>`, `<em>`) **ignorano** i margini `top` e `bottom`. Funzionano solo i margini `left` e `right`.
- **Eccezione:** Elementi **replaced** (es. `<img>`) si comportano diversamente e accettano margini su tutti i lati.


### Proprietà Overflow
Gestisce cosa succede quando il contenuto è troppo grande per il box che lo contiene:
- `visible`: (Default) Il contenuto esce dai bordi.
- `hidden`: Il contenuto in eccesso viene tagliato e nascosto.
- `scroll`: Aggiunge sempre le barre di scorrimento.
- `auto`: Aggiunge le barre di scorrimento solo se necessario.


### Gestione del Background (Sfondi)
Lo sfondo copre l'area del contenuto e del padding (ma non del margine).

*   **`background-color`**: Imposta un colore solido.
*   **`opacity`**: (CSS3) Imposta la trasparenza dell'intero elemento (valori da `0.0` a `1.0`).
*   **`background-image`**: Carica un'immagine (`url('immagine.jpg')`).
*   **`background-repeat`**: 
    - `repeat` (default): tilling orizzontale e verticale.
    - `repeat-x` / `repeat-y`: ripete solo in una direzione.
    - `no-repeat`: l'immagine appare una volta sola.
*   **`background-position`**: Definisce dove posizionare l'immagine (es: `top left`, `center`, `200px 50px`, `15% 100%`).
*   **`background-attachment`**: 
    - `scroll` (default): lo sfondo scorre con la pagina.
    - `fixed`: lo sfondo resta fermo mentre il contenuto scorre.
*   **Shorthand**: 
    ```css
    body {
        background: [color] [image] [repeat] [attachment] [position];
        /* Esempio */
        background: white url(foto.png) no-repeat fixed right top;
    }
    ```
