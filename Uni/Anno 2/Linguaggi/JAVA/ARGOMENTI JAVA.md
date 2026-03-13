# PROGRAMMAZIONE PROCEDURALE
Si sviluppa con l’idea di riutilizzare blocchi di codice:
- **subroutine**: blocchi di codice riusabili, eseguibili più volte.  
- **procedure**: simili a subroutine, accettano parametri ma non restituiscono valori (modificano variabili globali).  
- **funzioni**: procedure che restituiscono un valore.  
- **metodi**: concetto simile alle funzioni, ma legato alla programmazione a oggetti.

# PROGRAMMAZIONE A OGGETTI
Si avvicina al modo naturale di pensare, rendendo il codice più intuitivo:
- Organizza il codice in **oggetti**, entità con un ciclo di vita (possono essere creati e distrutti).  
- Una **classe** è una “famiglia” di oggetti e definisce un nuovo tipo di dato.  

# PRINCIPI FONDAMENTALI
1. **Incapsulamento (Encapsulation)**  
	- Separare i problemi in più parti, nascondendo i dettagli implementativi, rendendo il codice più leggibile e manutenibile.
2. **Astrazione (Abstraction)**  
	- Usare oggetti e classi in modo astratto, senza preoccuparsi della loro implementazione interna.  
	- Permette di concentrarsi sul “cosa fa” piuttosto che sul “come lo fa”.
3. **Ereditarietà (Inheritance)**  
	- Consente di riutilizzare il codice creando nuove classi basate su classi esistenti.  
	- Le sottoclassi ereditano attributi e metodi della superclasse, riducendo ridondanze.
4. **Polimorfismo (Polymorphism)**  
	- Permette a oggetti di classi diverse, ma correlate, di essere trattati come oggetti della stessa superclasse.  
	- Due forme principali:
	     - **Overriding**: una sottoclasse ridefinisce un metodo della superclasse → risolto a **runtime**.  
	     - **Overloading**: più metodi con lo stesso nome ma firme diverse → risolto a **compile-time**.  


---


# Strumenti Java
- **java**: l’interprete che esegue il bytecode.  
- **javac**: il compilatore che converte il sorgente in bytecode.  
- **javadoc**: genera automaticamente documentazione HTML a partire dai commenti nel codice.  

# API (Application Programming Interface)
Le API Java sono insiemi di classi, interfacce e pacchetti che forniscono funzionalità già pronte.
Esempi:  
- `java.util`: collezioni di dati (liste, set, mappe).  
- `java.io`: input/output da file e flussi.  
- `java.net`: programmazione di rete (socket, URL, HTTP).


---

# Caratteristiche di Java
## Funzione VS Metodo
- ***Funzione***: è un **blocco di codice indipendente**, che prende dei valori in ingresso e restituisce un risultato.
	- tipiche di linguaggi come C e Python
- ***Metodo***: è una funzione che appartiene a una classe o a un oggetto
	- Per chiamarla, serve sapere **a quale oggetto o classe** appartiene.
	- In Java **tutte le funzioni sono metodi**, perché tutto deve stare dentro una classe.


## Stringhe
In Java, le stringhe non sono tipi primitivo (come `int` o `double`) ma sono **oggetti della classe `String`** che si trova nel package `java,lang`.

#### Metodo `toString`
`toString()` è un metodo ereditato dalla classe base **`Object`**, quindi **tutte le classi in Java lo possiedono** (anche se non lo riscriviamo).  
Serve per ottenere una **rappresentazione testuale** (stringa) dell’oggetto. Esempio base: 
```java
Object o = new Object(); System.out.println(o.toString());
```
- come output tipico hai l'identificativo dell'oggetto,
- se invece fai override puoi printare quello che vuoi


## Librerie
- In Java la maggior parte delle classi utili è già inclusa (nel package `java.lang`).  
- Per altre funzionalità (collezioni, I/O, rete, ecc.) bisogna importare le librerie tramite `import`.  
- Ciò che importiamo sono **classi**, con i loro metodi e attributi.


## Classpath
- Quando compilo un file `ES1.java`, `javac` genera `ES1.class`.  
- Questo `.class` viene caricato dalla JVM seguendo il **classpath**, ovvero il percorso in cui si cercano le classi compilate.  
- Possiamo modificare il classpath con l’opzione `-cp`.  


## Oggetti
Un **oggetto** è un’entità concreta creata a partire da una **classe**.
- Ha uno **stato** → rappresentato dai valori delle sue variabili di istanza (campi).
- Ha un **comportamento** → definito dai metodi della classe.
- Ha un’**identità** → ogni oggetto occupa una posizione unica in memoria, anche se ha gli stessi valori di un altro oggetto.
#### Creazione di un oggetto
All'interno del main scrivo
```java
NomeClasse NomeOggetto = new NomeClasse(parametri)
```

>[!question]- Se faccio una uguaglianza tra due puntatori ad oggetti?  `oggetto1 = oggetto2`
> Avrò lo stesso puntamento a memoria quindi entrambe puntano allo stesso oggetto


## Ereditarietà
Una sottoclasse eredita tutte le caratteristiche della superclasse (o classe madre) e può aggiungerne di nuove.  
- In Java non esiste **ereditarietà multipla** tra classi.  
- È possibile ridefinire un metodo della superclasse usando `@Override`
- Una sottoclasse può richiamare il **Costruttore** della superclasse con `super(...)`


## Interfacce
Un’interfaccia definisce un **contratto**, ossia un insieme di metodi che una classe <u>DEVE</u> implementare.  
Serve quindi a definire il comportamento che deve assumere una classe.
- Le classi usano `implements` per adottare un’interfaccia.  
- Posso implementare più interfacce contemporaneamente.  

>[!question]- A che servono quindi le interfacce? 
>Le interfacce servono per **fornirci un vocabolario unificante per permettere l’interoperabilità tra oggetti.**
>Interoperabilità indica la capacità di essere flessibile e integrare più linguaggi di programmazione o servizi esterni.
>Java non è un ecosistema chiuso.

#### Costanti nelle interfacce
Oltre ai prototipi, nelle interfacce posso inserire anche le costanti, come
Quindi se implemento quell'interfaccia dovrò usare `pigreco` e so che vale 3.14.

#### Signature
Per signature si intende la firma di un metodo che si trova in una classe o in un'interfaccia.
Una signature è composta da:
- nome del metodo
- l'ordine e il tipo di parametri del metodo

Possiamo sfruttarla per differenziare metodi con lo stesso nome (overloading)
```java
public interface Signature {
	public sborra(String pisello, int lunghezza); // tutta la riga è la signature
	public sborra(String nome, String pisello, int lunghezza); // signature	
}
```

