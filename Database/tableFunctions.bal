package Database;

import ballerina.data.sql;
import ballerina.log;
import ballerina.net.http;

struct Components {
    int COMP_ID;
    string COMP_NAME;
    string COMP_TYPE;
    string COMP_VERSION;
}

struct LibraryDetails {
    int LIB_ID;
    string LIB_NAME;
    string LIB_VERSION;
    string LIB_TYPE;
    string LM_ARTIFACT_ID;
    string LM_GROUP_ID;
}

struct Products {
    int PRODUCT_ID;
    string PRODUCT_NAME;
    string PRODUCT_VERSION;
}

struct ProductList {
     string PRODUCT_NAME;
}

struct ComponentList {
    string COMP_NAME;
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
            log:printInfo("Library Names were Successfully Retreived");
            libdt.close();
            return JSONResponse;
        }
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        log:printError(err.msg);
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
            log:printInfo("Library Versions were Successfully Retreived");
            libdt.close();
            return JSONResponse;
        }
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        log:printError(err.msg);
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
            log:printInfo("Product Names were Successfully Retreived");
            libdt.close();
            return JSONResponse;
        }
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        log:printError(err.msg);
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
            log:printInfo("Product Versions were Successfully Retreived");
            return JSONResponse;
        }
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        log:printError(err.msg);
        return errorMessage;
    }
    json errorMessage = {"responseType":"Error","responseMessage":"Not Found"};
    libdt.close();
    return errorMessage;
}

public function selectComponentVersionDropDown(sql:ClientConnector sqlConnection, string requestedComponent)(json){
    endpoint<sql:ClientConnector> sqlCon {
    }

    datatable libdt;

    try{
        bind sqlConnection with sqlCon;
        sql:Parameter[] paramsCompQuery = [];
        sql:Parameter paraName = {sqlType:"varchar", value:requestedComponent};
        paramsCompQuery  =  [paraName];

        libdt = sqlCon.select(LM_DB_COMPONENT_VERSION_DROP_DOWN, paramsCompQuery);
        var JSONResponse,err = <json>libdt;

        if(lengthof JSONResponse != 0){
            log:printDebug(JSONResponse.toString());
            log:printInfo("Component Versions were Successfully Retreived");
            libdt.close();
            return JSONResponse;
        }
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        log:printError(err.msg);
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
            log:printInfo("Components of the Products were Successfully Retreived");
            libdt.close();
            return JSONResponse;
        }
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        log:printError(err.msg);
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
            log:printInfo("Product Libraries were Successfully Retreived");
            libdt.close();
            return JSONResponse;
        }
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        log:printError(err.msg);
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
            log:printInfo("Component Libraries were Successfully Retreived");
            libdt.close();
            return JSONResponse;
        }
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        log:printError(err.msg);
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
            log:printInfo("Products using the given Library were Successfully Retreived");
            libdt.close();
            return JSONResponse;
        }
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        log:printError(err.msg);
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
            log:printInfo("Components using the given Library were Successfully Retreived");
            libdt.close();
            return JSONResponse;
        }
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        log:printError(err.msg);
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
            log:printInfo("Artifact ID and Group ID of the given Library were Successfully Retreived");
            libdt.close();
            return JSONResponse;
        }
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        log:printError(err.msg);
        return errorMessage;
    }
    json errorMessage = {"responseType":"Error","responseMessage":"NotFound"};
    libdt.close();
    return errorMessage;
}

public function selectProductComponentsForLibrary(sql:ClientConnector sqlConnection, string requestedProduct, string productVersion,string givenLibrary, string givenVersion)(json){
    endpoint<sql:ClientConnector> sqlCon {
    }
    //no use
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
        log:printError(err.msg);
        return errorMessage;
    }
    if(matchCount > 0){
        println(returnMsg);
        return returnMsg;
    }else{
        json errorMessage = {"responseType":"Other","responseMessage":"ProductLevel"};
        libdtLbComponents.close();
        libdtPrComponents.close();
        return errorMessage;
    }
}

