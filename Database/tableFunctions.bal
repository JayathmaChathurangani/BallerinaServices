package Database;

import ballerina.data.sql;
import ballerina.log;

struct Components {
    int COMP_ID;
    string COMP_NAME;
    string COMP_TYPE;
    string COMP_VERSION;
}

public function selectLibraryDropDown(sql:ClientConnector sqlConnection)(json){
    endpoint<sql:ClientConnector> sqlCon {
    }
    datatable libdt;

    try{
        bind sqlConnection with sqlCon;

        sql:Parameter[] paramsLibraryNameQuery = [];
        libdt = sqlCon.select(LM_DB_LIBRARY_DROP_DOWN,paramsLibraryNameQuery);

        var JSONResponse,err = <json>libdt;

        if(lengthof JSONResponse != 0){
            log:printDebug(JSONResponse.toString());
            libdt.close();
            return JSONResponse;
        }
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        return errorMessage;
    }
    json errorMessage = {"responseType":"Error","responseMessage":"Not Found"};
    libdt.close();
    return errorMessage;
}

public function selectLibraryVersionDropDown(sql:ClientConnector sqlConnection, string requestedLibrary)(json){
    endpoint<sql:ClientConnector> sqlCon {
    }
    datatable libdt;

    try{
        bind sqlConnection with sqlCon;
        sql:Parameter[] paramslibraryQuery = [];
        sql:Parameter paraName = {sqlType:"varchar", value:requestedLibrary};
        paramslibraryQuery  =  [paraName];

        libdt = sqlCon.select(LM_DB_LIBRARY_VERSION_DROP_DOWN, paramslibraryQuery);
        var JSONResponse,err = <json>libdt;

        if(lengthof JSONResponse != 0){
            log:printDebug(JSONResponse.toString());
            libdt.close();
            return JSONResponse;
        }
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        return errorMessage;
    }
    json errorMessage = {"responseType":"Error","responseMessage":"Not Found"};
    libdt.close();
    return errorMessage;
}

public function selectProductDropDown(sql:ClientConnector sqlConnection)(json){
    endpoint<sql:ClientConnector> sqlCon {
    }
    datatable libdt;

    try{
        bind sqlConnection with sqlCon;
        sql:Parameter[] paramsProductNameQuery = [];
        libdt = sqlCon.select(LM_DB_PRODUCT_DROP_DOWN,paramsProductNameQuery);

        var JSONResponse,err = <json>libdt;

        if(lengthof JSONResponse != 0){
            log:printDebug(JSONResponse.toString());
            libdt.close();
            return JSONResponse;
        }
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        return errorMessage;
    }
    json errorMessage = {"responseType":"Error","responseMessage":"Not Found"};
    libdt.close();
    return errorMessage;
}

public function selectProductVersionDropDown(sql:ClientConnector sqlConnection, string requestedProduct)(json){
    endpoint<sql:ClientConnector> sqlCon {
    }

    datatable libdt;

    try{
        bind sqlConnection with sqlCon;
        sql:Parameter[] paramsProductQuery = [];
        sql:Parameter paraName = {sqlType:"varchar", value:requestedProduct};
        paramsProductQuery  =  [paraName];

        libdt = sqlCon.select(LM_DB_PRODUCT_VERSION_DROP_DOWN, paramsProductQuery);
        var JSONResponse,err = <json>libdt;

        if(lengthof JSONResponse != 0){
            log:printDebug(JSONResponse.toString());
            libdt.close();
            return JSONResponse;
        }
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        return errorMessage;
    }
    json errorMessage = {"responseType":"Error","responseMessage":"Not Found"};
    libdt.close();
    return errorMessage;
}

