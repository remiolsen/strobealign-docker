FROM mambaorg/micromamba:1.3.0

LABEL author="Remi-Andre Olsen" \
      maintainer="remi-andre.olsen@scilifelab.se"

USER root
COPY strobealign.yml /
RUN micromamba create -y -f /strobealign.yml \
&& apt-get clean && micromamba clean -a
USER 1001
ENV PATH /opt/conda/envs/strobealign/bin:$PATH