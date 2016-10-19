//
//  MapViewController.h
//  LoginApp
//
//  Created by ilabafrica on 21/09/2016.
//  Copyright © 2016 ilabafrica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>



@interface MapViewController : UIViewController <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)zoomToCurrentLocation:(UIButton *)sender;
- (IBAction)sender:(UISegmentedControl *)sender;


@end
