//
//  JGViewController.h
//  YeazyPleazy
//
//  Created by Jenna Gain on 4/3/14.
//  Copyright (c) 2014 JG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JGViewController : UIViewController <UINavigationControllerDelegate, UIGestureRecognizerDelegate> {
    IBOutlet UIImageView *kanyePhoto;
    UIImage *image;
    IBOutlet UIImageView *imageView;
    IBOutlet UIImageView *saveImage;
    
}

@property (strong, nonatomic) IBOutlet UILabel *label;
@property (retain, nonatomic) IBOutlet UIImageView *kanyePhoto;


- (IBAction)addYeezy:(id)sender;









@end
