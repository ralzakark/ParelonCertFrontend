#!/bin/bash
db_name="parelon_cert"
secure_db_name="parelon_cert"

psql_cmd="/usr/bin/psql -v ON_ERROR_STOP=1"


if [ $# -lt 3 ];then
   echo "Utility per la creazione di utenti certificatori:"
   echo
   echo "Utilizzo:  ./nuovo_certificatore.sh Nome Cognome CodiceFiscale Email" 
   echo
   echo
   exit 0
fi

randomString32 () 
{
  index=0
  str=""
  for i in {a..z}; do arr[index]=$i; index=`expr ${index} + 1`; done
  for i in {A..Z}; do arr[index]=$i; index=`expr ${index} + 1`; done
  for i in {0..9}; do arr[index]=$i; index=`expr ${index} + 1`; done
  for i in {1..32}; do str="$str${arr[$RANDOM%$index]}"; done
  echo $str
}

randomLogin6 ()
{
  index=0
  str=""
  for i in {a..z}; do arr[index]=$i; index=`expr ${index} + 1`; done
  for i in {0..9}; do arr[index]=$i; index=`expr ${index} + 1`; done
  for i in {1..6}; do str="$str${arr[$RANDOM%$index]}"; done
  echo $str
}


echo "INSERT INTO member (login, realname, invite_code, nin, notify_email, lqfb_access, auditor) VALUES ('$(randomLogin6)', '$1 $2','$(randomString32)', '$3', '$4', FALSE, TRUE) RETURNING invite_code;" |${psql_cmd} -xq ${db_name}

echo 
