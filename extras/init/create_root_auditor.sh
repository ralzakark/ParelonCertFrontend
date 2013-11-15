#!/bin/bash
db_name="parelon_cert"
secure_db_name="parelon_cert"

psql_cmd="/usr/bin/psql -v ON_ERROR_STOP=1"

if [ "`id -u -n`z" != "www-dataz" ]; then
  echo "This script must be run as www-data user"
  exit 1
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

invite_code=`randomString32`

randomLogin6 ()
{
  index=0
  str=""
  for i in {a..z}; do arr[index]=$i; index=`expr ${index} + 1`; done
  for i in {0..9}; do arr[index]=$i; index=`expr ${index} + 1`; done
  for i in {1..6}; do str="$str${arr[$RANDOM%$index]}"; done
  echo $str
}

login=`randomLogin6`

echo "Please insert root auditor data"
echo
echo -n "Firstname: "; read firstname
echo -n "Secondaname: "; read secondname
echo -n "National Insurance Number: "; read nin
echo -n "Email: "; read email
echo -n "Birthdate (dd/mm/yyyy): "; read birthdate
echo -n "Id Card Number: "; read idcard
echo -n "Residence Address: "; read residence_address
echo -n "Residence City: "; read residence_city
echo -n "Residence Province: "; read residence_province
echo -n "Residence Postcode: "; read residence_postcode
echo -n "Domicile Address: "; read domicile_address
echo -n "Domicile City: "; read domicile_city
echo -n "Domicile Province: "; read domicile_province
echo -n "Domicile Postcode: "; read domicile_postcode
echo -n "Unit Location (xx xxx xxxxxx): "; read location
echo -n "Token Serial Number: "; read token_serial

result=`echo "INSERT INTO member (login, realname, invite_code, nin, notify_email, lqfb_access, auditor) VALUES ('${login}', '${firstname} ${secondname}','${invite_code}', '${nin}', '${email}', FALSE, TRUE) RETURNING id;" |${psql_cmd} -xq ${db_name}`

id=`echo ${result}|grep id|awk -F'|' '{print $2}'|sed -e 's/ //g'`
result=`echo "INSERT INTO member_data (firstname, secondname, nin, email, birthdate, idcard, residence_address, residence_city, residence_province, residence_postcode, domicile_address, domicile_city, domicile_province, domicile_postcode, location, token_serial) VALUES ('${firstname}', '${secondname}', '${nin}', '${email}','${birthdate}','${idcard}','${residence_address}','${residence_city}','${residence_province}','${residence_postcode}','${domicile_address}','${domicile_city}','${domicile_province}','${domicile_postcode}', '${location}', '${token_serial}') RETURNING id;" |${psql_cmd} -xq ${secure_db_name}`

echo
echo "User ID: ${id}"
echo "User Invite Code: ${invite_code}"
