//
//  AddGalleryViewController.m
//  Judson
//
//  Created by Suresh D on 01/07/13.
//  Copyright (c) 2013 Judson. All rights reserved.
//

#import "AddGalleryViewController.h"
#import "JSON.h"
#import "LoadingView.h"
#import "MapAnotation.h"
#import "JudsonAppDelegate.h"
#import <QuartzCore/QuartzCore.h>


#define kTimerRefreshInterval 2

@interface AddGalleryViewController ()

@end

@implementation AddGalleryViewController
@synthesize scroll;
@synthesize btnAddPhoto;
@synthesize btnLocations;
@synthesize txtDescription;
@synthesize txtTitle;
@synthesize mapView,strCoordinates;
@synthesize lblText,lblUpdatedby;
@synthesize timerRefresh;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    strCoordinates=[[NSString alloc] init];
    appDelegate= (JudsonAppDelegate *)[[UIApplication sharedApplication] delegate];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    view.backgroundColor = [UIColor clearColor];
    
    UIButton *settingsButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    [settingsButton setImage:[UIImage imageNamed:@"Upload-button.png"] forState:UIControlStateNormal];
    [settingsButton addTarget:self action:@selector(Upload:) forControlEvents:UIControlEventTouchUpInside];
    [settingsButton setFrame:CGRectMake(282,8,35,35)];
    
    
    UIButton *backButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"back-button.png"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backPressed:) forControlEvents:UIControlEventTouchUpInside];
    [backButton setFrame:CGRectMake(5,9,45,38)];
    
    
    UILabel *lbl_title=[[UILabel alloc] initWithFrame:CGRectMake(110, 0, 200, 50)];
    [lbl_title setBackgroundColor:[UIColor clearColor]];
    [lbl_title setTextColor:[UIColor blackColor]];
    [lbl_title setFont:[UIFont boldSystemFontOfSize:20]];
    [lbl_title setText:@"Add Gallery"];
    [view addSubview:lbl_title];
    
    
    [view addSubview:settingsButton];
    [view addSubview:backButton];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    [self.navigationItem setRightBarButtonItem:barButtonItem];
    [self.navigationItem setLeftBarButtonItem:barButtonItem];
    txtTitle.clearButtonMode = UITextFieldViewModeWhileEditing;
    @synchronized(self)
    {
        if(timerRefresh == nil)
        {
            self.timerRefresh = [NSTimer scheduledTimerWithTimeInterval:kTimerRefreshInterval target:self
                                                               selector:@selector(refreshData) userInfo:nil repeats:YES];
        }
    }
    [[mapView layer] setCornerRadius:10.0];
    [[mapView layer] setMasksToBounds:YES];
}

- (void)dealloc
{
    [timerRefresh release];
    [super dealloc];
}

- (void)viewDidUnload
{
    @synchronized(self)
    {
        [timerRefresh invalidate];
        [timerRefresh release];
        timerRefresh = nil;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [lblUpdatedby setText:[appDelegate.userDefaults objectForKey:@"userFirstName"]];
    [scroll setContentOffset:CGPointMake(0, 0) animated:YES];
    
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    @synchronized(self)
    {
        [timerRefresh invalidate];
        [timerRefresh release];
        timerRefresh = nil;
    }
}

-(void)refreshData
{
    [mapView setDelegate:self];
    [mapView setShowsUserLocation:YES];
    CLLocationCoordinate2D userCoord;
    userCoord.latitude = mapView.userLocation.coordinate.latitude;
    userCoord.longitude = mapView.userLocation.coordinate.longitude;
    [self drawOnMap:userCoord.latitude Lng:userCoord.longitude];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)textViewShouldReturn:(UITextView *)textView
{
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([[textView text]isEqualToString:@"Description"] || [[textView text]isEqualToString:@"\n"]) {
        [textView setText:@""];
        [textView setTextColor:[UIColor blackColor]];
    }
    svos = scroll.contentOffset;
    CGPoint pt;
    CGRect rc = [textView bounds];
    rc = [textView convertRect:rc toView:scroll];
    pt = rc.origin;
    pt.x = 0;
    pt.y -=20;
    [scroll setContentOffset:pt animated:YES];
    [scroll setContentSize:CGSizeMake(320,625)];
}

- (BOOL)textFieldDidBeginEditing:(UITextField *)textField
{
    [[self.view viewWithTag:textField.tag+1] becomeFirstResponder];
    svos = scroll.contentOffset;
    CGPoint pt;
    CGRect rc = [textField bounds];
    rc = [textField convertRect:rc toView:scroll];
    pt = rc.origin;
    pt.x = 0;
    pt.y -=50;
    [scroll setContentOffset:pt animated:YES];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
	return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [txtDescription becomeFirstResponder];
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        [scroll setContentSize:CGSizeMake(320,500)];
        [scroll setContentOffset:CGPointMake(0,0) animated:YES];
        return NO;
    }
    return YES;
}


