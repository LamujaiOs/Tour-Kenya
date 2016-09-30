//
//  PlaceDetailsViewController.m
//  Tour Kenya
//
//  Created by  ilabadmin on 09/08/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import "PlaceDetailsViewController.h"
#import "PlacePreviewController.h"
@interface PlaceDetailsViewController ()

@end

@implementation PlaceDetailsViewController


NSMutableArray *myObject;

// A dictionary object
NSDictionary *dict;

// Define keys
NSString *placeid;
NSString *name;
NSString *imagePlace;
NSString *longitude;
NSString *latitude;
NSString *description;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    

    name = @"name";
    placeid = @"place_id";
    imagePlace = @"image";
    longitude=@"longitude";
    latitude=@"latitude";
    description=@"description";
    
    myObject = [[NSMutableArray alloc] init];
    
    
    
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
        
                   dict = [NSDictionary dictionaryWithObjectsAndKeys:
                           strName, name,
                           strPlaceid, placeid,
                           strImage, imagePlace,
                           strLongitude,longitude,
                           strLatitude,latitude,
                           strDescription,description,
                                        nil];
                   [myObject addObject:dict];
                
               }
    
   // NSLog(@"Data: ", myObject);
   
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


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return myObject.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        // Use the default cell style.
        cell = [[[UITableViewCell alloc] initWithStyle : UITableViewCellStyleSubtitle
                 
                                       reuseIdentifier : CellIdentifier] autorelease];
        
    }
    
    NSDictionary *tmpDict = [myObject objectAtIndex:indexPath.row];
    NSMutableString *text;
    
    text = [NSString stringWithFormat: [tmpDict objectForKey:name]];
    NSLog(@"Text:",text);
    cell.textLabel.text = text;
    
    NSMutableString *detail;
    detail = [NSString stringWithFormat:@"Location : %@ , Mobile : %@"
              
              
              
              ,[tmpDict objectForKey:name]
              
              
              
              ,[tmpDict objectForKey:placeid]];
    
     cell.detailTextLabel.text= [tmpDict objectForKey:imagePlace];
    //cell.imageView.image = [UIImage imageNamed:@"default.JPG"];
        NSMutableString *imageUrl;
    imageUrl=[NSString stringWithFormat: [tmpDict objectForKey:imagePlace]];
    NSLog(@"Image Url",imageUrl.length);
    if([imageUrl isEqualToString:@" "]){
        cell.imageView.image = [UIImage imageNamed:@"default.JPG"];
    }else{
        [cell.imageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[tmpDict objectForKey:imagePlace]]]]];
        //cell.imageView.image = [UIImage imageNamed:@"default.JPG"];
    }
    
    
    return cell;
    

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"preview"]) {
        NSIndexPath *indexPath = [self.placesTable indexPathForSelectedRow];
        PlacePreviewController *destViewController = segue.destinationViewController;
        destViewController.placeObject=[myObject objectAtIndex:indexPath.row];
   }
}




@end
