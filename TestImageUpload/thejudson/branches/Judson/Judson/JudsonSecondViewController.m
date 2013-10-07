//
//  JudsonSecondViewController.m
//  Judson
//
//  Created by Suresh D on 25/06/13.
//  Copyright (c) 2013 Judson. All rights reserved.
//

#import "JudsonSecondViewController.h"
#import "JudsonTableViewCell.h"
#import "JSON.h"
#import "AddGalleryViewController.h"
#import "JudsonAppDelegate.h"
#import "DetailViewController.h"
#import "JudsonLogin.h"
#import "LoadingView.h"

@interface JudsonSecondViewController ()

@end

@implementation JudsonSecondViewController

//@synthesize galleryImages,galleryTitle,galleryDescription,galleryDateandTime;

@synthesize  appDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[self tabBarItem] setFinishedSelectedImage:[UIImage imageNamed:@"gallery-hover1.png"]withFinishedUnselectedImage:[UIImage imageNamed:@"gallery-icon.png"]];
        [[self tabBarItem] setImageInsets:UIEdgeInsetsMake(6, 0, -6, 0)];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"view did load calling");
    appDelegate= (JudsonAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSLog(@"userId %@",[appDelegate.userDefaults objectForKey:@"userId"]);
    [self.navigationController setNavigationBarHidden:NO];
    arrys_images=[[NSMutableArray alloc] init];
    [arrys_images addObject:@"http://static.squarespace.com/static/5172d329e4b0b9b09d34eb0f/t/5172f334e4b08db710705ec7/1366487873793/620660_440493285994306_366660866_o.jpg?format=700w"];
    [arrys_images addObject:@"http://static.squarespace.com/static/5172d329e4b0b9b09d34eb0f/5172d329e4b0b9b09d34eb1f/5172e09ee4b0152c18fe2e81/1366483102697/Opus%20Dei%20Window_Sancte%20Raphael.jpg?format=700w"];
    [arrys_images addObject:@"http://static.squarespace.com/static/5172d329e4b0b9b09d34eb0f/t/5172f307e4b02ce3fe4f9930/1366487816544/Judson%20Hands%20Lead.jpg?format=700w"];
    [arrys_images addObject:@"http://static.squarespace.com/static/5172d329e4b0b9b09d34eb0f/5172d329e4b0b9b09d34eb1f/518a029fe4b00d1f32f8dd82/1367999138086/Boys-sitting-room-revised-March.jpg"];
    appDelegate.checkResponse=@"0";
    [appDelegate.galleryImages removeAllObjects];
    [appDelegate.galleryTitle removeAllObjects];
    [appDelegate.galleryDescription removeAllObjects];
    [appDelegate.galleryDateandTime removeAllObjects];
    [appDelegate.galleryLocation removeAllObjects];
}


-(void)viewWillAppear:(BOOL)animated
{
    if (![appDelegate.userDefaults objectForKey:@"userId"]) {
        NSLog(@"user id value is empty");
        JudsonLogin *Login = [[JudsonLogin alloc]initWithNibName:@"JudsonLogin" bundle:nil];
        [self.tabBarController.tabBar setHidden:YES];
        [Login setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:Login animated:YES];
    }
    else if ([appDelegate.galleryImages count] == 0)
    {
        NSLog(@"load images calling");
        [self loadImages];
    }
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top-bar.png"] forBarMetrics:UIBarMetricsDefault];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    view.backgroundColor = [UIColor clearColor];
    UIButton *settingsButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    [settingsButton setImage:[UIImage imageNamed:@"add-button.png"] forState:UIControlStateNormal];
    [settingsButton addTarget:self action:@selector(AddImage:) forControlEvents:UIControlEventTouchUpInside];
    [settingsButton setFrame:CGRectMake(282,8,35,35)];
    
    UIButton *refreshButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    [refreshButton setImage:[UIImage imageNamed:@"refresh-button.png"] forState:UIControlStateNormal];
    [refreshButton addTarget:self action:@selector(refreshPressed:) forControlEvents:UIControlEventTouchUpInside];
    [refreshButton setFrame:CGRectMake(10,8,36,35)];
    
    UILabel *lbl_title=[[UILabel alloc] initWithFrame:CGRectMake(125, 0, 200, 50)];
    [lbl_title setBackgroundColor:[UIColor clearColor]];
    [lbl_title setTextColor:[UIColor blackColor]];
    [lbl_title setFont:[UIFont fontWithName:@"Georgia-Bold" size:23]];
    [lbl_title setText:@"Gallery"];
    [view addSubview:lbl_title];
    [view addSubview:settingsButton];
    [view addSubview:refreshButton];   
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    [self.navigationItem setRightBarButtonItem:barButtonItem];
    
}

