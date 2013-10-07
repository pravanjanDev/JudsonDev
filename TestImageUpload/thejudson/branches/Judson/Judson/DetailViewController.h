//
//  DetailViewController.h
//  Judson
//
//  Created by Suresh D on 01/07/13.
//  Copyright (c) 2013 Judson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@class JudsonAppDelegate;
@class EGOImageView;

@interface DetailViewController : UIViewController<MKMapViewDelegate>
{
    EGOImageView* imageView;
    JudsonAppDelegate *appDelegate;
    IBOutlet UIScrollView *scroll;
    IBOutlet UIImageView *img;
    IBOutlet UILabel *lbl;
    IBOutlet UITextView *txt_view;
}
@property (nonatomic, retain) JudsonAppDelegate *appDelegate;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
-(void)backPressed;
@end