public function selectProductComponents(sql:ClientConnector sqlConnection, string requestedProduct, string productVersion)(json){
    endpoint<sql:ClientConnector> sqlCon {
    }

    datatable libdt;

    try{
        bind sqlConnection with sqlCon;
        sql:Parameter[] paramsProductQuery = [];
        sql:Parameter paraName = {sqlType:"varchar", value:requestedProduct};
        sql:Parameter paraVersion = {sqlType:"varchar", value:productVersion};
        paramsProductQuery  =  [paraName,paraVersion];

        libdt = sqlCon.select(LM_DB_PRODUCT_COMPONENTS, paramsProductQuery);
        var JSONResponse,err = <json>libdt;

        if(lengthof JSONResponse != 0){
            log:printDebug(JSONResponse.toString());
            libdt.close();
            return JSONResponse;
        }
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        return errorMessage;
    }
    json errorMessage = {"responseType":"Error","responseMessage":"Not Found"};
    libdt.close();
    return errorMessage;
}

public function selectProductLibraries(sql:ClientConnector sqlConnection, string requestedProduct, string productVersion)(json){
    endpoint<sql:ClientConnector> sqlCon {
    }

    datatable libdt;

    try{
        bind sqlConnection with sqlCon;
        sql:Parameter[] paramsProductQuery = [];
        sql:Parameter paraName = {sqlType:"varchar", value:requestedProduct};
        sql:Parameter paraVersion = {sqlType:"varchar", value:productVersion};
        paramsProductQuery  =  [paraName,paraVersion];

        libdt = sqlCon.select(LM_DB_PRODUCT_LIBRARIES, paramsProductQuery);
        var JSONResponse,err = <json>libdt;

        if(lengthof JSONResponse != 0){
            log:printDebug(JSONResponse.toString());
            libdt.close();
            return JSONResponse;
        }
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        return errorMessage;
    }
    json errorMessage = {"responseType":"Error","responseMessage":"Not Found"};
    libdt.close();
    return errorMessage;
}

public function selectComponentLibraries(sql:ClientConnector sqlConnection, string requestedComponent, string componentVersion)(json){
    endpoint<sql:ClientConnector> sqlCon {
    }

    datatable libdt;

    try{
        bind sqlConnection with sqlCon;
        sql:Parameter[] paramsProductQuery = [];
        sql:Parameter paraName = {sqlType:"varchar", value:requestedComponent};
        sql:Parameter paraVersion = {sqlType:"varchar", value:componentVersion};
        paramsProductQuery  =  [paraName,paraVersion];

        libdt = sqlCon.select(LM_DB_COMPONENT_LIBRARIES, paramsProductQuery);
        var JSONResponse,err = <json>libdt;

        if(lengthof JSONResponse != 0){
            log:printDebug(JSONResponse.toString());
            libdt.close();
            return JSONResponse;
        }
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        return errorMessage;
    }
    json errorMessage = {"responseType":"Error","responseMessage":"Not Found"};
    libdt.close();
    return errorMessage;
}


public function selectProductsUsingLibrary(sql:ClientConnector sqlConnection, string requestedLibrary, string libraryVersion)(json){
    endpoint<sql:ClientConnector> sqlCon {
    }

    datatable libdt;

    try{
        bind sqlConnection with sqlCon;
        sql:Parameter[] paramsProductQuery = [];
        sql:Parameter paraName = {sqlType:"varchar", value:requestedLibrary};
        sql:Parameter paraVersion = {sqlType:"varchar", value:libraryVersion};
        paramsProductQuery  =  [paraName,paraVersion];

        libdt = sqlCon.select(LM_DB_LIBRARY_PRODUCTS, paramsProductQuery);
        var JSONResponse,err = <json>libdt;

        if(lengthof JSONResponse != 0){
            log:printDebug(JSONResponse.toString());
            libdt.close();
            return JSONResponse;
        }
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        return errorMessage;
    }
    json errorMessage = {"responseType":"Error","responseMessage":"Not Found"};
    libdt.close();
    return errorMessage;
}

