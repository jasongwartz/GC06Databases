<?php 

    $url = $_GET['url'];

    $password = $url;
    $salt = "emothershaw";
    
    $limit = 50000;
    $start = 0;
    $length = 15;
    
    $i=0;
    while ($i > -1) {
        $password = hash_url($password, $salt);
        
        if ($i>=$limit && valid_pass(substr($password, $start, $length))) {
            //echo $password;
            break;
        }
        
        $i++;
    }
    
    $pass = substr($password, $start, $length);
    
    
    echo $pass . " " ;
    
    
    if (valid_pass($pass)) {
        echo "TRUE";
    
    } else {
        echo "FALSE";
    }
    
    function hash_url($url, $salt) {
    
        $hash = md5($url . $salt);
        
        $sum = 0;
        for($i=0; $i<strlen($hash); $i++) {
            $sum += ord($hash[$i]);
        }

        //echo $sum*ord($hash) .  "<br/>";

        srand($sum*ord($hash));

//        echo chr(rand(33, 47)) . " ";
//        echo chr(rand(33, 47)) . " ";
//        echo chr(rand(33, 47)) . " ";

        for($i=0; $i<32; $i++) {
            $hash[32 + $i] = chr(rand(33, 47));
        }    

        for($i=0; $i<32; $i++) {
            $hash[64 + $i] = chr(rand(65, 90));
        }   
        
        //echo str_shuffle($hash) . " " . strlen($hash);
    
        return str_shuffle($hash);
        
    }
    
    function valid_pass($candidate) {
       $r1='/[A-Z]/';  //Uppercase
       $r2='/[a-z]/';  //lowercase
       $r3='/[!@#$%^&*()\-_=+{};:,<.>]/';  // whatever you mean by 'special char'
       $r4='/[0-9]/';  //numbers

       if(preg_match_all($r1,$candidate, $o)<2) return FALSE;

       if(preg_match_all($r2,$candidate, $o)<2) return FALSE;

       if(preg_match_all($r3,$candidate, $o)<2) return FALSE;

       if(preg_match_all($r4,$candidate, $o)<2) return FALSE;

       if(strlen($candidate)<8) return FALSE;

       return TRUE;
    }
