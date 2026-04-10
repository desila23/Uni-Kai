## Misurare la rilevanza
Un modo per valutare oggettivamente
- serve un benchmark, composto da
	- insieme di documenti che sarà il perimetro dell'analisi
	- query note 
	- un sistema che dice cosa è rilevante e cosa non lo è per ogni query e ogni documento

IL TUTTO DEVE ESSERE REPLICABILE.


```python
N_word():
	while (1 < 2):
		print("Nig..")

N_word().
```


### Gold standard - metodo per costruire un data set annotato
1. sviluppo un insieme di query rappresentative
2. si utilizza un sistema base che data una serie di parole recupera tutti i documenti utili -> VOGLIAMO MASSIMIZZARE LA RECALL
	- bisogna utilizzare tecniche che facciano si che il perimetro di analisi sia contenuto
3. per ogni query avere 1 o 2 esperti che stabiliscano la rilevanza dei documenti selezionati nello step 2


### Precision e Recall
![[Pasted image 20260410115846.png]]
![[Pasted image 20260410120216.png]]
Se i due insiemi coincidono vuol dire che ho estratto TUTTI E SOLI i documenti utili
- è molto stringente

- il riquadro con `not retrieved and irrilevant` è un dato che generalmente non ci serve (anche perché se erano irrilevanti e non selezionate non servono a molto)

![[Pasted image 20260410120423.png]]
- tp -> lo dovevo fare e l'ho fatto
- fp -> non lo dovevo fare MA l'ho fatto
- e così via

![[Pasted image 20260410120522.png]]

>[!tip] Trucchetti per ricordarli
>- recall -> il tn va buttato via
>- la presicion -> chiama le p 

SE DEVO DARE ANALISI DEL CANCRO VOGLIO MASSIMIZZARE LA RECALL (se proprio devo scegliere)
- ma generalmente vogliamo bilanciare le due

>[!danger] La media aritmetica non funziona
>La media aritmetica non funziona.
>Se ho entrambi 0.5 la media sarà 0.5
>Se ho precision 0.9 e recall 0.1 la media sarà sempre 0.5
>NON FUNZIONA

## Soluzione - F Measure
![[Pasted image 20260410121251.png]]

I sistemi scrivono F-1 Measure
- posso mettere un $\alpha$ per decidere se massimizzare precision o recall


Noi vogliamo stare nell'angolo in alto a DX
![[Pasted image 20260410121346.png]]

- RECALL 0 - PRECISION 1
	- si intende tipo che a 10 query non ho mai risposto
		- sono stato preciso A NON RISPONDERE A NULLA
		- ma appunto non ho risposto

Il nostro sistema starà nel centro


### Accuracy e Error rate
![[Pasted image 20260410121659.png]]
ERR -> scelte corrette che hai fatto sulle scelte totali
ACC -> 

Error rate è $1 -  acc$


#### Esempio
![[Pasted image 20260410122242.png]]
La recall può solo aumentare 
La precision dipende da quanti documenti ho visto fino ad ora e quanto sono "andato bene"


## Rank-based measures
![[Pasted image 20260410122345.png]]

La recall nei sistemi moderni viene in parte non calcolata (?)

### Precision@K
HO CAPITO MA NON HO CAPITO

### Interpolazione 
Non ho capito


![[Pasted image 20260410123104.png]]
È una sorta di impronta digitale per capire come va la precision e la recall del mio sistema


![[Pasted image 20260410123423.png]]
Questo mi serve per capire quale sistema va meglio
- quello che a parità di recall massimizza la precision 



### Average precision
È una misura che, in base a diversi k (che va scelto), calcola l'average di precision a k

### Mean average precision
Lo faccio su `q` query

È MACRO
>[!tip] Differenza tra micro e macro
>Micro -> giudico le singole decisioni (vedo i micro fenomeni)
>Macro -> boh



## Discounted cumulative gain
Tre assunzioni
- i migliori stanno in cima
- i peggiori stanno in fondo
- e io? so gay

Cumulative -> li sommo
Discounted -> ogni volta che scendo faccio una cosa che non ho capito porcaccio dio



FINO A SLIDE 36