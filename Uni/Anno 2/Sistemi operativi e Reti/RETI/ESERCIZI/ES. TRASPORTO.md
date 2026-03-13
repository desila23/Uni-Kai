## LISTA COMANDI
##### MOSTRARE LE STATISTICHE SULLE SOCKET
```
$ ss -s
```
Mostra tutte le statistiche delle socket attive
![[Pasted image 20250706161218.png]]


##### STAMPARE TUTTE LE SOCKET UDP
```
$ ss -u
```
Mostra tutte le socket UDP connesse

```
$ ss -ua
```
Mostra tutte le socket che non hanno connessione all'attivo

ALTRE OPZIONI
- `-n`  -> toglie le traduzioni automatiche delle porta (es. indirizzo: http -> indirizzo: 80)
- `-p` -> stampiamo le informazioni sul processo
- `-E` -> mostra le socket quando vengono distrutte


##### EFFETTUARE UNA RICHIESTA AD UN SERVER DNS
```
$ dig @dns.uniroma2.it uniroma2.it MX
```

##### WIRESHARK
Analizza i pacchetti inviati e ricevuti nella rete.
Possiede anche dei filtri che consentono di vedere determinati pacchetti

##### INDICA I VARI INDIRIZZI IP 
```
$ ip addr
```