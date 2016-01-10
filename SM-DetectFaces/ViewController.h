//
//  ViewController.h
//  SM-DetectFaces
//
//  Created by Huq Majharul on 1/11/16.
//  Copyright © 2016 Huq Majharul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet    UIImageView     *imageViewPhoto;
    IBOutlet    UILabel         *labelFaceCount;
    
    CIDetector                  *faceDetector;
    CIContext                   *context;
}

@end