#### Problema delle interfacce
Se ho un'interfaccia modificata da 1000 classi e, in un futuro, la aggiorno aggiungendo un prototipo, si crea un problema: tutte le classi ora saranno obbligate a implementare quel metodo.
Due soluzioni
1. ***Creo una sotto-interfaccia***, con `extends`, così chi vuole utilizzare quel metodo deve solo cambiare interfaccia e le altre stanno nel chill
2. vado a **creare**, all'interno dell'interfaccia stessa, ***un metodo di default*** che vale per tutte le classi che la implementano ma che non sono costretti ad utilizzare. SCRIVO IL METODO E NON SOLO IL PROTOTIPO. È brutto perché si va a perdere il concetto di interfaccia.



## Package
- Un **package** è come una cartella che contiene classi correlate.  
- Serve a organizzare il codice e ad evitare conflitti di nomi.  

>[!tip] Il **nome del package** deve essere la prima istruzione del file `.java` e va importato.

## Variabili in Java
Tipologie:  
1. **Variabili globali** 
2. **Variabili di istanza** (o campi):
	- sono variabili definite direttamente all'interno di una classe ma **fuori da qualsiasi metodo**.
	- rappresentano le **caratteristiche** o lo **stato** di un oggetto della classe e sono quindi memorizzate per ogni istanza creata.
	- sono composti da tre componenti, in ordine
		- zero o più **modificatori**, come `public` o `private`
		- il **tipo**
		- il **nome**
	
3. **Variabili locali**: dichiarate dentro un metodo:
	- sono dichiarate all'interno di un **metodo**, un **blocco di codice**, o un **costruttore**.
	- esistono solo all'interno di quello specifico metodo o blocco e **non possono essere utilizzate** all'esterno di esso.
	- non conservano il valore quando il metodo termina.
	
4. **Parametri**:
	- sono variabili che vengono dichiarate all'interno della **firma di un metodo**.
	- servono per ricevere valori passati al metodo quando viene chiamato.
	- esistono solo all'interno del metodo in cui sono definiti.

👉 Differenza:  
- **Parametro**: variabile formale dichiarata nel metodo.  
- **Argomento**: valore passato quando il metodo viene chiamato.  

## Non static
- **Non statico**: ogni oggetto ha il proprio valore della variabile.  
	Se modifico la variabile in un oggetto, non cambia nelle altre istanze.
>[!tip]- Esempio
>```java
>class Persona {
>    String nome; // variabile non statica
>}
>```
>
>Ora ogni oggetto persona avrà il proprio personale nome.
>

## Static
Normalmente, campi (variabili) e metodi appartengono **agli oggetti**: ogni volta che crei un nuovo oggetto hai la **tua copia** delle variabili e puoi chiamare i metodi su quell’oggetto.

Con la parola chiave **`static`**, invece, stai dicendo che quella variabile o quel metodo **non appartiene a un singolo oggetto**, ma alla **classe stessa**.    
- Vuol dire che **c’è una sola copia condivisa** da tutti gli oggetti.
- Puoi accedere al membro statico **senza creare un oggetto**, usando direttamente il nome della classe.

>[!tip]-  Variabili di classe (campi statici)
>```java
>class Persona {
>    String nome;
>}
>
>public class Main {
>    public static void main(String[] args) {
>        Persona p1 = new Persona();
>        p1.nome = "Mario";
>		
>        Persona p2 = new Persona();
>        p2.nome = "Luigi";
>		
>        System.out.println(p1.nome); // Mario
>        System.out.println(p2.nome); // Luigi
>    }
>}
>```
>➡️ Ogni oggetto (`p1`, `p2`) ha la **sua copia** di `nome`.
>
>
>```java
>class Persona {
>    static String specie = "Homo Sapiens"; // variabile statica
>}
>
>public class Main {
>    public static void main(String[] args) {
>        System.out.println(Persona.specie); // accesso diretto senza oggetti
>    }
>}
>```
>➡️ `specie` è **unica e condivisa**: non importa quanti oggetti creo, il valore è sempre quello per tutti.
#### Metodi di Classe (Metodi Statici)
I metodi statici sono associati alla classe piuttosto che a un oggetto particolare. Possono essere chiamati senza creare un'istanza della classe.
Si deve fare un eventuale passaggio di parametri (nel `main`) per comunicare con questo metodo
```java
public class Calcolatrice {
    public static int somma(int a, int b) {
        return a + b;
    }
}
```
➡️ Il metodo `somma` è della **classe** `Calcolatrice`, non di un singolo oggetto.

E nel main io scrivo questo
```java
int risultato = Calcolatrice.somma(3, 4);  // Risultato: 7
```

Qui, la classe `Calcolatrice` non richiede la creazione di un oggetto, quindi nel main posso richiamare direttamente la classe, con `Clacce.metodo(parametri)`.


## Heap
- L’**Heap** è l’area di memoria dove vengono creati gli **oggetti** (quando uso `new`).
- Ogni oggetto con le sue **variabili non statiche** vive lì.
- Le variabili **statiche** invece non stanno nell’Heap ma in un’area separata gestita dalla JVM (metaspace / metodo area).
- La memoria nell’Heap viene gestita automaticamente dal **Garbage Collector** (procedura): quando un oggetto non è più referenziato, viene eliminato.

```java
class Libro {
    String titolo;        // variabile di istanza (va nell'Heap)
    static int totale = 0; // variabile statica (non va nell'Heap)
    
    Libro(String t) {
        titolo = t;
        totale++;
    }
}
```

## Costanti
- In Java si usano con il modificatore **`final`**, ossia il valore non può essere modificato una volta assegnato. 
	- SE VOGLIO RENDERLA UNIVERSALE -> `static final`
```JAVA
class Esempio {
    static final int SONO_UNA_COSTANTE = 20;
    public static void main(String[] args) {
        System.out.println(SONO_UNA_COSTANTE);
    }
}
```

## Tipi primitivi
- **Interi**:  
  - `byte` (8 bit), `short` (16 bit), `int` (32 bit), `long` (64 bit).  
- **Virgola mobile**:  
  - `float` (32 bit), `double` (64 bit).  
- **Altri**:  
  - `boolean` (true/false),  
  - `char` (16 bit, codifica Unicode).  
- **String**: non è primitivo, è una classe speciale ma trattata con sintassi dedicata.  

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
    }
}
```
Più semplice da scrivere, utile per **leggere** valori.

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

## Classe `MAth`
Contiene tutti i metodi e costanti matematiche
- i metodi sono tutti `statici`


## Espressioni
Un’espressione è una combinazione di **variabili**, **operatori** (come `+`, `-`, `/`) e, talvolta, **chiamate a metodi**, che insieme producono un valore. 
- `1 + 2`
- `System.out.println("Ciao")`
#### Precedenza degli operatori
Ogni operatore ha una “precedenza” (quelle matematica) che ovviamente Java rispetta.

## Statement
- Uno **statement** è un’istruzione completa.  
	- Contiene di solito un’espressione.  
Esempi:  
- Assegnazione: `aValue = 5;`  
- Incremento: `aValue++;`  
- Invocazione metodo: `System.out.println("Hi");`  
- Creazione oggetto: `Bicycle b = new Bicycle();`  

## Blocchi
- Sequenza di istruzioni racchiuse tra `{}`.  
- Usati in `if`, `while`, `for`, `class`, `method`.  

## Control Flow Statements
Un **control flow statement** è un’istruzione che gestisce l’ordine in cui vengono eseguiti i blocchi di codice, determinando **il flusso di esecuzione del programma**.

Abbiamo diversi tipi
1. **Condizionali**
   - `if`, `if-else`: eseguono un blocco se la condizione è vera.  
   - `switch`: seleziona tra più casi. 
	   - Supporta `int`, `char`, `String`, ma **non** `float`, `double`, `boolean`.  
```java
int giorno;

