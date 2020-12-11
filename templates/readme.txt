mouse_Allen2017HikishimaLR (lowResolution)
- Allen Mouse Atlas 2017(CCFv3)* in combination with Hikishima Templates - LOW RESOLUTION (0.07x0.07x0.07 mm)
*see: http://help.brain-map.org/display/mouseconnectivity/API
- using annotation/ccf_2017	UINT (32 bit) structure gray matter and fiber tract annotation of CCFv3 (October 2017), templates were downloaded with 25µm isotropic resolution
- Note that the templates are downsampled to 70µm isotropic resolution (sufficient in most cases)  

--------------------------------------------------------
file information:  mouse_Allen2017HikishimaLR (lowResolution)
--------------------------------------------------------
  [-]..not required files, 
  [1]..required files, [*]..suggested

ANO.nii      .. [1] atlas 
ANO.xlsx     .. [1] atlas information
AVGT.nii     .. [1] MR template (brain)
AVGThemi.nii .. [1] brain hemisphere mask
AVGTmask.nii .. [1] brain mask 
_b1grey.nii  .. [1] gray matter TPM
_b2white.nii .. [1] white matter TPM
_b3csf.nii   .. [1] CSF TPM
parameter.m  .. [1] parameter file (m.file) to specify species and default voxel-resolution
readme.txt   .. [-] file information, authors of atlases/MR templates/TPMs and sources
______ additional files ________________________ 
- none
--------------------------------------------------------

Please refer the following papers: 
Hikishima K, Komaki Y, Seki F, Ohnishi Y, Okano HJ, Okano H. 
In vivo microscopic voxel-based morphometry with a brain template to characterize strain-specific structures in the mouse brain. Sci Rep. 2017 Dec;7(1):85. doi:10.1038/s41598-017-00148-1. PubMed PMID: 28273899.

and maybe this..
Allen Institute for Brain Science. Allen Mouse Common Coordinate Framework ALLEN MOUSE COMMON COORDINATE FRAMEWORK AND REFERENCE ATLAS. Technical White Paper, 2017.
see also:
A. R. Jones, C. C. Overly, and S. M. Sunkin. The Allen Brain Atlas: 5 years and beyond. Nature Reviews Neuroscience, 2009.
E. Lein, M. Hawrylycz, N. Ao, M. Ayres, A. Bensinger, A. Bernard, A. Boe, M. Boguski, K. Brockway, E. Byrnes, and Others. Genome-wide atlas of gene expression in the adult mouse brain. Nature, 2006.
--> https://neurodata.io/data/allen_atlas/

--------------------------------------------------------
source: https://www.nitrc.org/projects/tpm_mouse

The templates for in vivo mouse brain are intended for SPM normalization and segmentation (including skull-stripping). The population-averaged, stereotaxic, and tissue segmented template were created from in vivo T1WI (an isotropic resolution of 80µm) of C57Bl/6(n=30, male), BALB/cBy(n=10, male), C3H/He(n=10, male), and DBA/2 (n=10, male) mice. The voxel size of templates were multiplied by 10 to be able to use SPM directly.
Keywords: atlas, mouse, probability map, template, inbred strain

 