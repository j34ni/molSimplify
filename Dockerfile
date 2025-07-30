FROM condaforge/mambaforge:24.7.1-0

# Create a conda environment and install dependencies
RUN mamba create -n molsimp python=3.8 && \
    mamba clean -afy

# Install molSimplify via conda, from GitHub
RUN wget -q -nc --no-check-certificate -P /var/tmp https://github.com/hjkgrp/molSimplify/archive/refs/tags/v1.8.0.tar.gz && \
    tar -x -f /var/tmp/v1.8.0.tar.gz -C /var/tmp -z && \
    . /opt/conda/etc/profile.d/conda.sh && \
    conda activate molsimp && \
    cd /var/tmp/molSimplify-1.8.0 && \
    conda env update --file devtools/conda-envs/mols.yml && \
    pip install -e . --no-deps && \
    rm -rf /var/tmp/v1.8.0.tar.gz

# Copy the start.sh script
COPY ./start.sh /opt/start.sh

# Set the entrypoint to the start.sh script
ENTRYPOINT ["/opt//start.sh"]
