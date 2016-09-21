//
//  MixHomeViewController.h
//  Tellem
//
//  Created by Ed Bayudan on 25/03/14.
//  Copyright (c) 2014 Tellem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+ImageEffects.h"
#import "AddCirclesViewController.h"
#import "PAPProfileImageView.h"
#import "HomePhotoDetailsViewController.h"
#import "TTTTimeIntervalFormatter.h"
#import "TellemUtility.h"
#import "DataReceiver.h"
#import "TNCircularRadioButton.h"
#import "TNRadioButtonGroup.h"
#import "TellemAddToRegistry.h"
#import "TellemBuildCustomRegistry.h"
#import "TellemUserCustomRegistry.h"

@interface MixHomeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UITextFieldDelegate>{
    
    UIWebView *webView;
}
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UITableView *netWorkTable;
@property (nonatomic, strong) IBOutlet UINavigationItem *navItem;
@property (nonatomic, retain) NSMutableArray *userCircle;
@property (weak, nonatomic) IBOutlet UITableView *circleTableView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property PFObject *pageCircle;
@property NSUInteger pageIndex;
@property NSString *titleText;
@property (nonatomic) NSString *selectFBUserid;
@property (nonatomic) NSString *selectFBUserName;
@property (strong, nonatomic) IBOutlet UIImageView *activityImageView;
@property (strong, nonatomic) IBOutlet UILabel *activityUserId;
@property (strong, nonatomic) IBOutlet UILabel *activityInitialComment;
@property (strong, nonatomic) UIButton *circleAvatar;
@property (strong, nonatomic)  UILabel *posterNameLabel;
@property (nonatomic, strong) UILabel *postTimestampLabel;
@property (nonatomic, strong) UILabel *postLatestCommentsLabel;
@property NSDictionary *pushPayload;
@property TellemGlobals *tM;
@property (weak, nonatomic) IBOutlet UILabel *quickAddLabel;
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *productLabel;
@property (weak, nonatomic) IBOutlet UITextField *productDescription;
@property (weak, nonatomic) IBOutlet UITextField *productURL;
@property (weak, nonatomic) IBOutlet UITextField *productPrice;
@property (weak, nonatomic) IBOutlet UITextField *productName;
@property (weak, nonatomic) IBOutlet UILabel *productDesirability;
@property (weak, nonatomic) IBOutlet UIButton *productComplete;
@property (weak, nonatomic) IBOutlet UILabel *customGiftLabel;
@property (weak, nonatomic) IBOutlet UILabel *giftSuggestLabel;
@property (weak, nonatomic) IBOutlet UILabel *groceryXChngLabel;
@property (weak, nonatomic) IBOutlet UILabel *customLabelOne;
@property (weak, nonatomic) IBOutlet UILabel *customLabelTwo;
@property (weak, nonatomic) IBOutlet UILabel *customLabelThree;
@property (nonatomic, strong) TNRadioButtonGroup *desirabilityGroup;
@property (nonatomic, strong) TNCircularRadioButtonData *needProduct;
@property (nonatomic, strong) TNCircularRadioButtonData *wantProduct;
@property (nonatomic, strong) TNCircularRadioButtonData *loveProduct;
@property (nonatomic, strong) TellemAddToRegistry *tellemAddToRegistry;
@property (nonatomic, strong) TellemUserCustomRegistry *tellemUserCustomRegistry;
@property (nonatomic, strong) TellemBuildCustomRegistry *tellemBuildCustomRegistry;
@property UIVisualEffectView *blurEffectView;



- (IBAction)completeBtnTouched:(id)sender;

@end
