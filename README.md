# Face Detection

#### Count faces From Photo and Draw Rect over Faces

[![](https://raw.githubusercontent.com/Majharul-Huq/SM-DetectFaces/master/SM-DetectFaces/Screenshot-1.png)](Screenshot-1.png)

## Simply use
    NSDictionary  *opts = [NSDictionary dictionaryWithObject:CIDetectorAccuracyHigh forKey:CIDetectorAccuracy];
    faceDetector = [CIDetector detectorOfType:CIDetectorTypeFace context:context options:opts];
    CIImage *image = [CIImage imageWithCGImage:[self resizeImage:imageViewPhoto.image].CGImage];
    NSArray *faces = [faceDetector featuresInImage:image];
    labelFaceCount.text = [NSString stringWithFormat:@"%d Faces Detected",faces.count];
    CGAffineTransform transform = CGAffineTransformMakeScale(1, -1);
    transform = CGAffineTransformTranslate(transform,0, -imageViewPhoto.bounds.size.height);
    for(CIFaceFeature *f in faces)
    {
        CGRect  faceRect    = CGRectApplyAffineTransform(f.bounds, transform);
        UIView  *faceView   = [[UIView alloc] initWithFrame:faceRect];
        faceView.backgroundColor  = [UIColor colorWithWhite:0.0 alpha:0.5];
        [faceView.layer setBorderColor:[UIColor colorWithWhite:1.0 alpha:0.8].CGColor];
        [faceView.layer setBorderWidth:1.0f];
        [self.view addSubview:faceView];
    }

    
## Author

Majharul Huq, sumancsc@gmail.com


## License

Face Detection is available under the MIT license. See the LICENSE file for more info.
