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

Reumatoide Artritis is een vorm van gewrichtsslijmvlies ontsteking waarbij het immuun systeem lichaamseigen weefsels aantast in de [gewrichten](bronnen/managementofrheumatoidarth.pdf). Deze auto-immuun ziekte ontstaat in 0.24-1% van de populatie en komt 2 tot 3 keer meer voor in vrouwen dan bij [mannen](bronnen/epidoemiologyandriskfactorsforrheumatoid.pdf). De symptonen van Reumatoide Artritis omvatten pijn in de aangetaste gewrichte en stijfheid in deze gewrichten na langdurig [stil zitten](https://www.ncbi.nlm.nih.gov/books/NBK441999/). Reumatoide artritis wordt veroorzaakt door een combinatie van genetica en een auto-immuun reactie op, bijvoorbeeld lichaams eigen [eiwitten](glycosaminoglycans-are-a-potential.pdf). Omdat er bekende indicatoren zijn voor het ontstaan van reumatoide artritis, zoals [reumatoide factor](sympotons-in-individuals-at-risk-of-rheuma.pdf) is het van groot interesse om ook te kijken naar genetische indicatoren van reumatoide artritis, een bekende genetische indicator van reumatoide artritis is [HLA-DRB1](bronnen/geneticsofrheumatoidarthritis.pdf). Omdat er al genen genetische indicatoren zijn gevonden is het van interesse om meer genen te vinden, de hoofdvraag van dit onderzoek is daarom; Welke genen hebben een afwijkende expressie in patienten met rheumatoide artritis vergeleken met gezonde patienten? 

## Methoden

Om de data te verwerken is gebruik gemaakt van verscheidenen packages in het [R script](code/script-transcriptionomics.R). 
Voor het mappen van de reads is gebruik gemaakt van Rsubread. Het Rsubread package zoekt de locatie van bepaalde sequenties van het gesequencete DNA op het volledige genoom van de mens en maakt hiermee een bam file. Deze bam files worden in een countmatrix gezet. 
Na het mappen van de samples zijn de gemapte samples genormaliseert met DEseq2. De data wordt genormaliseert om rekening te houden met de sequencing depth en kan door deze normalisering de expressie beter vergelijken tussen samples.
Na het normaliseren van de samples kan de data worden gevisualiseert met de package EnhancedVolcano. Met deze package kan een grafiek worden gemaakt die de differentiele expressie van de samples weergeeft.
Verder zijn de samples geanalyseert met goseq om een Go enrichment uit te voeren, Voor deze analyse wordt gebruik gemaakt van het menselijke HG38 genoom. De goenrichment laat genen zien in een grafiek die een verhoogde expressie hebben in de patienten samples.
Om de pathway analyse te doen is gebruik gemaakt van de KEGG package, Deze package mapt de gesequencete DNA op bekende pathways om te kijken welke pathways mogelijk betrokken zijn bij reumatoide artritis.



## Resultaten

Om inzicht te krijgen in eigenschappen van de te gebruiken spreuken is er een overzicht gemaakt, te vinden in [deze tabel](resultaten/.csv). Onvergeeflijke vloeken zijn niet meegenomen in dit overzicht. 

Om een afweging te maken welke spreuken het meest effectief zijn, is er onderzocht of er een verband te vinden is tussen kracht en accuraatheid. In [het resultaat hiervan](resultaten/spell_power_vs_accuracy.png) is te zien dat er een negatieve daling lijkt te zijn in kracht als de accuraatheid toeneemt. Een uitschieter is de onvergeeflijke vloek *Avada Kedavra*, met zowel hoge kracht als accuraatheid. 

## Conclusie

Spreuken met meer accuraatheid lijken minder krachtig te zijn. Een uitzondering op deze trend is de onvergeeflijke vloek *Avada Kedavra*, welke beter niet gebruikt kan worden. 

