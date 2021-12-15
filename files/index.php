<!DOCTYPE html>
<html>
<head>
    <title>Page Title</title>
    <meta http-equiv="refresh" content="10">
</head>
<body>
<h1> Talanet Academy - Ring-Challenge logfile </h1>
   


       <?php
        echo '<hr>';
        $file = fopen("masterlog.txt","r");

        while(! feof($file))
        {
        echo fgets($file). "<br />";
        }

        fclose($file);
        ?> 





</body>
</html>