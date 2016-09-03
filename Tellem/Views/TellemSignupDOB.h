//
// TellemSignupDOB.h
//  Tellem
//
//  Created by Ed Bayudan on 1/28/15.
//  Copyright (c) 2015 Tellem, LLC All rights reserved.
//

#import "DownPicker.h"

@interface TellemSignupDOB : UIView<UITextFieldDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIButton *removeViewButton;
@property (nonatomic, strong) UIButton *alreadyButton;
@property (nonatomic, strong) UIButton *finishButton, *skipButton;
@property (nonatomic, strong) UIButton *forgotPasswordButton;
@property (nonatomic, strong) UIButton *sportsButton, *newsButton,*musicButton;
@property (nonatomic, strong) UIButton *entertainmentButton, *lifestyleButton,*techscienceButton;
@property (nonatomic, strong) UIButton *artButton, *gamingButton,*foodButton;
@property (nonatomic, strong) UIButton *fashionButton, *outdoorsadventureButton;
@property (nonatomic, strong) DownPicker *monthPicker;
@property (nonatomic, strong) DownPicker *dayPicker;
@property (nonatomic, strong) DownPicker *yearPicker;
@property (nonatomic, strong) UITextField  *monthDOB;
@property (nonatomic, strong) UITextField *dayDOB;
@property (nonatomic, strong) UITextField *yearDOB;
@property (nonatomic, strong) UITextField *whoSeesMMDD;
@property (nonatomic, strong) UITextField *whoSeesMMDDYY;
@property (nonatomic, strong) DownPicker *whoSeesMMDDPicker;
@property (nonatomic, strong) DownPicker *whoSeesMMDDYYPicker;


- (id)initWithFrame:(CGRect)frame;


@end