switch (giorno) {
    case 1:
        System.out.println("Lunedì");
        break;
    case 2:
        System.out.println("Martedì");
        break;
    default: // opzionale, se non lo metto non restituisce nulla e va bene
        System.out.println("Altro giorno");
}
```

2. **Cicli**
   - `for`: ripete un numero definito di volte.  
   - `while`: ripete finché condizione vera.  
   - `do-while`: garantisce che il blocco venga eseguito almeno una volta, poi controlla la condizione.  

3. **Interruzioni di flusso**
   - `break`: interrompe ciclo o switch.  
```java
for (int i = 0; i < 10; i++) {
    if (i == 5) {
        break; // Interrompe il ciclo quando i è 5
    }
    System.out.println(i);
}
```

   - `break etichettato`: esce da cicli annidati.  
```java
etichetta: // Etichetta per il ciclo esterno
for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
        if (i == 1 && j == 1) {
            break etichetta; // Esce dal ciclo esterno, si collega a etichetta e 
                             // salta TUTTO il blocco
        }
        System.out.println("i: " + i + ", j: " + j);
    }
}
```

   - `continue`: salta l'iterazione corrente e passa all’iterazione successiva.  
```java
for (int i = 0; i < 10; i++) {
    if (i % 2 == 0) {
        continue; // Salta i numeri pari
    }
    System.out.println(i);
}
```

   - `return`: termina l'esecuzione di un metodo (e opzionalmente restituisce un valore).  
```java
public int somma(int a, int b) {
    return a + b; // Interrompe il metodo e restituisce il risultato
}
```
>[!warning] DEVO SEMPRE SCRIVERE COSA RITORNARE, `return` da solo non va bene.


## Classi
In Java una **classe** è un _modello_ (o stampo) che serve per creare oggetti.
### Componenti di una classe
1. **Campi (attributi)** → variabili che descrivono lo stato di un oggetto e sono dichiarati all'interno della classe ma fuori dai metodi.  
2. **Costruttori** → è uno **speciale metodo** che viene chiamato automaticamente quando si crea un nuovo oggetto di una classe.
	- serve per **inizializzare** i campi di un oggetto.
	- ha lo stesso nome della classe e non ha un tipo di ritorno.
3. **Metodi** → funzioni che definiscono il comportamento della classe.  
	- possono modificare lo stato di un oggetto (cambiando i valori dei campi) o eseguire altre operazioni.
### Esempio
```java
public class Automobile {
	
