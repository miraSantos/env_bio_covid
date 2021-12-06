# Final Project: Replicating the bioinformatic analysis of [Emergence and expansion of SARS-CoV-2 B.1.526 after identification in New York](https://bedford.io/papers/annavajhala-ncov-ny-b.1.526/)

# Paper of Interest: Replication -- Emergence and expansion of SARS-CoV-2 B.1.526 after identification in New York

# Background

"Phylogenetic reconstruction of amino acid changes (Fig. 2a) was con-ducted using the Nextstrain32 workflow at https://github.com/next-strain/ncov, which aligns sequences against the Wuhan Hu-1 reference using nextalign (https://github.com/nextstrain/nextclade), constructs a maximum-likelihood phylogenetic tree via IQ-TREE33, estimates molecular clock branch lengths via TreeTime34 and reconstructs nucleotide and amino acid changes (also via TreeTime). This workflow was applied to 2,309 SARS-CoV-2 genomes with the 9-bp deletion Δ106–108 in ORF1a-nsp6 along with mutation A20262G, which demarcates the parent clade to lineage B.1.526 alongside 688 global reference viruses. This analysis was conducted on data downloaded35 from GISAID 
(https://gisaid.org/) on 5 April 2021. Phylogeographic reconstruction of spread from New York state (Fig. 4e, f) was similarly conducted using the same Nextstrain workflow with the addition of performing ancestral trait reconstruction of the geographic ‘division’ attribute of 933 SARS-CoV-2 genomes downloaded from GISAID on 6 Jun 2021."







# Why this paper...our objectives for the replication

The selection of this paper grew out of our broader interest in the community of research and ecosystem of technologies emerging out of the response to the COVID-19 pandemic.  In particular, we wanted to investigate Nextstrain as platform for the rapid production of SARS-CoV-2 research. We focused on the *Emergence and expansion of SARS-CoV-2 B.1.526* paper because it felt particularly relevant, living in New England.

We embarked on the Replication Project with the following questions in mind:

    - How is Bioinformatics adapting to the SARS-CoV-2 threat?

    - How are the techniques and technologies discussed in class being deployed in the response to SARS-CoV-2?

    - How has the pressure of the SARS-CoV-2 threat influenced research best practices?

    - How are pipelines/workflows/wrappers impacting speed, accessibility and replicability?

    - How does Nextstrain (and other philosophically similar approaches) balance its stated mission to "improve outbreak response" with the requirements of Replicability?

# Our approach -- 3 pronged replication

    **1.    Reproduce directly from the existing project Repository: Nextstrain is setup to function as a rapid deployment system with a standard set of tools packaged together so that they can quickly setup in response to outbreaks.  Our first angle of attack was to attempt exactly that.  Clone, configure run.

    **2.    Replicate within the Nexstrain ecosystem of tools:  To better understand how Nextstrain operates under the hood, we simultaneously attempted a replication using the Nextstrain toolset, but using our own data filtered from GISAID.

    **3.    Replicate within standard tools: Lastly, to test our understanding of approach taken by the Bedford lab in their study of *Emergence and expansion of SARS-CoV-2 B.1.526*, we attempted a replication without the use of the Nextstrain toolset.

# Original Paper Workflow

How Nextstrain Replication is Intended to Work
# Running Nextstrain pipelines

In the `scripts` directory, there are two Nextstrain workflows: `ncov` and `ncov-ny`. `ncov` is the official Nextstrain workflow for analyzing SARS-CoV-2 data. We cloned the ncov repository to our machine as recommended in the documentation. We will use `ncov` as our Nextstrain pipeline. 

The second repository `ncov-ny` is a copy of `ncov` used and specified by the authors of the paper. You can find the original repository from the Bedford lab [here](https://github.com/blab/ncov-ny). We will use `ncov-ny` to refer to in our project as "using both Github repo and Nextstrain" because this is the official GitHub repository associated with the paper, and utilizes the Nextstrain pipeline.

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

1. Go into `scripts/ncov-ny` directory.
The remaining steps are identical to running the `ncov` pipeline above.



What does Replication mean for an ecosystem of technologies like nextstrain?


Results and Observations
replication - reproduction and rapid response
“Reproducibility refers to the ability to achieve the same findings as another investigator using extant data from a prior study.”

https://ies.ed.gov/pdf/CompanionGuidelinesReplicationReproducibility.pdf

“In general, replication studies involve collecting and analyzing data to determine if the new studies...yield the same findings as a previous study. As such, replication sets a somewhat higher bar than reproducibility and has been described as ‘the ultimate standard by which scientific claims are judged’ (Peng, 2011: 1226)”

Companion Guidelines on Replication & Reproducibility in Education Research
A Report from The National Science Foundation, U.S. Department of Education Nov 28, 2018
https://ies.ed.gov/pdf/CompanionGuidelinesReplicationReproducibility.pdf

Peng, Roger D. (2011). Reproducible research in computational science. Science, 334(6060): 1226-1227

How the Replication process worked in Practice (for each)


Conclusions (workflow management tradeoffs)


Snakemake Mechanism to Support 
Reproduction
and
Replication



Nextrain  Intends to Support Rapid Response

Resource Reuse

Rapid deployment

Flexible Collaboration


