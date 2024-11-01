//%attributes = {}
#DECLARE($sourceImage : Variant; $degrees : Real) : Picture

If (($degrees%90)#0)
	return 
End if 

var $image : Picture

Case of 
	: (Value type:C1509($sourceImage)=Is picture:K8:10)
		$image:=$sourceImage
	: (Value type:C1509($sourceImage)=Is object:K8:27)\
		 && (OB Instance of:C1731($sourceImage; 4D:C1709.File))\
		 && ($sourceImage.exists)
		READ PICTURE FILE:C678($sourceImage.platformPath; $image)
	: (Value type:C1509($sourceImage)=Is text:K8:3)\
		 && (Test path name:C476($sourceImage)=Is a document:K24:1)
		READ PICTURE FILE:C678($sourceImage; $image)
End case 

If (Picture size:C356($image)=0)
	return 
End if 

If (($degrees%360)=0)
	return $image
End if 

var $width; $height : Integer
PICTURE PROPERTIES:C457($image; $width; $height)

$svg:=SVG_New

Case of 
	: (($degrees%180)=0)
		$img:=SVG_New_embedded_image($svg; $image)
		SVG_ROTATION_CENTERED($img; $degrees)
		SVG_SET_DIMENSIONS($svg; $width; $height)
	: (($degrees%270)=0)
		SVG_SET_DIMENSIONS($svg; $height; $width)
		$cx:=$width/2
		$cy:=$height/2
		$tx:=-($cx-$cy)
		$ty:=-($cx-$cy)
		$img:=SVG_New_embedded_image($svg; $image)
		SVG_ROTATION_CENTERED($img; $degrees)
		SVG_SET_TRANSFORM_TRANSLATE($img; $tx; $ty)
	: (($degrees%90)=0)
		SVG_SET_DIMENSIONS($svg; $height; $width)
		$cx:=$width/2
		$cy:=$height/2
		$tx:=($cx-$cy)
		$ty:=($cx-$cy)
		$img:=SVG_New_embedded_image($svg; $image)
		SVG_ROTATION_CENTERED($img; $degrees)
		SVG_SET_TRANSFORM_TRANSLATE($img; $tx; $ty)
End case 

return SVG_Export_to_picture($svg; Own XML data source:K45:18)
//SVG_CLEAR($svg)