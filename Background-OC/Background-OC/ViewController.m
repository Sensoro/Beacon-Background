//
//  ViewController.m
//  Background-OC
//
//  Created by David Yang on 15/3/24.
//  Copyright (c) 2015年 Sensoro. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate>{
    BOOL _started;
}

@property (nonatomic,strong) NSTimer * timer;
@property (nonatomic,strong) CLLocationManager * locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _locationManager = [[CLLocationManager alloc] init];
    [_locationManager requestAlwaysAuthorization];
    _locationManager.delegate = self;
    
    _started = NO;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(logout:) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionPress:(id)sender {
    
    if (_started == NO) {
        _started = YES;
        [_locationManager startUpdatingLocation];
        
        [_actionButton setTitle:@"结束" forState:UIControlStateNormal];
        
    }else{
        _started = YES;
        [_locationManager stopUpdatingLocation];
        
        [_actionButton setTitle:@"开始" forState:UIControlStateNormal];
    }
    
}

- (void) logout : (NSTimer*) timer {

    static int timeCall = 0;
    NSLog(@"It is %d call!", timeCall++);
    
}

#pragma mark CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations{

    NSLog(@"did Update Locations");
}

@end
