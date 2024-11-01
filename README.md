# 4d-topic-rotate-image
want to rotate images🌀

a picture taken with a smartphone could have an EXIF *orientation* tag that rotates the image by 90°.

when such photos are imported with `READ PICTURE FILE`, the orientation is ignored, which may result in an image rotated by 90° or 270°.

the status can be verified with the following code:

```4d
var $orientation : Integer
GET PICTURE METADATA($image; TIFF orientation; $orientation)
```

### SVG

the SVG component can rotate any image by any angle.

shift the rotated image to crop the margins created as result of changing dimension.

see [code](https://github.com/miyako/4d-topic-rotate-image/blob/main/rotate/Project/Sources/Methods/rotate.4dm).

<img src="https://github.com/user-attachments/assets/af342d2e-6bb5-40b0-bfb7-6e05929e9fab" height=277 width=auto />
<img src="https://github.com/user-attachments/assets/46a56b6c-208f-47f6-b3ad-5473c4ac5630" width=277 height=auto />
<img src="https://github.com/user-attachments/assets/28271c94-03c8-469f-ba44-cd9fb859e0de" height=277 width=auto />
<img src="https://github.com/user-attachments/assets/1042b415-3e50-4b3d-9c3f-4054194ce08e" width=277 height=auto />

### OpenCV plugin

SVG can be used to "correct" such images, but affine transforms are computationally expensive.

since we are only interested in 90° or 270° rotations, it may be better to use pixel displacement for performace.

https://github.com/miyako/4d-plugin-rotate-image

### Other plugins

the GD library supports rotation

https://github.com/miyako/4d-plugin-gd-v3?tab=readme-ov-file

ImageMagick supports rotation

https://github.com/miyako/4d-plugin-imagemagick-v2
