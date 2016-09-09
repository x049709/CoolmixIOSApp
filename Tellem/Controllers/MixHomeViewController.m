//
//  MixHomeViewController.m
//  Tellem
//
//  Created by Ed Bayudan on 25/03/14.
//  Copyright (c) 2014 Tellem. All rights reserved.
//

#import "MixHomeViewController.h"
#import "PAPSettingsActionSheetDelegate.h"
#import "PAPSettingsButtonItem.h"
#import "PAPUtility.h"
#import "AppDelegate.h"
#import "MBProgressHUD.h"
#import "PostSharingViewController.h"
#import "PAPLoadMoreCell.h"
#import "UITableView+DragLoad.h"
#import "MixGSRViewController.h"

@interface MixHomeViewController ()
{
    UITextField *addCircleTextField;
}
@property (nonatomic, strong) PAPSettingsActionSheetDelegate *settingsActionSheetDelegate;
@property (nonatomic) NSArray *sortedCircleNames;
@property (nonatomic) NSArray *circleUserIds;
@property (nonatomic) NSArray *sortedUserActivities;
@property (nonatomic, strong) TTTTimeIntervalFormatter *timeIntervalFormatter;
@property NSUInteger userActivityCount;


@end

@implementation MixHomeViewController
{
    NSMutableArray *menuList;
}
@synthesize sortedCircleNames,circleUserIds,sortedUserActivities,circleTableView,titleText, titleLabel,pageCircle,pushPayload,scrollView;
@synthesize activityImageView,activityUserId,activityInitialComment,circleAvatar,netWorkTable;
@synthesize posterNameLabel,postTimestampLabel,postLatestCommentsLabel,timeIntervalFormatter,pageIndex, tM;
@synthesize quickAddLabel, customGiftLabel, giftSuggestLabel, groceryXChngLabel, customLabelOne, customLabelTwo, customLabelThree;
@synthesize productImageView,productLabel,productDescription,productURL,productPrice,productName,
    productDesirability,needProduct,wantProduct, loveProduct, productComplete,desirabilityGroup;

- (void)viewDidLoad
{
    //MWLogDebug(@"\nMixHomeViewController viewDidLoad started.");
    [super viewDidLoad];
    self.tM = [TellemGlobals globalsManager];    
    menuList = [NSMutableArray arrayWithObjects:@"custom_gift_circle_more.png",  @"gifting_suggestions.png", @"grocery_exchange.png",@"custom_gift_circle_more.png", @"gifting_suggestions_more.png", @"grocery_exchange_more.png", nil];

}

