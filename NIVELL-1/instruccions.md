## Nivell 1

## Nivell 1
### Exercici 1 - Òptica

Una òptica, anomenada “Cul d'Ampolla”, vol informatitzar la gestió dels clients/es i vendes d'ulleres.

En primer lloc, l'òptica vol saber quin és el proveïdor de cadascuna de les ulleres. En concret vol saber de cada proveïdor: El nom, l'adreça (carrer, número, pis, porta, ciutat, codi postal i país), telèfon, fax, NIF.

La política de compres de l'òptica es basa que les ulleres d'una marca es compraran a un únic proveïdor (així en podrà treure més bons preus), però poden comprar ulleres de diverses marques a un proveïdor. De les ulleres vol saber: La marca, la graduació de cadascun dels vidres, el tipus de muntura (flotant, pasta o metàl·lica), el color de la muntura, el color de cada vidre, el preu.

Dels clients/es vol emmagatzemar: El nom, l'adreça postal, el telèfon, el correu electrònic, la data de registre.
Quan arriba un/a client/a nou, emmagatzemar el/la client/a que li ha recomanat l'establiment (sempre que algú li hagi recomanat).
El nostre sistema haurà d’indicar qui ha sigut l’empleat/da que ha venut cada ullera. Defineix un període de temps de vendes.

### Requisits

Per a verificar que el teu disseny és correcte, efectua les següents consultes i comprova que retornen resultats correctes:

*Òptica:*

- Llista el total de compres d’un client/a.
- Llista les diferents ulleres que ha venut un empleat durant un any.
- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.


### Exercici 2 - Pizzeria

**T’han contractat per a dissenyar una web que permeti fer comandes de menjar a domicili per Internet.**

Tingues en compte les següents indicacions per a modelar com seria la base de dades del projecte:

- Per a cada client/a emmagatzemem un identificador únic: Nom, cognoms, adreça, codi postal, localitat, província, número de telèfon.

- Una persona pot realitzar moltes comandes, però una única comanda només pot ser realitzat per una única persona. De cada comanda s'emmagatzema un identificador únic: Data/hora, si la comanda és per a repartiment a domicili o per a recollir en botiga, la quantitat de productes que s'han seleccionat de cada tipus, el preu total.

- Una comanda pot constar d'un o diversos productes.

- Els productes poden ser pizzes, hamburgueses i begudes. De cada producte s'emmagatzema un identificador únic: Nom, descripció, imatge, preu.

- En el cas de les pizzes existeixen diverses categories que poden anar canviant de nom al llarg de l'any. Una pizza només pot estar dins d'una categoria, però una categoria pot tenir moltes pizzes.

- De cada categoria s'emmagatzema un identificador únic i un nom. Una comanda és gestionada per una única botiga i una botiga pot gestionar moltes comandes. 
- De cada botiga s'emmagatzema un identificador únic: Adreça, codi postal, localitat, província.

- En una botiga poden treballar molts empleats/des i un empleat/da només pot treballar en una botiga. De cada empleat/da, s'emmagatzema un identificador únic: Nom, cognoms, NIF, Telèfon.

- Si treballa com a cuiner/a o repartidor/a. 

- Per a les comandes de repartiment a domicili interessa guardar qui és el repartidor/a que fa el lliurament de la comanda i la data/hora del moment del lliurament.


### Requisits

Per a verificar que el teu disseny és correcte, efectua les següents consultes i comprova que retornen resultats correctes:

*Pizzeria:*

Llista quants productes de tipus “Begudes” s'han venut en una determinada localitat.
Llista quantes comandes ha efectuat un determinat empleat/da.