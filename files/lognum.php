<!DOCTYPE html>
<html>
<head>
    <title>Page Title</title>
    <meta http-equiv="refresh" content="10">
</head>
<body>
<h1> Current log number :  </h1>
<h3> Private servers are reading the log number from the main server (public) and increase by one and write back to the server!!  </h3>

    <h1>
       <?php
        echo '<hr>';
        
        $file = fopen("log.txt","r");
        
        while(! feof($file))
        {
        echo fgets($file). "<br />";
        }

        fclose($file);
        ?> 

    </h1>



</body>
</html>