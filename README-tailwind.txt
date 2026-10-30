Le fichier tailwind.css est généré à partir des classes utilisées dans index.html.

Si tu ajoutes de NOUVELLES classes Tailwind dans index.html (par exemple "mt-7" ou
"text-[#123456]" qui n'existaient pas encore), il faut regénérer le fichier,
sinon ces classes n'auront aucun effet.

Pour regénérer (Node.js requis), depuis ce dossier :
    npx tailwindcss@3 -c tailwind.config.js -i tailwind-source.css -o tailwind.css --minify

Puis change le numéro dans index.html (tailwind.css?v=1 -> ?v=2) pour que les
navigateurs rechargent le nouveau fichier.

Les fichiers tailwind.config.js et tailwind-source.css servent uniquement à cette
regénération : ils peuvent rester dans le dépôt, ils ne gênent pas le site.
