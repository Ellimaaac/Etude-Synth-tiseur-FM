# Etude-Synthetiseur-FM
data sheet proposée par Reynal : [lien](datasheets/projet_Article_Chowning_Synthese_FM.pdf)

# Sommaire
1.  [Etude théorique](#1-etude-théorique)
    - [Principe de la modulation](#principe-de-la-modulation)
    - [Application théorique sur matlab](#Application-théorique-sur-matlab)
    - [Raffinements possibles](#raffinements-possibles)
2.  Mise en oeuvre de la synthèse sonore
      - Application expérimentale sur MaxMSP 

# 1. Etude théorique

## Introduction

l'équation de modulation de fréquence : ***BW = 2 ( d + m )***
permet de produire des spectres complexes avec une très grande simplicité. 
Le fait que l'évolution temporelle des composantes de fréquence du spectre puisse être facilement contrôlée est peut-être l'attribut le plus frappant de la technique, car les spectres dynamiques ne sont obtenus qu'avec des difficultés considérables en utilisant les techniques actuelles de synthèse. 
A la fin de ce document, nous présentons quelques simulations de sons de cuivres, de bois et de percussions. L'importance de ces simulations réside autant dans leur élégance et leur simplicité que dans leur précision. Cette technique de modulation de fréquence, bien qu'elle ne soit pas un modèle physique du son naturel, s'avère être un mode de perception très puissant, du moins pour certains d'entre eux.

## Principe de la modulation

En FM, la fréquence instantanée d'une onde porteuse varie en fonction d'une onde modulante, de sorte que la vitesse à laquelle la porteuse varie est la fréquence de l'onde modulante. La variation de la porteuse autour de sa moyenne (ou écart de fréquence de crête) est proportionnelle à l'amplitude de l'onde modulante. Les paramètres d'un signal modulé en fréquence sont les suivants :

- c = fréquence de la porteuse ou fréquence moyenne
- m = fréquence de modulation
- d = écart maximal.

L'équation d'une onde modulée en fréquence d'amplitude de crête A, où l'onde porteuse et l'onde modulante sont toutes deux des sinusoïdes, est la suivante :
- ***e = A sin(at + I sin(Bt))***

ou

- e  = l'amplitude instantanée de l'onde porteuse modulée
- α = la fréquence de la porteuse en rad/ s
- β = la fréquence de modulation en rad/s
- ***I = d/m*** = l'indice de modulation, le rapport entre l'écart maximal et la fréquence de modulation.

La largeur de bande totale est approximativement égale à deux fois la somme de l'écart de fréquence et de la fréquence de modulation : ***BW = 2 ( d + m )***

Toutes les relations ci-dessus sont exprimées dans le développement trigonométrique de l'Eq :
- e = { A*J0(I)*sin(αt)+ J1(I)*(sin(a+ ,8)t-sin(a- ,8)) + J2(I)*(sin(a+2,8)t+sin(a-2,8)) + J3(I)*(sin(a+3,8)t-sin(a-3,8) }

## Application théorique sur matlab
## Raffinements possibles
