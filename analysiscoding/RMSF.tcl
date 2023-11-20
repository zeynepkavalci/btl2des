#RMSF
set outfile [open "RMSF.dat" w]
set sel [atomselect top all]
set sel0 [$sel num]
set sel [atomselect top "resid 1 to $sel0 and name CA"]

set stepsize 1

set nframes [molinfo top get numframes]
set nframes2 [expr $nframes - 1]

# Comment out below line if you do not want a header in output
#puts $outfile "Residue \t RMSF"

for {set i 0} {$i < [$sel num]} {incr i} { 
     set rmsf [measure rmsf $sel first 1 last $nframes2 step $stepsize] 
     puts $outfile "[expr {$i+1}] \t [lindex $rmsf $i]" 
} 

close $outfile