# Altre caratteristiche di Java

## Costanti
- In Java si usano con il modificatore **`final`**.  
- Convenzioni di scrittura:
	- **camelCase** → `final int piValue = 3;`  
	- **UPPERCASE + snake_case** → `final int MAX_VALUE = 100;`  
- Se la costante è universale, conviene dichiararla anche **`static`**:  
	- **`static final`** 

>[!question]- Perché `static final`?
>- **`final`**: significa che il valore non può essere modificato una volta assegnato.
>- **`static`**: rende la variabile condivisa tra tutti gli oggetti della classe. Se una costante è universale, `static` permette di non creare copie della costante per ogni oggetto, ma di condividerla.

👉 Esempio:
```java
class Esempio {
    static final int SONO_UNA_COSTANTE = 20;
    public static void main(String[] args) {
        System.out.println(SONO_UNA_COSTANTE);
    }
}
```

---

## Tipi primitivi
- **Interi**:  
  - `byte` (8 bit), `short` (16 bit), `int` (32 bit), `long` (64 bit).  
- **Virgola mobile**:  
  - `float` (32 bit), `double` (64 bit).  
- **Altri**:  
  - `boolean` (true/false),  
  - `char` (16 bit, codifica Unicode).  
- **String**: non è primitivo, è una classe speciale ma trattata con sintassi dedicata.  

### Valori di default (per campi non inizializzati)
$$\begin{array}{|c|c|}
\hline
\textbf{Data Type} & \textbf{Default Value (for fields)} \\
\hline
\text{byte} & 0 \\
\hline
\text{short} & 0 \\
\hline
\text{int} & 0 \\
\hline
\text{long} & 0L \\
\hline
\text{float} & 0.0f \\
\hline
\text{double} & 0.0d \\
\hline
\text{char} & '\textbackslash u0000' \\
\hline
\text{String (or any object)} & \text{null} \\
\hline
\text{boolean} & \text{false} \\
\hline
\end{array}$$

---

## Array
- Struttura dati che contiene elementi **dello stesso tipo**.  
- Due modi di dichiararli:

👉 Dinamica (con `new`):  
```java
int[] numeri = new int[5];
numeri[0] = 10;
```

👉 Statica (inizializzazione diretta):  
```java
int[] numeri = {10, 20, 30, 40, 50};
```

### Array multidimensionali
Un array può contenere altri array (anche di lunghezze diverse, irregolari):  
```java
String[][] names = {
    {"Mr. ", "Mrs. ", "Ms. "},
    {"Smith", "Jones"}
};
System.out.println(names[0][0] + names[1][0]); // Mr. Smith
```

### Copiare array
##### Usando `System.arraycopy`
All'interno della classe system, che è una classe utility fornita dalla libreria standard, è presente un metodo statico, `System.arraycopy`, che permette di copiare **una parte o tutto il contenuto** di un array dentro un altro array.

Questo metodo accetta ***5 parametri***
```java
System.arraycopy(Object src, int srcPos, 
				 Object dest, int destPos, 
				 int length);
```
Dove
- **`src`** è l'array di origine, da cui copiare i valori.
- **`srcPos`** è la posizione iniziale nell'array di origine, da cui iniziare a copiare.
- **`dest`** è l'array di destinazione, dove incollare i valori copiati.
- **`destPos`** è la posizione iniziale nell'array di destinazione, dove iniziare a incollare i valori.
- **`length`** è il numero di elementi da copiare.
***NB:*** gli elementi che vengono copiati in `dest` vanno a sovrascrivere quelli vecchi presenti da `destPos` in poi (ovviamente in base a `length`)

###### ESEMPIO
```java
class ArrayCopyEsempio {
    public static void main(String[] args) {
        int[] arrayOrigine = {1, 2, 3, 4, 5};
        int[] arrayDestinazione = {10, 20, 30, 40, 50};
	
        // Copia 3 elementi a partire dalla posizione 1 di arrayOrigine
        // e li incolla a partire dalla posizione 2 di arrayDestinazione
        System.arraycopy(arrayOrigine, 1, arrayDestinazione, 2, 3);
	
        // Stampa arrayDestinazione per vedere il risultato
        for (int i : arrayDestinazione) {
            System.out.print(i + " ");
            /* OUTPUT
		       {10, 20, 2, 3, 4}
        }
    }
}
```


##### Usando `Arrays.copyOfRange`
```java
class ArrayCopyEsempio {
    public static void main(String[] args) {
        int[] arrayOrigine = {1, 2, 3, 4, 5};
	
        // Creo un nuovo array copiando dall'elemento 2 al 5 (non incluso) di                 arrayOrigne
        int[] arrayDestinazione = java.util.Arrays.copyOfRange(arrayOrigine, 2, 5)
	
        // Stampa arrayDestinazione per vedere il risultato
        for (int i : arrayDestinazione) {
            System.out.print(i + " ");
            /* OUTPUT
		       {2, 3, 4}
        }
    }
}
```
Più semplice da scrivere, utile per **leggere** valori.

