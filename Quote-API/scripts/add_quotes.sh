#!/bin/bash


API_URL="http://localhost:8080/api/quotes"

declare -a quotes=(
    '{"text": "Le succès, c’est tomber sept fois, se relever huit.", "author": "Proverbe japonais"}'
    '{"text": "Ils ne savaient pas que c’était impossible, alors ils l’ont fait.", "author": "Mark Twain"}'
    '{"text": "Faites que le rêve dévore votre vie afin que la vie ne dévore pas votre rêve.", "author": "Antoine de Saint-Exupéry"}'
    '{"text": "Croyez en vos rêves et ils se réaliseront peut-être. Croyez en vous et ils se réaliseront sûrement.", "author": "Martin Luther King"}'
    '{"text": "Tout ce que vous avez toujours voulu est juste de l’autre côté de la peur.", "author": "George Addair"}'
    '{"text": "Ce n’est pas parce que les choses sont difficiles que nous n’osons pas, c’est parce que nous n’osons pas qu’elles sont difficiles.", "author": "Sénèque"}'
    '{"text": "L’échec est seulement l’opportunité de recommencer d’une façon plus intelligente.", "author": "Henry Ford"}'
    '{"text": "Ne laisse jamais les ombres d’hier obscurcir la lumière de demain.", "author": "Proverbe"}'
    '{"text": "Faites ce que vous pouvez, avec ce que vous avez, là où vous êtes.", "author": "Theodore Roosevelt"}'
    '{"text": "Les défis rendent la vie intéressante ; les surmonter lui donne un sens.", "author": "Joshua J. Marine"}'
    '{"text": "Ne regarde pas en arrière, tu ne vas pas dans cette direction.", "author": "Proverbe"}'
    '{"text": "La vie, c’est 10 % ce qui nous arrive et 90 % la façon dont on y réagit.", "author": "Charles R. Swindoll"}'
    '{"text": "On ne peut pas changer le vent, mais on peut ajuster les voiles.", "author": "Aristote"}'
    '{"text": "Le plus grand échec est de ne pas avoir le courage d’oser.", "author": "Abbé Pierre"}'
    '{"text": "Commencez où vous êtes. Utilisez ce que vous avez. Faites ce que vous pouvez.", "author": "Arthur Ashe"}'
    '{"text": "Les seules limites de votre avenir sont celles que vous créez dans votre esprit.", "author": "Napoleon Hill"}'
    '{"text": "Soyez le changement que vous voulez voir dans le monde.", "author": "Mahatma Gandhi"}'
    '{"text": "Ne rêvez pas votre vie, vivez vos rêves.", "author": "Proverbe"}'
    '{"text": "Il n’y a qu’une façon d’échouer, c’est d’abandonner avant d’avoir réussi.", "author": "Georges Clemenceau"}'
    '{"text": "La seule chose que l’on est sûr de ne pas réussir est celle que l’on ne tente pas.", "author": "Paul-Émile Victor"}'
    '{"text": "La meilleure façon de prédire l’avenir est de le créer.", "author": "Peter Drucker"}'
    '{"text": "Ce n’est pas la force, mais la persévérance, qui fait les grandes œuvres.", "author": "Samuel Johnson"}'
    '{"text": "Un pessimiste voit la difficulté dans chaque opportunité, un optimiste voit l’opportunité dans chaque difficulté.", "author": "Winston Churchill"}'
    '{"text": "Quand on veut une chose, tout l’univers conspire à nous permettre de réaliser notre rêve.", "author": "Paulo Coelho"}'
    '{"text": "Rien n’est impossible, seules les limites de nos esprits définissent certaines choses comme inconcevables.", "author": "Marc Levy"}'
    '{"text": "Le bonheur est parfois caché dans l’inconnu.", "author": "Victor Hugo"}'
    '{"text": "Les seules limites à notre épanouissement de demain sont nos doutes d’aujourd’hui.", "author": "Franklin D. Roosevelt"}'
    '{"text": "Le secret du changement, c’est de concentrer toute son énergie non pas à lutter contre le passé, mais à construire l’avenir.", "author": "Socrate"}'
    '{"text": "Il faut toujours viser la lune, car même en cas d’échec, on atterrit dans les étoiles.", "author": "Oscar Wilde"}'
    '{"text": "Ce que vous faites aujourd’hui peut améliorer tous vos lendemains.", "author": "Ralph Marston"}'
    '{"text": "L’important n’est pas d’avoir de l’argent, mais d’avoir des rêves.", "author": "Steve Jobs"}'
    '{"text": "La réussite, c’est d’aller d’échec en échec sans perdre son enthousiasme.", "author": "Winston Churchill"}'
    '{"text": "Ne laissez pas le bruit des opinions des autres étouffer votre propre voix intérieure.", "author": "Steve Jobs"}'
    '{"text": "Il y a toujours une lumière au bout du tunnel.", "author": "Proverbe"}'
    '{"text": "Chaque matin, nous renaissons. Ce que nous faisons aujourd’hui est ce qui importe le plus.", "author": "Bouddha"}'
    '{"text": "Si vous pouvez le rêver, vous pouvez le faire.", "author": "Walt Disney"}'
    '{"text": "La vie commence à la fin de votre zone de confort.", "author": "Neale Donald Walsch"}'
    '{"text": "Ne crains pas d’avancer lentement, crains seulement de t’arrêter.", "author": "Proverbe chinois"}'
    '{"text": "Le meilleur moyen de réaliser l’impossible est de croire que c’est possible.", "author": "Lewis Carroll"}'
    '{"text": "Faites aujourd’hui ce que les autres ne veulent pas faire. Demain vous vivrez comme les autres ne peuvent pas vivre.", "author": "Proverbe"}'
    '{"text": "Tout semble toujours impossible, jusqu’à ce qu’on le fasse.", "author": "Nelson Mandela"}'
    '{"text": "Un voyage de mille lieues commence toujours par un premier pas.", "author": "Lao Tseu"}'
    '{"text": "Rien n’arrive jamais sans raison.", "author": "Proverbe"}'
    '{"text": "Votre temps est limité, ne le gâchez pas en vivant la vie de quelqu’un d’autre.", "author": "Steve Jobs"}'
    '{"text": "La vie est faite de défis à relever, pas de problèmes à résoudre.", "author": "Proverbe"}'
    '{"text": "L’échec n’est pas le contraire du succès, c’est une partie du succès.", "author": "Arianna Huffington"}'
    '{"text": "L’avenir appartient à ceux qui croient en la beauté de leurs rêves.", "author": "Eleanor Roosevelt"}'
    '{"text": "Transformez vos blessures en sagesse.", "author": "Oprah Winfrey"}'
    '{"text": "Rien ne peut arrêter celui qui refuse d’abandonner.", "author": "Napoleon Hill"}'
)

for quote in "${quotes[@]}"
do
    curl -X POST $API_URL \
    -H "Content-Type: application/json" \
    -d "$quote"
    echo ""
done
