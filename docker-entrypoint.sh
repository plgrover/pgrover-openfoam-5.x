#!/bin/bash

source /opt/openfoam5/etc/bashrc

cd /home/openfoam/PressureGradientSolvers-OpenFOAM-5.x/applications/solvers/incompressible/pisoFoamGradP
wmake

cd /home/openfoam/LRN-WallTreatments-openFOAM-5.x/src/TurbulenceModels/turbulenceModels/derivedFvPatchFields
wmake