public function viewByLibrary(sql:ClientConnector sqlConnection, string givenLibrary, string givenVersion)(json){
    endpoint<sql:ClientConnector> sqlCon {
    }
    datatable libdtLibraryProducts;
    datatable libdtLibraryComponents;
    datatable dtCompProduct;
    json returnMsg = { data:[]};

    try{
        bind sqlConnection with sqlCon;
        sql:Parameter[] paramsQuery = [];

        sql:Parameter paraLName = {sqlType:"varchar", value:givenLibrary};
        sql:Parameter paraLVersion = {sqlType:"varchar", value:givenVersion};
        paramsQuery  =  [paraLName,paraLVersion];
        libdtLibraryProducts = sqlCon.select(LM_DB_LIBRARY_PRODUCTS, paramsQuery);
        libdtLibraryComponents = sqlCon.select(LM_DB_LIBRARY_COMPONENTS, paramsQuery);

        while(libdtLibraryProducts.hasNext()){
            var product, _ = (Products)libdtLibraryProducts.getNext();
            json element = {"PRODUCT_LEVEL_DEPENDENCY": "Yes", "PRODUCT_NAME":product.PRODUCT_NAME, "PRODUCT_VERSION":product.PRODUCT_VERSION, "COMPONENT_NAME":"-", "COMP_VERSION":"-", "COMP_TYPE":"-"};
            returnMsg.data[lengthof returnMsg.data]=element;
        }

        log:printInfo("Finished retrieving products using the given library");

        while (libdtLibraryComponents.hasNext()) {
            var component, _ = (Components)libdtLibraryComponents.getNext();
            string compName  = component.COMP_NAME;
            string compVersion = component.COMP_VERSION;
            string compType  = component.COMP_TYPE;

            sql:Parameter[] paramsCompQuery = [];

            sql:Parameter paraCName = {sqlType:"varchar", value:compName};
            sql:Parameter paraCVersion = {sqlType:"varchar", value:compVersion};
            paramsCompQuery  =  [paraCName,paraCVersion];
            dtCompProduct  = sqlCon.select(LM_DB_COMPONENT_PRODUCTS, paramsCompQuery);

            while(dtCompProduct.hasNext()){
                var product, _ = (Products)dtCompProduct.getNext();
                json element = {"PRODUCT_LEVEL_DEPENDENCY": "No", "PRODUCT_NAME":product.PRODUCT_NAME, "PRODUCT_VERSION":product.PRODUCT_VERSION, "COMPONENT_NAME":compName, "COMP_VERSION":compVersion, "COMP_TYPE":compType };
                returnMsg.data[lengthof returnMsg.data]=element;
            }
        }
        log:printInfo("Finished retrieving components using the given library");
        return returnMsg;
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        libdtLibraryProducts.close();
        libdtLibraryComponents.close();
        log:printError(err.msg);
        return errorMessage;
    }
    json errorMessage = {"responseType":"Other","responseMessage":"NotFound"};
    libdtLibraryProducts.close();
    libdtLibraryComponents.close();
    return errorMessage;
}

public function selectComponentNameDropDown(sql:ClientConnector sqlConnection)(json){
    endpoint<sql:ClientConnector> sqlCon {
    }
    datatable dtComponent;

    try{
        bind sqlConnection with sqlCon;

        sql:Parameter[] paramsNameQuery = [];
        dtComponent = sqlCon.select(LM_DB_COMPONENT_DROP_DOWN,paramsNameQuery);

        var JSONResponse,err = <json>dtComponent;

        if(lengthof JSONResponse != 0){
            log:printDebug(JSONResponse.toString());
            dtComponent.close();
            log:printInfo("Successfully retireved Component names");
            return JSONResponse;
        }
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        log:printError(err.msg);
        return errorMessage;
    }
    json errorMessage = {"responseType":"Error","responseMessage":"Not Found"};
    dtComponent.close();
    return errorMessage;
}

public function componentLibraries(sql:ClientConnector sqlConnection, string requestedComponent, string componentVersion)(json){
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
            log:printInfo("Successfully retireved Component Libraries");
            return JSONResponse;
        }
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        log:printError(err.msg);
        return errorMessage;
    }
    json errorMessage = {"responseType":"Error","responseMessage":"Not Found"};
    libdt.close();
    return errorMessage;
}

public function selectProductsAndComponents(sql:ClientConnector sqlConnection)(json){
    endpoint<sql:ClientConnector> sqlCon {
    }
    datatable dtProducts;
    datatable dtComponents;
    json returnMsg = { products:[], components:[]};
    json element;

    try{
        bind sqlConnection with sqlCon;
        sql:Parameter[] paramsQuery = [];

        dtProducts = sqlCon.select(LM_DB_PRODUCT_DROP_DOWN, paramsQuery);
        dtComponents = sqlCon.select(LM_DB_COMPONENT_DROP_DOWN, paramsQuery);

        while(dtProducts.hasNext()){
            var product, _ = (ProductList)dtProducts.getNext();
            element = {"NAME": product.PRODUCT_NAME};
            returnMsg.products[lengthof returnMsg.products]=element;
        }
        log:printInfo("Finished retreiving product names");

        while (dtComponents.hasNext()) {
            var component, _ = (ComponentList)dtComponents.getNext();
            element = {"NAME": component.COMP_NAME};
            returnMsg.components[lengthof returnMsg.components]=element;
        }
        dtProducts.close();
        dtComponents.close();

        log:printInfo("Finished retreiving component names");

        return returnMsg;
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        dtProducts.close();
        dtComponents.close();
        log:printError(err.msg);
        return errorMessage;
    }
    json errorMessage = {"responseType":"Other","responseMessage":"NotFound"};
    dtProducts.close();
    dtComponents.close();
    return errorMessage;
}

