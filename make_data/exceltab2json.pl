#!/usr/bin/perl

# exceltab2json.pl
# Nakazato T.
# '16-06-03-Fri.    Ver. 0


my ($flag) = 0;

my ($file_in, $group_ins) = @ARGV;
open (IN, $file_in) or die $!;
while (defined ($line_in = <IN>)) {
#    @ele_in = split(/[\r\n]/, $line_in);

    $line_in =~ s/[\r\n]//g;
    
#    foreach $each_line (@ele_in) {

#	$each_line =~ s/^"//;
#	$each_line =~ s/"$//;

    $line_in =~ s/\"/\\\"/g;
    @ele_pre = split(/\t/, $line_in);
    @ele = map { $_ =~ s/\s+$//; $_ } @ele_pre;

    $name_ins_ja   = $ele[0];
    $name_ins_sci  = $ele[1];
    $name_chem_ins = $ele[2];
    $pmid_ins      = $ele[3];
    $name_plt_ja   = $ele[4];
    $name_plt_sci  = $ele[5];
    $effect        = $ele[6];
    $pmid_plt      = $ele[7];
    $name_chem_plt = $ele[8];

    $pmid_ins =~ s/PMID:\s+//;
    $pmid_plt =~ s/PMID:\s+//;

    $str .= '"name_ins_ja":   "'. $name_ins_ja    ."\",\n";
    $str .= '"name_ins_sci":  "'. $name_ins_sci   ."\",\n";
    $str .= '"group_ins":     "'. $group_ins      ."\",\n";
    $str .= '"id_ins":        "'. $id_ins         ."\",\n";
    $str .= '"name_chem_ins": "'. $name_chem_ins  ."\",\n";
    $str .= '"id_chem_ins":   "'. $id_chem_ins    ."\",\n";
    $str .= '"pmid_ins":      "'. $pmid_ins       ."\",\n";
    $str .= '"name_plt_ja":   "'. $name_plt_ja    ."\",\n";
    $str .= '"name_plt_sci":  "'. $name_plt_sci   ."\",\n";
    $str .= '"group_plt":     "'. $group_plt      ."\",\n";
    $str .= '"id_plt":        "'. $id_plt         ."\",\n";
    $str .= '"name_chem_plt": "'. $name_chem_plt  ."\",\n";
    $str .= '"id_chem_plt":   "'. $id_chem_plt    ."\",\n";
    $str .= '"pmid_plt":      "'. $pmid_plt       ."\",\n";
    $str .= '"effect":        "'. $effect         ."\"\n";

    $str = "{".$str."}";

    push @ele_out, $str;

    undef $str;
#    }
}
close (IN);

$str_out = "[".join(",\n", @ele_out)."]"."\n";

print $str_out;
