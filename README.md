# post-processing-antismash

The script extract_clusters_antismash.py was designed to process inoumerous outputs from Antismash cluster detector.

Post-process of results created by Antismash. Generate a matrix containing the number of clusters by catagories for each organism.

Before you run extract_clusters_antismash.py, you need that the output folders of antismash in the same folder.

Folder:

    Example_antismash	
   		|_outputs_antismash_results
           	      |
           	      |_GCF_000026985.1.gbff.antismash
			GCF_002865965.1.gbff.antismash
			GCF_002952315.1.gbff.antismash
			GCF_900068895.1.gbff.antismash
			...
					

Download the example file and extract it.

	$ cd Example_antismasg
	$ extract_clusters_antismash.py outputs_antismash_results (without the last '/')
	$ ls
	outputs_antismash_results (input folder)
 	results.clusters.tab	(output)
 	results_faa	(output)
 	results_fna	(output)
  
 File results.clusters.tab is a resume of counting the clusters in each genome.
 
 			arylpolyene	bacteriocin	butyrolactone	hserlactone	hserlactone-arylpolyene	nrps	siderophore	t1pks-nrps	terpene	thiopeptide	transatpks-nrps
	GCF_000026985.1		0	0	0	0	0	1	1	0	0	0	0
	GCF_002865965.1		0	1	1	1	1	2	0	0	0	1	0
	GCF_002952315.1		0	0	0	0	0	1	1	0	0	0	0
	GCF_900068895.1		1	0	0	2	0	1	1	1	1	1	1