	// La classe Automobile ha tre campi
    int velocita;
    int marcia;
    int carburante;
	
    
    // La classe Automobile ha un costruttore
    public Automobile(int v, int m, int c) {
        velocita = v;
        marcia = m;
        carburante = c;
    }
	
    
    // La classe Automobile ha due metodi
    public void accelera(int inc) { velocita += inc; }
    public void frena(int dec) { velocita -= dec; }
}
```

### Ereditarietà (`extends`)
L’**ereditarietà** è un meccanismo della programmazione a oggetti che permette a una **classe (sottoclasse)** di **riutilizzare** i campi e i metodi di un’altra **classe (superclasse)**.

La sottoclasse può:   
- **usare** direttamente ciò che eredita,
- **specializzare** i comportamenti ridefinendo metodi (`@Override`),
- **aggiungere** nuovi campi e metodi.
  
In Java l’ereditarietà tra classi è **singola**: una classe può estendere solo una superclasse (`extends`).


### Implementazione di interfacce (`implements`)
Usato quando una **classe** si impegna a rispettare il **contratto** definito da una o più interfacce.
- Tutti i metodi dell’interfaccia devono essere implementati dalla classe (a meno che non sia `abstract`).
- Una classe può **implementare più interfacce**, simulando una forma di ereditarietà multipla per i comportamenti.


## Metodi
Gli unici elementi di base richiesti nella dichiarazione di un metodo sono 
- il **tipo** restituito
- il **nome**
- un paio di parentesi `()` con eventualmente dei parametri
- un corpo tra le graffe `{}`

IN GENERALE, la dichiarazione di un metodo ha sei componenti, in ordine.
Partiamo da questo esempio
```java
public int calcolaDoppio(int numero) {
    return numero * 2;
}
```

>[!lemma]- DEFINIZIONE: FIRMA
>La firma del metodo (o method signature) è una combinazioni di due componenti della dichiarazione di un metodo.
>1. nome del metodo
>2. tipi dei parametri del metodo, nell'ordine in cui appaiono
>
>La firma di un metodo non include né il tipo di ritorno né i nomi dei parametri; conta solo il nome del metodo e i tipi dei parametri.
>
>### Perché la Firma del Metodo è Importante?
La firma del metodo è ciò che distingue un metodo dagli altri all'interno di una classe. Java utilizza la firma per capire quale metodo chiamare in caso di _overloading_ (sovraccarico di metodi), cioè quando esistono più metodi con lo stesso nome ma con tipi o numeri di parametri diversi.
>#### Esempio
>Consideriamo questi metodi
>```java
>public class Calcolatrice {
>
>   public int somma(int a, int b) {
>        return a + b;
>    }
>
>    public double somma(double a, double b) {
>        return a + b;
>    }
>
>    public int somma(int a, int b, int c) {
>        return a + b + c;
>    }
>}
>```
>In questo esempio, tutti e tre i metodi si chiamano `somma`, ma le loro firme sono diverse:
>
>1. `somma(int, int)` – nome del metodo `somma` e parametri `int, int`.
>2. `somma(double, double)` – nome del metodo `somma` e parametri `double, double`.
>3. `somma(int, int, int)` – nome del metodo `somma` e parametri `int, int, int`.


## Costruttore
Un **costruttore** è un blocco di codice speciale in una classe che viene chiamato quando viene creato un nuovo oggetto. Serve per **inizializzare l'oggetto**, impostando i valori iniziali dei campi (attributi) secondo le specifiche desiderate.

##### Come Appare un Costruttore?
Un costruttore:
- Ha lo **stesso nome della classe**.
- Non ha un **tipo di ritorno**

##### Creare un oggetto con un costruttore
Riprendendo la classe `Automobile` che abbiamo visto prima, possiamo creare un oggetto inserendo nel main questo:
```java
Automobile fiatPunto = new Automobile(0, 1, 60)
```
Questo codice:
- **Alloca spazio in memoria** per un nuovo oggetto `Automobile`.
- Chiama il costruttore `Automobile(int, int, int)` per **inizializzare i campi** `velocità`, 
  `marcia`, e `livelloCarburante` con i valori `0`, `1`, e `60`, rispettivamente.

###### Costruttori Multipli
Una classe può avere **più costruttori**, ciascuno con un diverso numero e tipo di parametri. Questo è utile per creare oggetti con diverse configurazioni iniziali.

###### Costruttori di Default
Se non dichiari nessun costruttore, il compilatore Java crea "automaticamente" (se lo crea da solo ma noi non lo vediamo) un **costruttore di default senza argomenti** per la tua classe. Questo costruttore chiama il costruttore senza argomenti della superclasse.

###### Uso dei Costruttori della Superclasse
In una classe che estende un'altra (sottoclasse), puoi chiamare il costruttore della superclasse usando `super(...)`. Questo permette di inizializzare i campi della superclasse.
```java
super(v, m);  // passo gli argomenti
```

### Passare informazioni a un metodo o ad un costruttore
Due concetti fondamentali
- **Parametri**: sono le **variabili dichiarate nella firma** del metodo o del costruttore. Sono come "segnaposto" per i dati che il metodo userà quando viene chiamato.
- **Argomenti**: sono i **valori reali** passati al metodo al momento della chiamata, che devono corrispondere in `tipo` e `ordine` ai parametri.

#### Tipi di parametri
Posso usare qualsiasi tipo di dato come parametro:  
- **Primitivi**: int, double, float, char, boolean 
- **Riferimento**: oggetti e array

#### Passare un numero variabile di argomenti
Quando non sappiamo in anticipo quanti argomenti verranno passati al metodo possiamo usare una funzionalità java chiamata `varargs` (variadic arguments).
###### Come funziona?
Quando dichiari un metodo, scrivi
- tipo del parametro
- tre puntini e spazio `(... )`
- nome parametro
In questo modo, all'interno del metodo questo parametro verrà trattato come un **array**.

##### UTILITÀ PRATICA DEL VARARGS
Il `varargs` può accettare anche tipi di dati diversi contemporaneamente utilizzando `Object... NOME`.
>[!lemma]- OBJECT
>In Java, `Object` è un **tipo di dato** (più precisamente, è la classe base di tutte le classi).
>Quindi io posso creare un array di `Object` (`Object[]`) che può contenere **qualsiasi tipo di oggetto**.

##### LIMITAZIONI DI VARARGS
1. Posso passare un solo parametro varargs per metodo.
2. Il parametro `varargs` (`...`) deve essere l'ultimo nella lista di parametri


### Nomi dei parametri -> `this`
Se un parametro ha lo stesso nome di un campo all'interno della classe si usa `this` per distinguerli.


## Accedere ai campi di un oggetto
- all'interno di una classe -> uso i nomi
- dall'esterno di una classe -> uso `OGGETTO.NOME_CAMPO`
- direttamente in fase di creazione -> `int altezza = new Rettangolo(10, 20).altezza;`


## Garbage Collector
Il **Garbage Collector** (GC) in Java è un meccanismo automatico che gestisce la memoria, liberando spazio occupato da oggetti non più utilizzati dal programma. In pratica, quando un oggetto non ha più riferimenti che lo puntano, il Garbage Collector lo elimina per recuperare la memoria.


## Ritorno di un valore da un metodo
Un metodo in Java ritorna al punto in cui è stato chiamato in tre situazioni:
1. Quando completa tutte le istruzioni all'interno del metodo.
2. Quando raggiunge un'istruzione `return`.
3. Quando lancia un'eccezione.

In altre parole, appena il metodo ha finito di eseguire il suo lavoro in uno di questi modi, restituisce il controllo al codice che lo ha invocato.

Bisogna sempre dichiarare il tipo di ritorno di un metodo e usare `return ELEMENTO CHE RISPETTA IL TIPO`.

In un metodo `void` possiamo usare `return;` per uscire dal metodo se necessario.

## Return di una classe
Quando un metodo ha come tipo di ritorno una **classe**, può restituire:
- un oggetto **esattamente di quella classe**,
- oppure un oggetto di una **sottoclasse**.
```java
public Number returnANumber() {
    return new Integer(5);   // OK, Integer è una sottoclasse di Number
}
```

#### Return di un’interfaccia
Un metodo può avere come tipo di ritorno anche un’**interfaccia**.  
In questo caso, l’oggetto restituito deve essere di una **classe che implementa quell’interfaccia**.
```java
interface Animale {
    void verso();
}

class Cane implements Animale {
    public void verso() { System.out.println("Bau!"); }
}

public Animale creaAnimale() {
    return new Cane(); // valido perché Cane implementa Animale
}
```

## Livelli di accesso
- `public` -> **visibile a tutti**, a qualsiasi classe di qualsiasi pacchetto.
- `protected` -> **visibile all'interno del pacchetto** in cui è definito, **e** nelle **sottoclassi** (anche se sono in un altro pacchetto). 
- `package-private` (nessun modificatore) -> se non scrivi nulla, il campo o metodo è visibile solo **all'interno del pacchetto** in cui si trova la classe.
- `private` -> visibile solo **all'interno della classe** in cui è dichiarato.

| <center>MODIFICATORE</center>              | CLASSI              | PACCHETTO           | SOTTOCLASSI         | WORLD               |
| ------------------------------------------ | ------------------- | ------------------- | ------------------- | ------------------- |
| <center>***public***</center>              | <center>SI</center> | <center>SI</center> | <center>SI</center> | <center>SI</center> |
| <center>***protected***</center>           | <center>SI</center> | <center>SI</center> | <center>SI</center> | <center>NO</center> |
| <center>***nessun modificatore***</center> | <center>SI</center> | <center>SI</center> | <center>NO</center> | <center>NO</center> |
| <center>private</center>                   | <center>SI</center> | <center>NO</center> | <center>NO</center> | <center>NO</center> |


## Inizializzazione campi
L'inizializzazione dei campi di una classe può essere gestita in diversi modi.
- **DIRETTA** -> assegno un valore iniziale a un campo direttamente nella sua dichiarazione
```java
public class Esempio {
    private int numero = 10;
    private String testo = "Ciao";
}
```

- **NEI COSTRUTTORI** -> i costruttori permettono di inizializzare i campi al momento della creazione di un'istanza della classe. Questo è utile quando l'inizializzazione dipende da parametri o richiede logica specifica.
```java
public class Esempio {
    private int numero;
    private String testo;
	
    public Esempio(int numero, String testo) {
        this.numero = numero;
        this.testo = testo;
    }
}
```

- **BLOCCHI DI INIZIALIZZAZIONE** -> si tratta di un insieme di istruzioni racchiuse tra `{}` che vengono eseguite ogni volta che un oggetto della classe viene creato.
```java
public class Esempio {
    private int numero;
    private String testo;
	
