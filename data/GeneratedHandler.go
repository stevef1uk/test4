// GENERATED FILE so do not edit or will be overwritten upon next generate
package data

import (
    "github.com/stevef1uk/test4/models"
    "github.com/stevef1uk/test4/restapi/operations"
    middleware "github.com/go-openapi/runtime/middleware"
    "github.com/gocql/gocql"
    "os"
    "log"
    "github.com/stevef1uk/test4/restapi/operations/verysimple"
     
)


var cassuservice_session *gocql.Session

func SetUp() {
  var err error
  log.Println("Tring to connect to Cassandra database using ", os.Getenv("CASSANDRA_SERVICE_HOST"))
  cluster := gocql.NewCluster(os.Getenv("CASSANDRA_SERVICE_HOST"))
  cluster.Keyspace = "demo"
  cluster.Consistency = gocql.One
  cassuservice_session, err = cluster.CreateSession()
  if ( err != nil ) {
    log.Fatal("Have you remembered to set the env var $CASSANDRA_SERVICE_HOST as connection to Cannandra failed with error = ", err)
  } else {
    log.Println("Yay! Connection to Cannandra established")
  }
}

func Stop() {
    log.Println("Shutting down the service handler")
  cassuservice_session.Close()
}

func Search(params operations.GetVerysimpleParams) middleware.Responder {

    var ID int64
    _ = ID
    var Message string
    _ = Message
    _ = models.Verysimple{}

    codeGenRawTableResult := map[string]interface{}{}

    if err := cassuservice_session.Query(` SELECT id, message FROM verysimple WHERE id = ? `,params.ID).Consistency(gocql.One).MapScan(codeGenRawTableResult); err != nil {
      log.Println("No data? ", err)
      return operations.NewGetVerysimpleBadRequest()
    }
    payLoad := operations.NewGetVerysimpleOK()
    payLoad.Payload = make([]*operations.GetVerysimpleOKBodyItems0,1)
    payLoad.Payload[0] = new(operations.GetVerysimpleOKBodyItems0)
    retParams := payLoad.Payload[0]
    tmp_ID_0 := codeGenRawTableResult["id"].(int)
    ID = int64(tmp_ID_0)
    retParams.ID = &ID
    tmp_Message_1 := codeGenRawTableResult["message"].(string)
    retParams.Message = &tmp_Message_1
    return operations.NewGetVerysimpleOK().WithPayload( payLoad.Payload)
    }

func Insert(params verysimple.AddVerysimpleParams) middleware.Responder {

    m := make(map[string]interface{})
    
    
    m["id"] = params.Body.ID
    m["message"] = params.Body.Message
    if err := cassuservice_session.Query(` INSERT INTO verysimple(id, message) VALUES (?,?)`,m["id"],m["message"]).Consistency(gocql.One).Exec(); err != nil {
      return verysimple.NewAddVerysimpleMethodNotAllowed()
    }
    return verysimple.NewAddVerysimpleCreated()
}