<?php

// Dependency: https://github.com/Synchro/PHPMailer

// Triggered by cURL command, runs event_end_expired_auctions() sproc
    // and sends all auction completion/feedback invite emails
        
    include '../../sql_statements.php';
    include '../../helper.php';
    include 'PHPMailer/PHPMailerAutoload.php';
    include 'emailconfig.php';

    $result = db_r_function(event_end_expired_auctions());
    $data = json_decode($result, true);
    
    foreach ($data as $auction) {
        print_r($auction);
        if($auction['successful']) {
            
            $seller_text = "Congratulations, your item has sold to " . $auction['buyer_username'] . " for " . $auction['final_bid_price'] . "!\n\nAfter you have sent the item, please fill out some feedback here: " . $auction['seller_feedback_url'] . "\n\nThanks!\nHashtagories";

            $buyer_text = "Congratulations, you've purchased an item from " . $auction['seller_username'] . " for " . $auction['final_bid_price'] . "!\n\nAfter you have received the item, please fill out some feedback here: " . $auction['buyer_feedback_url'] . "\n\nThanks!\nHashtagories";
            
            $buyer_mail = new PHPMailer;

            //$mail->SMTPDebug = 3;                               // Enable verbose debug output

            $buyer_mail->isSMTP();                                      // Set mailer to use SMTP
            $buyer_mail->Host = SMTP_HOSTNAME;  // Specify main and backup SMTP servers
            $buyer_mail->SMTPAuth = true;                               // Enable SMTP authentication
            $buyer_mail->Username = SENDER;                 // SMTP username
            $buyer_mail->Password = PASSWORD;                           // SMTP password
            $buyer_mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
            $buyer_mail->Port = 587;                                    // TCP port to connect to

            $buyer_mail->SetFrom(SENDER, 'Hashtagories');
            $buyer_mail->addAddress($auction['buyer_email']);  // VARIABLE

            $buyer_mail->Subject = 'You won the auction!';
            $buyer_mail->Body    = $buyer_text;

            if(!$buyer_mail->send()) {
                echo 'Message could not be sent.';
                echo 'Mailer Error: ' . $buyer_mail->ErrorInfo;
            } else {
                echo 'Message has been sent';
            }
            
            $seller_mail = new PHPMailer;

            //$mail->SMTPDebug = 3;                               // Enable verbose debug output

            $seller_mail->isSMTP();                                      // Set mailer to use SMTP
            $seller_mail->Host = SMTP_HOSTNAME;  // Specify main and backup SMTP servers
            $seller_mail->SMTPAuth = true;                               // Enable SMTP authentication
            $seller_mail->Username = SENDER;                 // SMTP username
            $seller_mail->Password = EMAIL_PASSWORD;                           // SMTP password
            $seller_mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
            $seller_mail->Port = 587;                                    // TCP port to connect to

            $seller_mail->SetFrom(SENDER, 'Hashtagories');
            $seller_mail->addAddress($auction['seller_email']);  // VARIABLE

            $seller_mail->Subject = 'Your auction has closed!';
            $seller_mail->Body    = $seller_text;

            if(!$seller_mail->send()) {
                echo 'Message could not be sent.';
                echo 'Mailer Error: ' . $seller_mail->ErrorInfo;
            } else {
                echo 'Message has been sent';
            }
        } else {
            
            $seller_text = "Thank you for listing your item on Hashtagories!\n\nUnfortunately, you did not receive any bids above the reserve price. You can try re-listing the item, or re-listing and changing the reserve price.\n\nThanks!\nHashtagories";
    
            $seller_mail = new PHPMailer;

            //$mail->SMTPDebug = 3;                               // Enable verbose debug output

            $seller_mail->isSMTP();                                      // Set mailer to use SMTP
            $seller_mail->Host = SMTP_HOSTNAME;  // Specify main and backup SMTP servers
            $seller_mail->SMTPAuth = true;                               // Enable SMTP authentication
            $seller_mail->Username = SENDER;                 // SMTP username
            $seller_mail->Password = EMAIL_PASSWORD;                           // SMTP password
            $seller_mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
            $seller_mail->Port = 587;                                    // TCP port to connect to

            $seller_mail->SetFrom(SENDER, 'Hashtagories');
            $seller_mail->addAddress($auction['seller_email']);  // VARIABLE

            $seller_mail->Subject = 'Your auction has closed!';
            $seller_mail->Body    = $seller_text;

            if(!$seller_mail->send()) {
                echo 'Message could not be sent.';
                echo 'Mailer Error: ' . $seller_mail->ErrorInfo;
            } else {
                echo 'Message has been sent';
            }
        }

        
    } // ends foreach
