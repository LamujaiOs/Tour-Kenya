//
//  MapViewController.h
//  Tour Kenya
//
//  Created by  ilabadmin on 09/08/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)setMap:(id)sender;

@end