-(IBAction)backPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)Upload:(id)sender
{
    if ([[txtTitle text]length] == 0) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Enter the Title" delegate:self cancelButtonTitle:NULL otherButtonTitles:@"OK", nil];
        [alertView show];
        [alertView release];
    }
    else if ([[txtDescription text]length] == 0 || [[txtDescription text]isEqualToString:@"Description"] || [[txtDescription text]isEqualToString:@"\n"])
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Enter the Description" delegate:self cancelButtonTitle:NULL otherButtonTitles:@"OK", nil];
        [alertView show];
        [alertView release];
    }
    else if (!imageData)
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Image not upload" delegate:self cancelButtonTitle:NULL otherButtonTitles:@"OK", nil];
        [alertView show];
        [alertView release];
    }
    else
    {
        [scroll setContentOffset:CGPointMake(0, 0) animated:YES];
        NSLog(@"server uploading");
        [mapView setDelegate:self];
        [mapView setShowsUserLocation:YES];
        CLLocationCoordinate2D userCoord;
        userCoord.latitude = mapView.userLocation.coordinate.latitude;
        userCoord.longitude = mapView.userLocation.coordinate.longitude;
        strCoordinates = [NSString stringWithFormat:@"%f,%f",userCoord.latitude,userCoord.longitude];
        [txtTitle resignFirstResponder];
        [txtDescription resignFirstResponder];
        [[LoadingView sharedLoadingView] showLoadingScreen:self.view];
        NSURL *url=[NSURL URLWithString:@"http://judson-server.appspot.com/api/ImageUpload/uploadImage/v_1"];
        imageData = [NSData dataWithData:UIImagePNGRepresentation(addimage)];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        NSString *boundary = @"0x0hHai1CanHazB0undar135";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data;boundary=%@",boundary];
        [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
        NSMutableData *body = [NSMutableData data];
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"imageDescription\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"%@\r\n",[txtDescription text]] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"title\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"%@\r\n",[txtTitle text]] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"imageShaveValue\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"%@\r\n",strCoordinates] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding: NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"imagefile\"; filename=\"1\"\r\n"]dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Type: image/jpeg\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:imageData];
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [request setHTTPBody:body];
        [request setHTTPMethod:@"POST"];
        urlConnection =[[NSURLConnection alloc]initWithRequest:request delegate:self];
        if(urlConnection)
        {
            responseData = [[NSMutableData alloc]retain];
        }
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[responseData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[responseData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError : %@",[error description]);
    [urlConnection release];
    urlConnection = nil;
    [responseData release];
	responseData = nil;
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    responseString =[[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
    dictValues =[responseString JSONValue];
    NSLog(@"Add Gallery dictvalues : %@",dictValues);
    [[LoadingView sharedLoadingView]hideLoadingScreen];
    if ([[dictValues allKeys]count] == 6) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    [urlConnection release];
    urlConnection = nil;
}


-(IBAction)btnImgSelect:(id)sender
{
    [txtTitle resignFirstResponder];
    [txtDescription resignFirstResponder];
    actionSheetPickPicture = [[UIActionSheet alloc] initWithTitle:@""
                                                         delegate:self
                                                cancelButtonTitle:@"Cancel"
                                           destructiveButtonTitle:nil
                                                otherButtonTitles:@"Take Photo", @"Choose Photo", nil];
    actionSheetPickPicture.delegate = self;
    [actionSheetPickPicture showInView:self.tabBarController.tabBar];
    [actionSheetPickPicture release];
}

-(IBAction)btnLocateMe:(id)sender
{
    [mapView setDelegate:self];
    [mapView setShowsUserLocation:YES];
    CLLocationCoordinate2D userCoord;
    userCoord.latitude = mapView.userLocation.coordinate.latitude;
    userCoord.longitude = mapView.userLocation.coordinate.longitude;
    strCoordinates = [NSString stringWithFormat:@"%f",userCoord.latitude];
    NSLog(@"strCoordinates : %@",strCoordinates);
}

#pragma mark - Actions Sheet Delegates

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    imgPickerController = [[UIImagePickerController alloc] init];
    imgPickerController.modalPresentationStyle = UIModalPresentationFormSheet;
    imgPickerController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    imgPickerController.delegate = self;
    imgPickerController.allowsEditing = YES;
    switch (buttonIndex) {
        case 0:
            imgPickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            //[self presentModalViewController:imgPickerController animated:YES];
            [self presentViewController:imgPickerController animated:YES completion:nil];
            break;
        case 1:
            imgPickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:imgPickerController animated:YES completion:nil];
            break;
        default:
            break;
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    //[self dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [imgPickerController dismissViewControllerAnimated:YES completion:nil];
    [imgPickerController release];
    addimage =  [info objectForKey:UIImagePickerControllerEditedImage];
    imageData = [NSData dataWithData:UIImagePNGRepresentation([info objectForKey:UIImagePickerControllerEditedImage])];
    [btnAddPhoto setBackgroundImage:addimage forState:UIControlStateNormal];
}

-(void)drawOnMap:(float)lat Lng:(float)lng
{
    @try
    {
        NSArray *existingPins = mapView.annotations;
        if ([existingPins count] > 0)
        {
            [mapView removeAnnotations:existingPins];
        }
        NSMutableArray* annotations=[[NSMutableArray alloc] init];
        [mapView setMapType:MKMapTypeStandard];
        [mapView setZoomEnabled:YES];
        [mapView setScrollEnabled:YES];
        [mapView setDelegate:self];
        MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
        MKCoordinateSpan span;
        span.latitudeDelta=0.01f;
        span.longitudeDelta=0.01f;
        CLLocationCoordinate2D theCoordinate;
        theCoordinate.latitude = lat;
        theCoordinate.longitude = lng;
        region.span=span;
        region.center= theCoordinate;
        MapAnotation * myAnnotation=[[MapAnotation alloc] init];
        [myAnnotation setCoordinate:theCoordinate];
        [mapView addAnnotation:myAnnotation];
        [annotations addObject:myAnnotation];
        [mapView setRegion:region animated:TRUE];
        [mapView regionThatFits:region];
        [mapView setSelectedAnnotations:[NSArray arrayWithObjects:myAnnotation, nil]];
        [myAnnotation release];
        [annotations release];
    }
    @catch (NSException *exception) {
        //NSLog(@"Catch Exception : %@",[exception name]);
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        [[LoadingView sharedLoadingView]hideLoadingScreen];
        return nil;
    }
    static NSString* AnnotationIdentifier = @"AnnotationIdentifier";
    MKAnnotationView *anotView = (MKAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationIdentifier];
    if(anotView == nil)
    {
        anotView = [[[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:AnnotationIdentifier]autorelease];
        anotView.frame = CGRectMake(0, 0, 20, 50);
    }
    UIImageView *imgViewOuter = [[UIImageView alloc]init];
    imgViewOuter.frame = CGRectMake(0,0,25,27);
    imgViewOuter.image = [appDelegate retrieveUIimage:@"currentLocation.png"];
    [anotView addSubview:imgViewOuter];
    [imgViewOuter release];
    anotView.canShowCallout=YES;
    anotView.annotation = annotation;
	return anotView;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (UIInterfaceOrientationPortrait == interfaceOrientation);
}
@end
