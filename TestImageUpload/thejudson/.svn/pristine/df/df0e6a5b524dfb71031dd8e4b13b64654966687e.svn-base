//
//  DetailViewController.m
//  Judson
//
//  Created by Suresh D on 01/07/13.
//  Copyright (c) 2013 Judson. All rights reserved.
//

#import "DetailViewController.h"
#import "JudsonAppDelegate.h"
#import "EGOImageView.h"
#import "MapAnotation.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize appDelegate;
@synthesize mapView;

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
    appDelegate=(JudsonAppDelegate *)[[UIApplication sharedApplication] delegate];
    [self.navigationController.navigationItem setHidesBackButton:YES];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    view.backgroundColor = [UIColor clearColor];
    UIButton *backButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"back-button.png"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    [backButton setFrame:CGRectMake(5,9,45,38)];
    
//    UILabel *lbl_title=[[UILabel alloc] initWithFrame:CGRectMake(110, 0, 200, 50)];
//    [lbl_title setBackgroundColor:[UIColor clearColor]];
//    [lbl_title setTextColor:[UIColor blackColor]];
//    [lbl_title setFont:[UIFont boldSystemFontOfSize:20]];
//    [lbl_title setText:@"Add Gallery"];
//    [view addSubview:lbl_title];
    
    [view addSubview:backButton];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    [self.navigationItem setLeftBarButtonItem:barButtonItem];
    imageView = [[EGOImageView alloc] init];
	imageView.imageURL =[NSURL URLWithString:[appDelegate.galleryImages objectAtIndex:[appDelegate.indexvalue intValue]]];
	[imageView setNeedsDisplay];
    img.image=imageView.image;

	if(imageView.image == nil)
	{
		NSLog(@"image nil");
	}
	else {	}
    [lbl setText:[appDelegate.galleryTitle objectAtIndex:[appDelegate.indexvalue intValue]]];
    [txt_view setText:[appDelegate.galleryDescription objectAtIndex:[appDelegate.indexvalue intValue]]];
    NSLog(@"location : %@",[appDelegate.galleryLocation objectAtIndex:[appDelegate.indexvalue intValue]]);
    NSString *strCoord  = [appDelegate.galleryLocation objectAtIndex:[appDelegate.indexvalue intValue]];
    NSLog(@"strcoord : %@",strCoord);
    NSArray *aryCoord = [strCoord componentsSeparatedByString:@","];
    CLLocationCoordinate2D userCoord;
    userCoord.latitude = [[aryCoord objectAtIndex:0]floatValue];
    userCoord.longitude = [[aryCoord objectAtIndex:1]floatValue];
    [self drawOnMap:userCoord.latitude Lng:userCoord.longitude];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [scroll setFrame:CGRectMake(0,0,320,500)];
    [self.navigationController.navigationItem setHidesBackButton:YES];
}

-(void)backPressed
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (UIInterfaceOrientationPortrait == interfaceOrientation);
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

@end
