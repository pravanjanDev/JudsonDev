//
//  JudsonSecondViewController.h
//  Judson
//
//  Created by Suresh D on 25/06/13.
//  Copyright (c) 2013 Judson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JudsonTableViewCell.h"

@class JudsonAppDelegate;

@interface JudsonSecondViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    JudsonAppDelegate *appDelegate;
    IBOutlet UIScrollView *scroll;
    IBOutlet UITableView *tbl_view;
    IBOutlet JudsonTableViewCell *tblcell;
    NSMutableArray *arrys_images;
    NSURLConnection *urlConnection;
    NSDictionary *dictValues;
    NSString *responseString;
    NSMutableData  *responseData;
}
@property (nonatomic, retain) JudsonAppDelegate *appDelegate;
@end
