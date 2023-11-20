###############################################################
# sasa.tcl                                                    #
# DESCRIPTION:                                                #
#    This script is quick and easy to provide procedure       #
# for computing the Solvent Accessible Surface Area (SASA)    #
# of Protein and allows Users to select regions of protein.   #
#                                                             #   
# EXAMPLE USAGE:                                              #
#         source sasa.tcl                                     #
#         Selection: chain A and resid 1                      #
#                                                             #
#   AUTHORS:                                                  #
#	Sajad Falsafi (sajad.falsafi@yahoo.com)               #
#       Zahra Karimi                                          # 
#       3 Sep 2011                                           #
###############################################################

puts -nonewline "\n \t \t Selection: "
gets stdin selmode
# selection
set sel [atomselect top "$selmode"]
set protein [atomselect top "protein"]
set n [molinfo top get numframes]
set output [open "SASA_$selmode.dat" w]
# sasa calculation loop
for {set i 0} {$i < $n} {incr i} {
	molinfo top set frame $i
	set sasa [measure sasa 1.4 $protein -restrict $sel]
	puts "\t \t progress: $i/$n"
	puts $output "$sasa"
}
puts "\t \t progress: $n/$n"
puts "Done."	
puts "output file: SASA_$selmode.dat"
close $output

