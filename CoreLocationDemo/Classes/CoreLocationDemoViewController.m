//
//  CoreLocationDemoViewController.m
//  CoreLocationDemo
//
//  Created by Nicholas Vellios on 8/15/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "CoreLocationDemoViewController.h"

@implementation CoreLocationDemoViewController

//@synthesize CLController;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	CLController = [[MyCoreLocationController alloc] init];
	[CLController setDelegate:self];
	[[CLController locationManager] startUpdatingLocation];
}

- (void)locationUpdate:(CLLocation *)location {
	[locLabel setText:[location description]];
}

- (void)locationError:(NSError *)error {
	[locLabel setText:[error description]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	return YES;
}

- (void)viewDidUnload {
}


@end