public function selectLibrariesForSelectedComponent(sql:ClientConnector sqlConnection, string requestedComponent, string componentVersion)(json){
    endpoint<sql:ClientConnector> sqlCon {
    }
    endpoint<http:HttpClient> httpEndpoint {
        create http:HttpClient("https://localhost:9091/dependencyManager/router/", {});
    }
    http:Response resp = {};
    http:Request req = {};
    json jsonReqMsg;
    json jsonRespMsg;
    datatable dtLibrary;
    json element   =  {};
    json returnMsg = { Libraries:[]};

    try{
        bind sqlConnection with sqlCon;
        sql:Parameter[] paramsQuery = [];
        sql:Parameter paraName = {sqlType:"varchar", value:requestedComponent};
        sql:Parameter paraVersion = {sqlType:"varchar", value:componentVersion};
        paramsQuery = [paraName, paraVersion];

        dtLibrary = sqlCon.select(LM_DB_COMPONENT_LIBRARIES_DETAIL, paramsQuery);
        var JSONResponse, err = <json>dtLibrary;

        int i = 0;
        string httpQuery;


        while (i < (lengthof JSONResponse)) {
            if (JSONResponse[i].LM_ARTIFACT_ID != null) {
                var groupID, castErr = (string)JSONResponse[i].LM_GROUP_ID;

                httpQuery = "java?VersionReq=true&GroupID=" + groupID;
                jsonReqMsg = {"groupID":JSONResponse[i].LM_GROUP_ID, "artifactID":JSONResponse[i].LM_ARTIFACT_ID};

                req.setJsonPayload(jsonReqMsg);
                resp, _ = httpEndpoint.post(httpQuery, req);

                if(resp.getStatusCode() == 200){
                    jsonRespMsg = resp.getJsonPayload();
                    element = {"LIB_NAME":JSONResponse[i].LIB_NAME, "LIB_TYPE":JSONResponse[i].LIB_TYPE, "LIB_VERSION":JSONResponse[i].LIB_VERSION, "LATEST_VERSION":jsonRespMsg.NewestVersion, "GROUP_ID":JSONResponse[i].LM_GROUP_ID, "ARTIFACT_ID":JSONResponse[i].LM_ARTIFACT_ID};
                    returnMsg.Libraries[lengthof returnMsg.Libraries] = element;
                }else{
                    element = {"LIB_NAME":JSONResponse[i].LIB_NAME, "LIB_TYPE":JSONResponse[i].LIB_TYPE, "LIB_VERSION":JSONResponse[i].LIB_VERSION, "LATEST_VERSION":"NotFound", "GROUP_ID":JSONResponse[i].LM_GROUP_ID, "ARTIFACT_ID":JSONResponse[i].LM_ARTIFACT_ID};
                    returnMsg.Libraries[lengthof returnMsg.Libraries] = element;
                }
            } else{
                element = {"LIB_NAME":JSONResponse[i].LIB_NAME, "LIB_TYPE":JSONResponse[i].LIB_TYPE, "LIB_VERSION":JSONResponse[i].LIB_VERSION, "LATEST_VERSION":"CannotResolved", "GROUP_ID":"", "ARTIFACT_ID":""};
                returnMsg.Libraries[lengthof returnMsg.Libraries] = element;
            }
            i = i + 1;
        }

        log:printInfo("Retreiving library details");
        dtLibrary.close();
        return returnMsg;
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        dtLibrary.close();
        log:printError(err.msg);
        return errorMessage;
    }
    json errorMessage = {"responseType":"Other","responseMessage":"NotFound"};
    dtLibrary.close();
    return errorMessage;
}

