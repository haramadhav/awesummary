<?php
   include("config.php");
   session_start();
   
   if($_SERVER["REQUEST_METHOD"] == "POST")
   {
      $myusername = mysqli_real_escape_string($db,$_POST['username']);
      $mypassword = mysqli_real_escape_string($db,$_POST['password']); 
      
      $sql = "SELECT * FROM users WHERE username = '$myusername' and password = '$mypassword'";
      $result = mysqli_query($db,$sql);
      
      if(!$result)
      {
      printf("Error: %s\n", mysqli_error($db));
      exit();
      }
      
      $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
      $active = $row['active'];
      
      $count = mysqli_num_rows($result);
      
      if($count == 1)
      {
         $_SESSION['login_user'] = $myusername;   
         header("location: user_page.php");
      }
      else
      {
         $error = "Your username or password is invalid";
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
	<title>AweSummary LOGIN-PAGE</title>
    </head>
   <body>
   <center><h2>Login to AweSummary</h2>
	<br><br>
	<form action = "" method = "post">
    <td> <label>Username:</label><input type = "text" name = "username" class = "box"/><br /><br /> </td>
    <td> <label>Password:</label><input type = "password" name = "password" class = "box" /><br/><br /> </td>
    <input type = "reset" value = "Reset"/>
    <input type = "submit" value = " Submit"/><br />
    </form>
	<div style = "font-size:11px; color:#cc0000; margin-top:10px"><?php echo $error; ?></div>
	</center>
   </body>
</html>
