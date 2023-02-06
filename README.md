# Dolibarr

Dolibarr_app est un projet FLutter dans le cadre scolaire charge d'implementer l'application mobile pour Dolibarr.
https://www.dolibarr.org/ pour en savoir plus sur Dolibarr

## Collaboration
Nous allons travailler a quatre pour essayer d'implementer une solution adaptee.

### Cloner le projet 
Il y'a deux possibilite de cloner le projet:

1- Aller sur le repositorie github https://github.com/Id8987/dolibarr_app/ , appuyer sur le button vert et download.

2- en ligne de commande taper 
```git clone https://github.com/Id8987/dolibarr_app.git```

Une fois en local, ouvrir le  dossier et faire ```git remote add origin  https://github.com/Id8987/dolibarr_app.git ```  //pour nous eviter de taper souvent le lien https.

Faire ```flutter create .``` pour installer les dependances.

```git pull origin main``` synchroniser la branche principale distante avec celle en local.

Maintenant vous  pouvez commencer a travailler.
Pour ajouter votre travail travail? Rien de plus simple:

```git add .``` // ceci ajoute toutes les modifs de maniere recursives.

```git status``` // pour verifier les modifs ajoutees dans le staging area.

Pour le fameux commit :

```git commit -m "notre fameux message de commit #num"``` // le #num  c'est pour dire  a   github qu'on est en train de faire l'issue numero num qu'on nous avait assigne.

#### La derniere etape ?

L'etape restante est de pousse notre code vers github. Pour cela il est peferable de creer une branche avant de pouvoir merger avec la branche main. 
En exemple si je devais coder la page d'inscription:
```git checkout -b page-inscription``` // creation de la branche page-inscription

Maintenant je vpeux pousser avec :
```git push origin page-inscription```



### Ceci peut contenir des erreurs ( debutant comme yen rire  ) . Il est peferable de se documenter sur git et github pour une meilleure comprehension de la chose.


Voici un lien pour ca https://www.youtube.com/watch?v=8JJ101D3knE&ab_channel=ProgrammingwithMosh.
Autre chose pour les erreurs , j'ai un clavier anglais j'ai pas d'accents desole.
