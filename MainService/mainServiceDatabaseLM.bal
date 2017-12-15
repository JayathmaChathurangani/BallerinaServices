package MainService;

import ballerina.net.http;
import ballerina.data.sql;
import Database;

@http:configuration {
    basePath:"/LMDependencyManager",
    httpsPort:9099,
    keyStoreFile:"${ballerina.home}/bre/security/wso2carbon.jks",
    keyStorePassword:"wso2carbon",
    certPassword:"wso2carbon",
    trustStoreFile:"${ballerina.home}/bre/security/client-truststore.jks",
    trustStorePassword:"wso2carbon"
}


service<http> DatabaseLM {

    sql:ClientConnector sqlConnection = Database:getDatabaseConfiguration();

    @http:resourceConfig {
        methods:["GET"],
        path:"/library/nameDropDown"
    }
    resource fillLibraryNameDropDownResource (http:Request request, http:Response response) {
        if(sqlConnection == null){
            sqlConnection = Database:getDatabaseConfiguration();
        }
        if(sqlConnection != null){
            json jsonresponse = Database:selectLibraryDropDown(sqlConnection);
            response.setJsonPayload(jsonresponse);
        }else{
            json errorMessage = {"responseType":"Error","responseMessage":"Connection Error"};
            response.setJsonPayload(errorMessage);
        }
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.send();
    }

    @http:resourceConfig {
        methods:["GET"],
        path:"/library/versionDropDown/{libraryName}"
    }
    resource fillProductVersionDropDownResource (http:Request request, http:Response response,string libraryName) {
        if(sqlConnection == null){
            sqlConnection = Database:getDatabaseConfiguration();
        }

        if(sqlConnection != null){
            json jsonresponse = Database:selectLibraryVersionDropDown(sqlConnection, libraryName);
            response.setJsonPayload(jsonresponse);
        }else{
            json errorMessage = {"responseType":"Error","responseMessage":"Connection Error"};
            response.setJsonPayload(errorMessage);
        }
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.send();
    }

    @http:resourceConfig {
        methods:["GET"],
        path:"/component/versionDropDown/{componentName}"
    }
    resource fillCompponentVersionDropDownResource (http:Request request, http:Response response,string componentName) {
        if(sqlConnection == null){
            sqlConnection = Database:getDatabaseConfiguration();
        }

        if(sqlConnection != null){
            json jsonresponse = Database:selectComponentVersionDropDown(sqlConnection, componentName);
            response.setJsonPayload(jsonresponse);
        }else{
            json errorMessage = {"responseType":"Error","responseMessage":"Connection Error"};
            response.setJsonPayload(errorMessage);
        }
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.send();
    }

    @http:resourceConfig {
        methods:["GET"],
        path:"/component/nameDropDown"
    }
    resource fillComponentNameDropDownResource (http:Request request, http:Response response) {
        if(sqlConnection == null){
            sqlConnection = Database:getDatabaseConfiguration();
        }

        if(sqlConnection != null){
            json jsonresponse = Database:selectComponentNameDropDown(sqlConnection);
            response.setJsonPayload(jsonresponse);
        }else{
            json errorMessage = {"responseType":"Error","responseMessage":"Connection Error"};
            response.setJsonPayload(errorMessage);
        }
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.send();
    }

    @http:resourceConfig {
        methods:["GET"],
        path:"/product/nameDropDown"
    }
    resource fillProductNameDropDownResource (http:Request request, http:Response response) {
        if(sqlConnection == null){
            sqlConnection = Database:getDatabaseConfiguration();
        }

        if(sqlConnection != null){
            json jsonresponse = Database:selectProductDropDown(sqlConnection);
            response.setJsonPayload(jsonresponse);
        }else{
            json errorMessage = {"responseType":"Error","responseMessage":"Connection Error"};
            response.setJsonPayload(errorMessage);
        }
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.send();
    }

    @http:resourceConfig {
        methods:["GET"],
        path:"/product/versionDropDown/{productName}"
    }
    resource fillLibraryVersionDropDownResource (http:Request request, http:Response response,string productName) {
        if(sqlConnection == null){
            sqlConnection = Database:getDatabaseConfiguration();
        }

        if(sqlConnection != null){
            json jsonresponse = Database:selectProductVersionDropDown(sqlConnection, productName);
            response.setJsonPayload(jsonresponse);
        }else{
            json errorMessage = {"responseType":"Error","responseMessage":"Connection Error"};
            response.setJsonPayload(errorMessage);
        }
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.send();
    }

    @http:resourceConfig {
        methods:["GET"],
        path:"/product/components/{productName}"
    }
    resource getComponentsOfProduct (http:Request request, http:Response response,string productName) {
        if(sqlConnection == null){
            sqlConnection = Database:getDatabaseConfiguration();
        }

        if(sqlConnection != null){
            map params = request.getQueryParams();
            var productVersion, _ = (string)params.productVersion;
            json jsonresponse = Database:selectProductComponents(sqlConnection, productName, productVersion);
            response.setJsonPayload(jsonresponse);
        }else{
            json errorMessage = {"responseType":"Error","responseMessage":"Connection Error"};
            response.setJsonPayload(errorMessage);
        }
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.send();
    }

    @http:resourceConfig {
        methods:["GET"],
        path:"/product/library/{productName}"
    }
    resource getLibrariesOfProduct (http:Request request, http:Response response,string productName) {
        if(sqlConnection == null){
            sqlConnection = Database:getDatabaseConfiguration();
        }

        if(sqlConnection != null){
            map params = request.getQueryParams();
            var productVersion, _ = (string)params.productVersion;
            json jsonresponse = Database:selectProductLibraries(sqlConnection, productName, productVersion);
            response.setJsonPayload(jsonresponse);
        }else{
            json errorMessage = {"responseType":"Error","responseMessage":"Connection Error"};
            response.setJsonPayload(errorMessage);
        }
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.send();
    }

    @http:resourceConfig {
        methods:["GET"],
        path:"/component/library/{componentName}"
    }
    resource getLibrariesOfComponent (http:Request request, http:Response response,string componentName) {
        if(sqlConnection == null){
            sqlConnection = Database:getDatabaseConfiguration();
        }

        if(sqlConnection != null){
            map params = request.getQueryParams();
            var compVersion, _ = (string)params.componentVersion;
            json jsonresponse = Database:selectComponentLibraries(sqlConnection, componentName, compVersion);
            response.setJsonPayload(jsonresponse);
        }else{
            json errorMessage = {"responseType":"Error","responseMessage":"Connection Error"};
            response.setJsonPayload(errorMessage);
        }
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.send();
    }

    @http:resourceConfig {
        methods:["GET"],
        path:"/library/component/{libraryName}"
    }
    resource getComponentsofLibrary (http:Request request, http:Response response,string libraryName) {
        if(sqlConnection == null){
            sqlConnection = Database:getDatabaseConfiguration();
        }

        if(sqlConnection != null){
            map params = request.getQueryParams();
            var libVersion, _ = (string)params.libraryVersion;
            json jsonresponse = Database:selectComponentsUsingLibrary(sqlConnection, libraryName, libVersion);
            response.setJsonPayload(jsonresponse);
        }else{
            json errorMessage = {"responseType":"Error","responseMessage":"Connection Error"};
            response.setJsonPayload(errorMessage);
        }
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.send();
    }

    @http:resourceConfig {
        methods:["GET"],
        path:"/library/artifact/group/{Name}"
    }
    resource getArtifactGroupID (http:Request request, http:Response response,string Name) {
        if(sqlConnection == null){
            sqlConnection = Database:getDatabaseConfiguration();
        }

        if(sqlConnection != null){
            map params = request.getQueryParams();
            var givenVersion, _ = (string)params.reqVersion;
            json jsonresponse = Database:selectArtifactGroupIDsLibrary(sqlConnection, Name, givenVersion);
            response.setJsonPayload(jsonresponse);
        }else{
            json errorMessage = {"responseType":"Error","responseMessage":"Connection Error"};
            response.setJsonPayload(errorMessage);
        }
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.send();
    }

    @http:resourceConfig {
        methods:["GET"],
        path:"/library/product/{libraryName}"
    }
    resource getProductsOfLibrary (http:Request request, http:Response response,string libraryName) {
        if(sqlConnection == null){
            sqlConnection = Database:getDatabaseConfiguration();
        }

        if(sqlConnection != null){
            map params = request.getQueryParams();
            var libVersion, _ = (string)params.libraryVersion;
            json jsonresponse = Database:selectProductsUsingLibrary(sqlConnection, libraryName, libVersion);
            response.setJsonPayload(jsonresponse);
        }else{
            json errorMessage = {"responseType":"Error","responseMessage":"Connection Error"};
            response.setJsonPayload(errorMessage);
        }
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.send();
    }

    @http:resourceConfig {
        methods:["GET"],
        path:"/library/component/compare/{libraryName}"
    }
    resource getProductComponentsForLibrary (http:Request request, http:Response response,string libraryName) {
        if(sqlConnection == null){
            sqlConnection = Database:getDatabaseConfiguration();
        }

        if(sqlConnection != null){
            map params = request.getQueryParams();
            var libVersion, _ = (string)params.libraryVersion;
            var prName, _ = (string)params.productName;
            var prVersion, _ = (string)params.productVersion;
            json jsonresponse = Database:selectProductComponentsForLibrary(sqlConnection, prName,prVersion, libraryName, libVersion);
            response.setJsonPayload(jsonresponse);
        }else{
            json errorMessage = {"responseType":"Error","responseMessage":"Connection Error"};
            response.setJsonPayload(errorMessage);
        }
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.send();
    }

    @http:resourceConfig {
        methods:["GET"],
        path:"/library/view/{libraryName}"
    }
    resource getViewByLibrary (http:Request request, http:Response response,string libraryName) {
        if(sqlConnection == null){
            sqlConnection = Database:getDatabaseConfiguration();
        }

        if(sqlConnection != null){
            map params = request.getQueryParams();
            var libVersion, _ = (string)params.libraryVersion;
            json jsonresponse = Database:viewByLibrary(sqlConnection, libraryName, libVersion);
            response.setJsonPayload(jsonresponse);
        }else{
            json errorMessage = {"responseType":"Error","responseMessage":"Connection Error"};
            response.setJsonPayload(errorMessage);
        }
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.send();
    }

    @http:resourceConfig {
        methods:["GET"],
        path:"/view/productandcomponentlist"
    }
    resource getProductAndComponentList (http:Request request, http:Response response) {
        if(sqlConnection == null){
            sqlConnection = Database:getDatabaseConfiguration();
        }
        if(sqlConnection != null){
            json jsonresponse = Database:selectProductsAndComponents(sqlConnection);
            response.setJsonPayload(jsonresponse);
        }else{
            json errorMessage = {"responseType":"Error","responseMessage":"Connection Error"};
            response.setJsonPayload(errorMessage);
        }
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.send();
    }

    @http:resourceConfig {
        methods:["GET"],
        path:"/view/component/librarylist/{componentName}"
    }
    resource getLibrariesForSelectedComponent (http:Request request, http:Response response, string componentName) {
        if(sqlConnection == null){
            sqlConnection = Database:getDatabaseConfiguration();
        }
        if(sqlConnection != null){
            map params = request.getQueryParams();
            var componentVersion, _ = (string)params.compVersion;

            json jsonresponse = Database:selectLibrariesForSelectedComponent(sqlConnection, componentName, componentVersion);

            response.setJsonPayload(jsonresponse);
        }else{
            json errorMessage = {"responseType":"Error","responseMessage":"Connection Error"};
            response.setJsonPayload(errorMessage);
        }
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.send();
    }

    @http:resourceConfig {
        methods:["GET"],
        path:"/view/product/librarylist/{productName}"
    }
    resource getLibrariesForSelectedProduct (http:Request request, http:Response response, string productName) {
        if(sqlConnection == null){
            sqlConnection = Database:getDatabaseConfiguration();
        }
        if(sqlConnection != null){
            map params = request.getQueryParams();
            var productVersion, _ = (string)params.prodVersion;
            json jsonresponse = Database:selectLibrariesForSelectedProduct(sqlConnection, productName, productVersion);
            response.setJsonPayload(jsonresponse);
        }else{
            json errorMessage = {"responseType":"Error","responseMessage":"Connection Error"};
            response.setJsonPayload(errorMessage);
        }
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.send();
    }

    @http:resourceConfig {
        methods:["GET"],
        path:"/view/component/{componentName}"
    }
    resource getComponentDetails (http:Request request, http:Response response, string componentName) {
        if(sqlConnection == null){
            sqlConnection = Database:getDatabaseConfiguration();
        }
        if(sqlConnection != null){
            map params = request.getQueryParams();
            var componentVersion, _ = (string)params.compVersion;

            json jsonresponse = Database:selectComponentDetails(sqlConnection, componentName, componentVersion);

            response.setJsonPayload(jsonresponse);
        }else{
            json errorMessage = {"responseType":"Error","responseMessage":"Connection Error"};
            response.setJsonPayload(errorMessage);
        }
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.send();
    }
}
