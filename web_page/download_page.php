<?php

include("session.php");
include("config.php");

$download_file= "Downloads/" . $_SESSION['file_id'];

$mycount = 0;
$success = true;
do 
{
    $mycount = $mycount +1;
    if (file_exists("Downloads/" .$string )) 
	{
        break;
    }
	elseif($mycount > 5)
	{ 
        $success = false;
		echo " Download timed out: Please try again!";
		break;
	}
	else 
	{
        sleep(3);
	}
} 
while(true);
			
if($success === true)
{
    header('Content-Description: File Transfer');
    header('Content-Type: application/octet-stream');//change your extension of your files
    header('Content-Disposition: attachment; filename="'.basename($download_file).'"');
    header('Expires: 0');
    header('Cache-Control: must-revalidate');
    header('Pragma: public');
    header('Content-Length: ' . filesize($download_file));
    readfile($download_file);
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
</body>
</html>
