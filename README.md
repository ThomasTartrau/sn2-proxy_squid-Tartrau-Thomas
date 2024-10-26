## Tutorial:

  

```shell

sudo apt install curl -y && sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ThomasTartrau/sn2-proxy_squid-Tartrau-Thomas/refs/heads/main/script.sh)" && sudo systemctl restart squid

```


This command performs the complete installation to meet the [CDC](CDC.pdf) requirements.  
The objective is to install:

- squid
- squidGuard  
  - Create a list to block sites (barbed.fr, ...)
  - Create a list to block specific URLs within sites (tartrau.fr/test ...)
  - Perform an installation of the client & proxy automatically with **Vagrant** for automated test deployment.

<u>Performed by Thomas TARTRAU, EPSI SN2 2024-2025</u>

---

Cette commande réalise tout l'installation permettant de répondre au [CDC](CDC.pdf).
L'objectif de ce dernier est d'installer:
- squid
- squidGuard
	- Faire une liste permettant de bloquer des sites (barbed.fr, ....)
	- Faire une liste permettant de bloquer des urls de sites spécifiques (tartrau.fr/test ....)
	- Faire une installation du client & proxy automatiquement avec **Vagrant** pour un déploiement de test automatique.

<u>Réalisé par TARTRAU Thomas EPSI SN2 2024-2025</u>