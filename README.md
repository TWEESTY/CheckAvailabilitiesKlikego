***Lu'tilisation de ce script peut entrainer un blocage de votre adresse ip par le site***

# Fonctionnement

Le script s'exécute en tâche de fond jusqu'à ce qu'il trouve un dossard dans la bourse aux dossards pour votre épreuve. Il vous averti via un message de notification sur l'ordinateur. 
L'exécution du script est stoppée lors de la fermeture de la console Powershell (et donc si vous éteignez l'ordinateur). Il sera donc nécessaire de relancer le script.

# Installation

Récupérer le fichier "checkAvailabilitiesKlikego.ps1" de la dernière release.

# Récupération des informations nécessaires

1- Accéder à la page principale de la course souhaitée, par exemple ici la page pour le triathlon de Brocéliande 
![image](https://user-images.githubusercontent.com/1401675/232883254-a2653c88-1f7c-4e39-9767-c03ea2a1ffbd.png)
2- Noter le nom de l'épreuve qui vous intéresse, par exemple ici "Triathlon S"

![image](https://user-images.githubusercontent.com/1401675/232883528-66983dfa-8481-46e2-84e7-342776b079ba.png)
3- Cliquer sur "Consulter la liste", et noter l'URL, par exemple ici "https://www.klikego.com/revente-dossard/triathlon-de-broceliande-2023/1644013702567-2"

![image](https://user-images.githubusercontent.com/1401675/232883776-7de56bb5-7ad8-42d1-b2ff-10842b08a9ca.png)


# Lancement

1- Lancer une console Powershell en tant qu'administrateur, comme indiqué dans l'image ci-dessous :
![image](https://user-images.githubusercontent.com/1401675/232882426-319257fb-e830-4be8-b289-c6f9a3e76f4a.png)

2- Dans la console Powershell ouverte, exécuter la commande suivante :
```
cd "<CHEMIN_DU_REPERTOIRE_CONTENANT_FICHIER_checkAvailabilitiesKlikego.ps1>"
```

3- Puis exécuter la commande suivante :
```
Set-ExecutionPolicy ByPass -Scope Process
```

4- Puis, exécuter la commande suivante :
```
.\checkAvailabilitiesKlikego.ps1 -BourseEchangeCourseUrl "<URL_RECUPEREE>" -NomEpreuve "<NOM_EPREUVE_RECUPERE>" -DureeEnSecondsEntreChaqueRecuperation <DUREE_ENTRE_CHAQUE_ESSAI>
```
Example :
![image](https://user-images.githubusercontent.com/1401675/232885344-5d062db8-7b7b-4d50-aae7-d03b8591905c.png)

Je vous invite dans un premier temps à tester la procédure sur une course où il existe bel et bien un dossard dans la bourse aux dossards.

***Ne pas mettre une durée inférieure à 60s entre chaque essai de récupération, il se pourrait que le site bloque votre adresse ip si il pense que vous êtes un robot.***