- (void)viewWillAppear:(BOOL)animated
{
    //MWLogDebug(@"\nMixHomeViewController viewWillAppear started.");
    [super viewWillAppear:animated];
    self.tM.gCurrentTab = 0;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.netWorkTable setBackgroundColor:[UIColor whiteColor]];
    
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],
                              NSFontAttributeName:[UIFont fontWithName:kFontNormal size:22.0] }];
    self.navigationItem.title=@"HOME";
    self.navigationItem.rightBarButtonItem = [[PAPSettingsButtonItem alloc] initWithTarget:self action:@selector(settingsButtonAction:)];
    //Reset tab bar notification
    MokriyaUITabBarController *tabBarController = [(AppDelegate*)[[UIApplication sharedApplication] delegate] tabBarController];
    if (tabBarController.hasNotifications) {
        tabBarController.hasNotifications = NO;
        [tabBarController customizeTabBar:0];
    }
    
    self.titleLabel.frame=CGRectMake(15.0f, 10.0f, self.view.frame.size.width - 30.0f, 50.0f);
    self.titleLabel.layer.cornerRadius = 0.0;
    self.titleLabel.layer.borderWidth = 1.0;
    self.titleLabel.layer.borderColor = [UIColor clearColor].CGColor;
    self.titleLabel.layer.backgroundColor =[UIColor blackColor].CGColor;
    self.titleLabel.textAlignment = NSTextAlignmentRight;
    NSString *mixTitle = [NSString stringWithFormat:@"%@\t", @"THE MIX"];
    self.titleLabel.text = mixTitle;
    self.titleLabel.textColor = [UIColor whiteColor];
    [self.titleLabel setFont:[UIFont fontWithName:kFontBold size:40.0f]];
    [self.view addSubview:titleLabel];

    self.scrollView.frame = CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y + 60.0f,self.view.bounds.size.width,self.view.bounds.size.height);
    [scrollView setContentSize:CGSizeMake(scrollView.bounds.size.width, scrollView.bounds.size.height+250)];
    [self.view addSubview:scrollView];
   
    self.quickAddLabel.frame = CGRectMake(15.0f, 10.0f, self.view.frame.size.width - 30.0f, 230.0f);
    self.quickAddLabel.textAlignment = NSTextAlignmentCenter;
    self.quickAddLabel.textColor = [UIColor whiteColor];
    [self.quickAddLabel setFont:[UIFont fontWithName:kFontBold size:40.0f]];
    self.quickAddLabel.backgroundColor = [UIColor blackColor];
    [self.scrollView addSubview:self.quickAddLabel];

    self.productImageView.frame = CGRectMake(10.0f, 5.0f, 80.0f, 80.0f);
    self.productImageView.layer.cornerRadius = 40.0;
    self.productImageView.layer.borderWidth = 1.0;
    [self.productImageView setImage:[UIImage imageNamed:@"user.png"]];
    [self.quickAddLabel addSubview:self.productImageView];
    
    self.productLabel.frame = CGRectMake(95.0f, 5.0f, self.quickAddLabel.frame.size.width - 100.0f, 40.0f);
    [self.productLabel setTextColor:[UIColor whiteColor]];
    [self.productLabel setBackgroundColor:[UIColor blackColor]];
    [self.productLabel setFont:[UIFont fontWithName: kFontBold size: 14.0f]];
    self.productLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.productLabel.numberOfLines = 0;
    self.productLabel.text = @"SEE SOMETHING YOU WANT?\nADD IT TO A REGISTRY.";
    self.productLabel.textAlignment = NSTextAlignmentRight;
    [self.quickAddLabel addSubview:self.productLabel];

    int sVWidth = self.scrollView.frame.size.width;
    self.productName.frame = CGRectMake(130.0f, 60.0f, sVWidth - 150.0f, 30.0f);
    self.productName.backgroundColor = [UIColor whiteColor];
    [self.productName setTextColor:[UIColor blackColor]];
    [self.productName setFont:[UIFont fontWithName:kFontNormal size:14.0f]];
    self.productName.placeholder = @"Name of product";
    [self.productName setBorderStyle:UITextBorderStyleNone];
    self.productName.delegate=self;
    self.productName.userInteractionEnabled=YES;
    [self.scrollView addSubview:self.productName];
    
    self.productURL.frame = CGRectMake(30.0f, 100.0f, sVWidth - 130.0f, 30.0f);
    self.productURL.backgroundColor = [UIColor whiteColor];
    [self.productURL setTextColor:[UIColor blackColor]];
    [self.productURL setFont:[UIFont fontWithName:kFontNormal size:14.0f]];
    [self.productURL setBorderStyle:UITextBorderStyleNone];
    self.productURL.placeholder = @"Product link (optional)";
    self.productURL.delegate=self;
    self.productURL.userInteractionEnabled=YES;
    [self.scrollView addSubview:self.productURL];
    
    self.productPrice.frame = CGRectMake(230, 100, 70, 30.0f);
    self.productPrice.backgroundColor = [UIColor whiteColor];
    [self.productPrice setTextColor:[UIColor blackColor]];
    self.productPrice.textAlignment = NSTextAlignmentCenter;
    [self.productPrice setFont:[UIFont fontWithName:kFontNormal size:14.0f]];
    [self.productPrice setBorderStyle:UITextBorderStyleNone];
    self.productPrice.placeholder = @"$0.00";
    self.productPrice.delegate=self;
    self.productPrice.userInteractionEnabled=YES;
    [self.scrollView addSubview:self.productPrice];
    
    self.productDescription.frame = CGRectMake(30.0f, 140.0f, sVWidth - 50.0f, 30.0f);
    self.productDescription.backgroundColor = [UIColor whiteColor];
    [self.productDescription setTextColor:[UIColor blackColor]];
    [self.productDescription setFont:[UIFont fontWithName:kFontNormal size:14.0f]];
    [self.productDescription setBorderStyle:UITextBorderStyleNone];
    self.productDescription.placeholder = @"Product description";
    self.productDescription.delegate=self;
    self.productDescription.userInteractionEnabled=YES;
    [self.scrollView addSubview:self.productDescription];
    
    self.productDesirability.frame = CGRectMake(25.0f, 180.0f, sVWidth -200.0f, 30.0f);
    self.productDesirability.textAlignment = NSTextAlignmentCenter;
    self.productDesirability.text = @"LEVEL OF DESIRE";
    [self.productDesirability setTextColor:[UIColor whiteColor]];
    [self.productDesirability setBackgroundColor:[UIColor blackColor]];
    [productDesirability setFont:[UIFont fontWithName:kFontBold size:14.0f]];
    [self.scrollView addSubview:self.productDesirability];
    
    [self createDesirabilityGroup];
    
    //self.productComplete = [UIButton buttonWithType:UIButtonTypeCustom];
    self.productComplete.frame = CGRectMake(255, 185, 45, 40);
    [self.productComplete setBackgroundColor:[UIColor whiteColor]];
    [self.productComplete setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.productComplete setTitle:@"GO!" forState:UIControlStateNormal];
    [self.productComplete.titleLabel setFont:[UIFont fontWithName:kFontBold size:14.0f]];
    [self.productComplete setSelected:NO];
    self.productComplete.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [self.scrollView addSubview:self.productComplete];
    

    
    self.customGiftLabel.frame = CGRectMake(15.0f, 250.0f, self.view.frame.size.width - 30.0f, 50.0f);
    customGiftLabel.textAlignment = NSTextAlignmentCenter;
    customGiftLabel.text = @"CUSTOM GIFT CIRCLE";
    customGiftLabel.textColor = [UIColor whiteColor];
    [customGiftLabel setFont:[UIFont fontWithName:kFontBold size:40.0f]];
    customGiftLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"custom_gift_circle_more.png"]];
    [self.scrollView addSubview:customGiftLabel];
    
    self.giftSuggestLabel.frame = CGRectMake(15.0f, 310.0f, self.view.frame.size.width - 30.0f, 50.0f);
    giftSuggestLabel.textAlignment = NSTextAlignmentCenter;
    giftSuggestLabel.text = @"GIFT SUGGESTIONS";
    giftSuggestLabel.textColor = [UIColor whiteColor];
    [giftSuggestLabel setFont:[UIFont fontWithName:kFontBold size:40.0f]];
    giftSuggestLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"gifting_suggestions.png"]];
    [self.scrollView addSubview:giftSuggestLabel];
    
    self.groceryXChngLabel.frame = CGRectMake(15.0f, 370.0f, self.view.frame.size.width - 30.0f, 50.0f);
    groceryXChngLabel.textAlignment = NSTextAlignmentCenter;
    groceryXChngLabel.text = @"GLOBAL GROCERY EXCHANGE";
    groceryXChngLabel.textColor = [UIColor whiteColor];
    [groceryXChngLabel setFont:[UIFont fontWithName:kFontBold size:40.0f]];
    groceryXChngLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"grocery_exchange.png"]];
    [self.scrollView addSubview:groceryXChngLabel];
    
    self.customLabelOne.frame = CGRectMake(15.0f, 420.0f, self.view.frame.size.width - 30.0f, 50.0f);
    customLabelOne.textAlignment = NSTextAlignmentCenter;
    customLabelOne.text = @"CUSTOM OPTION ONE";
    customLabelOne.textColor = [UIColor whiteColor];
    [customLabelOne setFont:[UIFont fontWithName:kFontBold size:40.0f]];
    customLabelOne.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"custom_gift_circle_more.png"]];
    [self.scrollView addSubview:customLabelOne];
    
    self.customLabelTwo.frame = CGRectMake(15.0f, 480.0f, self.view.frame.size.width - 30.0f, 50.0f);
    customLabelTwo.textAlignment = NSTextAlignmentCenter;
    customLabelTwo.text = @"CUSTOM OPTION TWO";
    customLabelTwo.textColor = [UIColor whiteColor];
    [customLabelTwo setFont:[UIFont fontWithName:kFontBold size:40.0f]];
    customLabelTwo.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"gifting_suggestions.png"]];
    [self.scrollView addSubview:customLabelTwo];
    
    self.customLabelThree.frame = CGRectMake(15.0f, 540.0f, self.view.frame.size.width - 30.0f, 50.0f);
    customLabelThree.textAlignment = NSTextAlignmentCenter;
    customLabelThree.text = @"CUSTOM OPTION THREE";
    customLabelThree.textColor = [UIColor whiteColor];
    [customLabelThree setFont:[UIFont fontWithName:kFontBold size:40.0f]];
    customLabelThree.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"grocery_exchange.png"]];
    [self.scrollView addSubview:customLabelThree];
    
}

