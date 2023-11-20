import MDAnalysis as mda
from MDAnalysis.analysis import diffusionmap, align
import matplotlib.pyplot as plt
get_ipython().run_line_magic('matplotlib', 'inline')
import numpy as np

u = mda.Universe("/pathtofile/psf.psf","/pathtofile/dcd.dcd")

aligner = align.AlignTraj(u, u, select='name CA',in_memory=True).run()
print(u)

matrix = diffusionmap.DistanceMatrix(u, select='name CA').run()
matrix.dist_matrix.shape

fig1=plt.imshow(matrix.dist_matrix, cmap='viridis' , vmin=0,vmax=6 )
plt.xlabel('Frame', weight='bold' , fontsize=12)
plt.ylabel('Frame' , weight='bold', fontsize=12)
plt.colorbar(fig1, label='labelofthecolorbar)')
ax = plt.gca()
ax.tick_params(axis = 'both',  labelsize = 16 )
plt.title('titleoftheplot', weight='bold')

fig1.figure.savefig("tif.tif" , bbox_inches='tight' ,dpi=1200)

plt.colorbar(fig1)
