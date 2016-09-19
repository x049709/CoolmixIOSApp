//
//  TellemBuildCustomRegistry.m
//  Tellem
//
//  Created by Ed Bayudan on 1/28/15.
//  Copyright (c) 2015 Tellem, LLC All rights reserved.
//

#import "TellemBuildCustomRegistry.h"


@interface TellemBuildCustomRegistry ()
@end


@implementation TellemBuildCustomRegistry
@synthesize buildScrollView;
@synthesize profileImageView, profileImageLabel;
@synthesize profileImage;
@synthesize removeViewButton;
@synthesize inputUserName, inputFirstName, inputLastName;
@synthesize inputPassword,retypePassword;
@synthesize continueButton,skipButton;
@synthesize alreadyButton;
@synthesize forgotPasswordButton;
@synthesize sportsButton, newsButton, musicButton;
@synthesize entertainmentButton, lifestyleButton, techscienceButton;
@synthesize artButton, gamingButton, foodButton;
@synthesize fashionButton, outdoorsadventureButton;
@synthesize quickAddLabel,productImageView,productLabel,productDescription,productURL,productPrice,productName,productComplete;


#pragma mark - Initialization

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        self.layer.cornerRadius = 0.0;
        self.layer.borderWidth = 0.0;
        self.buildScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(10, 0, self.frame.size.width-20, self.frame.size.height)];
        [self.buildScrollView setContentSize:CGSizeMake(self.buildScrollView.bounds.size.width, self.buildScrollView.bounds.size.height+250)];        
        self.buildScrollView.layer.cornerRadius = 0.0;
        self.buildScrollView.layer.masksToBounds = YES;
        self.buildScrollView.layer.borderWidth = 0.0;
        [self.buildScrollView setScrollEnabled:YES];
        self.buildScrollView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.buildScrollView];
        
        UILabel *signupLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, self.buildScrollView.frame.size.width - 10, 300)];
        [signupLabel setTextColor:[UIColor whiteColor]];
        [signupLabel setBackgroundColor:[UIColor blackColor]];
        [self.buildScrollView addSubview:signupLabel];
        
        
        UIImageView *productImageView = [[UIImageView alloc]init];
        productImageView.frame = CGRectMake(15.0f, 15.0f, 80.0f, 80.0f);
        productImageView.layer.cornerRadius = 40.0;
        productImageView.layer.borderWidth = 1.0;
        [productImageView setImage:[UIImage imageNamed:@"user.png"]];
        [self.buildScrollView  addSubview:productImageView];
        
        removeViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [removeViewButton setFrame:CGRectMake(self.buildScrollView.frame.size.width - 60.0f, 10.0f, 50.0f, 20.0f)];
        [removeViewButton setBackgroundColor:[UIColor blackColor]];
        removeViewButton.titleLabel.font = [UIFont fontWithName: kFontBold size: 12.0f];
        [removeViewButton setTitle:@"(CLOSE)" forState:UIControlStateNormal];
        [removeViewButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //[[removeViewButton titleLabel] setAdjustsFontSizeToFitWidth:YES];
        //[removeViewButton setBackgroundImage:[UIImage imageNamed:@"cancel.png"] forState:UIControlStateNormal];
        [removeViewButton setSelected:NO];
        [self.buildScrollView addSubview:removeViewButton];
        

        UILabel *productLabel = [[UILabel alloc]init];
        productLabel.frame = CGRectMake(self.buildScrollView.frame.size.width - 200.0f, 25.0f, 190.0f, 70.0f);
        [productLabel setTextColor:[UIColor whiteColor]];
        [productLabel setBackgroundColor:[UIColor blackColor]];
        [productLabel setFont:[UIFont fontWithName: kFontBold size: 12.0f]];
        productLabel.lineBreakMode = NSLineBreakByWordWrapping;
        productLabel.numberOfLines = 0;
        productLabel.text = @"A REGISTRY FOR ANY OCCASION\nEND THE RE-GIFTING CYCLE!";
        productLabel.textAlignment = NSTextAlignmentRight;
        [self.buildScrollView addSubview:productLabel];
        
        int sVWidth = self.frame.size.width;
        self.productName.frame = CGRectMake(130.0f, 60.0f, sVWidth - 150.0f, 30.0f);
        self.productName.backgroundColor = [UIColor whiteColor];
        [self.productName setTextColor:[UIColor blackColor]];
        [self.productName setFont:[UIFont fontWithName:kFontNormal size:14.0f]];
        self.productName.placeholder = @"Name of product";
        [self.productName setBorderStyle:UITextBorderStyleNone];
        self.productName.delegate=self;
        self.productName.userInteractionEnabled=YES;
        [self.buildScrollView addSubview:self.productName];
        
        self.productURL.frame = CGRectMake(30.0f, 100.0f, sVWidth - 130.0f, 30.0f);
        self.productURL.backgroundColor = [UIColor whiteColor];
        [self.productURL setTextColor:[UIColor blackColor]];
        [self.productURL setFont:[UIFont fontWithName:kFontNormal size:14.0f]];
        [self.productURL setBorderStyle:UITextBorderStyleNone];
        self.productURL.placeholder = @"Product link (optional)";
        self.productURL.delegate=self;
        self.productURL.userInteractionEnabled=YES;
        [self.buildScrollView addSubview:self.productURL];
        
        self.productPrice.frame = CGRectMake(230, 100, 70, 30.0f);
        self.productPrice.backgroundColor = [UIColor whiteColor];
        [self.productPrice setTextColor:[UIColor blackColor]];
        self.productPrice.textAlignment = NSTextAlignmentCenter;
        [self.productPrice setFont:[UIFont fontWithName:kFontNormal size:14.0f]];
        [self.productPrice setBorderStyle:UITextBorderStyleNone];
        self.productPrice.placeholder = @"$0.00";
        self.productPrice.delegate=self;
        self.productPrice.userInteractionEnabled=YES;
        self.productPrice.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        [self.buildScrollView addSubview:self.productPrice];
        
        self.productDescription.frame = CGRectMake(30.0f, 140.0f, sVWidth - 50.0f, 30.0f);
        self.productDescription.backgroundColor = [UIColor whiteColor];
        [self.productDescription setTextColor:[UIColor blackColor]];
        [self.productDescription setFont:[UIFont fontWithName:kFontNormal size:14.0f]];
        [self.productDescription setBorderStyle:UITextBorderStyleNone];
        self.productDescription.placeholder = @"Product description";
        self.productDescription.delegate=self;
        self.productDescription.userInteractionEnabled=YES;
        [self.buildScrollView addSubview:self.productDescription];
        
        self.productComplete.frame = CGRectMake(255, 185, 45, 40);
        [self.productComplete setBackgroundColor:[UIColor whiteColor]];
        [self.productComplete setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.productComplete setTitle:@"ADD" forState:UIControlStateNormal];
        [self.productComplete.titleLabel setFont:[UIFont fontWithName:kFontBold size:14.0f]];
        [self.productComplete setSelected:NO];
        self.productComplete.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [self.buildScrollView addSubview:self.productComplete];
        
    }
    
    return self;
}

- (void)changeButtonColor:(id)sender {
    
    UIButton* btn = (UIButton*)sender;
    if (btn.tag == 0) {
        btn.tag = 1;
        [btn setBackgroundColor:[UIColor blackColor]];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        continueButton.tag++;
    } else {
        btn.tag = 0;
        [btn setBackgroundColor:[UIColor whiteColor]];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        continueButton.tag--;
    }
    
    if (continueButton.tag>0) {
        [continueButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [continueButton setEnabled:TRUE];
        [skipButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [skipButton setEnabled:FALSE];
    }
    else {
        [continueButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [continueButton setEnabled:FALSE];
        [skipButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [skipButton setEnabled:TRUE];
    }
}



@end