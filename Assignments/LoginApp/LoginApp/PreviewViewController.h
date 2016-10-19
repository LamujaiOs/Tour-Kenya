//
//  PreviewViewController.h
//  LoginApp
//
//  Created by ilabafrica on 11/08/2016.
//  Copyright © 2016 ilabafrica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Events.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>

@interface PreviewViewController : UIViewController
@property(weak, nonatomic) Events *Events;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblDetails;


@end
