//
//  TellemSignupDOB.m
//  Tellem
//
//  Created by Ed Bayudan on 1/28/15.
//  Copyright (c) 2015 Tellem, LLC All rights reserved.
//

#import "TellemSignupDOB.h"


@interface TellemSignupDOB ()
@end


@implementation TellemSignupDOB
@synthesize scrollView;
@synthesize removeViewButton;
@synthesize finishButton,skipButton;
@synthesize alreadyButton;
@synthesize forgotPasswordButton;
@synthesize sportsButton, newsButton, musicButton;
@synthesize entertainmentButton, lifestyleButton, techscienceButton;
@synthesize artButton, gamingButton, foodButton,whoSeesMMDDPicker,whoSeesMMDDYYPicker;
@synthesize fashionButton, outdoorsadventureButton, monthPicker,dayPicker,yearPicker, monthDOB, dayDOB,yearDOB, whoSeesMMDD, whoSeesMMDDYY;

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
        [self addSubview:scrollView];
        
        removeViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [removeViewButton setFrame:CGRectMake(self.bounds.origin.x+self.bounds.size.width-40, 25.0f, 32.0f, 32.0f)];
        [removeViewButton setBackgroundColor:[UIColor clearColor]];
        [[removeViewButton titleLabel] setAdjustsFontSizeToFitWidth:YES];
        [removeViewButton setBackgroundImage:[UIImage imageNamed:@"cancel.png"] forState:UIControlStateNormal];
        [removeViewButton setSelected:NO];
        [self addSubview:removeViewButton];
        
        UILabel *signupLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, scrollView.frame.size.width - 40, 30)];
        [signupLabel setTextColor:[UIColor whiteColor]];
        [signupLabel setBackgroundColor:[UIColor blackColor]];
        [signupLabel setFont:[UIFont fontWithName: kFontBold size: 14.0f]];
        signupLabel.text = @"ADD YOUR BIRTHDAY";
        signupLabel.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:signupLabel];
        
        UILabel *interestLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, scrollView.frame.size.width - 40, 20)];
        [interestLabel setTextColor:[UIColor blackColor]];
        [interestLabel setBackgroundColor:[UIColor lightGrayColor]];
        [interestLabel setFont:[UIFont fontWithName: kFontBold size: 8.0f]];
        interestLabel.lineBreakMode = NSLineBreakByWordWrapping;
        interestLabel.numberOfLines = 0;
        interestLabel.text = @"LET YOUR FRIENDS CELEBRATE WITH YOU! YOU ARE ALWAYS IN CONTROL OF WHO CAN SEE IT. ";
        [scrollView addSubview:interestLabel];
        
        NSMutableArray* monthArray = [[NSMutableArray alloc] init];
        [monthArray addObject:@"January"];
        [monthArray addObject:@"February"];
        [monthArray addObject:@"March"];
        [monthArray addObject:@"April"];
        [monthArray addObject:@"May"];
        [monthArray addObject:@"June"];
        [monthArray addObject:@"July"];
        [monthArray addObject:@"August"];
        [monthArray addObject:@"September"];
        [monthArray addObject:@"October"];
        [monthArray addObject:@"November"];
        [monthArray addObject:@"December"];
        
        NSMutableArray* dayArray = [[NSMutableArray alloc] init];
        for (int i = 1; i < 32; ++i) {
            NSString *dateOfBirth = [NSString stringWithFormat:@"%d", i];
            [dayArray addObject:dateOfBirth];
        }


        NSMutableArray* yearArray = [[NSMutableArray alloc] init];
        for (int i = 1950; i < 2025; ++i) {
            NSString *yearOfBirth = [NSString stringWithFormat:@"%d", i];
            [yearArray addObject:yearOfBirth];
        }
       
        monthDOB = [[UITextField alloc]  initWithFrame:CGRectMake(20, 110, scrollView.frame.size.width - 80, 30)];
        self.monthPicker = [[DownPicker alloc] initWithTextField:monthDOB withData:monthArray];
        [self.monthPicker setPlaceholder:@"MONTH"];
        [self.monthPicker setToolbarStyle:UIBarStyleBlack];
        [scrollView addSubview:monthDOB];
        
        dayDOB = [[UITextField alloc]  initWithFrame:CGRectMake(20, 150, scrollView.frame.size.width - 80, 30)];
        self.dayPicker = [[DownPicker alloc] initWithTextField:dayDOB withData:dayArray];
        [self.dayPicker setPlaceholder:@"DAY"];
        [self.dayPicker setToolbarStyle:UIBarStyleBlack];
        [scrollView addSubview:dayDOB];
        
        yearDOB = [[UITextField alloc]  initWithFrame:CGRectMake(20, 190, scrollView.frame.size.width - 80, 30)];
        self.yearPicker = [[DownPicker alloc] initWithTextField:yearDOB withData:yearArray];
        [self.yearPicker setPlaceholder:@"YEAR"];
        [self.yearPicker setToolbarStyle:UIBarStyleBlack];
        [scrollView addSubview:yearDOB];
        
        UILabel *whoseesLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 230, scrollView.frame.size.width - 40, 20)];
        [whoseesLabel setTextColor:[UIColor blackColor]];
        [whoseesLabel setBackgroundColor:[UIColor lightGrayColor]];
        [whoseesLabel setFont:[UIFont fontWithName: kFontBold size: 8.0f]];
         whoseesLabel.text = @"WHO SEES THIS ---------------------------------------";
        [scrollView addSubview:whoseesLabel];
        
        NSMutableArray* mmddChoices = [[NSMutableArray alloc] init];
        [mmddChoices addObject:@"MONTH & DAY (we are friends)"];
        [mmddChoices addObject:@"MONTH & DAY (we are strangers)"];
 
        whoSeesMMDD = [[UITextField alloc]  initWithFrame:CGRectMake(20, 260, scrollView.frame.size.width - 40, 30)];
        [whoSeesMMDD setFont:[UIFont fontWithName: kFontBold size: 8.0f]];
        self.whoSeesMMDDPicker = [[DownPicker alloc] initWithTextField:whoSeesMMDD withData:mmddChoices];
        [self.whoSeesMMDDPicker setPlaceholder:@"MONTH & DAY"];
        [self.whoSeesMMDDPicker setToolbarStyle:UIBarStyleBlack];
        [scrollView addSubview:whoSeesMMDD];
        
        NSMutableArray* mmddyyChoices = [[NSMutableArray alloc] init];
        [mmddyyChoices addObject:@"YEAR (only me)"];
        [mmddyyChoices addObject:@"YEAR (we are friends)"];
        
        whoSeesMMDDYY = [[UITextField alloc]  initWithFrame:CGRectMake(20, 300, scrollView.frame.size.width - 40, 30)];
        [whoSeesMMDDYY setFont:[UIFont fontWithName: kFontBold size: 8.0f]];
        self.whoSeesMMDDYYPicker = [[DownPicker alloc] initWithTextField:whoSeesMMDDYY withData:mmddyyChoices];
        [self.whoSeesMMDDYYPicker setPlaceholder:@"YEAR"];
        [self.whoSeesMMDDYYPicker setToolbarStyle:UIBarStyleBlack];
        [scrollView addSubview:whoSeesMMDDYY];
        
        finishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [finishButton setFrame:CGRectMake(scrollView.frame.size.width - 80, scrollView.frame.size.height - 40, 60, 25)];
        [finishButton setBackgroundColor:[UIColor whiteColor]];
        [finishButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [finishButton setTitle:@"FINISH" forState:UIControlStateNormal];
        [finishButton.titleLabel setFont:[UIFont fontWithName:kFontNormal size:10.0f]];
        [finishButton setSelected:NO];
        finishButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [scrollView addSubview:finishButton];
        
        skipButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [skipButton setFrame:CGRectMake(20, scrollView.frame.size.height - 40, 60, 25)];
        [skipButton setBackgroundColor:[UIColor whiteColor]];
        [skipButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [skipButton setTitle:@"SKIP" forState:UIControlStateNormal];
        [skipButton.titleLabel setFont:[UIFont fontWithName:kFontNormal size:10.0f]];
        [skipButton setSelected:NO];
        skipButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [scrollView addSubview:skipButton];
        
        alreadyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [alreadyButton setFrame:CGRectMake(30, scrollView.frame.size.height +80, scrollView.frame.size.width, 30.0)];
        [alreadyButton setBackgroundColor:[UIColor blackColor]];
        [alreadyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [alreadyButton setTitle:@"ALREADY A MIXER? LOG IN HERE." forState:UIControlStateNormal];
        [alreadyButton.titleLabel setFont:[UIFont fontWithName:kFontBold size:14.0f]];
        [alreadyButton setSelected:NO];
        [self addSubview:alreadyButton];
        
    }
    
    return self;
}

- (void)changeButtonColor:(id)sender {
    
    UIButton* btn = (UIButton*)sender;
    if (btn.tag == 0) {
        btn.tag = 1;
        [btn setBackgroundColor:[UIColor blackColor]];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        finishButton.tag++;
    } else {
        btn.tag = 0;
        [btn setBackgroundColor:[UIColor whiteColor]];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        finishButton.tag--;
    }
    
    if (finishButton.tag>0) {
        [finishButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [finishButton setEnabled:TRUE];
        [skipButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [skipButton setEnabled:FALSE];
    }
    else {
        [finishButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [finishButton setEnabled:FALSE];
        [skipButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [skipButton setEnabled:TRUE];
    }
}



@end