-(void)loadImages
{
    [[LoadingView sharedLoadingView]showLoadingScreen:self.view];
    NSString *url;
    url = [NSString stringWithFormat:@"http://judson-server.appspot.com/api/ImageUpload/getApproveImageWithRequestPagination/v_0?paginationLimit=10"];
    NSURL *nurl = [NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request url : %@",url);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:nurl];
    urlConnection =[[NSURLConnection alloc]initWithRequest:request delegate:self];
    if(urlConnection)
    {
        responseData = [[NSMutableData alloc]retain];
    }
    int x = 0,y = 0;
    for(int i=0;i<5;i++)
    {
        UIImageView *img=[[UIImageView alloc] init];
        [img setFrame:CGRectMake(x,y, 100, 44)];
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
    [[LoadingView sharedLoadingView]hideLoadingScreen];
    NSLog(@"didFailWithError");
    [urlConnection release];
    urlConnection = nil;
    [responseData release];
	responseData = nil;
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [[LoadingView sharedLoadingView]hideLoadingScreen];
    responseString =[[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
    dictValues =[responseString JSONValue];
    NSLog(@"key count : %d",[[dictValues allKeys] count]);
    NSLog(@"Gallery dictValues %@",dictValues);
    if([[dictValues allKeys] count]==1)
    {
        appDelegate.checkResponse=@"1";
    }
    if([[dictValues allKeys] count]>2 && [appDelegate.checkResponse isEqualToString:@"0"])
    {
        for(int i=0;i<[[dictValues allKeys] count];i++)
        {
            NSDictionary *arr=[dictValues objectForKey:[[dictValues allKeys] objectAtIndex:i]];
            NSLog(@"arr : %@",arr);
            [appDelegate.galleryImages addObject:[arr objectForKey:@"url"]];
            [appDelegate.galleryTitle addObject:[arr objectForKey:@"title"]];
            [appDelegate.galleryDescription addObject:[arr objectForKey:@"imageDescription"]];
            [appDelegate.galleryDateandTime addObject:[arr objectForKey:@"currentDate"]];
            [appDelegate.galleryLocation addObject:[arr objectForKey:@"shapeValue"]];
        }
        NSLog(@"values added");
        [tbl_view reloadData];
    }
}


-(void)refreshPressed:(id)sender
{
    NSLog(@"refresh pressed");
    [self loadImages];
}

-(void)AddImage:(id)sender
{
    AddGalleryViewController *addViewController=[[AddGalleryViewController alloc] initWithNibName:@"AddGalleryViewController" bundle:nil];
    [self.navigationController pushViewController:addViewController animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [appDelegate.galleryImages count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cellfor row calling : %@",[appDelegate.galleryImages objectAtIndex:indexPath.row]);
    static NSString *MyIdentifier = @"MyIdentifier";
	MyIdentifier = @"JudsonTableViewCell";
	JudsonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	if (cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"JudsonTableViewCell" owner:self options:nil];
		cell = tblcell;
    }
    NSString *imgUrl = [appDelegate.galleryImages objectAtIndex:indexPath.row];
    [cell setFlickrPhoto:imgUrl]; 
    [cell.NewsTitle setTextColor:[UIColor colorWithRed:121/255.0f green:120/255.0f blue:120/255.0f alpha:1.0f]];
    cell.NewsTitle.text=[NSString stringWithFormat:@"%@",[appDelegate.galleryTitle objectAtIndex:[indexPath row]]];
    [cell.descriptions setTextColor:[UIColor colorWithRed:132/255.0f green:132/255.0f blue:132/255.0f alpha:1.0f]];
    cell.descriptions.text=[NSString stringWithFormat:@"%@",[appDelegate.galleryDescription objectAtIndex:[indexPath row]]];
    NSString *nDate=[appDelegate.galleryDateandTime objectAtIndex:[indexPath row]];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:([nDate doubleValue] / 1000)];
    NSDateFormatter *dtfrm = [[NSDateFormatter alloc] init];
//    [dtfrm setDateFormat:@"MM/dd/yyyy hh:ss"];
    [dtfrm setDateStyle:NSDateFormatterMediumStyle];
    [dtfrm setTimeStyle:NSDateFormatterMediumStyle];
    nDate = [dtfrm stringFromDate:date];    
    cell.dateandtime.text=[NSString stringWithFormat:@"%@",nDate];
    NSLog(@"date and time added");
    [cell.dateandtime setTextColor:[UIColor colorWithRed:132/255.0f green:132/255.0f blue:132/255.0f alpha:1.0f]];
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    float endScrolling = scrollView.contentOffset.y + scrollView.frame.size.height;
    if (endScrolling >= scrollView.contentSize.height)
    {
        NSLog(@"Adding");
//        if([appDelegate.checkResponse isEqualToString:@"0"])
            [self loadImages];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //put data on your array
    if(indexPath.row == [appDelegate.galleryImages count]-1)
    {
        NSLog(@"Adding code");
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    appDelegate.indexvalue=[NSString stringWithFormat:@"%d",[indexPath row]];
    DetailViewController  *detailViewController=[[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    [self.navigationController pushViewController:detailViewController animated:YES];
    [tbl_view deselectRowAtIndexPath:indexPath animated:YES];
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

@end
