#!/bin/bash


# "name" and "dirout" are named according to the testcase

name=FinalNormal4cm
dirout=${name}_out


# "executables" are renamed and called from their directory


boundaryvtk="/mnt/e/GithubRepo/DualSPHysics_Linux_MyProj/EXECS/BoundaryVTK4_linux64"
partvtk="/mnt/e/GithubRepo/DualSPHysics_Linux_MyProj/EXECS/PartVTK4_linux64"
partvtkout="/mnt/e/GithubRepo/DualSPHysics_Linux_MyProj/EXECS/PartVTKOut4_linux64"



# Library path must be indicated properly

current=$(pwd)
cd "/mnt/e/GithubRepo/DualSPHysics_Linux_MyProj/EXECS"
path_so=$(pwd)
cd $current
export LD_LIBRARY_PATH=$path_so


# CODES are executed according the selected parameters of execution in this testcase
errcode=0



if [ $errcode -eq 0 ]; then
  $partvtk -dirin $dirout -savevtk $dirout/PartFluid -onlytype:-all,+fluid
  errcode=$?
fi

if [ $errcode -eq 0 ]; then
  $partvtkout -dirin $dirout -filexml $dirout/${name}.xml -savevtk $dirout/PartFluidOut -SaveResume $dirout/ResumeFluidOut
  errcode=$?
fi

if [ $errcode -eq 0 ]; then
  echo All done
else
  echo Execution aborted
fi
read -n1 -r -p "Press any key to continue..." key
echo
