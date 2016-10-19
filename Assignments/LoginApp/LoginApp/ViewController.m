//
//  ViewController.m
//  LoginApp
//
//  Created by ilabafrica on 11/08/2016.
//  Copyright © 2016 ilabafrica. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>


@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
//    loginButton.center = self.view.center;
//    [self.view addSubview:loginButton];
    
    
   
    
    
}
//-(void)toggleHiddenState:(BOOL)shouldHide{
//    self.home.hidden = shouldHide;
//    
//}

// Once the button is clicked, show the login dialog

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView
//{
//    ListViewController *dashBoard = [[ListViewController alloc]initWithNibName:@"ListViewController" bundle:nil];
//    [self.navigationController pushViewController:dashBoard animated:YES];
//   
//}
- (IBAction)home:(UIButton *)sender {
}
@end
