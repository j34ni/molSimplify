# molSimplify
This is a container recipe for molSimplify, an open source toolkit, developed by the Kulik Group in the Department of Chemical Engineering at MIT, for the automated, first-principles screening and discovery of new inorganic molecules and intermolecular complexes. 

## Usage with Apptainer (or Singularity)

Pull the container image using `apptainer pull docker://quay.io/jeani/molsimplify:1.8.0`, this will create a file called `molsimplify_1.8.0.sif` in the directory where you did it.

To gain interactive shell access inside the container start it and do `apptainer shell molsimplify_1.8.0.sif`; There you first have to activate the molSimplify environment by doing `source /opt/start.sh`, the prompt will change to `(molsimp)` and now you can run commands interactively, for instance `pytest` to execute the tests in `/opt/src/molSimplify-1.8.0/tests`:

```
apptainer shell molsimplify_1.8.0.sif
apptainer> source /opt/start.sh
(molsimp) Apptainer> cd /opt/src/molSimplify-1.8.0
(molsimp) Apptainer> pytest tests/
==================================================================================================== test session starts ====================================================================================================
platform linux -- Python 3.8.15, pytest-8.3.5, pluggy-1.5.0
rootdir: /var/src/molSimplify-1.8.0
configfile: pyproject.toml
plugins: resource-path-1.4.0, anyio-4.1.0
collected 1171 items                                                                                                                                                                                                        
tests/informatics/test_MOF_descriptors.py ......................                                                                                                                                                      [  1%]
tests/informatics/test_MOF_functional_group_add.py ............                                                                                                                                                       [ 
[...]                                                                                                                                                                               [ 99%]
=================================================================================
(molsimp) Apptainer> exit
exit
INFO:    Cleaning up image...
```

The container runs largely in isolation, and to be able to access files in folders located on the host you have to use the `--bind` option that allows you to mount directories from your host file system into the container at runtime, for instance `apptainer shell --bind /cluster/projects/nn1000k:/opt/uio molsimplify_1.8.0.sif` makes all the content of the `nn1000K` project folder on the host accessible in `/opt/uio` inside the container.

Should there be a `disk quota exceeded` error when pulling the container image make sure that these temporary folders or their equivalent for Singularity are correctly defined (here I am pointing to `/cluster/projects/nn1000k`):

```
export APPTAINER_CACHEDIR=/cluster/projects/nn1000k
export APPTAINER_TMPDIR=/cluster/projects/nn1000k
```
