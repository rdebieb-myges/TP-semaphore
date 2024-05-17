# TP-semaphore par DEBIEB Ryan


## Ce qui fonctionne:

- Création d'une vm sur GCP

- Installation de sémaphore

- Configuration basique de sémaphore

- Gestion basique de mariadb pour la configuration de sémaphore

- Création d'un utilisateur administrateur pour sémaphore.

- Accès au dashboard


## Ce qui doit être amélioré: 

- Changer la localisation des fichiers de sémaphore

- Variabiliser plus le fichier config.json afin d'avoir plus de personnalisation possible. par exemple, pour le moment il est uniquement possible d'utiliser une base de données mariadb

- Au niveau tasks, ajouter la compatibilité avec les autres bases de données afin de pouvoir créer les tables, bases de données, utilisateurs...

- Au niveau terraform, ajouter une boucle afin de créer plusieurs machines à la fois

- Créer un inventaire dynamique

- ajouter une règle niveau firewall au lieu d'utiliser un tunnel ?
