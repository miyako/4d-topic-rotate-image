//%attributes = {}
$sourceImage:=File:C1566("/RESOURCES/sample.jpg")

$f:={}
$f.toDesktop:=(Formula:C1597(WRITE PICTURE FILE:C680(System folder:C487(Desktop:K41:16)+String:C10($2)+".png"; $1)))

$f.toDesktop(rotate($sourceImage; 90); 90)
$f.toDesktop(rotate($sourceImage; 180); 180)
$f.toDesktop(rotate($sourceImage; 270); 270)
$f.toDesktop(rotate($sourceImage; 360); 360)