//
//  PreviewViewController.m
//  LoginApp
//
//  Created by ilabafrica on 11/08/2016.
//  Copyright © 2016 ilabafrica. All rights reserved.
//

#import "PreviewViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>

@interface PreviewViewController ()

@end

@implementation PreviewViewController
@synthesize Events=_Events;
@synthesize image=_image;
@synthesize lblName=_lblName;
@synthesize lblDetails=_lblDetails;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_image setImage: [UIImage imageNamed: _Events.image]];
    [_lblName setText: _Events.name];
    [_lblDetails setText: _Events.details];
    
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    content.contentTitle= _Events.name;
    content.contentDescription= _Events.details;
    //content.photos=_Events.image;
//    NSURL *imageURL =
//    [NSURL URLWithString:@"hike.jpg"];
    
    content.contentURL = [NSURL
                          URLWithString:@"https://www.facebook.com"], [UIImage imageNamed:_Events.name];
    //content.imageURL=[NSURL URLWithString:@"wed.jpg"];
    //content.image= _Events.image;
    FBSDKShareButton *shareButton = [[FBSDKShareButton alloc] init];
    shareButton.shareContent = content;
//    shareButton.shareContent=_lblName;
    shareButton.center = self.view.center;
    [self.view addSubview:shareButton];
    
    
    

}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
