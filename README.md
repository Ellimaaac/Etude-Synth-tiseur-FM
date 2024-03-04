# Etude-Synthetiseur-FM
data sheet proposée par Reynal : [lien](datasheets/projet_Article_Chowning_Synthese_FM.pdf)

# Sommaire
1.  [Etude théorique](#1-etude-théorique)
    - [Principe de la modulation](#principe-de-la-modulation)
    - [Spectre généré](#spectre-généré)
    - [Raffinements possibles](#raffinements-possibles)
2.  Mise en oeuvre de la synthèse sonore
    - Application théorique sur matlab
    - Application expérimentale sur MaxMSP 

# 1. Etude théorique

## Un peu d'Histoire

La synthèse FM (génération numérique de sons par Modulation de Fréquence) a été découverte plus ou moins par accident par John Chowning, au début des 70s, en expérimentant avec un synthé analogique de son université. Chowning remarque que les fréquences aiguës peuvent modifier le timbre de sa forme d’onde de base : c’est ainsi qu’est née la synthèse FM ! Le brevet a été par la suite racheté par Yamaha, qui l’a utilisé dans son synthétiseur DX7, un modèle qui changera le monde de la musique.

Avant l’invention de la synthèse FM, c’est la synthèse analogique (soustractive) qui est à l’ordre du jour. Elle permet de créer de beaux sons, mais a néanmoins certaines limites. À l’époque, les premiers samplers constituent la seule alternative, mais ils ne sont pas exactement abordables… Grâce à la synthèse FM, le processus de créer des sons inédits devient accessible à tout le monde. Quelques années plus tard, quand les prix des samplers et des ROMplers commencent à tomber, la synthèse FM commence à perdre de sa popularité. Beaucoup plus tard, après l’arrivée des synthétiseurs logiciels (entre autres au format VST), les synthés FM reprennent du terrain. Et c’est à partir de là que les choses commencent vraiment à décoller.

## Introduction

l'équation de modulation de fréquence : ***BW = 2 ( d + m )***
permet de produire des spectres complexes avec une très grande simplicité. 
Le fait que l'évolution temporelle des composantes de fréquence du spectre puisse être facilement contrôlée est peut-être l'attribut le plus frappant de la technique, car les spectres dynamiques ne sont obtenus qu'avec des difficultés considérables en utilisant les techniques actuelles de synthèse. 
A la fin de ce document, nous présentons quelques simulations de sons de cuivres, de bois et de percussions. L'importance de ces simulations réside autant dans leur élégance et leur simplicité que dans leur précision. Cette technique de modulation de fréquence, bien qu'elle ne soit pas un modèle physique du son naturel, s'avère être un mode de perception très puissant, du moins pour certains d'entre eux.

## Principe de la modulation

En FM, la fréquence instantanée d'une onde porteuse varie en fonction d'une onde modulante, de sorte que la vitesse à laquelle la porteuse varie est la fréquence de l'onde modulante, ou fréquence de modulation. La variation de la porteuse autour de sa moyenne, ou écart de fréquence de crête, est proportionnelle à l'amplitude de l'onde modulante. Les paramètres d'un signal 
modulé en fréquence sont les suivants :

- c = fréquence de la porteuse ou fréquence moyenne
- m = fréquence de modulation
- d = écart maximal.

L'équation d'une onde modulée en fréquence d'amplitude de crête A, où l'onde porteuse et l'onde modulante sont toutes deux des sinusoïdes, est la suivante :
- ***e = A sin(at + I sin,Bt)***

ou

- e  = l'amplitude instantanée de l'onde porteuse modulée
- α = la fréquence de la porteuse en rad/ s
- β = la fréquence de modulation en rad/s
- ***I = d/m*** = l'indice de modulation, le rapport entre l'écart maximal et la fréquence de modulation.


## Spectre généré
## Raffinements possibles# Etude-Synth-tiseur-FM
