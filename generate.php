<html>
<body>
<body style="font-family:Calibri">
<p><img src="logo.png" alt="logo"></p>


<b><FONT COLOR="#880000">Status: </FONT></b><br>
<FONT COLOR="#33CC00">
<?php

$GKEY=$_POST['fkey'];
$GMAIL=$_POST['fmail'];
$GPWD=$_POST['fpswd'];
$DIAGTYPE=$_POST['diagT'];

system("./GenPDF.sh $GKEY $GMAIL $GPWD $DIAGTYPE", $output);

?></FONT><br>

Please check file here: <a href="./pdf/<?php echo $_POST['diagT']; echo $_POST['fkey'];?>.pdf">Generated PDF Diagram</a>

</body>
</html>
