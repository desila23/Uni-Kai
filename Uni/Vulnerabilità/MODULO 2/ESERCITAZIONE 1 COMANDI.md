##### ES1
SE HA LA PORTA 53 è un DNS
- viene usato IP come ip del dns
- si fa `dig @192.168.14.98 vdsilab.local txt`
	- per trovare i record di tipo txt del server dns
- `nmap -sS -sC -sV ip`
	- per vedere le porte
#### ES2
`dnsenum vdsisecurity.lab --dnsserver 192.168.14.95 -f subdomains-top1million-5000.txt `
#### ES3
