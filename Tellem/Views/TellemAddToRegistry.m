//
//  TellemAddToRegistry.m
//  Tellem
//
//  Created by Ed Bayudan on 1/28/15.
//  Copyright (c) 2015 Tellem, LLC All rights reserved.
//

#import "TellemAddToRegistry.h"


@interface TellemAddToRegistry ()
@end


@implementation TellemAddToRegistry
@synthesize scrollView;
@synthesize inputBackgroundImageView;
@synthesize inputBackgroundImage;
@synthesize removeViewButton;
@synthesize currentRegistryButton;
@synthesize futureRegistryButton;
@synthesize pushToFriendsButton;

#pragma mark - Initialization

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        self.layer.cornerRadius = 0.0;
        self.layer.borderWidth = 0.0;
        scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(30, 60, self.frame.size.width-60, self.frame.size.height-110)];
        scrollView.layer.cornerRadius = 0.0;
        scrollView.layer.masksToBounds = YES;
        scrollView.layer.borderWidth = 0.5;
        [scrollView setScrollEnabled:YES];
        scrollView.backgroundColor = [UIColor whiteColor];
        //To scroll, set the contentsize
        //CGSize scrollViewContentSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
        //[scrollView setContentSize:scrollViewContentSize];
        [self addSubview:scrollView];
        
        removeViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [removeViewButton setFrame:CGRectMake(self.bounds.origin.x+self.bounds.size.width-40, 25.0f, 32.0f, 32.0f)];
        [removeViewButton setBackgroundColor:[UIColor clearColor]];
        [[removeViewButton titleLabel] setAdjustsFontSizeToFitWidth:YES];
        [removeViewButton setBackgroundImage:[UIImage imageNamed:@"cancel.png"] forState:UIControlStateNormal];
        [removeViewButton setSelected:NO];
        [self addSubview:removeViewButton];
        
        currentRegistryButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [currentRegistryButton setFrame:CGRectMake(20, 60, scrollView.frame.size.width - 40, 30.0)];
        [currentRegistryButton setBackgroundColor:[UIColor blackColor]];
        [currentRegistryButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [currentRegistryButton setTitle:@"ADD TO A CURRENT REGISTRY" forState:UIControlStateNormal];
        [currentRegistryButton.titleLabel setFont:[UIFont fontWithName:kFontBold size:14.0f]];
        [currentRegistryButton setSelected:NO];
        [scrollView addSubview:currentRegistryButton];

        futureRegistryButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [futureRegistryButton setFrame:CGRectMake(20, 130, scrollView.frame.size.width - 40, 30.0)];
        [futureRegistryButton setBackgroundColor:[UIColor blackColor]];
        [futureRegistryButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [futureRegistryButton setTitle:@"SAVE TO A NEW REGISTRY" forState:UIControlStateNormal];
        [futureRegistryButton.titleLabel setFont:[UIFont fontWithName:kFontBold size:14.0f]];
        [futureRegistryButton setSelected:NO];
        [scrollView addSubview:futureRegistryButton];
        
        pushToFriendsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [pushToFriendsButton setFrame:CGRectMake(20, 200, scrollView.frame.size.width - 40, 30.0)];
        [pushToFriendsButton setBackgroundColor:[UIColor blackColor]];
        [pushToFriendsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [pushToFriendsButton setTitle:@"PUSH TO FRIENDS" forState:UIControlStateNormal];
        [pushToFriendsButton.titleLabel setFont:[UIFont fontWithName:kFontBold size:14.0f]];
        [pushToFriendsButton setSelected:NO];
        [scrollView addSubview:pushToFriendsButton];
        
        
        
    }
    
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}




@end
