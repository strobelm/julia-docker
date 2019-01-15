# Julia and Jupyter Notebook
FROM debian:buster
MAINTAINER Michael Strobel "m.strobel@posteo.de"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get update && apt-get install -yq  \
    julia \
    jupyter-notebook \
    wget \
&& rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash juliaUser
WORKDIR /home/juliaUser/
USER juliaUser

RUN julia -e 'import Pkg; Pkg.update()' && \
    julia -e 'import Pkg; Pkg.add("IJulia")' && \
    # Precompile Julia packages \
    julia -e 'using IJulia' 


CMD jupyter-notebook --ip=0.0.0.0
