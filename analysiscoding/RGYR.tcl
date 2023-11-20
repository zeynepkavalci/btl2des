#RGYR Calculation
set outfile [open $name.rgyr.dat w]
set selp [atomselect top "protein"]
for {set i 0} {$i < $num_steps} {incr i} {
$selp frame $i
# # $selp update
# $selp1 frame $i
# $selp1 update
set rgyr1 [measure rgyr $selp]
puts $outfile "$i $rgyr1"
}
close $outfile
