//
//  JGViewController.m
//  YeazyPleazy
//
//  Created by Jenna Gain on 4/3/14.
//  Copyright (c) 2014 JG. All rights reserved.
//

#import "JGViewController.h"

@interface JGViewController ()
@property (nonatomic, assign) id<UINavigationControllerDelegate, UIImagePickerControllerDelegate> delegate;

@end

@implementation JGViewController
@synthesize kanyePhoto;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
	UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panDetected:)];
    [self.view addGestureRecognizer:panRecognizer];
    
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchDetected:)];
    [self.view addGestureRecognizer:pinchRecognizer];
    
    UIRotationGestureRecognizer *rotationRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationDetected:)];
    [self.view addGestureRecognizer:rotationRecognizer];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
    tapRecognizer.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:tapRecognizer];
    
    panRecognizer.delegate = self;
    pinchRecognizer.delegate = self;
    rotationRecognizer.delegate = self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addYeezy:(id)sender {
    NSLog(@"Yeezy added");

    int kanyePhotos = rand() % 4;
    switch (kanyePhotos) {
        case 0:
            kanyePhoto.image = [UIImage imageNamed:@"kanye1.png"];
            break;
        case 1:
            kanyePhoto.image = [UIImage imageNamed:@"kanye2.png"];
            break;
        case 2:
            kanyePhoto.image = [UIImage imageNamed:@"kanye3.png"];
            break;
        case 3:
            kanyePhoto.image = [UIImage imageNamed:@"kanye4.png"];
            break;
      
        default:
            break;
    }
    
}


-(IBAction)saveImage { UIImageWriteToSavedPhotosAlbum(saveImage.image, nil, nil, nil); UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Image Saved" message:@"The Image Was Saved." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil]; [alert show];
}

- (void)viewDidUnload
{
    [self setKanyePhoto:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark - Gesture Recognizers

- (void)panDetected:(UIPanGestureRecognizer *)panRecognizer
{
    CGPoint translation = [panRecognizer translationInView:self.view];
    CGPoint kanyePhotoPosition = self.kanyePhoto.center;
    kanyePhotoPosition.x += translation.x;
    kanyePhotoPosition.y += translation.y;
    
    self.kanyePhoto.center = kanyePhotoPosition;
    [panRecognizer setTranslation:CGPointZero inView:self.view];
}

- (void)pinchDetected:(UIPinchGestureRecognizer *)pinchRecognizer
{
    CGFloat scale = pinchRecognizer.scale;
    self.kanyePhoto.transform = CGAffineTransformScale(self.kanyePhoto.transform, scale, scale);
    pinchRecognizer.scale = 1.0;
}

- (void)rotationDetected:(UIRotationGestureRecognizer *)rotationRecognizer
{
    CGFloat angle = rotationRecognizer.rotation;
    self.kanyePhoto.transform = CGAffineTransformRotate(self.kanyePhoto.transform, angle);
    rotationRecognizer.rotation = 0.0;
}

- (void)tapDetected:(UITapGestureRecognizer *)tapRecognizer
{
    [UIView animateWithDuration:0.25 animations:^{
        self.kanyePhoto.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
        self.kanyePhoto.transform = CGAffineTransformIdentity;
    }];
}


#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

@end

