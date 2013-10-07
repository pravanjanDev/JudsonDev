//
//  JudsonTableViewCell.m
//  Judson
//
//  Created by Suresh D on 27/06/13.
//  Copyright (c) 2013 Judson. All rights reserved.
//

#import "JudsonTableViewCell.h"
#import "EGOImageView.h"

@implementation JudsonTableViewCell

@synthesize NewsImage,NewsTitle,descriptions,dateandtime;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)setFlickrPhoto:(NSString*)Photo {
	imageView = [[EGOImageView alloc] init];
	imageView.frame = CGRectMake(5, 5, 92, 88);
	[self.contentView addSubview:imageView];
	imageView.imageURL =[NSURL URLWithString:Photo];
//   imageView.image=[self imageByCropping:imageView.image toRect:CGRectMake(0,0, 106.6, 106.6)];
	[imageView setNeedsDisplay];
	if(imageView.image == nil)
	{
		NSLog(@"image nil");
	}
	else {
	}
}

- (UIImage *)imageByCropping:(UIImage *)imageToCrop toRect:(CGRect)rect
{
	CGImageRef imageRef = CGImageCreateWithImageInRect([imageToCrop CGImage], rect);
	
	UIImage *cropped = [UIImage imageWithCGImage:imageRef];
	CGImageRelease(imageRef);
	
	
	return cropped;
	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (UIInterfaceOrientationPortrait == interfaceOrientation);
}

@end
