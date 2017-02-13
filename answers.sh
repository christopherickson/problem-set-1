#! /usr/bin/env bash 

datasets='/Users/christophererickson/Genome_Class/rc-files/data-sets'


#1: Which state has the lowest murder rate?

states="$datasets/misc/states.tab.gz"

answer_1=$(gzcat $states \
    | cut -f 1,6 \
    | sort -k2 \
    | head -n2 \
    | tail -n1 \
    | cut -f1 \
    | sed 's/"//g') 

echo "answer-1: $answer_1"



#2: How many sequence records are in the sample.fa file?

records="$datasets/fasta/sample.fa"

answer_2=$(grep -v '^>' $records \
    | wc -l)

echo "answer-2: $answer_2"



#3: How many unique CpG IDs are in cpg.bed.gz?

unique="$datasets/bed/cpg.bed.gz"

answer_3=$(gzcat $unique \
    | cut -f4 \
    | sort -g \
    | uniq \
    | wc -l)

echo "answer-3: $answer_3"



#4: How many sequence records are in the SP1.fq file?

seq_records="$datasets/fastq/SP1.fq"

answer_4=$(grep '^@cluster' $seq_records \
    | wc -l)

echo "answer-4: $answer_4"



#5: How many words are on lines containing the word bloody in hamlet.txt?

Hamlet="$datasets/misc/hamlet.txt"

answer_5=$(grep -i bloody $Hamlet \
    | wc -w)

echo "answer-5: $answer_5"



#6: What is the length of the sequence in the first record of sample.fa?

length="$datasets/fasta/sample.fa"

answer_6=$(grep -v '^>' $length \
    | head -n1 \
    | tr -d '\n' \
    | wc -m)

echo "answer-6: $answer_6"



#7: What is the name of the longest gene in genes.hg19.bed.gz?

longene="$datasets/bed/genes.hg19.bed.gz"

answer_7=$(gzcat $longene \
    | awk '{OFS="\t"} \
    {print $1, $3 - $2}' \
    | sort -k2nr \
    | head -n1 \
    | cut -f1)

echo "answer-7: $answer_7"



#8: How many unique chromosomes are in genes.hg19.bed.gz?

sounique="$datasets/bed/genes.hg19.bed.gz"

answer_8=$(gzcat $sounique \
    | cut -f1 \
    | uniq \
    | wc -l)

echo "answer-8: $answer_8"



#9: How many intervals are associated with CTCF (not CTCFL) in peaks.chr22.bed.gz?

intervals="$datasets/bed/peaks.chr22.bed.gz"

answer_9=$(gzcat $intervals \
    | grep 'CTCF$' \
    | wc -l)

echo "answer-9: $answer_9"




#10: On what chromosome is the largest interval in lamina.bed?

largeinterval="$datasets/bed/lamina.bed"

answer_10=$(awk '{OFS="\t"} \
    {print $1, $3 - $2}' $largeinterval \
    | sort -nr \
    | head -n1 \
    | cut -f1)

echo "answer-10: $answer_10"




