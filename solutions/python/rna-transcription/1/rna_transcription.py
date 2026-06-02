def to_rna(dna_strand):
    table = str.maketrans('GCTA', 'CGAU')
    return dna_strand.translate(table)
