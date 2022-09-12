import python

// https://libcloud.apache.org/
// ported from python/ql/src/Imports/DeprecatedModule.ql
// aws-cdk
predicate service_specific_module(string name, string service, string type) {
  name = "boto3" and service = "AWS" and type = "cloud"
  or
  name = "aioboto3" and service = "AWS" and type = "cloud"
  or
  name = "azure" and service = "Azure" and type = "cloud"
  or
  name = "neo4j" and service = "Neo4j" and type = "database"
  or
  name = "py2neo" and service = "Neo4j" and type = "database"
  or
  name = "cx_oracle" and service = "Oracle" and type = "database"
  or
  name = "psycopg2" and service = "PostgreSQL" and type = "database"
  or
  name = "pymongo" and service = "MongoDB" and type = "database"
  or
  //mysql.connector
  name = "mysql" and service = "MySQL" and type = "database"
  or
  name = "cassandra-driver" and service = "Cassandra" and type = "database"
}

string service_message(string mod) {
  exists(string service, string type | service_specific_module(mod, service, type) |
    result = "The " + mod + " module is used to interface with " + service + " (" + type + ")."
  )
}

string service(string mod) {
  exists(string service | service_specific_module(mod, service, _) | result = service)
}

from ImportExpr imp, string name, string service, string type
where
  name = imp.getName() and
  service_specific_module(name, service, type) and
  not exists(Try try, ExceptStmt except | except = try.getAHandler() |
    except.getType().pointsTo(ClassValue::importError()) and
    except.containsInScope(imp)
  )
select name, service(name), service_message(name)
