# Autorun hmmsearch program
 
#! /usr/perl/bin -w
use strict;

my $folderin="/home/mnguyen/Research/Symbiomics/AA3/AA3_2/AA3_2_manuscript/Published_fungal_proteomes_04Jun2018";
my $folderout="/home/mnguyen/Research/AOX/pfam_aox_hmm/Mycocosm_published_genomes";
my $folderout_all="/home/mnguyen/Research/AOX/pfam_aox_hmm/Mycocosm_published_genomes/hmmsearch_detail";
my $folderout_dom="/home/mnguyen/Research/AOX/pfam_aox_hmm/Mycocosm_published_genomes/hmmsearch_domtbl";
my $hmm_file="/home/mnguyen/Research/AOX/pfam_aox_hmm/AOX.hmm";
mkdir $folderout;
mkdir $folderout_dom;
mkdir $folderout_all;

opendir(DIR,"$folderin") || die "Could not open folder $folderin";
my @files=readdir(DIR);
my $filecount=0;
foreach my $file (@files)
{
	if (($file ne ".") and ($file ne ".."))
	{
		my $fileout=substr($file,0,-5);
		my $fileout_all=$fileout."out";
		my $fileout_domtbl=$fileout."domtblout";
		$filecount++;
		print "$filecount.$file:start...............................";
		my $cmd = "hmmsearch -o $folderout_all/$fileout_all --domtblout $folderout_dom/$fileout_domtbl -E 1E-05 --domE 1E-05 --cpu 20 $hmm_file $folderin/$file";
		system $cmd;
		print "finish\n";
	}
}
closedir(DIR);