    // Blocco di inizializzazione
    {
        numero = 5;
        testo = "Inizializzato";
    }
	
    public Esempio() {
        // Il blocco di inizializzazione viene eseguito prima di questo costruttore
        // il valore di numero rimarrà 5 perché non ho passato nulla come parametro
    }
	
    public Esempio(int numero) {
        this.numero = numero;
        // Il blocco di inizializzazione viene eseguito prima di questo costruttore
        // il valore di numero verrà cambiato in base a quello nel parametro
    }
}
```

- **BLOCCHI DI INIZIALIZZAZIONE STATICI** -> per i campi statici, che appartengono alla classe piuttosto che alle istanze, si utilizzano blocchi di inizializzazione statici. Questi vengono eseguiti una sola volta, quando la classe viene caricata.
	- Dopo che il blocco è stato eseguito, il valore rimane valido per tutta la durata del programma.
```java
public class Esempio {
    private static int valoreStatico;
	
    static {
        valoreStatico = 100;
    }
}
```


## Classi annidate
In Java, è possibile definire una classe all'interno di un'altra classe; questa è chiamata **classe annidata** (_nested class_). 

#### Classi annidata statica
Sono dichiarate con il modificatore `static` e non hanno accesso diretto ai membri dell'istanza esterna.
```java
public class Esterna {
    static class AnnidataStatica {
        void metodo() {
            System.out.println("Classe annidata statica");
        }
    }
}
```

#### Classe interna (NON statica)
Non sono dichiarate con `static`  e possono accedere direttamente ai membri dell'istanza della classe esterna, anche se dichiarati `private`.
```java
public class Esterna {
    private int dato = 5;
	
    class Interna {
        void mostraDato() {
            System.out.println("Dato: " + dato);
            // posso accedere a "dato" perché la classe "Interna" si trova dentro 
            // la classe "Esterna"
        }
    }
}
```

#### Shadowing
Lo **shadowing** (oscuramento) avviene quando **dichiari una variabile con lo stesso nome** di un’altra variabile che esiste in un ambito più esterno.
- In quel punto, la variabile più **interna** “vince” → “oscura” quella esterna, che diventa **inaccessibile direttamente col nome**.
```java
public class Esterna {
    int x = 10;
	
    class Interna {
        int x = 20;
		
        void mostraValori(int x) {
            System.out.println("x locale: " + x); // Variabile locale al metodo
            System.out.println("x di Interna: " + this.x); // Variabile di Interna
            System.out.println("x di Esterna: " + Esterna.this.x); // Variabile di 
                                                                   // Esterna
        }
    }

    public static void main(String[] args) {
        Esterna esterna = new Esterna();
        Esterna.Interna interna = esterna.new Interna();
        interna.mostraValori(30);
    }
}
```
Quindi
- se mi riferisco alla **variabile nel metodo la chiamo direttamente**
- se mi riferisco alla **variabile della classe interna in cui si trova il metodo** uso `this.VABIABILE`
- se mi riferisco alla v**ariabile della classe esterna** uso `ESTERNA.this.VARIABILE`


## Classi Locali
Le classi locali sono delle **classi definite all'interno di un blocco** (ad esempio un metodo, ciclo, istruzione).
Posso dichiararle ovunque nel codice, purché all'interno di un blocco delimitato da `{}`.

```java
public void exampleMethod() {
    class LocalClass {
        void printMessage() {
            System.out.println("Sono una classe locale!");
        }
    }
    
    LocalClass local = new LocalClass();
    local.printMessage();
}
```
In questo caso il metodo `exampleMethod` crea una classe.

#### Accesso ai membri esterni alle classi locali
- Se la classe locale **è definita in un metodo `statico`** -> può accedere solo ai membri statici
```java
public class StaticExample { // Classe esterna
    static String staticMessage = "Ciao statico!"; // Membro statico
    String instanceMessage = "Ciao istanza!"; // Membro di istanza (non 
                                              //accessibile direttamente)
	
    public static void staticMethod() { // Metodo statico
        // Classe locale definita dentro un contesto statico
        class LocalClass {
            void printMessage() {
                System.out.println(staticMessage); // OK, il membro è statico
                System.out.println(instanceMessage); // ERRORE: non può accedere a                                                                 membri non statici
            }
        }
    }
}
```

- Se la classe locale è definita **in un metodo `non static`** -> può accedere a qualsiasi membro
```java
public class NonStaticExample { // Classe esterna
    static String staticMessage = "Ciao statico!"; // Membro statico
    String instanceMessage = "Ciao istanza!"; // Membro di istanza 
	
    public void nonStaticMethod() { // Metodo NON statico
        // Classe locale definita dentro un contesto non statico
        class LocalClass {
            void printMessage() {
                System.out.println(staticMessage); // OK
                System.out.println(instanceMessage); // OK 
	        }
	    }
    }
}
```


#### Accesso a variabili locali
Le classi locali possono accedere alle variabili locali del metodo in cui sono inserite solo se sono definite `final`, senza non va bene.
```java
public class LocalVariableExample {
	public void validateNumber() {
	    final int numberLength = 10; // VA BENE
	    class PhoneNumber {
	        void validate(String number) {
	            System.out.println("Validating number of length " + numberLength);
	        }
	    }
	}
}
```

#### Shadowing nelle Classi Locali
Nel caso in cui ci fossero due variabili o metodi identici, uno fuori dal metodo in cui è definita la classe locale e uno all'interno della classe locale, quest'ultimo va a **nascondere** (shadow) il primo.

#### Cosa NON posso fare nelle classi locali
- NON POSSO **definire membri statici** (es. `static String message)
	- tuttavia se sono variabili posso farlo (es. `static final int numero = 10`)
- NON POSSO **implementare un'interfaccia** 
- NON POSSO **avere inizializzatori statici** (es. metodo statico)
- NON POSSO **accedere direttamente ai membri di altre classi locali** definite nello stesso blocco o nello stesso metodo.


## Anonymous Classes
Le Anonymous classes sono molto utili quando vuoi creare una classe "al volo".
Nel senso, se devo creare una classe per fare un qualcosa di molto semplice, piuttosto che crearla esternamente posso scriverla direttamente nel main.

Utilità delle classi anonime
- implementare velocemente un'interfaccia.
- estendere una classe esistente e personalizzarne il comportamento.
- Quando vuoi evitare di creare una classe separata per qualcosa di semplice (scritto prima)
###### SINTASSI BASE
```java
AnonymousClass classe = new AnonymousClass() { // il nome lo scelgo sul momento
    // Corpo della classe anonima: metodi e campi
};
```