public function selectComponentsUsingLibrary(sql:ClientConnector sqlConnection, string requestedLibrary, string libraryVersion)(json){
    endpoint<sql:ClientConnector> sqlCon {
    }

    datatable libdt;

    try{
        bind sqlConnection with sqlCon;
        sql:Parameter[] paramsProductQuery = [];
        sql:Parameter paraName = {sqlType:"varchar", value:requestedLibrary};
        sql:Parameter paraVersion = {sqlType:"varchar", value:libraryVersion};
        paramsProductQuery  =  [paraName,paraVersion];

        libdt = sqlCon.select(LM_DB_LIBRARY_COMPONENTS, paramsProductQuery);
        var JSONResponse,err = <json>libdt;

        if(lengthof JSONResponse != 0){
            log:printDebug(JSONResponse.toString());
            libdt.close();
            return JSONResponse;
        }
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        return errorMessage;
    }
    json errorMessage = {"responseType":"Error","responseMessage":"Not Found"};
    libdt.close();
    return errorMessage;
}

public function selectArtifactGroupIDsLibrary(sql:ClientConnector sqlConnection, string requestedLibrary, string libraryVersion)(json){
    endpoint<sql:ClientConnector> sqlCon {
    }

    datatable libdt;

    try{
        bind sqlConnection with sqlCon;
        sql:Parameter[] paramsProductQuery = [];
        sql:Parameter paraName = {sqlType:"varchar", value:requestedLibrary};
        sql:Parameter paraVersion = {sqlType:"varchar", value:libraryVersion};
        paramsProductQuery  =  [paraName,paraVersion];

        libdt = sqlCon.select(LM_DB_LIBRARY_ARTIFACT_GROUP, paramsProductQuery);
        var JSONResponse,err = <json>libdt;

        if(lengthof JSONResponse != 0){
            log:printDebug(JSONResponse.toString());
            libdt.close();
            return JSONResponse;
        }
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        return errorMessage;
    }
    json errorMessage = {"responseType":"Error","responseMessage":"NotFound"};
    libdt.close();
    return errorMessage;
}

public function selectProductComponentsForLibrary(sql:ClientConnector sqlConnection, string requestedProduct, string productVersion,string givenLibrary, string givenVersion)(json){
    endpoint<sql:ClientConnector> sqlCon {
    }

    datatable libdtPrComponents;
    datatable libdtLbComponents;
    int matchCount = 0;
    json returnMsg = { data : []};

    try{
        bind sqlConnection with sqlCon;
        sql:Parameter[] paramsPrComponentsQuery = [];
        sql:Parameter[] paramsLbComponentsQuery = [];

        sql:Parameter paraPName = {sqlType:"varchar", value:requestedProduct};
        sql:Parameter paraPVersion = {sqlType:"varchar", value:productVersion};
        paramsPrComponentsQuery  =  [paraPName,paraPVersion];
        libdtPrComponents = sqlCon.select(LM_DB_PRODUCT_COMPONENTS, paramsPrComponentsQuery);


        sql:Parameter paraLName = {sqlType:"varchar", value:givenLibrary};
        sql:Parameter paraLVersion = {sqlType:"varchar", value:givenVersion};
        paramsLbComponentsQuery  =  [paraLName,paraLVersion];
        libdtLbComponents = sqlCon.select(LM_DB_LIBRARY_COMPONENTS, paramsLbComponentsQuery);

        while(libdtLbComponents.hasNext()){
            var LbComponents, _ = (Components)libdtLbComponents.getNext();
            while(libdtPrComponents.hasNext()){
                var PrComponents, _ = (Components)libdtPrComponents.getNext();
                if(LbComponents.COMP_NAME == PrComponents.COMP_NAME){
                    matchCount = matchCount + 1;
                    json element = { "COMP_NAME": PrComponents.COMP_NAME, "COMP_VERSION":PrComponents.COMP_VERSION};
                    returnMsg.data[lengthof returnMsg]=element;
                }
            }
        }

    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        libdtLbComponents.close();
        libdtPrComponents.close();
        return errorMessage;
    }
    if(matchCount > 0){
        println(returnMsg);
        return returnMsg;
    }else{
        json errorMessage = {"responseType":"Error","responseMessage":"Not Found"};
        libdtLbComponents.close();
        libdtPrComponents.close();
        return errorMessage;
    }
}

