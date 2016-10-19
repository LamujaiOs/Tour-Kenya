//
//  PlacePreviewController.m
//  Tour Kenya
//
//  Created by  ilabadmin on 29/09/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import "PlacePreviewController.h"
#import "MapDirectionController.h"

@interface PlacePreviewController ()

@end

@implementation PlacePreviewController
 NSString *title;
 NSString *imageUrl;
 NSString *place_description;
 NSString *place_longitude;
 NSString *place_latitude;



@synthesize placeObject=_placeObject;
@synthesize placeName=_placeName;
@synthesize image=_image;
@synthesize placeDescription=_placeDescription;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    title=[_placeObject objectForKey:@"name"];
    _placeName.text=title;
    
    place_description=[_placeObject objectForKey:@"description"];
    _placeDescription.text=place_description;
    
//    place_latitude=[_placeObject objectForKey:@"latitude"];
//    place_longitude=[_placeObject objectForKey:@"lonitude"];
    
    imageUrl=[_placeObject objectForKey:@"image"];
    NSLog(@"url: ",imageUrl);
   
    _image.image = [UIImage imageNamed:@"default.JPG"];
    
//    NSData *data = [[NSData alloc] initWithContentsOfURL:imageUrl];
//    UIImage *image_place = [[UIImage alloc] initWithData:data];
//    [_image setImage:image_place];
//    if([imageUrl isEqualToString:@" "]){
//        _image.image = [UIImage imageNamed:@"default.JPG"];
//    }else{
//        [_image setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:@"http://balequip.stazal.com/tourkenya/img/national_museum.jpg"]]];
//       
//    }
    
    
    
   
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
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"direction"]) {
      
        MapDirectionController *destViewController = segue.destinationViewController;
        destViewController.locationObject=_placeObject;
    }
}


@end
