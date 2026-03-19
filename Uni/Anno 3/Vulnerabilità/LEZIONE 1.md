#### 1️⃣ Navigazione e gestione file
**pwd**  
Mostra la directory corrente.
**ls**  
Elenca i file nella directory.
**touch**  
Crea un file vuoto o aggiorna il timestamp.
**cat**  
Mostra il contenuto di un file.
**echo**  
Stampa testo o variabili nel terminale.
**find**  
Cerca file e directory nel filesystem.
Esempio:
```bash
find / -name file.txt
```

**binwalk** FILE
mi dice il tipo di file


#### 2️⃣ Variabili di ambiente e PATH
**PATH**  
Variabile che contiene le directory dove il sistema cerca i comandi eseguibili.
Quando scrivi:
```bash
ls
```
il sistema cerca `ls` nelle cartelle presenti in `PATH`.
**export**  
Serve a esportare una variabile d'ambiente ai processi figli.
```bash
export PATH=$PATH:/home/user/bin
```
⚠️ Se un utente modifica il `PATH`, può far eseguire programmi diversi da quelli originali.
Esempio attacco:
1. creo file `ls`
2. dentro metto
```bash
#!/bin/bash
/bin/bash
```

3. metto la cartella nel PATH
Ora eseguendo `ls` si apre **bash**.
#### 3️⃣ Permessi e proprietà dei file

I gruppi servono per **gestire i permessi su file e risorse per più utenti contemporaneamente**.

**SuID**
Se un file eseguibile ha il **bit SetUID attivo**, il programma **non viene eseguito con i permessi dell’utente che lo lancia**, ma con **i permessi del proprietario del file**.

**SetGID**
Funziona allo stesso modo ma per **il gruppo**.
Il programma viene eseguito con il **group-id del file**, non con quello dell’utente.

**chmod**  
Modifica i permessi.
- owner
- group
- others
Permessi numerici:

| numero | permesso |
| ------ | -------- |
| 4      | read     |
| 2      | write    |
| 1      | execute  |

Esempio:
```bash
chmod 755 file
```

**SUID (s al posto di x)**
Se trovi `s` al posto di `x`, il programma viene eseguito **con i permessi dell'owner**.
Esempio:
```
-rwsr-xr-x
```

**chown**  
Cambia proprietario e gruppo.
```bash
chown user:group file
```

**comando find per trovare file posseduti da root e con SUID o SGID
```bash
find / -type f -user root \( -perm -4000 -o -perm -2000 \) -exec ls -lg {} \; 2>/dev/null
```
`find /`
- comando per **cercare file nel filesystem**
- `/` = inizia la ricerca dalla **root (tutto il sistema)**
`-type f`
- cerca **solo file**
- esclude **directory**
`\( -perm -4000 -o -perm -2000 \)`
filtro sui **permessi speciali**
- `-perm -4000` → file con **SUID** significa che il **bit SUID è attivo**.
- `-perm -2000` → file con **SGID** significa che il **bit SGID è attivo**.
- `-perm` specifica i permessi
- `-o` → **OR logico**
- `\(` `\)` → raggruppano la condizione
👉 quindi:
file con SUID OR SGID
`-exec ls -lg {} \;`
per ogni file trovato esegue il comando:
`ls -lg file`
serve per mostrare:
- permessi
- owner
- gruppo
elementi:
- `{}` → rappresenta il file trovato
	- placeholder del file trovato da find
- `\;` → termina il comando `-exec`
`2>/dev/null`
gestione degli errori
- `2` = **stderr (errori)**
- `>` = redirect
- `/dev/null` = dispositivo che **scarta tutto**
serve per **nascondere errori "Permission denied"**
#### 4️⃣ Utenti e identità

**id**  
Mostra UID, GID e gruppi dell'utente.

**adduser**  
Crea un nuovo utente.
```bash
adduser mario
```

**su**  
Cambia utente.
```bash
su user
```
#### 5️⃣ Link e filesystem (inode)

**inode**  
Struttura che contiene i metadati del file:
- permessi
- owner
- dimensione
- blocchi disco
**ls -li**  
Mostra gli inode dei file.

**Hard link**
- stesso inode
- stesso file fisico
```bash
ln file1 file2
```

**Symbolic link (symlink)**
- link simbolico
- inode diverso
```bash
ln -s file1 link
```
#### 6️⃣ Compressione e archivi

**tar**  
Crea o gestisce archivi.

**tar tf**  
Mostra il contenuto dell'archivio.
```bash
tar tf archive.tar
```

**tar zcf**

crea archivio compresso gzip.
```bash
tar zcf file.tar.gz cartella
```
opzioni:
- z → gzip
- c → create
- f → file
**zcat / zless**
Visualizzano file compressi.
```
zcat file.gz
zless file.gz
```

**unzip**
Estrae file zip.
```bash
unzip file.zip
```
#### 7️⃣ Processi
**ps aux**
Mostra tutti i processi.
- a → tutti utenti
- u → formato utente
- x → processi senza terminale
**kill**
Termina un processo.
```bash
kill PID
```
forzato:
```bash
kill -9 PID
```
**Ctrl + Z**
Sospende un processo.
**bg**
Riprende processo in background.
**fg**
Riporta processo in foreground.
#### 8️⃣ Monitoraggio sistema
**df**
Mostra spazio disco.
```bash
df -h
```
**du**
Mostra spazio occupato da file e cartelle.
```bash
du -sh *
```
**watch**
Ripete un comando ogni pochi secondi.
```bash
watch ls
```
#### 9️⃣ Networking
**netstat**
Mostra connessioni di rete.
**netstat -tulpn**
Mostra porte aperte e processi.
- t → TCP
- u → UDP
- l → listening
- p → processo
- n → numerico
**netstat -p**
Mostra il processo associato alla porta.
**ip a**
Mostra indirizzi IP.
```bash
ip a
```
**ip r**
Mostra la routing table.
```bash
ip r
```

#### 🔟 Accesso remoto
**ssh**
Connessione remota sicura.
```bash
ssh user@host
```
#### 1️⃣1️⃣ Privilegi e amministrazione

**sudo**
Esegue comando come root.

**sudo -l**
Mostra i comandi eseguibili con sudo.
```bash
sudo -l
<<<<<<< HEAD
du
=======
```

**visudo**
Modifica il file sudoers in modo sicuro.

```
/etc/sudoers
```
#### 1️⃣2️⃣ Automazione
**crontab**
Permette di schedulare comandi.
Formato:
```
minuto ora giorno mese giorno-settimana comando
```
Esempio:
```
0 2 * * * backup.sh
```
esegue alle **02:00 ogni giorno**.
