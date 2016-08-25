//
//  NewCGRView.m
//  Coolmix
//
//  Created by Ed Bayudan on 1/28/15.
//  Copyright (c) 2015 Tellem, LLC All rights reserved.
//

#import "NewCGRView.h"


@interface NewCGRView ()
@end


@implementation NewCGRView
@synthesize scrollView;
@synthesize inputBackgroundImageView;
@synthesize inputBackgroundImage;
@synthesize removeViewButton;
@synthesize inputCGRName, inputCGRDescription, addNewCGRButton;

#pragma mark - Initialization

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        self.layer.cornerRadius = 0.0;
        self.layer.borderWidth = 0.0;
        scrollView=[[TPKeyboardAvoidingScrollView alloc]initWithFrame:CGRectMake(30, 60, self.frame.size.width-60, self.frame.size.height-110)];
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
        signupLabel.text = @"NEW COOLMIX REGISTRY";
        signupLabel.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:signupLabel];
        
        float nameWidth = scrollView.frame.size.width - 40;
        UILabel *fNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, nameWidth - 2.5, 20)];
        [fNameLabel setTextColor:[UIColor blackColor]];
        [fNameLabel setBackgroundColor:[UIColor clearColor]];
        [fNameLabel setFont:[UIFont fontWithName: kFontBold size: 10.0f]];
        fNameLabel.text = @"REGISTRY NAME";
        [scrollView addSubview:fNameLabel];
        
        inputCGRName = [[UITextField alloc] initWithFrame:CGRectMake(20, 90, nameWidth - 2.5, 30)];
        inputCGRName.backgroundColor = [UIColor whiteColor];
        inputCGRName.layer.borderWidth = 0.5;
        [inputCGRName setTextColor:[UIColor blackColor]];
        [inputCGRName setFont:[UIFont fontWithName:kFontNormal size:14.0f]];
        inputCGRName.delegate=self;
        inputCGRName.userInteractionEnabled=YES;
        [scrollView addSubview:inputCGRName];
        
        UILabel *userLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 130, scrollView.frame.size.width - 40, 40)];
        [userLabel setTextColor:[UIColor blackColor]];
        [userLabel setBackgroundColor:[UIColor clearColor]];
        [userLabel setFont:[UIFont fontWithName: kFontBold size: 10.0f]];
        userLabel.text = @"DESCRIPTION";
        [scrollView addSubview:userLabel];
        
        inputCGRDescription = [[UITextView alloc] initWithFrame:CGRectMake(20, 160, scrollView.frame.size.width - 40, 60)];
        inputCGRDescription.backgroundColor = [UIColor whiteColor];
        inputCGRDescription.layer.borderWidth = 0.5;
        [inputCGRDescription setTextColor:[UIColor blackColor]];
        [inputCGRDescription setFont:[UIFont fontWithName:kFontNormal size:14.0f]];
        inputCGRDescription.userInteractionEnabled=YES;
        inputCGRDescription.textAlignment = NSTextAlignmentLeft;
        [scrollView addSubview:inputCGRDescription];

        addNewCGRButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [addNewCGRButton setFrame:CGRectMake(scrollView.frame.size.width - 100, 260, 80, 25)];
        [addNewCGRButton setBackgroundColor:[UIColor blackColor]];
        [addNewCGRButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [addNewCGRButton setTitle:@"CREATE IT!" forState:UIControlStateNormal];
        [addNewCGRButton.titleLabel setFont:[UIFont fontWithName:kFontBold size:14.0f]];
        [addNewCGRButton setSelected:NO];
        addNewCGRButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [scrollView addSubview:addNewCGRButton];
        
    }
    
    return self;
}

-(UIToolbar*)configureKeyboardToolbars: (UITextField*) textField
{
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f,self.window.frame.size.width, 40.0f)];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        toolBar.barTintColor = [UIColor grayColor];
        toolBar.tintColor = [UIColor colorWithRed:0.6f green:0.6f blue:0.64f alpha:1.0f];
    }
    else
    {
        toolBar.barTintColor = [UIColor grayColor];
        toolBar.tintColor = [UIColor colorWithRed:0.6f green:0.6f blue:0.64f alpha:1.0f];
    }
    toolBar.translucent = NO;
    toolBar.items =   @[ [[UIBarButtonItem alloc] initWithTitle:@"."
                                                          style:UIBarButtonItemStyleBordered
                                                         target:self
                                                         action:@selector(barButtonAddText:)],
                         [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                       target:nil
                                                                       action:nil],
                         [[UIBarButtonItem alloc] initWithTitle:@"@"
                                                          style:UIBarButtonItemStyleBordered
                                                         target:self
                                                         action:@selector(barButtonAddText:)],
                         [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                       target:nil
                                                                       action:nil],
                         [[UIBarButtonItem alloc] initWithTitle:@"_"
                                                          style:UIBarButtonItemStyleBordered
                                                         target:self
                                                         action:@selector(barButtonAddText:)],
                         [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                       target:nil
                                                                       action:nil],
                         [[UIBarButtonItem alloc] initWithTitle:@"#"
                                                          style:UIBarButtonItemStyleBordered
                                                         target:self
                                                         action:@selector(barButtonAddText:)],
                         [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                       target:nil
                                                                       action:nil],
                         [[UIBarButtonItem alloc] initWithTitle:@"$"
                                                          style:UIBarButtonItemStyleBordered
                                                         target:self
                                                         action:@selector(barButtonAddText:)],
                         [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                       target:nil
                                                                       action:nil],
                         [[UIBarButtonItem alloc] initWithTitle:@"("
                                                          style:UIBarButtonItemStyleBordered
                                                         target:self
                                                         action:@selector(barButtonAddText:)],
                         [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                       target:nil
                                                                       action:nil],
                         [[UIBarButtonItem alloc] initWithTitle:@")"
                                                          style:UIBarButtonItemStyleBordered
                                                         target:self
                                                         action:@selector(barButtonAddText:)],
                         [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                       target:nil
                                                                       action:nil],
                         [[UIBarButtonItem alloc] initWithTitle:@"_"
                                                          style:UIBarButtonItemStyleBordered
                                                         target:self
                                                         action:@selector(barButtonAddText:)],
                         [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                       target:nil
                                                                       action:nil],
                         [[UIBarButtonItem alloc] initWithTitle:@"*"
                                                          style:UIBarButtonItemStyleBordered
                                                         target:self
                                                         action:@selector(barButtonAddText:)],
                         [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                       target:nil
                                                                       action:nil],
                         [[UIBarButtonItem alloc] initWithTitle:@"+"
                                                          style:UIBarButtonItemStyleBordered
                                                         target:self
                                                         action:@selector(barButtonAddText:)],
                         [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                       target:nil
                                                                       action:nil],
                         ];
    
    return toolBar;
}

-(IBAction)barButtonAddText:(UIBarButtonItem*)sender
{
    if (self.inputCGRName.isFirstResponder)
    {
        [self.inputCGRName insertText:sender.title];
    }
}



@end