>[!tip]- ESEMPIO SEMPLICE: implementazione di un interfaccia
>```java
>interface Saluto {
>    void sayHello();
>}
>
>public class AnonymousExample {
>    public static void main(String[] args) {
>        // Creazione di una classe anonima che implementa Saluto
>        Saluto ciao = new Saluto() { // il nome è lo stesso dell'interfaccia
>            @Override
>            public void sayHello() {
>                System.out.println("Ciao, classe anonima!");
>            }
>        };
>		
>        ciao.sayHello(); // Stampa "Ciao, classe anonima!"
>    }
>}
>```
>Scrivere 
>```java
>Saluto ciao = new Saluto() {
>	// COSE
>};
>```
>è come scrivere
>```java
>class ciao implements Saluto {
>	// COSE
>}
>```

#### Accesso a variabili locali
Le **anonymous classes** possono accedere a:
- **Membri statici** e **di istanza** della classe esterna.
- **Variabili locali** del metodo, ma solo se sono dichiarate `final` o **effettivamente finali**.
#### Restrizioni delle classi anonime
1. **Non puoi dichiarare un costruttore**, ma puoi usare un **inizializzatore di istanza**.
2. Non possono contenere membri statici, a meno che siano costanti (`static final`).
3. Possono avere campi e metodi aggiuntivi, ma questi non sono visibili se usi un'interfaccia o una classe madre come riferimento (questo perché, ad esempio, `Dog` è visto come `Animal`).


## Factory
Si tratta di un metodo con il quale, partendo da una classe, posso generare automaticamente altri oggetti, senza specificare nel main ogni volta il `new`.
```java
// Classe Auto
class Auto {
    String modello;
    Auto(String modello) {
        this.modello = modello;
    }
}

// Factory che crea Auto
class AutoFactory {
    public static Auto creaFiat() {
        return new Auto("Fiat Panda");
    }
	
    public static Auto creaFerrari() {
        return new Auto("Ferrari F8");
    }
}

// Uso della factory
public class Main {
    public static void main(String[] args) {
        Auto a1 = AutoFactory.creaFiat();
        Auto a2 = AutoFactory.creaFerrari();
		
        System.out.println("Ho creato: " + a1.modello);
        System.out.println("Ho creato: " + a2.modello);
    }
}
```


## Annotazioni
- **Annotazioni = metadati**  
    Informazioni aggiuntive sul programma, **non influenzano la logica** ma servono come “etichette” per compilatore, strumenti o chi legge il codice.

#### Come si creano
- Si definiscono con `@interface`.
- Possono avere **campi/metodi** (con valori di default).
- Possono essere rese **ripetibili** con `@Repeatable`.

#### Annotazioni predefinite
- **@Deprecated** → segnala codice obsoleto.
- **@Override** → segnala override di un metodo della superclasse.
- **@SuppressWarnings** → sopprime avvisi specifici del compilatore.
- **@SafeVarargs** → sopprime avvisi su varargs generici.

#### Meta-annotazioni (si applicano alle annotazioni stesse)
- **@Retention** → definisce quanto a lungo l’annotazione è mantenuta (solo sorgente, bytecode o runtime).
- **@Documented** → l’annotazione appare nella Javadoc.
- **@Target** → specifica dove può essere usata (classe, metodo, campo, ecc.).
- **@Inherited** → un’annotazione sulla superclasse viene ereditata dai figli.
- **@Repeatable** → permette di usare più volte la stessa annotazione (serve un contenitore).

#### Type Annotations
- Applicabili a **tipi di dato** (es. variabili, parametri).
- Usate con tool/plugin per verifiche come `@NonNull` (evita `NullPointerException`).

#### Annotazioni ripetibili
- Con `@Repeatable`, si possono applicare più volte (es. più timer su un metodo, più ruoli su una classe).
- Serve un **contenitore** che raccoglie le annotazioni ripetute.
- Si possono recuperare tramite **Reflection**: Java raggruppa automaticamente le ripetizioni nel contenitore.


## Relatable
Il concetto si basa sul poter comparare due oggetti (uguali o non, BOH) secondo delle caratteristiche.

## Dato derivato
Il dato derivato è una dato che viene ritornato da un metodo a seguito di un'operazione o formula.
```java
public getAreaRettangolo() {
	return base*altezza;  // dato derivato
}
```



## Classe astratta
Una **classe astratta** è una classe “incompleta”: non puoi creare oggetti da essa (`new` non funziona).    
- Serve come **modello** per altre classi.
- Può contenere:
    - **metodi concreti** (già scritti, normali),
    - **metodi astratti** (senza corpo → solo la firma del metodo).

### Metodo astratto
È un metodo **dichiarato ma non scritto**.
- Dice: “chi estende questa classe dovrà implementare questo metodo”.   
```java
abstract class GraphicObject {     
	abstract void draw(); // so che mi serve, ma non so ancora come farlo 
}
```

#### Tipi di sottoclassi
1. **Sottoclasse astratta**
    - Può ereditare i metodi astratti senza implementarli subito.
    - Resta “incompleta” → anche lei non può essere istanziata.
    
2. **Sottoclasse concreta**
    - Deve implementare **tutti** i metodi astratti ereditati.
    - È una classe completa → può essere usata con `new`.

>[!tip]- Esempio completo
>```java
>// Classe astratta
>abstract class GraphicObject {
>    int x, y;
>	
>    void moveTo(int newX, int newY) { // metodo concreto
>        this.x = newX;
>        this.y = newY;
>    }
>	
>    abstract void draw(); // metodo astratto
>}
>
>
>// Sottoclasse ancora astratta
>abstract class Figura extends GraphicObject {
>    abstract double area(); // aggiunge un altro metodo astratto
>}
>
>
>// Sottoclasse concreta
>class Cerchio extends Figura {
>    int raggio;
>	
>    Cerchio(int r) { this.raggio = r; }
>	
>    @Override
>    void draw() { System.out.println("Disegno un cerchio"); }
>	
>    @Override
>    double area() { return Math.PI * raggio * raggio; }
>}
>
>
>public class Main {
>    public static void main(String[] args) {
>        Cerchio c = new Cerchio(5); // ok, sottoclasse concreta
>        c.draw();                   // Disegno un cerchio
>        System.out.println(c.area());// 78.5...
>    }
>}
>```


## Eccezioni
>[!lemma] Un'**eccezione** è un evento (e anche un oggetto) che si trova al di fuori del classico flusso del programma.

### Gerarchia delle eccezioni
Dato che le eccezioni possono andare dal generico allo specifico è giusto classificarle per poterle gestire al meglio.
Abbiamo tre tipi di eccezioni
- ***Checked exception***, sono controllate e possono essere gestire nel codice, con:
	- blocchi `try-catch`
	- `throws`
	
- ***Unchecked exception***, si dividono in due tipi
	- ***error***, non sono propriamente eccezioni ma errori a basso livello, molto rari e alle volte gravi (es. mi finisce la memoria, e che cazzo faccio?!)
	- ***runtime*** (*NULL pointer exceptions* oppure *segmentation fault*), non sono obbligato ad utilizzare `try-catch` oppure `throw` ma meglio prevenire!!!


