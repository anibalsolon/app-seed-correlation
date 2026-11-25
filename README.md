<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Computes a seed-based functional connectivity map from BOLD fMRI with AFNI: correlates the mean time series of a spherical seed with every voxel in a mask and outputs the Fisher z-transformed correlation image.**

Builds a sphere of the given radius around the seed coordinates (3dUndump), optionally smooths the BOLD to a target FWHM within the mask (3dBlurToFWHM), extracts the seed's mean time series (3dROIstats), correlates it with every voxel in the mask (3dTcorr1D, Pearson) and applies atanh. Use it for seed-based resting-state or task connectivity maps. The seed coordinates are in the coordinate space of the mask and BOLD images, so they must match the space of the data (for example MNI coordinates for MNI-space BOLD).

| | |
|---|---|
| 📥 **Inputs** | `neuro/func/task` · `neuro/mask` |
| 📤 **Outputs** | `neuro/parc-stats` |
| 🐳 **Container** | `anibalsolon/app-seed-corr:v0.0.1` |
| ⚙️ **Resources** | 16 CPUs |
| 🔗 **Run it** | [doi.org/10.25663/brainlife.app.571](https://doi.org/10.25663/brainlife.app.571) |

#### 📥 Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `bold` | `neuro/func/task` | yes | Input functional MRI |
| `mask` | `neuro/mask` | yes | Mask of the functional image to be correlated with the seed. Same grid as the BOLD; also defines the master grid for the seed sphere. |

#### 📤 Outputs

| Output | Datatype | Description |
|---|---|---|
| `corr` | `neuro/parc-stats` | Fisher z-transformed Pearson correlation map (corr.nii.gz) between the seed time series and each voxel in the mask. |

<details>
<summary><b>⚙️ Parameters</b> (3)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `seed` | string | `0 -54 26` | Coordinates of the functional image to be used as seed. |
| `radius` | number | `5` | Seed radius to capture the average time series |
| `fwhm` | number | `0` | Smoothing parameter (in mm). Blurs the image until it reaches the FWHM smoothness. |

</details>

<!-- brainlife-app:end -->

Seed-based Correlation app