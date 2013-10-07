//
//  LoadingView.m
//  
//
//  Created by Gokul Balaji




#import "LoadingView.h"

@implementation LoadingView

@synthesize  activityIndicator, imgLoading;

//Loading View Width and Height

#define VIEW_WIDTH 320  //Loading view Width
#define VIEW_HEIGHT 460 //Loading view Height


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        imgLoading = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loadBox.png"]];
        activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        
        //Set the Activity indicator at the center of the loading image
        
        int imgWidth = imgLoading.frame.size.width;
        int imgHeight = imgLoading.frame.size.height;
        int wheelWidth = activityIndicator.frame.size.width;
        int wheelHeight =  activityIndicator.frame.size.height;
        
        CGRect modifiedFrame;
        modifiedFrame.size.width = wheelWidth;
        modifiedFrame.size.height = wheelHeight;
        modifiedFrame.origin.x = (imgWidth - wheelWidth)>>1;
        modifiedFrame.origin.y = (imgHeight - wheelHeight)>>1;
        activityIndicator.frame = modifiedFrame;
        
        CGRect loadingModifiedImgFrame;
        loadingModifiedImgFrame.size.width = imgWidth;
        loadingModifiedImgFrame.size.height = imgHeight;
        loadingModifiedImgFrame.origin.x = (VIEW_WIDTH - imgWidth)>>1;
        loadingModifiedImgFrame.origin.y = (VIEW_HEIGHT - imgHeight)>>1;
        imgLoading.frame = loadingModifiedImgFrame;
        [activityIndicator startAnimating];
        [imgLoading addSubview:activityIndicator];
        
        [self addSubview:imgLoading];
        
        //self.backgroundColor = [UIColor redColor];
        // Initialization code
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //   [self initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}


+ (LoadingView *) sharedLoadingView{
    
    // the instance of this class is stored here
    static LoadingView *myInstance = nil;
    
    // check to see if an instance already exists
    if (nil == myInstance) {
        
        // initialize variables here
        
        CGRect frame = CGRectMake(10, 10, VIEW_WIDTH, VIEW_HEIGHT);
        myInstance  = [[[self class] alloc] initWithFrame:frame];
        
        
    }//End of if
    // return the instance of this class
    return myInstance;
    
}//End of class method

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

- (void)dealloc
{
     [super dealloc];
}


//Method definition for show loading screen

- (IBAction)showLoadingScreen:(UIView *)rootView{
    
    [self hideLoadingScreen];
    float rootViewWidth = rootView.frame.size.width;
    float rootViewHeight = CGRectGetHeight(rootView.bounds);
    float loadingViewWidth = self.bounds.size.width;
    float loadingViewHeight = CGRectGetHeight(self.bounds);
    CGRect modifiedFrame;
    modifiedFrame.origin.x = ((int)rootViewWidth - (int)loadingViewWidth)>>1;
    modifiedFrame.origin.y = ((int)rootViewHeight - (int)loadingViewHeight)>>1;
    modifiedFrame.size.width = VIEW_WIDTH;
    modifiedFrame.size.height = VIEW_HEIGHT;
    self.frame = modifiedFrame;
    [rootView addSubview:self];
}

- (IBAction)showFirstLoadingScreen:(UIView *)rootView
{
    [self hideFirstLoadingScreen];
    float rootViewWidth = rootView.frame.size.width;
    float rootViewHeight = CGRectGetHeight(rootView.bounds);
    float loadingViewWidth = self.bounds.size.width;
    float loadingViewHeight = CGRectGetHeight(self.bounds);
    CGRect modifiedFrame;
    modifiedFrame.origin.x = ((int)rootViewWidth - (int)loadingViewWidth)>>1;
    modifiedFrame.origin.y = ((int)rootViewHeight - (int)loadingViewHeight)>>1;
    modifiedFrame.size.width = VIEW_WIDTH;
    modifiedFrame.size.height = VIEW_HEIGHT;
    self.frame = modifiedFrame;
    [rootView addSubview:self];
}

//Method definition for hide loading screen

- (IBAction)hideLoadingScreen{
    //[appDelegate setAllItemsInTabBar:appDelegate.tabBarController toEnableState:YES];
    [self removeFromSuperview];
}

- (IBAction)hideFirstLoadingScreen{
    //[appDelegate setAllItemsInTabBar:appDelegate.tabBarController toEnableState:YES];
    [self removeFromSuperview];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // [self hideLoadingScreen];
}

@end

