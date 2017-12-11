package Database;

string LM_DB_LIBRARY_DROP_DOWN = "SELECT DISTINCT LIB_NAME
                                   FROM LM_LIBRARY
                                   WHERE LIB_NAME <> ''
                                   ORDER BY LIB_NAME";
string LM_DB_PRODUCT_DROP_DOWN = "SELECT DISTINCT(PRODUCT_NAME)
                                    FROM LM_PRODUCT
                                    ORDER BY PRODUCT_NAME";
string LM_DB_LIBRARY_VERSION_DROP_DOWN = "SELECT DISTINCT LIB_VERSION
                                            FROM LM_LIBRARY
                                            WHERE LIB_NAME = ?";
string LM_DB_LIBRARY_ARTIFACT_GROUP = "SELECT LM_ARTIFACT_ID, LM_GROUP_ID, LIB_TYPE
                                            FROM LM_LIBRARY
                                            WHERE LIB_NAME = ? AND LIB_VERSION = ?";
string LM_DB_PRODUCT_VERSION_DROP_DOWN = "SELECT DISTINCT PRODUCT_VERSION
                                            FROM LM_PRODUCT
                                            WHERE PRODUCT_NAME = ?";
string LM_DB_PRODUCT_COMPONENTS = "SELECT DISTINCT cm.COMP_ID, cm.COMP_NAME, cm.COMP_TYPE, cm.COMP_VERSION
                                    FROM LM_COMPONENT as cm
                                    INNER JOIN LM_COMPONENT_PRODUCT as cp ON cm.COMP_KEY = cp.COMP_KEY
                                    INNER JOIN LM_PRODUCT as pr ON cp.PRODUCT_ID = pr.PRODUCT_ID
                                    WHERE pr.PRODUCT_NAME = ? AND pr.PRODUCT_VERSION = ?";
string LM_DB_PRODUCT_LIBRARIES = "SELECT DISTINCT lb.LIB_ID, lb.LIB_NAME, lb.LIB_VERSION, lb.LIB_TYPE, lb.LM_ARTIFACT_ID, lb.LM_GROUP_ID
                                FROM LM_LIBRARY as lb
                                INNER JOIN LM_LIBRARY_PRODUCT as lp ON lp.LIB_ID = lb.LIB_ID
                                INNER JOIN LM_PRODUCT as pr ON lp.PRODUCT_ID = pr.PRODUCT_ID
                                WHERE pr.PRODUCT_NAME = ? AND pr.PRODUCT_VERSION = ?";
string LM_DB_COMPONENT_LIBRARIES = "SELECT DISTINCT lb.LIB_ID, lb.LIB_NAME, lb.LIB_VERSION, lb.LIB_TYPE
                                FROM LM_LIBRARY as lb
                                INNER JOIN LM_COMPONENT_LIBRARY as lp ON lp.LIB_ID = lb.LIB_ID
                                INNER JOIN LM_COMPONENT as cm ON lp.COMP_KEY = cm.COMP_KEY
                                WHERE cm.COMP_NAME = ? AND cm.COMP_VERSION = ?";
string LM_DB_LIBRARY_PRODUCTS="SELECT DISTINCT pr.PRODUCT_ID, pr.PRODUCT_NAME, pr.PRODUCT_VERSION
                                FROM LM_PRODUCT as pr
                                INNER JOIN LM_LIBRARY_PRODUCT as lp ON lp.PRODUCT_ID = pr.PRODUCT_ID
                                INNER JOIN LM_LIBRARY as lb ON lp.LIB_ID = lb.LIB_ID
                                WHERE lb.LIB_NAME = ? AND lb.LIB_VERSION = ?";
string LM_DB_LIBRARY_COMPONENTS="SELECT DISTINCT cm.COMP_ID, cm.COMP_NAME, cm.COMP_TYPE, cm.COMP_VERSION
                                FROM LM_COMPONENT as cm
                                INNER JOIN LM_COMPONENT_LIBRARY as lp ON lp.COMP_KEY = cm.COMP_KEY
                                INNER JOIN LM_LIBRARY as lb ON lp.LIB_ID = lb.LIB_ID
                                WHERE lb.LIB_NAME = ? AND lb.LIB_VERSION = ?";

