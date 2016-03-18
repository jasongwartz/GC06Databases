<?php 

    function validate_data($method, $names) {

        $error = FALSE;
        $returnData = array();

        for ($i=0; $i<count($names); $i++) {

            $returnData[$names[$i]] = array();

            $returnData[$names[$i]]["error"] = FALSE;

            $postValue = "";

            if ($method($names[$i]) != NULL) {  

                // Strips tags and mysql escapes the string.
                $postValue = mysql_escape_string( htmlspecialchars(strip_tags($method($names[$i]))) );

            } else {
                $returnData[$names[$i]]["error"] = $method . " variable '" . $names[$i] . "' is not set.";
                $error = TRUE;
                continue;
            }

            if ( preg_match('@_id@', $names[$i]) ) {

                if ( !is_numeric($method($names[$i])) ) {
                    $returnData[$names[$i]]["error"] = "'" . $names[$i] . "' value is not an integer.";
                    $error = TRUE;
                    continue;                    
                }

            }

    //                    $returnData[$names[$i]]["error"] = $method . " variable '" . $names[$i] . "' is not set.";
    //            $error = TRUE;
    //            continue;

            switch($names[$i]) {

                //Email case
                case "email":
                    $email = $postValue;

                    if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
                        $returnData[$names[$i]]["value"] = $email;
                    } else {
                        $returnData[$names[$i]]["error"] = "Invalid email address.";
                        $error = TRUE;
                    }

                    break;

                //Password case
                case "password":

                    $returnData["password"] = validate_password($postValue);
                    
                    if ($returnData["password"]["error"]) {
                        
                        $error = TRUE;
                    }
                    //echo POST("password_confirmation");
                    break;

                case "new_password":

                    $returnData["new_password"] = validate_password($postValue);
                    //echo POST("password_confirmation");
                    if ($returnData["password"]["error"]) {
                        $error = TRUE;
                    }
                    
                    break;                
    //            case "username":
    //            case "first_name":
    //            case "last_name":
    //                
    //                            
    //                break;


                default:

                    $returnData[$names[$i]]["value"] = $postValue;

                    break;

            }

        }

        if ($error) {

            $errorStr = "{\"error\":[";
            for ($i=0; $i<count($names); $i++) {

                if ($returnData[$names[$i]]["error"]) {
                    $errorStr .= "\"" . $returnData[$names[$i]]["error"] . "\",";
                }

            }

            $errorStr[strlen($errorStr)-1] = "]";
            $errorStr .= "}";

            die($errorStr);
        } 

        return $returnData;


    }

    function validate_var($method, $var) {

        $returnData = array();
        echo $method; 
        if ($method($var) != NULL) {

            $returnData = mysql_escape_string($method($var));           
            $returnData["error"] = FALSE;
        } else {
            $returnData["error"] = $method . " variable '" . $var . "' is not set.";


        }

        return $returnData;

    }

    function validate_id($id) {

        $returnData = array();

        if (preg_match('@user_id@', $id) || preg_match('@auction_id@', $id)) {

            if (!preg_match('@[0-9]+@', $method($id))) {
                $returnData["error"] = "'" . $id . "' value is not an integer.";

                return $returnData;
            } 

        }

        return mysql_escape_string($method($var));

    }

    function validate_password($password) {

        $returnData = array();

        $uppercase = preg_match('@[A-Z]@', $password);
        $lowercase = preg_match('@[a-z]@', $password);
        $number    = preg_match('@[0-9]@', $password);

        if(!$uppercase || !$lowercase || !$number || strlen($password) < 8) {
            $returnData["error"] = ""; 
        } else {
            $returnData["value"] = mysql_escape_string($password);
        }

        if(!$uppercase ) {
            $returnData["error"] .= "Password must contain uppercase letter. ";
        }

        if (!$lowercase) {
            $returnData["error"] .= "Password must contain lowercase letter. ";
        }

        if (!$number ) {
            $returnData["error"] .= "Password must contain a number. ";
        }

        if (strlen($password) < 8) {
            $returnData["error"] .= "Password must have at least 8 characters. ";
        }        

        return $returnData;
    }

    function POST($var) {
        return $_POST[$var];
    }

    function GET($var) {
        return $_GET[$var];
    }