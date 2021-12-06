# Final Project: Replicating the bioinformatic analysis of [Emergence and expansion of SARS-CoV-2 B.1.526 after identification in New York](https://bedford.io/papers/annavajhala-ncov-ny-b.1.526/)

# Paper of Interest: Replication -- Emergence and expansion of SARS-CoV-2 B.1.526 after identification in New York

# Background

"Phylogenetic reconstruction of amino acid changes (Fig. 2a) was con-ducted using the Nextstrain32 workflow at https://github.com/next-strain/ncov, which aligns sequences against the Wuhan Hu-1 reference using nextalign (https://github.com/nextstrain/nextclade), constructs a maximum-likelihood phylogenetic tree via IQ-TREE33, estimates molecular clock branch lengths via TreeTime34 and reconstructs nucleotide and amino acid changes (also via TreeTime). This workflow was applied to 2,309 SARS-CoV-2 genomes with the 9-bp deletion Δ106–108 in ORF1a-nsp6 along with mutation A20262G, which demarcates the parent clade to lineage B.1.526 alongside 688 global reference viruses. This analysis was conducted on data downloaded35 from GISAID 
(https://gisaid.org/) on 5 April 2021. Phylogeographic reconstruction of spread from New York state (Fig. 4e, f) was similarly conducted using the same Nextstrain workflow with the addition of performing ancestral trait reconstruction of the geographic ‘division’ attribute of 933 SARS-CoV-2 genomes downloaded from GISAID on 6 Jun 2021."


# Original Paper Workflow


# Running Nextstrain pipelines

In the `scripts` directory, there are two Nextstrain workflows: `ncov` and `ncov-ny`. `ncov` is the official Nextstrain workflow for analyzing SARS-CoV-2 data. We cloned the ncov repository to our machine as recommended in the documentation. We will use `ncov` as our Nextstrain pipeline. 

The second repository `ncov-ny` is a copy of `ncov` used and specified by the authors of the paper. You can find the original repository from the Bedford lab [here] (https://github.com/blab/ncov-ny). We will use `ncov-ny` to refer to in our project as "using both Github repo and Nextstrain" because this is the official GitHub repository associated with the paper, and utilizes the Nextstrain pipeline.

## Running `ncov`

1. Go into `scripts/ncov` directory. 
2. Run `nextstrain view auspice/ --port 8889`
3. Connect your local port to port opened on the Poseidon cluster by running:
```
ssh -N -f -L localhost:8889:localhost:8889 USERNAME@poseidon-[l1 or l2].whoi.edu
```
4. Go into a browser of your choice and type `http://localhost:8889` or `http://127.0.0.1:8889`
5. Select the auspice visualization you want to explore.

## Running `ncov-ny`

1. Go into `scripts/ncov` directory.
2. Run `nextstrain view auspice/ --port 8889`, or another port number.
3. Connect your local port to port opened on the Poseidon cluster by running:
```
ssh -N -f -L localhost:8889:localhost:8889 USERNAME@poseidon-[l1 or l2].whoi.edu
```
4. Go into a browser of your choice and type `http://localhost:8889` or `http://127.0.0.1:8889`
5. Select the auspice visualization you want to explore.

