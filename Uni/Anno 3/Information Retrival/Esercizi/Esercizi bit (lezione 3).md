# ESERCIZIO 1
![[Pasted image 20260311101813.png]]

>[!tip]- Merge
>![[Pasted image 20260312174718.png]]

### Brutus AND NOT Caesar
```c
AND-NOT(p1, p2)
	answer <- <>
	while p1 != NIL and p2 != NIL do
		if docID(p1) = docID(p2) then
			p1 <- next(p1)
			p2 <- next(p2)
		else if docID(p1) < docID(p2) then
			ADD(answer, docID(p1))
			p1 <- next(p1)
		else 
			p2 <- next(p2)
```


---

# ESERCIZIO 2
![[Pasted image 20260311103454.png]]
RISPOSTA -> la terza parantesi


---

# ESERCIZIO 3
![[Pasted image 20260311101826.png]]


---

# ESERCIZIO 4
![[Pasted image 20260311111004.png]]



