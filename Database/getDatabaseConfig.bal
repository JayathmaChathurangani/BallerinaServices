package Database;

import ballerina.data.sql;
import ballerina.log;
import ConfigFiles;

public function getDatabaseConfiguration()(sql:ClientConnector){
    try{
        string CONFIG_PATH =   "./ConfigFiles/databaseConfig.json";
        json configs = ConfigFiles:getConfigData(CONFIG_PATH);
        var dbHost, _ = (string)configs.LM_JDBC.DB_HOST;
        var dbPort, _ = (int)configs.LM_JDBC.DB_PORT;
        var dbName, _ = (string)configs.LM_JDBC.DB_NAME;
        var dbUser, _ = (string)configs.LM_JDBC.DB_USERNAME;
        var dbPassword, _ = (string)configs.LM_JDBC.DB_PASSWORD;
        var dbPoolSize, _ = (string)configs.LM_JDBC.MAXIMUM_POOL_SIZE;
        var maxPoolSize,_=<int>dbPoolSize;

        sql:ClientConnector sqlConnector = create sql:ClientConnector(sql:MYSQL,dbHost,dbPort,dbName,dbUser,dbPassword,{maximumPoolSize:maxPoolSize});
        return sqlConnector;

    }catch (error err) {
        log:printError("Error " + err.msg);
    }
    return null;
}
