# Reumatoide-artritis
Verslag over data-analyse van Reumatoide artritis


## 📁 Inhoud/structuur

- `data/` – de verwerkte data die is gebruikt.  
- `data/bambambai/` - bam en bambai files die zijn gemaakt
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
Om de pathway analyse te doen is gebruik gemaakt van de KEGGREST package, Deze package mapt de gesequencete DNA op bekende pathways om te kijken welke pathways mogelijk betrokken zijn bij reumatoide artritis.



## Resultaten

Om de overexpressie van genen in de patienten te analyseren is gebruik gemaakt van verscheidenen packages in R.
De data is verwerkt met Rsubread om een [countmatrix](data/count_matrix.txt) te maken met de bam en bambai [files](data/bambambai/).

<p align="center">
  <img src="figuren/volcano%20plot.png" alt="Figuur 2: enhanced volcano plot met p-cutoff" width="600"/>
</p>
*Figuur 2: enhanced volcano plot met p-cutoff, de x-as geeft de foldchange aan en de punten die op be y-as boven 5 liggen zijn significant, aangegeven met een rode kleur.*

In figuur 2 is de volcano plot weergegeven, in deze grafiek is te zien dat verscheidenen genen significant up of down regulated zijn. een opvallend voorbeeld hiervan is het ANKRD30BL, dit gen is erg significant downregulated in patienten.

<p align="center">
  <img src="figuren/Goenrichment.png" alt="Figuur 3: GOenrichment" width="600"/>
 </p> 
 
*Figuur 2: GOenrichment grafiek van de patienten. De x-as geeft de significantie in -log10 aan.*

De 10 meest significante genen zijn verwerkt in figuur 3, waarbij de "protein binding" het meest significant was. De overige significante genen zien [hier](data/GO_enrichment_significant.csv) te vinden.

<p align="center">
  <img src="figuren/upregpathway.png" alt="Figuur 4: Upregulated pathway" width="600"/>
</p>

*Figuur 4: Pathway analyse van de upregulated pathways, de x-as geeft de significantie van de pathways in -log10 aan.*



<p align="center">
  <img src="figuren/downregpathway.png" alt="Figuur 5: downregulated pathway" width="600"/>
</p>

*Figuur 5: Pathway analyse van de down regulated pathways, de x-as geeft de significantie van de pathways in -log10 aan.*






## Conclusie

Spreuken met meer accuraatheid lijken minder krachtig te zijn. Een uitzondering op deze trend is de onvergeeflijke vloek *Avada Kedavra*, welke beter niet gebruikt kan worden. 

