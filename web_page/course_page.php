<?php

include("session.php");
include("config.php");

$course_name = $_SESSION['active_course'];
$target_dir = "Uploads/$course_name/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = true;
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
$error = "";

if($_SERVER["REQUEST_METHOD"] == "POST")
{
    // Check if image file is a actual image or fake image
    if(isset($_POST["submit"])) 
    {
        $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
        if($check !== false) 
        {
            $uploadOk = true;
        } 
        else 
        {
            $error .= "File is not an image. ";
            $uploadOk = false;
        }
    }
    // Check if file already exists
    if (file_exists($target_file)) 
    {
        $error .= "Sorry, file already exists. ";
        $uploadOk = false;
    }
    // Check file size
    if ($_FILES["fileToUpload"]["size"] > 500000) 
    {
        $error .= "Sorry, your file is too large. ";
        $uploadOk = false;
    }
    // Allow certain file formats
    if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg") 
    {
        $error .= "Sorry, we can only support the JPG, JPEG and PNG formats. ";
        $uploadOk = false;
    }
    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk === false) 
    {
        $error .= "Sorry, your file was not uploaded. ";
    // if everything is ok, try to upload file
    } 
    else 
    {
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) 
        {
            //Insert image file 
            $insert = $db->query("UPDATE courses SET courses.file_name2='".$target_file."' WHERE course_name=$course_name LIMIT 1");
        } 
        else 
        {
            $error = "Sorry, there was an error uploading your file. ";
        }
    }
    
    if($uploadOk === true)
    {
        $msg = "Succesfully uploaded file ". basename( $_FILES["fileToUpload"]["name"]). ".";
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
	<title>AweSummary</title>
</head>

<body>
	<center><h1>Welcome, <?php echo $login_session; ?>! You are currently editing course <?php echo $_SESSION['active_course']?>.</h1>
	<?php $course_name = $_SESSION['active_course']; $target_dir = "Uploads/$course_name/"; $files = scandir($target_dir); $num_files = count($files)-2; echo "<h2>This course currently has $num_files files in our database. Help us by adding more!</h2>"; ?>
	<table>
	<center><h3>Select files to upload to your course summary.</h3>
	</center>
	<form action="" method="post" enctype="multipart/form-data">
    <tr>
		<td> Select image to upload </td>
		<td> <input type="file" name="fileToUpload" id="fileToUpload"> </td>
		<td> <input type="submit" value="Upload Image" name="submit"> </td>
	</tr>
	</form>
	<br><br>
	</table><br>
	<div style = "font-size:11px; color:#0eb714; margin-top:10px"><?php echo $error; ?><?php echo $msg; ?></div>
    <button class="button bigbutton" onclick="summary_gen()">GENERATE AWESOME SUMMARY</button>
    <p id="filefound"></p>
   
    <script type = "text/javascript">
        function summary_gen()
        {
            <?php $usr = $_SESSION['login_user']; $course = $_SESSION['active_course']; $string = "-"; $string .= $usr; $string .= " -"; $string .= $course; $string .= " -"; $t = time(); $string .= $t; $string .= "\n";  file_put_contents("master_request_log.txt",htmlspecialchars($string),FILE_APPEND); $string = $usr; $string .= "_";  $string .= $course; $string .= "_"; $string .= $t; $string .= ".png";  $_SESSION['file_id'] = $string; ?>
        }
    </script>
    <a href = 'download_page.php'>Click here to download!</a>
    
</body>
</html>
