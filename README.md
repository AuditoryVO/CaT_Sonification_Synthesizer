# CaT-Sonification-Synthesizer
Implementation of the deep learning feature extraction sonification synthesizer for the exploration of the stellar spectra from the CaT library (SVO). Jupiter Notebook analysis and CSound/Cabbage multimodal display.
![CaT_Synthesizer](https://github.com/AuditoryVO/CaT_Sonification_Synthesizer/assets/144262864/ce9b0e07-c248-4c83-bad6-69ab841ed0ce)

CONTENTS
- Jupyter notebook 1: CaT_2Layers_6D_Autoencoder.ipynb
- Jupyter notebook 2: CaT_Synth_Preprocess.ipynb
- Jupyter notebook 3: CaT_Synth.ipynb
- Jupyter notebook 4: Evaluation.ipynb (Requires running the three models' notebooks first)
- Jupyter notebook 5: CaT_6Layers_6D_Autoencoder.ipynb
- Jupyter notebook 6: CaT_VAE.ipynb
- CSound/Cabbage file: CaT_Synth.csd
- Cabbage mask file: Init.png
- Sample spectrum: Spectrum.png
- LICENSE
- README
- requirements.txt

CABBAGE/CSOUND INSTALLATION

1- Download and install CSound 6.15 from: https://github.com/csound/csound/releases/tag/6.15.0

2- Download Cabbage from (current version 2.9.0): https://cabbageaudio.com/download/ 

3- Install only Cabbage from the downloaded Cabbage package.

   Warning: Current Cabbage version 2.9.0 allows to optionally install the latest version of CSound. This default option should be unchecked not to overwrite CSound 6.15.
   Latests versions of CSound require additional plugins to work with the image CSound opcodes, so they should not be used.


CaT SYNTHESIZER INSTALLATION

1- Download the spectra from: http://svocats.cab.inta-csic.es/catlib

2- Clone or download all the content of this repository into the same folder

3- Install all the dependencies included in the requirements.txt file

4- To reproduce the sonifications:
   - Run the Jupyter notebook 1 (CaT_2Layers_6D_Autoencoder.ipynb) to encode the spectra
   - Add your path to the downloaded files before running all the cells
   - Run the Jupyter notebook 2 (CaT_Synth_Preprocess.ipynb) to preprocess the images and the spectra
   - Connect a piano keyboard MIDI controller
   - Launch Cabbage, open CaT_Synth.csd, and press play

   Important note: Cabbage 2.9.0 requires CamelCase update via: File/Convert Identifiers to camelCase. Also change manually “PluginID” to “PluginId” to avoid warnings.

   - Run the Jupyter notebook 3 (CaT_Synth.ipynb) to launch the synthesizer.

Enjoy the sonifications!

Developer system info: Python 3.8.5 - Cabbage 2.5.0 - i7 macOS 10.15.7 - 32 GB - 1536 MB
