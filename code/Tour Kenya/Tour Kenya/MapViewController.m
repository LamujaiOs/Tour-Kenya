//
//  MapViewController.m
//  Tour Kenya
//
//  Created by  ilabadmin on 09/08/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import "MapViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize mapView=_mapView;
- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.mapView setDelegate:self];
       // Do any additional setup after loading the view.
    [GMSServices provideAPIKey:@"AIzaSyDTx77PuoEccymXy5yxUNPkVkL2MvWwz_E"];
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

//The above lines of code instructs the map view to zoom into a region that is 800 by 800 meters around the user’s location.


- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMake(userLocation.coordinate,MKCoordinateSpanMake(0.1f, 0.1f));
    [self.mapView setRegion:region animated:YES];
    
    // Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = userLocation.coordinate;
    point.title = @"Where am I?";
    point.subtitle = @"I'm here!!!";
    
    [self.mapView addAnnotation:point];
}
- (IBAction)setMap:(id)sender {
    switch (((UISegmentedControl *) sender).selectedSegmentIndex) {
        case 0:
            _mapView.mapType=MKMapTypeStandard;
            break;
        case 1:
            _mapView.mapType=MKMapTypeSatellite;
            break;

        case 2:
            _mapView.mapType=MKMapTypeHybrid;
            break;

            
        default:
            break;
    }
}
@end
