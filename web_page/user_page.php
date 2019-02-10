<?php
   include('session.php');
   include("config.php");
   session_start();
   
   if($_SERVER["REQUEST_METHOD"] == "POST")
   {
      $coursename = mysqli_real_escape_string($db,$_POST['coursename']); 
      $coursename = strtoupper($coursename);
      $coursename = preg_replace('/\s+/', '', $coursename);
      
      if($coursename === '')
      {
            $error = "Course name is invalid";
      }
      
      $sql = "SELECT * FROM courses WHERE course_name = '$coursename'";
      $result = mysqli_query($db,$sql);
      
      if(!$result)
      {
        printf("Error: %s\n", mysqli_error($db));
        exit();
      }
      
      $count = mysqli_num_rows($result);
      
      if($result && $coursename !== '')
      {
        if($count > 0)
        {   
                while($row = mysqli_fetch_array($result))
                {
                    $course_search_msg = "<h2><a href = \"course_page.php\">Course found: $coursename. Click to proceed.</a></h2>";
                    $_SESSION['active_course'] = $row['course_name'];   
                }
                
        }
        else
        {
                $course_search_msg = "<h2><a href = \"newcourse_page.php\">No courses found! Click here to create $coursename.</a></h2>";
                $_SESSION['active_course'] = $coursename;
        }
      }
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
	<title>AweSummary USER-PAGE</title>
    </head>
   
   <body>
    <center><h1>Welcome, <?php echo $login_session; ?>!</h1>
      <h2>Search for a course to get started:</h2><br>
      <form action = "" method = "post">
        <td> <label>Course name:</label><input type = "text" name = "coursename" class = "box" width: 80%; /><br /><br /> </td>
        <input type = "reset" value = "Reset"/>
        <input type = "submit" value = " Submit"/><br />
      </form>
      <div style = "font-size:11px; color:#cc0000; margin-top:10px"><?php echo $error; ?><?php echo $course_search_msg; ?></div>
      <h4><a href = "logout.php">Sign Out</a></h4>
   </body>
   
</html>
