<?php
    // if(isset($_POST['add']))
    // {
       	$data = json_decode(file_get_contents("php://input"));
       	print_r($data);
		$text_post = mysql_real_escape_string($data->post);
		mysql_connect("localhost", "root", "root") or die(mysql_error()); 
		mysql_select_db("test") or die(mysql_error()); 
		mysql_query("INSERT INTO post (post) VALUES ('$text_post')"); 
		Print "Your information has been successfully added to the database."; 
    // }
?> 