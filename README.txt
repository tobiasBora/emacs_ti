* Kit de Développement en Lua pour Ti-nspire sous linux

Cette première version est loin d'être finie, je met un peu en vrac
mes bouts de codes (pour le moment je n'ai pas le temps d'en faire
plus), mais lorsque j'aurais un peu plus de temps j'organiserai tout
ça (à moins qu'un courageux le fasse avant !).

Pour que vous puissiez vous y retrouver, voici un rapide aperçu de ce
que vous pouvez trouver dans cette permière version :

** Dosier upload_script

Ce sont des scripts que j'ai codé en me basant sur la base de Jim
Bauwens (merci à lui pour toute son aide, nottament sur la partie
d'envoie en C, sans qui je n'aurais jamais pu le coder.

Le code initial : https://github.com/jimbauwens/ETK/tree/master/buildtools

Maintenant passons à un rapide listage des fichiers :

- luna : c'est l'exécutable du très bon logiciel luna qui converti un
code lua en fichier .tns. Je l'ai compilé pour une architecture 64,
mais vous pouvez le télécharger ici :
http://www.ticalc.org/archives/files/fileinfo/441/44113.html

- test_ticalcs_2 est un exécutable (aussi en 64bits) qui permet
  d'envoyer un fichier dans un dossier déterminté de la calculatrice
  (vous pourrez choisir la destionation, pour savoir comment
  l'utiliser lancez le sans argument). L'ayant codé à partir de la
  base libticalc, vous pouvez trouver le code et le compiler en allant
  dans le dossier racine libticalcs/test. (plus d'info plus bas, et
  promis quand j'aurais le temps je lui donnerai un nom plus
  explicite)

  
- ====> script_upload.lua est un exécutable qui est censé appeller les
  différents programmes. En théorie, vous n'avez **que celui ci à
  lancer**. (pour savoir comment l'utiliser, lancez le en console sans
  argument, il faut que vous ayez lua d'installé). Ce programme
  commence par combiner tous les fichiers inclus, à les mettre dans le
  fichier big.___.lua, ensuite il appelle luna pour le convertir en
  .tns, et il finit en appelant script_upload_final.lua qui lui va
  s'occuper d'envoyer le .tns sur la Ti via l'executable
  test_ticalcs_2.

- script_upload_final.lua s'occupe d'appeler test_ticalcs_2 pour envoyer le fichier sur la Ti.

- out.tns, big.demo.lua sont des fichiers utilisé temporairement, sachant que vous pouvez envoyer out.tns directement sur votre Ti via tilp (si jamais vous voulez un utilitaire graphique)

- ti-mode.el se veux contenir une fonction à appeler depuis emacs pour
  s'occuper d'envoyer le fichier courant sur la Ti. Je ne vous cache
  pas que je ne sais pas du tout si il fonctionne ou pas (pas le temps
  de le tester), mais je pense que les modification à faire sont
  mineures. Pensez à modifier l'emplacement du fichier en tête du
  fichier, ainsi que dans script_upload_final.lua.

- La syntaxe à utiliser pour un un fichier à un emplacement
  précis est :
  --Ti-mode="<dossier>"
  Exemple : --Ti-mode="MyLibs"

- Pour indiquer à emacs quel est le fichier principal :
  --Ti-mode-file="<nom dossier>"
  à placer dans le fichier en cours
  d'utilisation. (si il n'y en a pas il enverra le fichier courant).



** Dans le dossier libticalcs/test/, se trouve le code c pour envoyer
   les fichier dans un dossier déterminé. Pour le compiler, il suffit
   d'aller dans /libticalcs et de suivre les instruction du
   readme. (ie lancer ./configure puis make. (vous pouvez également
   lancer comprun.sh pour le lancer et vérifier qu'il marche en
   envoyer un fichier Lua3D.tns dans le dossier MyLib.

** Voilà, je pense avoir fait un tour rapide des possibilités, je le répète, je n'ai pas eu le temps de le finaliser, donc ça marche peut être, peut être pas entièrement, mais le gros du travail est là, si ça plante, c'est certainement une histoire d'emplacement d'exécutables les uns par rapports aux autres (je n'ai pas testé la chaine complète, seulement quelques bouts).

Si vous avez des questions, vous pouvez m'écrire à
tobias.bora [at] gmail [point] com.

Bonne continuation !

PS : et si vous améliorez ce programme, n'hésitez pas à partager votre
travail ! Je me ferai un plaisir de l'ajouter sur ce repo !
   