- (void)createDesirabilityGroup {
    self.needProduct = [TNCircularRadioButtonData new];
    self.needProduct.labelText = @"NEED";
    self.needProduct.identifier = @"NEED";
    self.needProduct.selected = YES;
    self.needProduct.borderRadius = 10;
    self.needProduct.circleRadius = 5;
    [self.needProduct setCircleActiveColor:[UIColor greenColor]];
    [self.needProduct setCirclePassiveColor:[UIColor whiteColor]];
    [self.needProduct setBorderActiveColor:[UIColor whiteColor]];
    [self.needProduct setBorderPassiveColor:[UIColor whiteColor]];
    [self.needProduct setLabelActiveColor:[UIColor greenColor]];
    [self.needProduct setLabelPassiveColor:[UIColor whiteColor]];
    
    self.wantProduct = [TNCircularRadioButtonData new];
    self.wantProduct.labelText = @"WANT";
    self.wantProduct.identifier = @"WANT";
    self.wantProduct.selected = NO;
    self.wantProduct.borderRadius = 10;
    self.wantProduct.circleRadius = 5;
    self.wantProduct.circleActiveColor = [UIColor greenColor];
    self.wantProduct.circlePassiveColor = [UIColor whiteColor];
    self.wantProduct.borderActiveColor = [UIColor whiteColor];
    self.wantProduct.borderPassiveColor = [UIColor whiteColor];
    self.wantProduct.labelActiveColor = [UIColor greenColor];
    self.wantProduct.labelPassiveColor = [UIColor whiteColor];
    
    self.loveProduct = [TNCircularRadioButtonData new];
    self.loveProduct.labelText = @"LOVE";
    self.loveProduct.identifier = @"LOVE";
    self.loveProduct.selected = NO;
    self.loveProduct.borderRadius = 10;
    self.loveProduct.circleRadius = 5;
    self.loveProduct.circleActiveColor = [UIColor greenColor];
    self.loveProduct.circlePassiveColor = [UIColor whiteColor];
    self.loveProduct.borderActiveColor = [UIColor whiteColor];
    self.loveProduct.borderPassiveColor = [UIColor whiteColor];
    self.loveProduct.labelActiveColor = [UIColor greenColor];
    self.loveProduct.labelPassiveColor = [UIColor whiteColor];
    
    self.desirabilityGroup = [[TNRadioButtonGroup alloc] initWithRadioButtonData:@[self.needProduct, self.wantProduct, self.loveProduct] layout:TNRadioButtonGroupLayoutHorizontal];
    self.desirabilityGroup.identifier = @"Desirability";
    [self.desirabilityGroup create];
    self.desirabilityGroup.marginBetweenItems = 0;
    int sVWidth = self.scrollView.frame.size.width;
    self.desirabilityGroup.frame = CGRectMake(30.0f, 210.0f, sVWidth -120.0f, 30.0f);

    [self.scrollView addSubview:self.desirabilityGroup];
    
}



- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)settingsButtonAction:(id)sender
{
    self.settingsActionSheetDelegate = [[PAPSettingsActionSheetDelegate alloc] initWithNavigationController:self.navigationController];
    UIActionSheet *actionSheetSetting = [[UIActionSheet alloc] initWithTitle:nil delegate:self.settingsActionSheetDelegate cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"My profile", @"Settings",@"Log out", nil];
    
    [actionSheetSetting showFromTabBar:self.tabBarController.tabBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark UItableView DataSource Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5.0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return menuList.count;
}

- (void)finishRefresh
{
}

- (void)dragTableDidTriggerRefresh:(UITableView *)tableView
{
    //send refresh request(generally network request) here
    [self performSelector:@selector(finishRefresh) withObject:nil afterDelay:2];
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID= @"MixHomeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSString *imageName = [menuList objectAtIndex:indexPath.row];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    imageView.frame= CGRectMake(5.0f, 0.0f, self.netWorkTable.frame.size.width - 10.0, 75.0f);
    [cell addSubview:imageView];

    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove separator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath == 0) {
        
    }
    else {
        //MWLogDebug(@"\nMixHomeViewController didSelectRowAtIndexPath started.");
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Coolmix" bundle: nil];
        MixGSRViewController *mixGSRViewController = [sb instantiateViewControllerWithIdentifier:@"MixGSRViewController"];
        self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
        [self.navigationController pushViewController:mixGSRViewController animated:YES];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0;
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
