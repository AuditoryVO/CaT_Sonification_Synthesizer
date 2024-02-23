# CaT-Sonification-Synthesizer
Implementation of the deep learning feature extraction sonification synthesizer for the exploration of the stellar spectra of the CaT library. Jupiter Notebook analysis and CSound/Cabbage multimodal display.



-------------------------------TO MODIFY-------------
CONTENTS
- Jupyter notebook: AutoFITS2Sound-Demo.ipynb
- CSound/Cabbage file: AutoFITS2Sound.csd
- Cabbage mask file: Init.png
- Sample spectrum: Spectra.png
- LICENSE
- README
- requirements.txt

CABBAGE/CSOUND INSTALLATION

1- Download and install CSound 6.15 from: https://github.com/csound/csound/releases/tag/6.15.0

2- Download Cabbage from (current version 2.9.0): https://cabbageaudio.com/download/ 

3- Install only Cabbage from the downloaded Cabbage package.

   Warning: Current Cabbage version 2.9.0 allows to optionally install the latest version of CSound. This default option should be unchecked not to overwrite CSound 6.15.
   Latests versions of CSound require additional plugins to work with the image CSound opcodes, so they should not be used.


AUTOFITS2SOUND INSTALLATION

1- Download the spectra from: http://svocats.cab.inta-csic.es/stelib/index.php?action=credits

2- Download all the content of this repository into the same folder

3- Install all the dependencies included in the requirements.txt file

4- To reproduce the sonifications:
   - Launch Cabbage, open AutoFITS2Sound.csd, and press play

   Important note: Cabbage 2.9.0 requires CamelCase update via: File/Convert Identifiers to camelCase. Also change manually “PluginID” to “PulginId” to avoid warnings.
     
   - Run the Jupyter notebook (AutoFITS2Sound-Demo.ipynb)
   - Add your path to the downloaded files before running all the cells

Enjoy the sonifications!

Developer system info: Python 3.8.5 - Cabbage 2.5.0 - i7 macOS 10.15.7 - 32 GB - 1536 MB
