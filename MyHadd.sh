#!/bin/bash
# arguments:
# inPattern - input file pattern, default: foo_in
# outPattern - input file pattern, default: foo_out
# maxNFiles - maximum number of files to add together, default: 10
# override - whether to use -f option in hadd, overwriting existing files, default: false

inPattern=${1:-foo_in}
outPattern=${2:-foo_out}
maxNFiles=${3:-10}

override=${4:-false}

echo "inPattern = ${inPattern}"
echo "outPattern = ${outPattern}"

haddchain=""
if [ override ]
then
  haddchain="-f"
fi

nFiles=0
nHadds=0
for file in `ls ${inPattern}_*.root`
do
  echo "${file}"
  haddchain="${haddchain} ${file}" # appends file to hadd command
  nFiles=$(( ${nFiles}+1 ))        # increment nFiles counter

  if [ ${nFiles} -ge ${maxNFiles} ] # if we've appended maxNFiles, then hadd them together
  then
    hadd ${outPattern}_${nHadds}.root ${haddchain}
    nHadds=$(( ${nHadds}+1 ))       # increment nHadds counter

    nFiles=0                        # reset relevant variables
    if [ override ]
    then
      haddchain="-f"
    else
      haddchain=""
    fi
  fi
done


if [ ${nFiles} -ge 1 ]
then
  hadd ${outPattern}_${nHadds}.root ${haddchain}
  nHadds=$(( ${nHadds}+1 ))
#elif [ ${nFiles} = 1 ]
# 
fi


#hadd -f Nominal/data16hi.root Nominal/Group?/3*.root
#hadd -f Nominal/data17.root Nominal/3*.root
#
##vars=( )
#
#GroupA=( 313063 313067 313100 313107 )
#GroupB=( 313136 313187 313259 313285 )
#GroupC=( 313295 313333 313435 )
#GroupD=( 313572 313574 313575 313603 )
#GroupE=( 313629 313630 313688 )
#GroupF=( 313695 313833 313878 )
#GroupG=( 313929 313935 313984 314014 )
#GroupH=( 314077 314105 )
#GroupI=( 314112 314157 314170 )
#
#cd Nominal
#for cent in {0..10}
#do
#  haddchain=""
#  for run in "${GroupA[@]}"
#  do
#    haddchain="${haddchain} GroupA/${run}_iCent${cent}.root"
#  done
#  hadd -f GroupA/GroupA_iCent${cent}.root ${haddchain}
#
#  haddchain=""
#  for run in "${GroupB[@]}"
#  do
#    haddchain="${haddchain} GroupB/${run}_iCent${cent}.root"
#  done
#  hadd -f GroupB/GroupB_iCent${cent}.root ${haddchain}
#
#  haddchain=""
#  for run in "${GroupC[@]}"
#  do
#    haddchain="${haddchain} GroupC/${run}_iCent${cent}.root"
#  done
#  hadd -f GroupC/GroupC_iCent${cent}.root ${haddchain}
#
#  haddchain=""
#  for run in "${GroupD[@]}"
#  do
#    haddchain="${haddchain} GroupD/${run}_iCent${cent}.root"
#  done
#  hadd -f GroupD/GroupD_iCent${cent}.root ${haddchain}
#
#  haddchain=""
#  for run in "${GroupE[@]}"
#  do
#    haddchain="${haddchain} GroupE/${run}_iCent${cent}.root"
#  done
#  hadd -f GroupE/GroupE_iCent${cent}.root ${haddchain}
#
#  haddchain=""
#  for run in "${GroupF[@]}"
#  do
#    haddchain="${haddchain} GroupF/${run}_iCent${cent}.root"
#  done
#  hadd -f GroupF/GroupF_iCent${cent}.root ${haddchain}
#
#  haddchain=""
#  for run in "${GroupG[@]}"
#  do
#    haddchain="${haddchain} GroupG/${run}_iCent${cent}.root"
#  done
#  hadd -f GroupG/GroupG_iCent${cent}.root ${haddchain}
#
#  haddchain=""
#  for run in "${GroupH[@]}"
#  do
#    haddchain="${haddchain} GroupH/${run}_iCent${cent}.root"
#  done
#  hadd -f GroupH/GroupH_iCent${cent}.root ${haddchain}
#
#  haddchain=""
#  for run in "${GroupI[@]}"
#  do
#    haddchain="${haddchain} GroupI/${run}_iCent${cent}.root"
#  done
#  hadd -f GroupI/GroupI_iCent${cent}.root ${haddchain}
#
#done
#cd ..
