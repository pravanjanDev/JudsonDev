//
//  AddGalleryViewController.h
//  Judson
//
//  Created by Suresh D on 01/07/13.
//  Copyright (c) 2013 Judson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@class JudsonAppDelegate;
@interface AddGalleryViewController : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,MKMapViewDelegate,UITextViewDelegate>
{
    JudsonAppDelegate *appDelegate;
    UIActionSheet *actionSheetPickPicture;
    UIImagePickerController *imgPickerController;
    UIImage *addimage;
    UIBarButtonItem *btnUpload;
    NSData *imageData;
    NSString *strCoordinates;
    NSURLConnection *urlConnection;
    NSMutableData *responseData;
    NSString *responseString;
    NSDictionary *dictValues;
    NSTimer *timerRefresh;
    CGPoint svos;
}
@property (nonatomic,retain) IBOutlet UIButton *btnAddPhoto;
@property (nonatomic,retain) IBOutlet UIButton *btnLocations;
@property (nonatomic,retain) IBOutlet UIScrollView *scroll;
@property (nonatomic,retain) IBOutlet UITextField *txtTitle;
@property (nonatomic,retain) IBOutlet UITextView *txtDescription;
@property (nonatomic,retain) IBOutlet MKMapView *mapView;
@property (nonatomic,retain) IBOutlet UILabel *lblText,*lblUpdatedby;
@property (nonatomic, retain) NSTimer *timerRefresh;
@property (nonatomic,retain) NSString *strCoordinates;

-(void)refreshData;
-(IBAction)btnImgSelect:(id)sender;
-(IBAction)btnLocateMe:(id)sender;
-(void)drawOnMap:(float)lat Lng:(float)lng;
@end
