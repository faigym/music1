//
//  WTTableViewController.m
//  Weather
//
//  Created by Scott on 26/01/2013.
//  Updated by Joshua Greene 16/12/2013.
//
//  Copyright (c) 2013 Scott Sherwood. All rights reserved.
//

#import "WTTableViewController.h"
#import "AFNetworking.h"
#import "NSDictionary+weather.h"
#import "NSDictionary+weather_package.h"
static NSString * const BaseURLString = @"http://developer.echonest.com/api/v4/artist/similar?api_key=QDYCOQ3LHPT6XEEJR &name=Adel+Tawil/";

@interface WTTableViewController ()
@property(nonatomic, strong) NSMutableDictionary *currentDictionary;   // current section being parsed
@property(nonatomic, strong) NSString *elementName;
@property(nonatomic, strong) NSMutableString *outstring;
//Do I need to delete NSDic *weather?
@property(strong) NSDictionary *weather;
@end

@implementation WTTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.toolbarHidden = NO;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)clear:(id)sender
{
    self.title = @"";
    self.weather = nil;
    [self.tableView reloadData];
}

- (IBAction)jsonTapped:(id)sender
{
    // 1
    NSString *string = [NSString stringWithFormat:@"%@format=json&results=3", BaseURLString];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        // 3
        self.weather = (NSDictionary *)responseObject;
        self.title = @"JSON Retrieved";
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // 4
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
    // 5
    [operation start];

}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if(!self.weather)
//        return 0;
//    
//    switch (section) {
//        case 0: {
//            return 1;
//        }
//        case 1: {
//            NSArray *upcomingWeather = [self.weather upcomingWeather];
//            return [upcomingWeather count];
//        }
//        default:
//            return 0;
//    }
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *daysWeather = nil;
    
//
//            daysWeather = [self.weather currentCondition];
//
//            NSArray *upcomingWeather = [self.weather upcomingWeather];
//            daysWeather = upcomingWeather[indexPath.row];

//    NSArray *recommendedArtists = [self.weather name];

    
    cell.textLabel.text = [self.weather name];
    
    // You will add code here later to customize the cell, but it's good for now.
    
    return cell;
//    NSDictionary *daysWeather = nil;
//    
//    switch (indexPath.section) {
//        case 0: {
//            daysWeather = [self.weather currentCondition];
//            break;
//        }
//            
//        case 1: {
//            NSArray *upcomingWeather = [self.weather upcomingWeather];
//            daysWeather = upcomingWeather[indexPath.row];
//            break;
//        }
//            
//        default:
//            break;
//    }
//    
//    cell.textLabel.text = [daysWeather weatherDescription];
//    
//    // You will add code here later to customize the cell, but it's good for now.
//    cell.textLabel.text = [daysWeather weatherDescription];
//    
//    NSURL *url = [NSURL URLWithString:daysWeather.weatherIconURL];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder"];
//    
//    __weak UITableViewCell *weakCell = cell;
//    
//    [cell.imageView setImageWithURLRequest:request
//                          placeholderImage:placeholderImage
//                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
//                                       
//                                       weakCell.imageView.image = image;
//                                       [weakCell setNeedsLayout];
//                                       
//                                   } failure:nil];
//    
//    return cell;

}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // Navigation logic may go here. Create and push another view controller.
//    static NSString *CellIdentifier = @"WeatherCell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    
//    NSDictionary *daysWeather = nil;
//    
//    switch (indexPath.section) {
//        case 0: {
//            daysWeather = [self.weather currentCondition];
//            break;
//        }
//            
//        case 1: {
//            NSArray *upcomingWeather = [self.weather upcomingWeather];
//            daysWeather = upcomingWeather[indexPath.row];
//            break;
//        }
//            
//        default:
//            break;
//    }
//    
//    cell.textLabel.text = [daysWeather weatherDescription];
    
    // You will add code here later to customize the cell, but it's good for now.
    
//    return cell;
}


@end