# Mini Fortnite-like Game

Bienvenue dans ce projet de jeu de combat en Ruby ! Ce projet consiste à créer un mini-jeu inspiré des Battle Royale, où un joueur humain doit affronter des ennemis pour survivre.

---

## Aperçu

Ce projet a été conçu en plusieurs versions progressives pour explorer la conception de jeux simples en Ruby.  
Chaque version introduit de nouvelles fonctionnalités, une meilleure organisation et des défis supplémentaires pour le joueur.

### Versions :
- **Version 1.0** : Une simulation de combat simple entre deux joueurs
- **Version 2.0** : Ajout d'un nouveau type de joueur, d'un système de menus et d'objets
- **Version 3.0** : Jeu structuré avec des classes mieux organisées, plus d'ennemis, et un système d'apparition progressive des adversaires.

---

## Fonctionnalités 

- **Combat au tour par tour** : Chaque joueur peut attaquer ou se défendre.
- **Gestion des ennemis** : Les ennemis apparaissent progressivement dans le jeu.
- **Système de fin de partie** : Victoire ou défaite en fonction de la survie du joueur.
- **Améliorations continues** : Chaque version ajoute des fonctionnalités et une meilleure structure.

---

## Structure du projet

Voici l'organisation des fichiers :
- app.rb : Version 1.0 (simulation de combat simple).
- app_2.rb : Version 2.0 (système de menus et gestion d'objets).
- app_3.rb : Version 3.0 (jeu complet et organisé avec apparition progressive des ennemis).
- lib/ : Contient les classes utilisées dans le projet :
  - player.rb : Gestion des joueurs (humains et ennemis).
  - human_player.rb : Classe pour le joueur humain avec des actions spéciales.
  - game.rb : Gestion globale du jeu (à partir de la version 3.0).
