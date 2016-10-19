//
//  MapDirectionController.m
//  Tour Kenya
//
//  Created by  ilabadmin on 30/09/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import "MapDirectionController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface MapDirectionController ()

@end

@implementation MapDirectionController

NSString *place_longitude_1;
NSString *place_latitude_1;

@synthesize locationObject=_locationObject;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [GMSServices provideAPIKey:@"AIzaSyDTx77PuoEccymXy5yxUNPkVkL2MvWwz_E"];
    
    
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-1.3368043
                                                            longitude:36.7669058
                                                                 zoom:12];
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.myLocationEnabled = YES;
    self.view = mapView;
    
//    // Creates a marker in the center of the map.
//    GMSMarker *marker = [[GMSMarker alloc] init];
//    marker.position = CLLocationCoordinate2DMake(-1.3368043, 36.7669058);
//    marker.title = @"Sydney";
//    marker.snippet = @"Australia";
//    marker.map = mapView;
//    
//    
//    GMSMarker *marker2 = [[GMSMarker alloc] init];
//    marker2.position = CLLocationCoordinate2DMake(-1.3666613, 36.8311446);
//    marker2.title = @"Sydney";
//    marker2.snippet = @"Australia";
//    marker2.map = mapView;
//    
//    CLLocationCoordinate2D position = CLLocationCoordinate2DMake(51.5, -0.127);
//    GMSMarker *london = [GMSMarker markerWithPosition:position];
//    london.title = @"London";
//   
//    london.map = mapView;
    
    //GMSCameraPosition *cameraPosition=[GMSCameraPosition cameraWithLatitude:18.5203 longitude:73.8567 zoom:12];
    mapView =[GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.myLocationEnabled=YES;
    GMSMarker *marker=[[GMSMarker alloc]init];
    marker.position=CLLocationCoordinate2DMake(-1.3368043, 36.7669058);
    GMSMarker *marker2=[[GMSMarker alloc]init];
    marker.title = @"My Location";
    marker.icon = [GMSMarker markerImageWithColor:[UIColor brownColor]];
    
    place_latitude_1=[_locationObject objectForKey:@"latitude"];
    place_longitude_1=[_locationObject objectForKey:@"longitude"];

    marker2.position=CLLocationCoordinate2DMake([place_latitude_1 floatValue], [place_longitude_1 floatValue]);
    marker2.title = [_locationObject objectForKey:@"name"];
    marker2.icon = [GMSMarker markerImageWithColor:[UIColor brownColor]];
    //marker.icon=[UIImage imageNamed:@"aaa.png"] ;
    marker.groundAnchor=CGPointMake(0.5,0.5);
    marker.map=mapView;
    marker2.map=mapView;
    GMSMutablePath *path = [GMSMutablePath path];
    
    
    [path addCoordinate:CLLocationCoordinate2DMake(@(-1.3368043).doubleValue,@(36.7669058).doubleValue)];
    [path addCoordinate:CLLocationCoordinate2DMake(@([place_latitude_1 floatValue]).doubleValue,@([place_longitude_1 floatValue]).doubleValue)];
    
    GMSPolyline *rectangle = [GMSPolyline polylineWithPath:path];
    rectangle.strokeWidth = 2.f;
    rectangle.map = mapView;
    self.view=mapView;
    
    
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
