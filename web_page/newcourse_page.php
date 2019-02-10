<?php
include 'config.php';
include('session.php');


    {
      // creates new course  
      
      //$mynewcourse = mysqli_real_escape_string($db,$_POST['newcourse']);
      
      
      if($coursename === '' )
      {
        $error = "Invalid Course Name";
      }
      
      $existence_check = "SELECT * FROM courses WHERE course_name = '$coursename'";
      $existence_result = mysqli_query($db,$existence_check);
      
      if(!$existence_result)
      {
      printf("Error: %s\n", mysqli_error($db));
      exit();
      }
      
      $count = mysqli_num_rows($existence_result);      
    

     
   }
   
 $coursename = $_SESSION['active_course'];
 $target_dir = "Uploads/". $coursename . "/";
 //echo($target_dir);
 if (file_exists($target_dir)) {
    echo "Sorry, course already exists.";
 }
	else{
		 mkdir($target_dir);
		//$insert2 = $db->query("INSERT into courses (course_name) VALUES ('".$target_file."')");	
		 $sql = "INSERT INTO courses VALUES ('$coursename')";
		 $result = mysqli_query($db,$sql);
		 
		//echo "The Course ".  $_SESSION['active_course']. " has been created.";
		
	}
    
    
 
?>
<html>
   <head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<link href="style.css"
		rel = "stylesheet"
		type = "text/css"/>
	<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
	<title>AweSummary REGISTRATION-PAGE</title>
    </head>
   <body> 
   <center><h2>The Course <?= $_SESSION['active_course'] ?> has been created </h2>
	<br><br>
	
	<a href="course_page.php">Click to go to <?= $_SESSION['active_course'] ?> Course Page</a>
	<div style = "font-size:11px; color:#cc0000; margin-top:10px"><?php echo $error; ?></div>
	</center>
   </body>
</html>
   

