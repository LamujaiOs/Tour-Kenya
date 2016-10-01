//
//  PlacePreviewController.h
//  Tour Kenya
//
//  Created by  ilabadmin on 29/09/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlacePreviewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UITextView *placeDescription;
@property (strong, nonatomic) IBOutlet UILabel *placeName;


@property (nonatomic,strong) NSDictionary *placeObject;

@end

