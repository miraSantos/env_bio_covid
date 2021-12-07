# Final Project: Replicating the bioinformatic analysis of [Emergence and expansion of SARS-CoV-2 B.1.526 after identification in New York](https://bedford.io/papers/annavajhala-ncov-ny-b.1.526/)


## Background

We are seeking to replicate the phylogenomic analysis of the Annavajhala 2021 paper. The methods are described in the paper as such,

"Phylogenetic reconstruction of amino acid changes (Fig. 2a) was con-ducted using the Nextstrain32 workflow at https://github.com/next-strain/ncov, which aligns sequences against the Wuhan Hu-1 reference using nextalign (https://github.com/nextstrain/nextclade), constructs a maximum-likelihood phylogenetic tree via IQ-TREE33, estimates molecular clock branch lengths via TreeTime34 and reconstructs nucleotide and amino acid changes (also via TreeTime). This workflow was applied to 2,309 SARS-CoV-2 genomes with the 9-bp deletion Δ106–108 in ORF1a-nsp6 along with mutation A20262G, which demarcates the parent clade to lineage B.1.526 alongside 688 global reference viruses. This analysis was conducted on data downloaded35 from GISAID 
(https://gisaid.org/) on 5 April 2021. Phylogeographic reconstruction of spread from New York state (Fig. 4e, f) was similarly conducted using the same Nextstrain workflow with the addition of performing ancestral trait reconstruction of the geographic ‘division’ attribute of 933 SARS-CoV-2 genomes downloaded from GISAID on 6 Jun 2021."

## Why this paper...our objectives for the replication

The selection of this paper grew out of our broader interest in the community of research and ecosystem of technologies emerging out of the response to the COVID-19 pandemic.  In particular, we wanted to investigate Nextstrain as platform for the rapid production of SARS-CoV-2 research. We focused on the *Emergence and expansion of SARS-CoV-2 B.1.526* paper because it felt particularly relevant, living in New England.

## We embarked on the Replication Project with the following questions in mind:

* How is Bioinformatics adapting to the SARS-CoV-2 threat?

* How are the techniques and technologies discussed in class being deployed in the response to SARS-CoV-2?

* How has the pressure of the SARS-CoV-2 threat influenced research best practices?

* How are pipelines/workflows/wrappers impacting speed, accessibility and replicability?

* How does Nextstrain (and other philosophically similar approaches) balance its stated mission to "improve outbreak response" with the requirements of Replicability?

## Our approach -- 3 pronged replication

1.    Reproduce directly from the existing project Repository: Nextstrain is setup to function as a rapid deployment system with a standard set of tools packaged together so that they can quickly setup in response to outbreaks.  Our first angle of attack was to attempt exactly that.  Clone, configure run.

2.    Replicate within the Nexstrain ecosystem of tools:  To better understand how Nextstrain operates under the hood, we simultaneously attempted a replication using the Nextstrain toolset, but using our own data filtered from GISAID.

3.    Replicate without Nextstrain: Lastly, to test our understanding of the Nextstrain toolset and the approach taken by the Bedford lab in their study of *Emergence and expansion of SARS-CoV-2 B.1.526*, we attempted a replication without the use of the Nextstrain toolset or the github repo.

## Repository Structure

 * code: Custom scripts used to replicate without Nextstrain
    * logs: from replication without Nextstrain
 * data: Downloaded and generated data used as the basis for replication with out the existing NCOV-NY repository
     * b.1.526
     * hcov_north-america
     * mafft_iqtree_out
     * nyc
     * reference_genomes
 * envs: yml file to recreate the working env we used to for the replications with Nextstrain
 * images: output figures generated by the Replication process
 * jupyter-notebooks: project notebook
 * logs: from replications with Nextstrain
 * output: Raw Data generated by Nextstrain Pipeline
     * lineage: Data from lineage build
     * ny
         * nextstrain_and_github: Data from ny build
 * results: results from replication without Nextstrain
     * iqtree_out: iqtree log output
 * scripts: Nextstrain workflows
     * ncov_ny: Copy of ncov-ny repository for Replication using repo and Nextstrain
     * ncov: Adaptation of ncov template repository for Replication using Nextstrain


## Original Paper Workflow

![Original Workflow](nextstrain_workflow.png)


## Running Nextstrain pipelines

In the `scripts` directory, there are two Nextstrain workflows: `ncov` and `ncov-ny`. `ncov` is the official Nextstrain template workflow for analyzing any SARS-CoV-2 data. We cloned the ncov repository to our machine as recommended in the documentation. We use `ncov` as our Nextstrain pipeline. 

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

## Results and Observations
The Nexstrain project is a powerful toolset, supporting a vibrant community of research, using bioinformatics to understand outbreaks in real-time.

### Distributed Documentation
The usage instructions for the original repository are parsimonious:
 1. Clone this repository: git clone https://github.com/blab/ncov-ny.git
 2. cd ncov-ny/
 3. Modify build definitions, as needed, in ny_profile/ny/builds.yaml.
 4. Running:  snakemake --profile ny_profiles/ny/

The Nextrain project website is extremely well documented so the authors of this paper likely did not feel it necessary to reproduce that documentation in detail.  This speeds up the research, but creates problems where there is not a single canonical set of static instructions that lives with the project.  The central documentation on the Nextstrain site continues to develop along with the project creating small inconsistencies with specific projects like ncov-ny over time. 

### Modularity, Nesting and Wrapping
The functional components that make up the Nextstrain pipeline are wrapped up into several layers (6 in some instances) of abstraction.  This allows a user to operate the pipeline without a deep understanding of what is actually happening in each step, speeding up the process and allowing a broader community of researchers to participate and contribute. 

As a tradeoff, it can be challenging to work through layer after layer to identify problems or just understand what is actually happening.  Further, if there are defects or even malicious attacks embeded within the software ecosystem, the depth of the hierarchy makes it much harder to identify and the interdependency of the pipeline specific configurations makes it harder to disentangle and replace dependencies.

### Ecosystem Specific Formats and Standards
The basic ingredients used within the Nextrain pipeline conform to broader standards.  The file types and process steps are familiar.  Digging into the details of how builds are setup within workflows, how input and intermediate data files are stored and how visualizations are configured however, revealed particularities specific to the Nextstrain process.  We found most of these details documented somewhere, but it was never clear whether they were specific to Nextstrain, the ncov template or the ncov-ny project.  The hierarchy of documentation became more difficult to navigate as we dug deeper into nuances of configurations and data formats.

### Distributed Data storage
For efficiency and to support collaboration, the ncov template process and the ncov-ny project stored input and intermediate data files on aws servers, reading and writing to aws as needed.
Without access to the same files it was difficult to know if initial data inputs or generated intermediate files matched the original process.

## Conclusions (workflow management tradeoffs)
Throughout the Nextrain ecosystem a focus on careful, accessible documentation and standardization is apparent.  There is an underlying urgency however, an emphasis on speed and accessibility rather than long term Replicability.  In many instances within Nextstrain efforts to support reusibility and rapid deployment also improve replicability. In some cases -- described above -- they do not, leading to trade-offs. We believe this to be intentional and in keeping with Nextstrain's' stated goal of improving outbreak response.



