set -e

mongo <<EOF
use admin

db.createUser({
    user: '${MONGO_SUPER_ROOT_USERNAME}',
    pwd: '${MONGO_SUPER_ROOT_PASSWORD}',
    roles: [{ 
        role: "readWrite", 
        db: "admin" 
    }, 
    "readWriteAnyDatabase",
    "userAdminAnyDatabase", 
    "dbAdminAnyDatabase"
    ]
  }
);

use loghub
db.createUser(
    {
        user: '${MONGO_LOGHUB_USERNAME}',
        pwd: '${MONGO_LOGHUB_PASSWORD}',
        roles: [
            { 
                role: "readWrite", 
                db: '${MONGO_LOGHUB_DATABASE}'
            }
        ],
        passwordDigestor: "server",
    }
);

use logstream
db.createUser(
    {
        user: '${MONGO_LOGSTREAM_USERNAME}',
        pwd: '${MONGO_LOGSTREAM_PASSWORD}',
        roles: [
            {
                role: "readWrite", 
                db: '${MONGO_LOGSTREAM_DATABASE}',
            }
        ],
        passwordDigestor: "server"
    }
);
EOF