#### Vediamo ora i metodi per gestire le eccezioni
##### **`Try-Catch`** 
###### Con Checked Exception (*IOException*)
Proviamo a gestire un file che non può essere aperto.
```java
import java.io.*;

public class CheckedExceptionExample {
    public static void main(String[] args) {
        try {
            // Prova ad aprire un file
            FileReader file = new FileReader("nonexistent.txt");
        } catch (IOException e) {
            // Gestione dell'eccezione
            System.out.println("Errore: Il file non esiste.");
        }
    }
}

// OUTPUT
// Errore: Il file non esiste.
```
Io qui provo a eseguire il codice con il `try`, qualora non dovesse andare a buon fine utilizzo il `catch` per gestire quell'eccezione.

###### Con Runtime Exception (*IndexOutOfBoundsException*).
Proviamo ad accedere ad un indice che non esiste in una lista.
```java
import java.util.ArrayList;
import java.util.List;

public class RuntimeExceptionExample {
    public static void main(String[] args) {
        List<Integer> numbers = new ArrayList<>();
        numbers.add(1); // Lista con un solo elemento
		
        try {
            // Prova ad accedere a un indice non valido (es. indice 5)
            System.out.println(numbers.get(5));
        } catch (IndexOutOfBoundsException e) {
            System.out.println("Errore: Indice fuori dai limiti.");
        }
    }
}

// OUTPUT
// Errore: Indice fuori dai limiti.
```

##### **`Finally`**
Il blocco `finally` viene eseguito indipendentemente dal verificarsi di un'eccezione
```java
public class FinallyExample {
    public static void main(String[] args) {
        try {
            int result = 10 / 0; // Questo genera un'eccezione
        } catch (ArithmeticException e) {
            System.out.println("Errore: Divisione per zero.");
        } finally {
            System.out.println("Blocco finally eseguito sempre.");
        }
    }
}

// OUTPUT
/* Errore: Divisione per zero.
   Blocco finally eseguito sempre.
*/
```

##### **`Try-with-resources`**
Il `try-with-resources` è una variante del blocco `try` che garantisce automaticamente la chiusura delle risorse dopo che sono state usate, senza bisogno di farlo manualmente nel blocco `finally`.
Generalmente dopo aver aperto una risorsa, nel finally scrivo.
```java
finally {
	RISORSA.close();
}
```
così lo chiudo.
Con il `try-with-resources` posso chiuderla automaticamente.


##### **`Throws`**
Quando si verifica un'eccezione è sempre meglio non gestirla direttamente nel metodo (con il `try-catch`) ma lasciare che sia il metodo chiamante a gestirla.

Per farlo utilizziamo la clausola `throws` nel metodo "chiamato", andando a specificare il tipo (uno o più) di eccezioni che potrebbero verificarsi.
>[!tip]- Esempio
>*METODO CHIAMATO*
>```java
>public void writeFile() throws IOException {
>    PrintWriter out = new PrintWriter(new FileWriter("output.txt"));
>    out.println("Ciao!");
>    out.close();
>}
>```
>Letteralmente il metodo chiamato ***LANCIA*** la sua eccezione (vedremo meglio dopo il come).
>
>*METODO CHIAMANTE*
>```java
>public static void main(String[] args) {
>    try {
>        new MyClass().writeFile();
>    } catch (IOException e) {
>        System.out.println("Errore gestito in main.");
>    }
>}
>```
Qui il metodo prova a eseguire `writeFile`, quando questo avrà finito, il chiamante controlla se ha lanciato un'eccezione e nel caso la gestisce personalmente.

>[!tip]- Esempio con più eccezioni
>Mettiamo caso che il chiamato possa generare più tipologie di eccezioni
>```java
>public void piuEccezioni() throws IOException, IndexOutOfBoundsException {
>    // Potenziale IOException
>    PrintWriter out = new PrintWriter(new FileWriter("output.txt"));
>
>    // Potenziale IndexOutOfBoundsException
>    int[] numbers = {1, 2, 3};
>    System.out.println(numbers[5]); // Accesso non valido
>
>    out.close();
}
>```
>
>Di conseguenza il chiamante deve essere in grado di "catturarle" tutte
>```java
>public static void main(String[] args) {
>    try {
>        new MyClass().piuEccezioni();
>    } catch (IOException e) {
>        System.out.println("Errore di I/O gestito.");
>    } catch (IndexOutOfBoundsException e) {
>        System.out.println("Errore di accesso alla lista gestito.");
>    }
}
>```


#### **`throw`**
Io uso `throw` per creare la mia eccezione e con il `throws` specifico quale eccezione sto per lanciare.
##### SINTASSI
```java
throw new NomeEccezione("Messaggio di errore");
```
- **`NomeEccezione`**: Deve essere una classe che eredita da `Throwable`.
	- se io genero un'eccezione che non è standard, posso creare una sottoclasse di `Exception` (che si trova in `Throwable`) e inserisco tutte le mie "nuove" eccezioni.
- **`Messaggio di errore`**: Una stringa opzionale che descrive l'errore

>[!tip]- ESEMPIO
>1. *UTILIZZO `THROW` MA NON `THROWS`* quando mi aspetto un'*unchecked exception*
>```java
>public double calcolaRadiceQuadrata(double numero) {
>    if (numero < 0) {
>        throw new IllegalArgumentException("È un numero negativo!!");
>    }
>    return Math.sqrt(numero);
>}
>```
>`IllegalArgumentException` è una ***Unchecked exception*** e quindi posso non scrivere `throws`.
>
>
>2. *UTILIZZO `THROW` E `THROWS`* quando mi aspetto una *checked excepetion*
>```java
>public void scriviSuFile(String testo) throws IOException {
>        // Lancia un'eccezione checked
>        throw new IOException("Errore di scrittura su file");
>    }
>```
>
>
>3. *UTILIZZO `THROW` E `THROWS`* quando mi aspetto un'eccezione "personalizzata", ossia inserita da me in una sottoclasse di `Exception`, <u>INDIPENDENTEMENTE SE SIA CHECKED O UNCHECKED</u>.
>```java
>public void calcolaRadice(double numero) throws NumeroNegativoException {
>    if (numero < 0) {
>        throw new NumeroNegativoException("Numero negativo: " + numero);
>    }
>    return Math.sqrt(numero);
>}
>```
Qui `NumeroNegativoException` è una mia eccezione personalizzata (non scrivo il codice della sottoclasse ma fai finta).


## Generics
Prima di introdurre i _Generics_ è utile ricordare che in Java possiamo usare oggetti ovunque: classi, metodi, interfacce, ecc.  
Tutte le classi che creiamo sono comunque figlie di `Object`.
##### Esempio di classe qualsiasi
```java
public class Box {
	private Object object;
	
	public void set(Object object) {
		this.object = object;
	}
	
	public Object get() {
		return object;
	}
}
```
Qui il box accetta qualsiasi oggetto. È molto flessibile, ma anche rischioso:
- **nessuna garanzia sul tipo** → potrei salvare una stringa e provare a leggerla come intero, causando `ClassCastException` a runtime.
- **serve sempre il cast** quando recupero il valore.

