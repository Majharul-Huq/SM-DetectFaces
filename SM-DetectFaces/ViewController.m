//
//  ViewController.m
//  SM-DetectFaces
//
//  Created by Huq Majharul on 1/11/16.
//  Copyright © 2016 Huq Majharul. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
        
        faceView.backgroundColor    = [UIColor colorWithWhite:0.0 alpha:0.5];
        [faceView.layer setBorderColor:[UIColor colorWithWhite:1.0 alpha:0.8].CGColor];
        [faceView.layer setBorderWidth:1.0f];
        [self.view addSubview:faceView];
    }
}

- (UIImage*)resizeImage:(UIImage*)img
{
    CGSize size     = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    size.height     = (img.size.height / img.size.width) * self.view.frame.size.width;
    CGRect rect     = imageViewPhoto.frame;
    rect.size       = size;
    rect.origin.y   = 0;
    imageViewPhoto.frame = rect;
    
    UIGraphicsBeginImageContext(size);
    [img drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
