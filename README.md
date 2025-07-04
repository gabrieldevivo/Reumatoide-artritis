# Reumatoide-artritis-BM2C
Verslag over data-analyse van Reumatoide artritis
Autheur: Gabriel de Vivo
klas: BM2C

## 📁 Inhoud/structuur
- `data/ruw/` - de orginele dataset
- `data/` – de verwerkte data die is gebruikt.  
- `data/bambambai/` - bam en bambai files die zijn gemaakt
- `code/` – gebruikte code om de gekregen data te verwerken
- `figuren/` - grafieken en tabellen
- `bronnen/` - gebruikte bronnen 
- `README.md` - het verslag
- `datastewardship/` - De files gerelateerd aan de competenties

---

## Inleiding

Reumatoide Artritis is een vorm van gewrichtsslijmvlies ontsteking waarbij het immuun systeem lichaamseigen weefsels aantast in de gewrichten[(Andrei-Flavius Radu, 2021)](bronnen/cells-10-02857-v2.pdf). Deze auto-immuun ziekte ontstaat in 0.24-1% van de populatie en komt 2 tot 3 keer meer voor in vrouwen dan bij mannen[(Venetsanpoulou et al, 2023)](bronnen/cells-10-02857-v2.pdf). De symptonen van Reumatoide Artritis omvatten pijn in de aangetaste gewrichte en stijfheid in deze gewrichten na langdurig stil zitten[(Jutley et al, 2017)](bronnen/1-s2.0-S1521694217300335-main.pdf). Reumatoide artritis wordt veroorzaakt door een combinatie van genetica, omgevings factoren en een auto-immuun reactie op, bijvoorbeeld lichaams eigen eiwitten[(Wang et al, 2004)](bronnen/roehrl-wang-glycosaminoglycans-are-a-potential-cause-of-rheumatoid-arthritis.pdf). Omdat er bekende indicatoren zijn voor het ontstaan van reumatoide artritis, zoals reumatoide factor[(Jutley et al, 2017)](bronnen/1-s2.0-S1521694217300335-main.pdf). Daarom is het van groot interesse om ook te kijken naar genetische indicatoren van reumatoide artritis, een bekende genetische indicator van reumatoide artritis is HLA-DRB1[(Laura E. Dedmon, 2020)](bronnen/keaa232.pdf). Omdat er al genen genetische indicatoren zijn gevonden is het van interesse om meer genen te vinden, de hoofdvraag van dit onderzoek is daarom; Welke genen en pathways hebben een afwijkende expressie in patienten met rheumatoide artritis vergeleken met gezonde patienten? 

## Methoden

