<?php 

// Dependency: https://github.com/Synchro/PHPMailer

include '../../sql_statements.php';
include '../../helper.php';
include '../PHPMailer/PHPMailerAutoload.php';
include '../emailconfig.php';

$result = db_r_function(event_retrieve_watches());


$data = json_decode($result, true);

foreach($data as $watch) {

    if (!is_null($watch['email'])) { // if an email address was returned

        $watcher_text = "Hey, @".$watch['username']."!\n\nWatch out, someone has bid GBP ".$watch['bid_price']." on '".$watch['title']."' Better go outbid them quickly! \n\nGood luck!\nHashtagories";
        
        $seller_text = "Hey, @".$watch['username']."!\n\nJust to let you know, someone has bid GBP ".$watch['bid_price']." on '".$watch['title']."' \n\nHappy selling!\nHashtagories";

        if ($watch['watch_user_id'] != $watch['owner_user_id']) { // if the watcher is not the owner

            

            $buyer_mail = new PHPMailer;

            $buyer_mail->isSMTP(); // Set mailer to use SMTP
            $buyer_mail->Host = SMTP_HOSTNAME; // Specify main and backup SMTP servers
            $buyer_mail->SMTPAuth = true; // Enable SMTP authentication
            $buyer_mail->Username = SENDER; // SMTP username
            $buyer_mail->Password = PASSWORD; // SMTP password
            $buyer_mail->SMTPSecure = 'tls'; // Enable TLS encryption, `ssl` also accepted
            $buyer_mail->Port = 587; // TCP port to connect to

            $buyer_mail->SetFrom(SENDER, 'Hashtagories');
            $buyer_mail->addAddress($watch['email']); // VARIABLE

            $buyer_mail->Subject = "Someone's bidding on '" . $watch['title'] . "'!";
            $buyer_mail->Body = $watcher_text;

            if (!$buyer_mail->send()) {
                echo 'Message could not be sent.';
                echo 'Mailer Error: '.$buyer_mail->ErrorInfo;
            } else {
                echo 'Message has been sent to ' . $watch['email'];
            }

        } else { // if the watcher is the owner


            $seller_mail = new PHPMailer;

            //$mail->SMTPDebug = 3;                               // Enable verbose debug output

            $seller_mail->isSMTP(); // Set mailer to use SMTP
            $seller_mail->Host = SMTP_HOSTNAME; // Specify main and backup SMTP servers
            $seller_mail->SMTPAuth = true; // Enable SMTP authentication
            $seller_mail->Username = SENDER; // SMTP username
            $seller_mail->Password = EMAIL_PASSWORD; // SMTP password
            $seller_mail->SMTPSecure = 'tls'; // Enable TLS encryption, `ssl` also accepted
            $seller_mail->Port = 587; // TCP port to connect to

            $seller_mail->SetFrom(SENDER, 'Hashtagories');
            $seller_mail->addAddress($watch['email']); // VARIABLE

            $seller_mail->Subject = "Someone's bidding on '" . $watch['title'] . "'!";
            $seller_mail->Body = $seller_text;

            if (!$seller_mail->send()) {
                echo 'Message could not be sent.';
                echo 'Mailer Error: '.$seller_mail->ErrorInfo;
            } else {
                echo 'Message has been sent to ' . $watch['email'];
            }

        }
    } else {}


} // ends foreach