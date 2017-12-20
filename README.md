L’exercice.

Ci-joint un fichier CSV de magasins (shops_shopmium.csv).

Dans un projet Git pour qu’on puisse voir l’évolution du code ;

Ce que l'on aimerait que tu fasses :

 * Créer un model pour ces shops (liste des champs à avoir en base : chain, name, latitude, longitude, address, city, zip, phone, country_code).
   Le model doit avoir les validations que tu jugeras nécessaires.

 * Créer une tâche rake qui importe ces magasins dans cette base de données, à partir du fichier CSV.
   La tâche doit gérer d’éventuelles erreurs lors de l’import.

 * Créer les pages et les actions/formulaires nécessaires pour pouvoir créer, visualiser, mettre à jour, supprimer et lister ces shops.

 * Faire un filtre permettant d'afficher, à partir de sa position :
   - tous les shops dans un rayon de X mètres ;
   ET / OU
   - les X shops les plus proches ;
  La position étant celle de l’utilisateur ;
  Bonus: les afficher sur une carte au dessus de la liste.

 * apporter le niveau de finition qui te semble pertinent en terme d’usabilité de la chose (UI… et par exemple, la position de l’utilisateur ?).

 * et de manière générale, ajouter tout ce qui te semble pertinent et qui nous permettrait de voir l'étendue de tes Skills RoR.

Quelques remarques :

 * cela doit être utilisable par un vrai utilisateur, disons un collègue de l’équipe Campaign Management, qui aurait à gérer une liste de magasin (import, modifications…), et qui doit être « guidé » au cours de ce process (erreurs etc…). On veut voir ta capacité à anticiper les besoins et les cas rencontrés. Exemple: un import de 100 shops rencontre une erreur en plein milieu (au 45ème shop), qu’est ce qu’il se passe ? Comment ton utilisateur mène à bien sa tâche d’importer ces 100 shops.

 * tu peux utiliser les Gems que tu veux (fais ce projet comme si tu travaillais pour un client et non pas comme un exercice, que l'on puisse voir ton code en "conditions réelles") ;

 * tu peux utiliser Internet et toutes les ressources que tu souhaites, le but étant :
   - que tu fasses le projet ;
   - que l'on puisse en discuter ;

 * si tu pouvais pousser le projet Git sur Github ou autre, et nous donner le lien, ce serait idéal.
