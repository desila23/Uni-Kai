## Capire la versione della macchina 
```
uname -a
```


##
```
cat /etc/os-release
```


## Lista degli utenti
```
cat /etc/passwd
```
- a noi interessano principalmente quelli che hanno `/bin/bash`


## DA FARE SUBITO: Capire i comandi che posso eseguire con `sudo`
```
sudo -l
```


## Come capire i permessi su un dato file
```
ls -la /xx/xx/.../NOME_FILE
```
- se il file è scrivibile, posso modificarlo con 
```
nano /xx/xx/.../NOME_FILE
```


## Eseguire un file con sudo come altro utente
```
sudo -u UTENTE /xx/xx/.../COMANDO /xx/xx/.../NOME_FILE
```
- per il comando potrei usare anche il path relativo
- per il nome del file DEVO USARE IL PATH ASSOLUTO


## 
```
su NOME_UTENTE
```



## DA FARE SUBITO: Usa le capabilities
```
getcap -r / 2>/dev/null
```
- Cerca le capabilities dentro tutte le app installate sul sistema (togliendo gli errori).


## Usare una bash stando su un file `.py`
```
import os
os.system('/bin/bash')
```


## DA FARE SUBITO: Vedere i cronjob
```
crontab -l
```


##
```
find / -perm -u=s -type f 2>/dev/null
```


##
```
strings
```


## Se devo usare una bash con un altro utente (?)
```
/xx/xx/.../bash -p
```



## Se un file non è eseguibile
```
chmod a+x NOME_FILE
```
