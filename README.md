
# ----- Allen ROI Extraction Toolbox ----- #
The VBM pipeline in SPM generates images in which maximum change has been observed in specific brain regions across a group of subjects. These images are referred to as cluster images here, that are used by the Allen ROI Extraction toolbox.
The toolbox has two functionalities - ROI Extraction and Cluster Labelling. ROI Extraction involves creation of masks of user-specified brain regions (ROIs) and, Cluster Labelling involves specifying the proportion of brain regions in cluster images, obtained from VBM analysis.

# Download and Installation #
1. This toolbox has been tested on Matlab R2019a.
2. This toolbox has been tested on SPM12 version 7771. Download and install SPM12 and add it to your Matlab search path using the addpath(genpath()) command from Matlab. SPM can be downloaded from the following link: https://www.fil.ion.ucl.ac.uk/spm/software/download/.
3. Download the Allen ROI Extraction Tool(ARET) from the following link: https://github.molgen.mpg.de/chaudhuri/ARET.git. Copy the toolbox to a preferred location in your file system and add its path to Matlab, using addpath(genpath) command from Matlab. This can be done in the following way - addpath(genpath(‘*fullpath to ARET in your filesystem*’)).

# Contact Information #
For further information and clarification about ARET please contact Tanusree Chaudhuri <tanusree_chaudhuri@psych.mpg.de> or Michael Czisch <czisch@psych.mpg.de> of Max Planck Institute of Psychiatry, Munich.