>[!success] Uso `Generics` per risolvere questi problemi, lasciando spazio all'utilizzatore della classe nel definire cosa quella classe prevede, senza bisogno di cast.

```java
public class Box<T> {
    private T content;

    public void setContent(T content) {
        this.content = content;
    }

    public T getContent() {
        return content;
    }
}

Box<String> box = new Box<>();
box.setContent("Hello");
String value = box.getContent(); // nessun cast

```

### Generics multipli e interfacce
Posso definire interfacce e classi con più tipi generici:
```java
// Interfaccia
public interface Pair<K, V> {
	public K getKey();
	public V getValue();
}


// Classe
public class OrderedPair<K, V> implements Pair<K, V> {
	private K key;
	private V value;
	
	public OrderedPair(K key, V value) {
		this.key = key;
		this.value = value;
	}
	
	public K getKey() { return key; }
	public V getValue() { return value; }
}


// Nel main avremo
Pair<String, Integer> p1 = new OrderedPair<String, Integer>("Even", 8);
Pair<String, String> p2 = new OrderedPair<String, String>("hello", "world");
```
###### Comodità
Scrivendo
```java
INTERFACCIA nome = new CLASSE
```
Ho una grande comodità perché dopo il `new`, potrei mettere tutte le classi che implementano l'interfaccia.

### Metodi generici (specialmente quelli statici)
Non serve che tutta la classe sia generica, posso dichiarare solo i metodi:
```java
public class Util {
	public static <K, V> boolean compare(Pair<K, V> p1, Pair<K, V> p2) {
		return p1.getKey().equals(p2.getKey()) &&
			   p1.getValue().equals(p2.getValue());
	}
}
```

### <> + extends
Posso scrivere
```java
<U extends Number>
```
E sto dicendo "`U` può essere di tutto, basta che rientri nella classe `Numeri` (ed eventuali sottoclassi)".
`Extends = Implement + Extend`

Posso anche scrivere
```java
<T extends B1 & B2 & B3>
```
MA
- posso avere **UNA SOLA CLASSE**
- posso avere **100000000 INTERFACCE**


### Wildcard (?)
Le wildcards le utilizzo nelle classi al posto del placeholder `T`, per rendere il codice ancora più flessibile
- se ho una classe con `<T>`, una volta creato un oggetto, `T = TIPO SCELTO` per sempre
- se ho una classe con `<?>`, una volta creato un oggetto io posso modificare il suo tipo quando voglio
```java
public void printBoxContent(Box<?> box) {
    Object content = box.getContent(); // Tipo sconosciuto
    System.out.println(content);
}
Box<String> stringBox = new Box<>();
stringBox.setContent("Hello");
```

#### Type Erasure s
Se ho una nuova generic ma un main vecchio, java modifica il file in Runtime

## Collections
Le ***collections*** sono un framework (insieme strumenti) che racchiudono delle strutture dati.
Apportano dei miglioramenti al codice, aumentandone l'efficienza e la velocità.

#### Gerarchia principale
- **List** → lista ordinata, può contenere duplicati (`ArrayList`, `LinkedList`)
- **Set** → insieme di elementi **unici** (`HashSet`, `TreeSet`)
- **Queue** → coda FIFO (`LinkedList`, `PriorityQueue`)
- **Deque** → coda a doppia estremità (`ArrayDeque`)
- **Map** → coppie chiave–valore con chiavi uniche (`HashMap`, `TreeMap`)

### LIST
Operazioni su una lista
- `add()`
```java
List<String> list = new ArrayList<>();
list.add("Apple");  // Aggiunge "Apple" alla lista
list.add("Banana"); // Aggiunge "Banana" alla lista
System.out.println(list); // Output: [Apple, Banana]
```

- `remove()`
```java
List<String> list = new ArrayList<>();
list.remove("Apple");  // Rimuove "Apple" alla lista
System.out.println(list); // Output: [Banana]
```

Devo stare attento quando ho una lista di numeri
```java
list.remove(1);  // rimuove l'elemento in posizione 1
list.remove(Integer.valueOf(1));  // rimuove il numero 1

```


##### Aggregate operations
Per poter iterare sulle collections possiamo utilizzare uno `stream`, che scorre tutta la sequenza, e utilizzo delle funzionalità, tipo
![[Pasted image 20241214180919.png]]

>[!tip] Lambda expression (`e -> e.getColor() == Color.RED`)
>-> serve per indicare che prima della freccia ho gli attributi e dopo la condizione

#### Iterator
METODI PRINCIPALI

| Metodo      | Descrizione                                                               |
| ----------- | ------------------------------------------------------------------------- |
| `hasNext()` | Restituisce `true` se c'è un altro elemento nella collezione da scorrere. |
| `next()`    | Restituisce l'elemento successivo nella collezione.                       |
| `remove()`  | Rimuove l'elemento corrente dalla collezione in modo sicuro (opzionale).  |

### Bulk operations
| **Metodo**        | **Cosa fa**                                                                                              |
| ----------------- | -------------------------------------------------------------------------------------------------------- |
| **`containsAll`** | Ritorna `true` se tutti gli elementi della collezione specificata sono presenti nella collezione target. |
| **`addAll`**      | Aggiunge tutti gli elementi di un'altra collezione alla collezione target.                               |
| **`removeAll`**   | Rimuove dalla collezione target tutti gli elementi presenti in un'altra collezione.                      |
| **`retainAll`**   | Mantiene solo gli elementi comuni tra la collezione target e quella specificata.                         |
| **`clear`**       | Rimuove **tutti** gli elementi dalla collezione target.                                                  |

### SET
UGUALE IDENTICO ALLA LIST, solo che non possiamo avere duplicati.

### DEQUE
| <center>**Tipo di Operazione**</center> | <center>**Primo elemento inserito (Inizio del Deque)**</center> | <center>**Ultimo elemento inserito (Fine del Deque)**</center> |
| --------------------------------------- | --------------------------------------------------------------- | -------------------------------------------------------------- |
| <center>**Inserimento**</center>        | <center>`addFirst(e)`</center>                                  | <center>`addLast(e)`</center>                                  |
| <center>**Rimozione**</center>          | <center>`removeFirst()`</center>                                | <center>`removeLast()`</center>                                |
| <center>**Esaminazione**</center>       | <center>`getFirst()`</center>                                   | <center>`getLast()`</center>                                   |

### QUEUE
Hanno solo `add` e `remove` MA SI BASANO SUL FIFO

### MAP
Sono tipo i dizionari (chiave, valore)
```java
Map<String, Integer> map = new HashMap<>();
map.put("Apple", 1);
map.put("Banana", 2);
System.out.println(map.get("Apple")); // Output: 1
System.out.println(map.keySet());     // Output: [Apple, Banana]
```
