"""
Identify matching haplotypes
"""
import argparse
from Bio import AlignIO

if __name__ == "__main__":

    parser = argparse.ArgumentParser(
        description="Identify matching haplotypes",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )

    parser.add_argument('--alignment', type=str, metavar="FASTA", required=True, help="input FASTA alignment")
    args = parser.parse_args()

    aln = AlignIO.read(args.alignment, "fasta")

    positions = [11288, 11289, 11290, 11294, 11296, 20262]
    wt_expected = ['-', '-', '-', '-', '-', 'G']

    newwave_records = []
    for seq in aln:
        include = True
        for i in range(0, len(positions)):
            if seq[positions[i]-1].upper() != wt_expected[i]:
                include = False
        if include:
            newwave_records.append(seq.name)

    newwave_records.sort()
    for record in newwave_records:
        print(record)
