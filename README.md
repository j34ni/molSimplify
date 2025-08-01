# molSimplify
This is a container recipe for molSimplify, an open source toolkit, developed by the Kulik Group in the Department of Chemical Engineering at MIT, for the automated, first-principles screening and discovery of new inorganic molecules and intermolecular complexes. 

## Usage with Apptainer (or Singularity) on HPC

Pull the container image using `apptainer pull docker://quay.io/jeani/molsimplify:1.8.0`, this will create a file called `molsimplify_1.8.0.sif` in the directory where you did it.

To gain interactive shell access inside the container start it and do `apptainer shell molsimplify_1.8.0.sif`; There you first have to activate the molSimplify environment by doing `source /opt/start.sh`, the prompt will change to `(molsimp)` and now you can run commands interactively, for instance `pytest` to perform all the tests in `/opt/src/molSimplify-1.8.0/tests` (except `test_main_empty` which requires writing to a read-only file system):

```
apptainer shell molsimplify_1.8.0.sif
apptainer> source /opt/start.sh
(molsimp) Apptainer> cd /opt/src/molSimplify-1.8.0
(molsimp) Apptainer> pytest tests/ -k 'not test_main_empty'
============================================================================================ test session starts =============================================================================================
platform linux -- Python 3.8.15, pytest-8.3.5, pluggy-1.5.0
rootdir: /opt/src/molSimplify-1.8.0
configfile: pyproject.toml
plugins: anyio-4.1.0, resource-path-1.4.0
collected 1171 items / 1 deselected / 1170 selected                                                                                                                                                          

tests/informatics/test_MOF_descriptors.py ......................                                                                                                                                       [  1%]
tests/informatics/test_MOF_functional_group_add.py ............                                                                                                                                        [  2%]
tests/informatics/test_MOF_functional_group_add_v2.py ........................                                                                                                                         [  4%]
tests/informatics/test_MOF_linker_rotation.py .....                                                                                                                                                    [  5%]
tests/informatics/test_PBC_functions.py .............................................                                                                                                                  [  9%]
tests/informatics/test_active_learning.py ..........                                                                                                                                                   [ 10%]
tests/informatics/test_coulomb_analyze.py .                                                                                                                                                            [ 10%]
tests/informatics/test_graph_racs.py .........                                                                                                                                                         [ 10%]
tests/ml/test_kernels.py ...                                                                                                                                                                           [ 11%]
tests/ml/test_layers.py ..                                                                                                                                                                             [ 11%]
tests/test_atom3D.py ..................................................                                                                                                                                [ 15%]
tests/test_autocorrelation.py .................................................................................................................................................................        [ 29%]
tests/test_basic_imports.py .s.s.                                                                                                                                                                      [ 29%]
tests/test_cli.py s                                                                                                                                                                                    [ 29%]
tests/test_decoration.py .                                                                                                                                                                             [ 30%]
tests/test_distgeom.py ....                                                                                                                                                                            [ 30%]
tests/test_example_1.py ..                                                                                                                                                                             [ 30%]
tests/test_example_3.py s.                                                                                                                                                                             [ 30%]
tests/test_example_5.py ..                                                                                                                                                                             [ 30%]
tests/test_example_7.py .s                                                                                                                                                                             [ 31%]
tests/test_example_8.py .                                                                                                                                                                              [ 31%]
tests/test_example_tbp.py .                                                                                                                                                                            [ 31%]
tests/test_ff_xtb.py .s....                                                                                                                                                                            [ 31%]
tests/test_geocheck_oct.py ................                                                                                                                                                            [ 33%]
tests/test_geocheck_one_empty.py ..                                                                                                                                                                    [ 33%]
tests/test_geometry.py .....                                                                                                                                                                           [ 33%]
tests/test_inparse.py .....                                                                                                                                                                            [ 34%]
tests/test_io.py .....                                                                                                                                                                                 [ 34%]
tests/test_jobgen.py ......                                                                                                                                                                            [ 35%]
tests/test_joption_pythonic.py ..                                                                                                                                                                      [ 35%]
tests/test_lig_load.py ..                                                                                                                                                                              [ 35%]
tests/test_ligand_assign.py ..                                                                                                                                                                         [ 35%]
tests/test_ligand_assign_consistent.py ..                                                                                                                                                              [ 35%]
tests/test_ligand_class.py .                                                                                                                                                                           [ 35%]
tests/test_ligand_from_mol_file.py s                                                                                                                                                                   [ 35%]
tests/test_ligands.py ................................................................................................................................................................................ [ 50%]
...................................................................................................................................................................................................... [ 67%]
.....................................................................................................                                                                                                  [ 76%]
tests/test_mol2D.py ............                                                                                                                                                                       [ 77%]
tests/test_mol3D.py ...............s.................................................................................................................................................................. [ 92%]
.............................                                                                                                                                                                          [ 95%]
tests/test_molcas_caspt2.py .                                                                                                                                                                          [ 95%]
tests/test_molcas_casscf.py .                                                                                                                                                                          [ 95%]
tests/test_old_ANNs.py ..                                                                                                                                                                              [ 95%]
tests/test_orca_ccsdt.py .                                                                                                                                                                             [ 95%]
tests/test_orca_dft.py .                                                                                                                                                                               [ 95%]
tests/test_qcgen.py ......                                                                                                                                                                             [ 96%]
tests/test_racs.py .....s.                                                                                                                                                                             [ 96%]
tests/test_rmsd.py .......                                                                                                                                                                             [ 97%]
tests/test_structgen_functions.py ................                                                                                                                                                     [ 98%]
tests/test_tetrahedral.py ..                                                                                                                                                                           [ 98%]
tests/test_tutorial_10_part_one.py .                                                                                                                                                                   [ 99%]
tests/test_tutorial_10_part_two.py s                                                                                                                                                                   [ 99%]
tests/test_tutorial_2.py .                                                                                                                                                                             [ 99%]
tests/test_tutorial_3.py .                                                                                                                                                                             [ 99%]
tests/test_tutorial_4.py ...                                                                                                                                                                           [ 99%]
tests/test_tutorial_6.py .                                                                                                                                                                             [ 99%]
tests/test_tutorial_8.py ..                                                                                                                                                                            [ 99%]
tests/test_tutorial_9_part_one.py .                                                                                                                                                                    [ 99%]
tests/test_tutorial_9_part_two.py .                                                                                                                                                                    [100%]

============================================================================================== warnings summary ==============================================================================================
molSimplify/Informatics/MOF/MOF_functionalizer_v2.py:20
  /opt/src/molSimplify-1.8.0/molSimplify/Informatics/MOF/MOF_functionalizer_v2.py:20: DeprecationWarning: pkg_resources is deprecated as an API. See https://setuptools.pypa.io/en/latest/pkg_resources.html
    from pkg_resources import resource_filename, Requirement

../../conda/envs/molsimp/lib/python3.8/site-packages/pkg_resources/__init__.py:3154
../../conda/envs/molsimp/lib/python3.8/site-packages/pkg_resources/__init__.py:3154
  /opt/conda/envs/molsimp/lib/python3.8/site-packages/pkg_resources/__init__.py:3154: DeprecationWarning: Deprecated call to `pkg_resources.declare_namespace('google')`.
  Implementing implicit namespace packages (as specified in PEP 420) is preferred to `pkg_resources.declare_namespace`. See https://setuptools.pypa.io/en/latest/references/keywords.html#keyword-namespace-packages
    declare_namespace(pkg)

../../conda/envs/molsimp/lib/python3.8/site-packages/pkg_resources/__init__.py:3154
  /opt/conda/envs/molsimp/lib/python3.8/site-packages/pkg_resources/__init__.py:3154: DeprecationWarning: Deprecated call to `pkg_resources.declare_namespace('mpl_toolkits')`.
  Implementing implicit namespace packages (as specified in PEP 420) is preferred to `pkg_resources.declare_namespace`. See https://setuptools.pypa.io/en/latest/references/keywords.html#keyword-namespace-packages
    declare_namespace(pkg)

../../conda/envs/molsimp/lib/python3.8/site-packages/tensorflow/python/autograph/impl/api.py:22
  /opt/conda/envs/molsimp/lib/python3.8/site-packages/tensorflow/python/autograph/impl/api.py:22: DeprecationWarning: the imp module is deprecated in favour of importlib; see the module's documentation for alternative uses
    import imp

tests/test_autocorrelation.py::test_get_descriptor_vector[3-False-False-False-False-False]
tests/test_autocorrelation.py::test_get_descriptor_vector[2-False-False-False-False-False]
tests/test_autocorrelation.py::test_get_descriptor_vector[3-True-False-False-False-False]
tests/test_autocorrelation.py::test_get_descriptor_vector[3-True-True-False-False-False]
tests/test_autocorrelation.py::test_get_descriptor_vector[3-False-False-True-False-False]
tests/test_autocorrelation.py::test_get_descriptor_vector[3-False-False-True-True-False]
tests/test_ligand_assign.py::test_six_monodentate
tests/test_ligand_assign.py::test_triple_bidentate
  /opt/src/molSimplify-1.8.0/molSimplify/utils/decorators.py:13: DeprecationWarning: Use ligand_assign_consistent instead.
    warnings.warn(message, DeprecationWarning)

../../conda/envs/molsimp/lib/python3.8/site-packages/_pytest/cacheprovider.py:475
  /opt/conda/envs/molsimp/lib/python3.8/site-packages/_pytest/cacheprovider.py:475: PytestCacheWarning: could not create cache path /opt/src/molSimplify-1.8.0/.pytest_cache/v/cache/nodeids: [Errno 38] Function not implemented: '/opt/src/molSimplify-1.8.0/pytest-cache-files-x7u603fw'
    config.cache.set("cache/nodeids", sorted(self.cached_nodeids))

../../conda/envs/molsimp/lib/python3.8/site-packages/_pytest/stepwise.py:51
  /opt/conda/envs/molsimp/lib/python3.8/site-packages/_pytest/stepwise.py:51: PytestCacheWarning: could not create cache path /opt/src/molSimplify-1.8.0/.pytest_cache/v/cache/stepwise: [Errno 38] Function not implemented: '/opt/src/molSimplify-1.8.0/pytest-cache-files-5chuk172'
    session.config.cache.set(STEPWISE_CACHE_DIR, [])

-- Docs: https://docs.pytest.org/en/stable/how-to/capture-warnings.html
================================================================== 1160 passed, 10 skipped, 1 deselected, 15 warnings in 1208.50s (0:20:08) ==================================================================
(molsimp) Apptainer> 
```

