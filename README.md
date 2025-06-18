# Reumatoide-artritis
Verslag over data-analyse van Reumatoide artritis


## 📁 Inhoud/structuur

- `data/raw/` – de data verkregen van het originele artiekel.  
- `data/processed/` - verwerkte datasets gegenereerd met scripts 
- `code/` – gebruikte code om de gekregen data te verwerken
- `figuren/` - grafieken en tabellen
- `bronnen/` - gebruikte bronnen 
- `README.md` - het verslag
- `assets/` - overige documenten voor de opmaak van deze pagina

---

## Introductie

Reumatoide Artritis is een vorm van gewrichtsslijmvlies ontsteking die verorzaakt wordt door [Auto-immuniteit](bronnen/managementofrheumatoidarth.pdf). En wordt veroorzaakt door een combinatie van genetica en een auto-immuun reactie op, bijvoorbeeld lichaams eigen [eiwitten](glycosaminoglycans-are-a-potential.pdf). (sympotons-in-individuals-at-risk-of-rheuma.pdf) De symptonen van Reumatoide Artritis omvatten pijn in de aangetaste gewrichte en stijfheid in deze gewrichten na langdurig [stil zitten](https://www.ncbi.nlm.nih.gov/books/NBK441999/). Deze auto-immuun ziekte ontstaat in 0.24-1% van de populatie en komt 2 tot 3 keer meer voor in vrouwen dan bij [mannen](bronnen/epidoemiologyandriskfactorsforrheumatoid.pdf). Rheumatoide artritis is, zoals genoemd een relatief veel voorkomende afflictie. de hoofdvraag van dit onderzoek is daarom; Welke genen hebben een afwijkende expressie in patienten met rheumatoide artritis vergeleken met gezonde patienten? 

## Methoden

Om de data te verwerken is gebruik gemaakt van verscheidenen packages in het [R script](code/script-transcriptionomics.R). 
Voor het mappen van de reads is gebruik gemaakt van Rsubread. Het Rsubread package zoekt de locatie van bepaalde sequenties van het gesequencete DNA op het volledige genoom van, in dit geval de mens. 
Na het mappen van de samples zijn de gemapte samples genormaliseert met DEseq2. Dit wordt gedaan om rekening te houden met de sequencing depth en kan de expressie beter worden vergeleken tussen samples.



## Resultaten

Om inzicht te krijgen in eigenschappen van de te gebruiken spreuken is er een overzicht gemaakt, te vinden in [deze tabel](resultaten/.csv). Onvergeeflijke vloeken zijn niet meegenomen in dit overzicht. 

Om een afweging te maken welke spreuken het meest effectief zijn, is er onderzocht of er een verband te vinden is tussen kracht en accuraatheid. In [het resultaat hiervan](resultaten/spell_power_vs_accuracy.png) is te zien dat er een negatieve daling lijkt te zijn in kracht als de accuraatheid toeneemt. Een uitschieter is de onvergeeflijke vloek *Avada Kedavra*, met zowel hoge kracht als accuraatheid. 

## Conclusie

Spreuken met meer accuraatheid lijken minder krachtig te zijn. Een uitzondering op deze trend is de onvergeeflijke vloek *Avada Kedavra*, welke beter niet gebruikt kan worden. 

