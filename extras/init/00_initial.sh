#!/bin/bash
db_name="parelon_cert"
psql_cmd="/usr/bin/psql -v ON_ERROR_STOP=1"

createdb ${db_name} || exit 1

cat core.sql |${psql_cmd} -q ${db_name}
cat sensitive_data.sql |${psql_cmd} -q ${db_name}
sleep 2
zcat db_istat.sql.gz |${psql_cmd} -q ${db_name}
sleep 2
echo "INSERT INTO member (login, name, admin, invite_code, realname, lqfb_access, auditor) VALUES ('admin', 'Administrator', TRUE, 'admin', 'Administrator', TRUE, TRUE);"| ${psql_cmd} -q ${db_name}
