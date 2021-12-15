<!DOCTYPE html>
<html>
<head>
    <title>Page Title</title>
    <meta http-equiv="refresh" content="10">
</head>
<body>
<h1> Masterlog entries : Each private server write on to a master log file </h1>
   


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