Om de ruwe [data](data/ruw/) te verwerken is gebruik gemaakt van verscheidenen packages in het [R script](code/script-transcriptionomics.R). 
Voor het mappen van de reads is gebruik gemaakt van Rsubread versie 2.22.1 [(Liao et al, 2019)](bronnen/Yang_Liao_2019.pdf). Het Rsubread package zoekt de locatie van bepaalde sequenties van het gesequencete DNA op het volledige genoom van de mens, [GRCh38.p14](https://ftp.ensembl.org/pub/release-114/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.toplevel.fa.gz), en maakt hiermee een bam file. Deze bam [files](data/bambambai/) worden in een countmatrix gezet. 
Na het mappen van de samples zijn de gemapte samples genormaliseert met DEseq2 versie 1.48.1 [(Love et al, 2014)](bronnen/Micheal_I_love_2014.pdf). De data wordt genormaliseert om rekening te houden met de sequencing depth en kan door deze normalisering de expressie beter vergelijken tussen samples.
Na het normaliseren van de samples kan de data worden gevisualiseert met de package EnhancedVolcano versie 1.26.0 [(Blighe et al, 2025)](https://bioconductor.org/packages/devel/bioc/vignettes/EnhancedVolcano/inst/doc/EnhancedVolcano.html). Met deze package kan een grafiek worden gemaakt die de differentiele expressie van de samples weergeeft.
Verder zijn de samples geanalyseert met goseq om een Go enrichment uit te voeren, Voor deze analyse wordt gebruik gemaakt van het menselijke HG38 genoom. De goenrichment laat genen zien in een grafiek die een verhoogde expressie hebben in de patienten samples.
Om de pathway analyse te doen is gebruik gemaakt van KEGGREST versie 1.48.0[(Tenenbaum et al, 2021)](bronnen/KEGGREST.pdf) package, Deze package mapt de gesequencete DNA op bekende pathways om te kijken welke pathways mogelijk betrokken zijn bij reumatoide artritis.

<p align="center">
  <img src="figuren/Screenshot%202025-06-21%20013352.png" alt="Figuur 1: flowchart" width="600"/>
</p>

*Figuur 1: Flowchart van de data verwerking in R.*

## Resultaten

Om de overexpressie van genen in de patienten te analyseren is gebruik gemaakt van verscheidenen packages in R.
De data is verwerkt met Rsubread om een [countmatrix](data/count_matrix.txt) te maken met de bam en bambai [files](data/bambambai/).

<p align="center">
  <img src="figuren/volcano%20plot.png" alt="Figuur 2: enhanced volcano plot met p-cutoff" width="600"/>
</p>

*Figuur 2: enhanced volcano plot met p-cutoff, de x-as geeft de foldchange aan en de punten die op be y-as boven 5 liggen zijn significant, aangegeven met een rode kleur. de grijs gekleurde bolletjes verschillen niet significant van de patienten.*

Na het maken van de [countmatrix](data/count_matrix.txt) wordt de data vergeleken met elkaar. Dit is te zien in figuur 2 waar een volcano plot is weergegeven, in deze grafiek is te zien dat verscheidenen genen significant up of down regulated zijn. een opvallend voorbeeld hiervan is het ANKRD30BL, dit gen is erg significant downregulated in patienten. De volcano plot bevat 2085 significant upregulated genen en 2487 significant downregulated genen. 

Er is literatuur onderzoek uitgevoerd voor de functie van een paar van deze significante verschillende genen, te vinden in deze [tabel](bronnen/genreference.csv).

<p align="center">
  <img src="figuren/Goenrichment.png" alt="Figuur 3: GOenrichment" width="600"/>
 </p> 
 
*Figuur 2: GOenrichment grafiek van de patienten. De x-as geeft de significantie in -log10 aan.*

De 10 meest significante genen zijn verwerkt in figuur 3, waarbij de "protein binding" het meest significant was. De overige significante genen zien [hier](data/GO_enrichment_significant.csv) te vinden. 

<p align="center">
  <img src="figuren/upregpathway.png" alt="Figuur 4: Upregulated pathway" width="600"/>
</p>

*Figuur 4: Pathway analyse van de upregulated pathways, de x-as geeft de significantie van de pathways in -log10 aan.*

Figuur 4 en 5 geven de 10 hoogste upregulated en downregulated pathways aan in de patienten. Bij de upregulated pathways waren de Adaptive immune response en de immuno globulline pathways het meest significant. Voor de downregulated pathways was de proton transport pathway het meest significant.

<p align="center">
  <img src="figuren/downregpathway.png" alt="Figuur 5: downregulated pathway" width="600"/>
</p>

*Figuur 5: Pathway analyse van de down regulated pathways, de x-as geeft de significantie van de pathways in -log10 aan.*



## Conclusie
Om afwijkende expressie van genen en pathways te vinden in patienten met reumatoide artritis is een data analyse uitgevoerd in R. 

De Enhancedvolcano [plot](figuren/volcano%20plot.png") laat zien dat er veel genen significant verschillende tot expressie komt in de patienten samples, Bij de genen die tot overexpressie komen in de data was van interesse het gen [SRN](bronnen/genreference.csv), een gen dat codeert voor een eiwit in immuuncellen met een bijbehorende receptor. [IGHV1-69](bronnen/genreference.csv) is een gen dat ook in overexpressie is gemeten, dit gen codeert voor een imunoglobuline complex, waarvan het product kan vervormen tot een reumatoide factor. Deze genen die tot overexpressie hebben te maken met het auto-immuun respons van reumatoide artritis. 
De [Goenrichment](figuren/Goenrichment.png) laat zien dat de meest significante overexpressie in het sample "protein binding" is, deze Gene Onthology heeft te maken met anti lichamen en komt mogelijk tot overexpressie door de auto immuniteit in de ziekte.
De pathway analyse voor de [up](figuren/upregpathway.png) en [downregulated](figuren/downregpathway.png) pathways laat zien dat de immuun respons gerelateerde pathways adaptive immune response en immunoglobuline productie significant tot overexpressie komen.
In conclusie lijkt het er op dat de meest significante genen en pathways die tot overexpressie komen in de samples betrokken zijn in de immuun response van het lichaam. Maar het is niet mogelijk om de conclusie te trekken dat deze overexpressie specifiek is voor reumatoide artritis, omdat deze genen en pathways wijzen op een algemeen immuun respons en niet een auto immuun reactie.