public function selectComponentDetails(sql:ClientConnector sqlConnection, string requestedComponent, string componentVersion)(json){
    endpoint<sql:ClientConnector> sqlCon {
    }

    datatable dtCompDetails;
    datatable dtCompProducts;
    json element   =  {};
    json returnMsg = { ComponentType:"", ComponentProducts:[]};

    try{
        bind sqlConnection with sqlCon;
        sql:Parameter[] paramsQuery = [];
        sql:Parameter paraName = {sqlType:"varchar", value:requestedComponent};
        sql:Parameter paraVersion = {sqlType:"varchar", value:componentVersion};
        paramsQuery = [paraName, paraVersion];

        dtCompDetails = sqlCon.select(LM_DB_COMPONENT_DETAILS, paramsQuery);
        dtCompProducts = sqlCon.select(LM_DB_COMPONENT_PRODUCTS, paramsQuery);

        var JSONResponse, err = <json>dtCompProducts;
        int i = 0;

        while (i < (lengthof JSONResponse)) {
            element = {"PRODUCT_NAME":JSONResponse[i].PRODUCT_NAME, "PRODUCT_VERSION":JSONResponse[i].PRODUCT_VERSION};
            returnMsg.ComponentProducts[lengthof returnMsg.ComponentProducts] = element;
            i = i + 1;
        }

        log:printInfo("Finished retreiving component details");

        var JSONCompType, err = <json>dtCompDetails;
        if(JSONCompType[0].COMP_TYPE != null){
            returnMsg.ComponentType = JSONCompType[0].COMP_TYPE;
        }

        dtCompDetails.close();
        dtCompProducts.close();
        return returnMsg;
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        dtCompDetails.close();
        dtCompProducts.close();
        log:printError(err.msg);
        return errorMessage;
    }
    json errorMessage = {"responseType":"Other","responseMessage":"NotFound"};
    dtCompDetails.close();
    dtCompProducts.close();
    return errorMessage;
}

public function selectLibrariesForSelectedProduct(sql:ClientConnector sqlConnection, string requestedProduct, string productVersion)(json){
    endpoint<sql:ClientConnector> sqlCon {
    }
    endpoint<http:HttpClient> httpEndpoint {
        create http:HttpClient("https://localhost:9091/dependencyManager/router/", {});
    }
    http:Response resp = {};
    http:Request req = {};
    json jsonReqMsg;
    json jsonRespMsg;
    datatable dtLibrary;
    json element   =  {};
    json returnMsg = { Libraries:[]};

    try{
        bind sqlConnection with sqlCon;
        sql:Parameter[] paramsQuery = [];
        sql:Parameter paraName = {sqlType:"varchar", value:requestedProduct};
        sql:Parameter paraVersion = {sqlType:"varchar", value:productVersion};
        paramsQuery = [paraName, paraVersion];

        dtLibrary = sqlCon.select(LM_DB_PRODUCT_LIBRARIES, paramsQuery);
        var JSONResponse, err = <json>dtLibrary;

        int i = 0;
        string httpQuery;


        while (i < (lengthof JSONResponse)) {
            if (JSONResponse[i].LM_ARTIFACT_ID != null) {
                var groupID, castErr = (string)JSONResponse[i].LM_GROUP_ID;

                httpQuery = "java?VersionReq=true&GroupID=" + groupID;
                jsonReqMsg = {"groupID":JSONResponse[i].LM_GROUP_ID, "artifactID":JSONResponse[i].LM_ARTIFACT_ID};

                req.setJsonPayload(jsonReqMsg);
                resp, _ = httpEndpoint.post(httpQuery, req);

                if(resp.getStatusCode() == 200){
                    jsonRespMsg = resp.getJsonPayload();
                    element = {"LIB_NAME":JSONResponse[i].LIB_NAME, "LIB_TYPE":JSONResponse[i].LIB_TYPE, "LIB_VERSION":JSONResponse[i].LIB_VERSION, "LATEST_VERSION":jsonRespMsg.NewestVersion, "GROUP_ID":JSONResponse[i].LM_GROUP_ID, "ARTIFACT_ID":JSONResponse[i].LM_ARTIFACT_ID};
                    returnMsg.Libraries[lengthof returnMsg.Libraries] = element;
                }else{
                    element = {"LIB_NAME":JSONResponse[i].LIB_NAME, "LIB_TYPE":JSONResponse[i].LIB_TYPE, "LIB_VERSION":JSONResponse[i].LIB_VERSION, "LATEST_VERSION":"NotFound", "GROUP_ID":JSONResponse[i].LM_GROUP_ID, "ARTIFACT_ID":JSONResponse[i].LM_ARTIFACT_ID};
                    returnMsg.Libraries[lengthof returnMsg.Libraries] = element;
                }
            }else{
                element = {"LIB_NAME":JSONResponse[i].LIB_NAME, "LIB_TYPE":JSONResponse[i].LIB_TYPE, "LIB_VERSION":JSONResponse[i].LIB_VERSION, "LATEST_VERSION":"CannotResolved", "GROUP_ID":"", "ARTIFACT_ID":""};
                returnMsg.Libraries[lengthof returnMsg.Libraries] = element;
            }

            i = i + 1;
        }
        dtLibrary.close();
        log:printInfo("Library details for the given product successfully retreived");
        return returnMsg;
    }catch (error err) {
        json errorMessage = {"responseType":"Error","responseMessage":err.msg};
        dtLibrary.close();
        log:printError(err.msg);
        return errorMessage;
    }
    json errorMessage = {"responseType":"Other","responseMessage":"NotFound"};
    dtLibrary.close();
    return errorMessage;

}