The container runs largely in isolation, and to be able to access files in folders located on the host you have to use the `--bind` option that allows you to mount directories from your host file system into the container at runtime, for instance `apptainer shell --bind /cluster/projects/nn1000k:/opt/uio molsimplify_1.8.0.sif` makes all the content of the `nn1000K` project folder on the host accessible in `/opt/uio` inside the container.

Should there be a `disk quota exceeded` error when pulling the container image make sure that these temporary folders or their equivalent for Singularity are correctly defined (here I am pointing to `/cluster/projects/nn1000k`):

```
export APPTAINER_CACHEDIR=/cluster/projects/nn1000k
export APPTAINER_TMPDIR=/cluster/projects/nn1000k
```

### Warning: Potential conflicts with home directory files/folders 
Remnants from previous installations can cause conflicts, such as permission issues or read-only errors. To avoid problems inspect your home directory for folders like `~/.conda`, `~/.cache/{pip,tensorflow,keras}`, `~/.keras`, etc. and delete/rename/move these if necessary.



## Citation

If you use this container recipe and/or image please kindly cite:

Iaquinta, J. (2025). Dockerfile and usage instructions for molSimplify (1.8.0). Zenodo. https://doi.org/10.5281/zenodo.16616374

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.16616374.svg)](https://doi.org/10.5281/zenodo.16616374)
