//
//  JudsonTableViewCell.h
//  Judson
//
//  Created by Suresh D on 27/06/13.
//  Copyright (c) 2013 Judson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EGOImageView;

@interface JudsonTableViewCell : UITableViewCell
{
    
@private
	
	EGOImageView* imageView;
	
	IBOutlet UIImageView *NewsImage;
	IBOutlet UILabel *NewsTitle,*descriptions,*dateandtime;

}
- (void)setFlickrPhoto:(NSString*)Photo;

@property (nonatomic,retain)IBOutlet UIImageView *NewsImage;
@property (nonatomic,retain)IBOutlet UILabel *NewsTitle,*descriptions,*dateandtime;

@end
