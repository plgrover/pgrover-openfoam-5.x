FROM openfoam/openfoam5-graphical-apps

USER root

EXPOSE 8888

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

RUN apt-get update && apt-get install -y git

RUN apt-get install -y vim-tiny

RUN pip install pyfoam

RUN pip install numpy

RUN pip install matplotlib

RUN pip install jupyter

RUN pip install pandas

# A fix https://github.com/jupyter/jupyter/issues/370
RUN pip uninstall -y ipykernel
RUN pip install ipykernel==4.8.0


WORKDIR "/home/openfoam"

RUN git clone https://github.com/plgrover/PatFoamLib.git
RUN git clone https://github.com/plgrover/PressureGradientSolvers-OpenFOAM-5.x.git
RUN git clone https://github.com/plgrover/LRN-WallTreatments-openFOAM-5.x.git


COPY ./docker-entrypoint.sh /docker-entrypoint.sh
# ENTRYPOINT ["/docker-entrypoint.sh"]

CMD "jupyter notebook --allow-root"


