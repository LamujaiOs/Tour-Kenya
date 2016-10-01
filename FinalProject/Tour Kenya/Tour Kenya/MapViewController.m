//
//  MapViewController.m
//  Tour Kenya
//
//  Created by  ilabadmin on 09/08/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import "MapViewController.h"
#import "MapDirectionController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface MapViewController ()

@end

@implementation MapViewController

NSMutableArray *myObject_d;

// A dictionary object
NSDictionary *dict_d;

// Define keys
NSString *placeid_d;
NSString *name_d;
NSString *imagePlace_d;
NSString *longitude_d;
NSString *latitude_d;
NSString *description_d;


@synthesize mapView=_mapView;
@synthesize locationManager;
- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.mapView setDelegate:self];
       // Do any additional setup after loading the view.
    [GMSServices provideAPIKey:@"AIzaSyDTx77PuoEccymXy5yxUNPkVkL2MvWwz_E"];
    
    
//    NSString *theLocation = [NSString stringWithFormat:@"latitude: %f longitude: %f", locationManager.location.coordinate.latitude, locationManager.location.coordinate.longitude];
//    
//    locationManager = [[CLLocationManager alloc] init];
//    locationManager.distanceFilter = kCLDistanceFilterNone;
//    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
//    [locationManager startUpdatingLocation];
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-1.273966
                                                            longitude:36.8122993
                                                                 zoom:7];
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.myLocationEnabled = YES;
    self.view = mapView;
    
    // Creates a marker in the center of the map.
    
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(-1.3089643,36.8108885);
    marker.title = @"My Location";
     marker.icon = [GMSMarker markerImageWithColor:[UIColor blueColor]];
    marker.map = mapView;

    
    name_d = @"name";
    placeid_d = @"place_id";
    imagePlace_d = @"image";
    longitude_d=@"longitude";
    latitude_d=@"latitude";
    description_d=@"description";
    
    myObject_d = [[NSMutableArray alloc] init];
    
    
    
    NSError *error;
    NSString *url_string = [NSString stringWithFormat: @"http://balequip.stazal.com/tourkenya/placeskenya.php"];
    NSLog(@"json: %@", url_string);
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
    //NSLog(@"json: %@", data);
    NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSLog(@"json: %@", json);
    
    
    for (NSDictionary *dataDict in json) {
        
        NSString *strName = [dataDict objectForKey:@"name"];
        NSString *strPlaceid = [dataDict objectForKey:@"place_id"];
        NSString *strImage = [dataDict objectForKey:@"image"];
        NSString *strLongitude = [dataDict objectForKey:@"longitude"];
        NSString *strLatitude = [dataDict objectForKey:@"latitude"];
        NSString *strDescription = [dataDict objectForKey:@"description"];
        
       
        dict_d = [NSDictionary dictionaryWithObjectsAndKeys:
                strName, name_d,
                strPlaceid, placeid_d,
                strImage, imagePlace_d,
                strLongitude,longitude_d,
                strLatitude,latitude_d,
                strDescription,description_d,
                nil];
        [myObject_d addObject:dict_d];
        
    }
    
    int count = [myObject_d count];
    for (int i=0; i<count; i++) {
        
        NSDictionary *temp=[myObject_d objectAtIndex:i];
        NSString *latitude=[temp objectForKey:@"latitude"];
        NSString *longitude=[temp objectForKey:@"longitude"];
        NSString *name=[temp objectForKey:@"name"];
        
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake([latitude floatValue],[longitude floatValue]);
        marker.title = name;
        marker.icon = [GMSMarker markerImageWithColor:[UIColor brownColor]];
        marker.map = mapView;
        
    }

    
    
    
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
- (void)mapView:(GMSMapView *)mapView
    didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
    NSLog(@"You tapped at %f,%f", coordinate.latitude, coordinate.longitude);
    
}
@end
