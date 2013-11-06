#!/bin/bash
script=/opt/ParelonCertFrontend/extras/admin/nuovo_certificatore.sh

randomNin16 () 
{
  index=0
  str=""
  for i in {a..z}; do arr[index]=$i; index=`expr ${index} + 1`; done
  for i in {A..Z}; do arr[index]=$i; index=`expr ${index} + 1`; done
  for i in {0..9}; do arr[index]=$i; index=`expr ${index} + 1`; done
  for i in {1..16}; do str="$str${arr[$RANDOM%$index]}"; done
  echo $str
}

${script} Mario Rossi `randomNin16`
${script} Falvia Neri `randomNin16`
${script} Enrico Bianchi `randomNin16`
${script} "Maria Lusia" Correnti `randomNin16`
${script} Ugo Fantozzi `randomNin16`
${script} Antonio Sperelli `randomNin16`
${script} Gino Lugini `randomNin16`
${script} Mario Barilla `randomNin16`
${script} Enzo Pirelli `randomNin16`