---

## Operatori

### Incremento/decremento
Se io scrivo come statement, da solo `a++` oppure `++a` non cambia nulla.
MA se io ho `a = 5` e scrivo 
- **`b = ++a`**, PRIMA viene INCREMENTATO `a` (`a = 6`) e poi assegno questo valore a `b` (`b = 6`)
- **`b = a++`**, PRIMA viene ASSEGNATO il valore a `b` (`b = 5`) e poi viene incrementato `a` (`a = 6`)

### Shift (<<, >>, >>>)
Gli operatori di **shift** spostano i bit di un numero a sinistra o a destra. Funzionano solo su valori numerici e spostano i bit di un numero binario per modificare il valore.
- **`<<` (shift a sinistra)**: sposta i bit a sinistra e riempie con zeri a destra. Ogni spostamento a sinistra equivale a moltiplicare per 2.
    ```java
    int a = 5; // 5 in binario è 00000101
	int b = a << 1; // sposta di 1 bit a sinistra: 00001010
	// b ora vale 10
	```

- **`>>` (shift a destra con segno)**: sposta i bit a destra, mantenendo il segno del numero (riempiendo con 0 se positivo o con 1 se negativo).
    ```java
    int a = 20; // 00010100
	int b = a >> 2; // sposta di 2 bit a destra: 00000101
	// b ora vale 5
	```

- **`>>>` (shift a destra senza segno)**: sposta i bit a destra, riempiendo con zeri, indipendentemente dal segno del numero.

### `instanceof`
Controlla se un oggetto appartiene a una classe o interfaccia.

**Esempio pratico**
```java
	class Animale {}
	class Cane extends Animale {}

	class instanceofprova{
		public static void(String[] args){
			Animale animale = new Animale();
			Cane cane = new Cane();
			
			System.out.println(cane instanceof Animale);  // true, perché `cane` è                                                              un'istanza di `Cane`,                                                              che deriva da                                                                      `Animale`
			System.out.println(animale instanceof Cane);  // false, perché                                                                      `animale` è un                                                                     `Animale` generico e                                                                non un `Cane`
		}
	}
```

>[!warning] ***ATTENZIONE***: se due oggetti sono di classi diverse ma condividono un'interfaccia diventano fratelli quindi `instanceof` restituisce `true`


### Operatori bitwise
###### **Bitwise AND (&)**
L’operatore **Bitwise AND** (`&`) effettua un’operazione logica AND tra i **bit** di due numeri. Funziona confrontando i bit di due numeri binari e ritorna 1 solo se entrambi i bit sono 1.
```java
int a = 5;  // 0101 in binario
int b = 3;  // 0011 in binario
int risultato = a & b; // 0001 (1 in decimale)
```

###### **Bitwise Exclusive OR (XOR) (`^`)**
L’operatore **Bitwise XOR** (`^`) effettua un’operazione logica esclusiva OR sui **bit**. Restituisce 1 solo se **i bit sono diversi**.
```java
int a = 5;  // 0101 in binario
int b = 3;  // 0011 in binario
int risultato = a ^ b; // 0110 (6 in decimale)
```

###### **Bitwise Inclusive OR (`|`)**
L’operatore **Bitwise OR** (`|`) effettua un’operazione logica OR tra i **bit**. Ritorna 1 se **almeno uno dei bit** è 1.
```java
int a = 5;  // 0101 in binario
int b = 3;  // 0011 in binario
int risultato = a | b; // 0111 (7 in decimale)
```

###### **Operatore Ternario (`? :`)**
L'**operatore ternario** è una scorciatoia per l'istruzione `if-else`. 
Ha la forma `condizione ? valoreSeVero : valoreSeFalso`, e ritorna un valore in base alla valutazione della condizione.
```java
int a = 10;
int b = 20;
int max = (a > b) ? a : b; // max sarà uguale a b, quindi 20
```



---

## Print vs Println
- `System.out.print()` → stampa sulla stessa riga.  
- `System.out.println()` → stampa e va a capo.  

---

## ASCII e Unicode
- **ASCII**: standard originario a 7 bit (poi 8), usato per lettere, cifre e simboli base.  
- **Unicode**: tabella universale per rappresentare tutti i caratteri dei vari alfabeti.  
- **UTF-8**: codifica più diffusa, compatibile con ASCII, usa 1-4 byte per carattere.  
- In Java, `char` è a 16 bit (Unicode), e `String` usa UTF-16.  

---

## Classe `Math`
- Contiene metodi e costanti matematiche (ad esempio `Math.PI`, `Math.sqrt()`).  
- Tutti i metodi sono **statici**, quindi si usano direttamente con la classe:  
```java
double radice = Math.sqrt(25); // 5.0
```
