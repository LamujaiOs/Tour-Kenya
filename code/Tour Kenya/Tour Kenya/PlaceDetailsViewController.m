//
//  PlaceDetailsViewController.m
//  Tour Kenya
//
//  Created by  ilabadmin on 09/08/2016.
//  Copyright © 2016 strathmore. All rights reserved.
//

#import "PlaceDetailsViewController.h"

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


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    // Define keys
//    name = @"name";
//    placeid = @"location";
//    image = @"mobile_no";
//    
//    // Create array to hold dictionaries
//    myObject = [[NSMutableArray alloc] init];
//    NSData *jsonData = [NSData dataWithContentsOfURL:
//                        
//                        [NSURL URLWithString:@"http://openarchsystemslimited.com/bePretty/artistrg.php"]];
//  
//    id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
//    
//  //  printf("%s",jsonObjects);
//    
//    // values in foreach loop
//       for (NSDictionary *dataDict in jsonObjects) {
//           
//           NSString *strName = [dataDict objectForKey:@"name"];
//           NSString *strPlaceid = [dataDict objectForKey:@"location"];
//           NSString *strImage = [dataDict objectForKey:@"mobile_no"];
//           
//           dict = [NSDictionary dictionaryWithObjectsAndKeys:
//                   strName, name,
//                   strPlaceid, placeid,
//                   strImage, image,
//                                nil];
//           [myObject addObject:dict];
//        
//       }
    

    name = @"name";
    placeid = @"location";
    imagePlace = @"image";
    
    myObject = [[NSMutableArray alloc] init];
    
    
    
    NSError *error;
    NSString *url_string = [NSString stringWithFormat: @"http://e494b912.ngrok.io/tourkenya/placeskenya.php"];
    NSLog(@"json: %@", url_string);
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
    //NSLog(@"json: %@", data);
    NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSLog(@"json: %@", json);
    
    
    for (NSDictionary *dataDict in json) {
        
                   NSString *strName = [dataDict objectForKey:@"name"];
                   NSString *strPlaceid = [dataDict objectForKey:@"location"];
                   NSString *strImage = [dataDict objectForKey:@"image"];
        
                   dict = [NSDictionary dictionaryWithObjectsAndKeys:
                           strName, name,
                           strPlaceid, placeid,
                           strImage, imagePlace,
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
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        // Use the default cell style.
        cell = [[[UITableViewCell alloc] initWithStyle : UITableViewCellStyleSubtitle
                 
                                       reuseIdentifier : CellIdentifier] autorelease];
        
    }
    
    NSDictionary *tmpDict = [myObject objectAtIndex:indexPath.row];
    NSMutableString *text;
    
    text = [NSString stringWithFormat: [tmpDict objectForKey:name]];
    
    cell.textLabel.text = text;
    
    NSMutableString *detail;
    detail = [NSString stringWithFormat:@"Location : %@ , Mobile : %@"
              
              
              
              ,[tmpDict objectForKey:name]
              
              
              
              ,[tmpDict objectForKey:placeid]];
    
   // cell.detailTextLabel.text= detail;
    //cell.imageView.image = [UIImage imageNamed:@"default.JPG"];
        NSMutableString *imageUrl;
        imageUrl=[NSString stringWithFormat: [tmpDict objectForKey:imagePlace]];
//    NSLog(@"Image Url",imageUrl);
    if([imagePlace isEqualToString:@" "]){
        cell.imageView.image = [UIImage imageNamed:@"default.JPG"];
    }else{
        [cell.imageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://e494b912.ngrok.io/tourkenya/img/wilson_airport.jpg"]]]];
        //cell.imageView.image = [UIImage imageNamed:@"default.JPG"];
    }
    
    
    return cell;
    

}
@end
