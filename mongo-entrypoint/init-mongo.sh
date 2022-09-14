set -e

mongo <<EOF

use ${MONGO_TESTDB_DATABASE}
db.createUser(
    {
        user: '${MONGO_TESTDB_USERNAME}',
        pwd: '${MONGO_TESTDB_PASSWORD}',
        roles: [
            { 
                role: "readWrite", 
                db: '${MONGO_TESTDB_DATABASE}'
            }
        ],
        passwordDigestor: "server",
    }
);
EOF
