<?php
// Triggered by cURL command, runs event_end_expired_auctions() sproc
    // and sends all auction completion/feedback invite emails
    
    include '../../sql_statements.php';
    include '../../helper.php';
    include 'PHPMailer/PHPMailerAutoload.php';
    include 'emailconfig.php';

    $result = db_r_function(event_end_expired_auctions());
    $data = json_decode($result, true);

    foreach ($data as $auction) {

        $seller_text = "Congratulations, your item has sold to " . $data['buyer_name'] . " for " . $data['sale_price'] . "!\n\nAfter you have sent the item, please fill out some feedback here: " . $data['feedback_url'] . "\n\nThanks!\nHashtagories";

        $buyer_text = "Congratulations, you've purchased an item from " . $data['seller_name'] . " for " . $data['sale_price'] . "!\n\nAfter you have received the item, please fill out some feedback here: " . $data['feedback_url'] . "\n\nThanks!\nHashtagories";
        
        $buyer_mail = new PHPMailer;

        //$mail->SMTPDebug = 3;                               // Enable verbose debug output

        $buyer_mail->isSMTP();                                      // Set mailer to use SMTP
        $buyer_mail->Host = SMTP_HOSTNAME;  // Specify main and backup SMTP servers
        $buyer_mail->SMTPAuth = true;                               // Enable SMTP authentication
        $buyer_mail->Username = SENDER;                 // SMTP username
        $buyer_mail->Password = PASSWORD;                           // SMTP password
        $buyer_mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
        $buyer_mail->Port = 587;                                    // TCP port to connect to

        $buyer_mail->From = SENDER;
        $buyer_mail->addAddress($data['buyer_email']);  // VARIABLE

        $buyer_mail->Subject = 'You won the auction!';
        $buyer_mail->Body    = $buyer_text;

        if(!$buyer_mail->send()) {
            echo 'Message could not be sent.';
            echo 'Mailer Error: ' . $mail->ErrorInfo;
        } else {
            echo 'Message has been sent';
        }
        
        $seller_mail = new PHPMailer;

        //$mail->SMTPDebug = 3;                               // Enable verbose debug output

        $seller_mail->isSMTP();                                      // Set mailer to use SMTP
        $seller_mail->Host = SMTP_HOSTNAME;  // Specify main and backup SMTP servers
        $seller_mail->SMTPAuth = true;                               // Enable SMTP authentication
        $seller_mail->Username = SENDER;                 // SMTP username
        $seller_mail->Password = PASSWORD;                           // SMTP password
        $seller_mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
        $seller_mail->Port = 587;                                    // TCP port to connect to

        $seller_mail->From = SENDER;
        $seller_mail->addAddress($data['seller_email']);  // VARIABLE

        $seller_mail->Subject = 'Your auction has closed!';
        $seller_mail->Body    = $seller_text;

        if(!$seller_mail->send()) {
            echo 'Message could not be sent.';
            echo 'Mailer Error: ' . $mail->ErrorInfo;
        } else {
            echo 'Message has been sent';
        }
    } // ends foreach
