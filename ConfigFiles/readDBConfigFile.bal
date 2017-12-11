package ConfigFiles;

import ballerina.file;
import ballerina.io;
import ballerina.log;

public function getConfigData (string filePath) (json) {

    file:File fileSrc = {path:filePath};

    io:ByteChannel channel;

    try {
        channel = fileSrc.openChannel("r");
        log:printDebug(filePath + " file found");

    } catch (error err) {
        log:printError(filePath + " file not found. " + err.msg);
        return null;
    }

    string content;

    if (channel != null) {
        io:CharacterChannel characterChannel = channel.toCharacterChannel("UTF-8");

        content = characterChannel.readCharacters(100000);
        log:printDebug(filePath + " content read");

        characterChannel.closeCharacterChannel();
        log:printDebug(filePath + " characterChannel closed");

        var configJson, _ = <json>content;
        return configJson;

    }
    return null;
}




