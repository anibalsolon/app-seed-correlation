<h1 align="center">Seed-based Correlation</h1>

<p align="center">
  Computes a seed-based functional connectivity map from BOLD fMRI with AFNI: correlates the mean time series of a spherical seed with every voxel in a mask and outputs the Fisher z-transformed correlation image.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.571"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.571-blue.svg" alt="Run on brainlife.io"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-see_LICENSE-lightgrey.svg" alt="License"></a>
</p>

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Computes a seed-based functional connectivity map from BOLD fMRI with AFNI: correlates the mean time series of a spherical seed with every voxel in a mask and outputs the Fisher z-transformed correlation image.**

Builds a sphere of the given radius around the seed coordinates (3dUndump), optionally smooths the BOLD to a target FWHM within the mask (3dBlurToFWHM), extracts the seed's mean time series (3dROIstats), correlates it with every voxel in the mask (3dTcorr1D, Pearson) and applies atanh. Use it for seed-based resting-state or task connectivity maps. The seed coordinates are in the coordinate space of the mask and BOLD images, so they must match the space of the data (for example MNI coordinates for MNI-space BOLD).

| | |
|---|---|
| **Inputs** | `neuro/func/task` · `neuro/mask` |
| **Outputs** | `neuro/parc-stats` |
| **Container** | `anibalsolon/app-seed-corr:v0.0.1` |
| **Resources** | 16 CPUs |
| **Run it** | [doi.org/10.25663/brainlife.app.571](https://doi.org/10.25663/brainlife.app.571) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `bold` | `neuro/func/task` | yes | Input functional MRI |
| `mask` | `neuro/mask` | yes | Mask of the functional image to be correlated with the seed. Same grid as the BOLD; also defines the master grid for the seed sphere. |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `corr` | `neuro/parc-stats` | Fisher z-transformed Pearson correlation map (corr.nii.gz) between the seed time series and each voxel in the mask. |

<details>
<summary><b>Parameters</b> (3)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `seed` | string | `0 -54 26` | Coordinates of the functional image to be used as seed. |
| `radius` | number | `5` | Seed radius to capture the average time series |
| `fwhm` | number | `0` | Smoothing parameter (in mm). Blurs the image until it reaches the FWHM smoothness. |

</details>

<!-- brainlife-app:end -->

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.571](https://doi.org/10.25663/brainlife.app.571), choose `neuro/func/task`, `neuro/mask` from your project, set the parameters and press **Execute**. The results are saved to your project as `neuro/parc-stats`.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/) (the App runs in `anibalsolon/app-seed-corr:v0.0.1`), [`jq`](https://jqlang.github.io/jq/).

1. Clone this repository.
2. Create `config.json` with the paths to your inputs and the parameters:

   ```json
   {
       "bold": "/path/to/bold/bold",
       "mask": "/path/to/mask/mask",
       "seed": "0 -54 26",
       "radius": 5,
       "fwhm": 0
   }
   ```

3. Run `./main`.

## Citing

If you use this App, please cite it, the software it builds on and brainlife.io:

- Seed-based Correlation. brainlife.io App. [doi:10.25663/brainlife.app.571](https://doi.org/10.25663/brainlife.app.571)
- Cox. AFNI: Software for Analysis and Visualization of Functional Magnetic Resonance Neuroimages. *Computers and Biomedical Research* 29:162-173 (1996). [doi:10.1006/cbmr.1996.0014](https://doi.org/10.1006/cbmr.1996.0014)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

Maintained by [@anibalsolon](https://github.com/anibalsolon).

## License

See [LICENSE](LICENSE).
