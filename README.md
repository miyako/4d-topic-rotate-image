# 4d-topic-rotate-image
want to rotate images🌀

# OpenCV plugin

a picture taken with a smartphone could have an EXIF *orientation* tag that rotates the image by 90°.

when such photos are imported with `READ PICTURE FILE`, the orientation is ignored, which may result in an image rotated by 90° or 270°.

the status can be verified with the following code:

```4d
var $orientation : Integer
GET PICTURE METADATA($image; TIFF orientation; $orientation)
```

SVG can be used to "correct" such images, but affine transforms are computationally expensive.

since we are only interested in 90° or 270° rotations, it may be better to use pixel displacement for performace.

https://github.com/miyako/4d-plugin-rotate-image
