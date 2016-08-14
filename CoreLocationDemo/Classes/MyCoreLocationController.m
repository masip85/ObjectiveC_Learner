//
//  CoreLocationController.m
//  CoreLocationDemo
//
//  Created by Nicholas Vellios on 8/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MyCoreLocationController.h"


@implementation MyCoreLocationController

@synthesize locationManager, delegate;

- (id)init {
	self = [super init];
	
	if(self != nil) {
		locationManager = [[CLLocationManager alloc] init];
		[locationManager setDelegate: self];
	}
	
	return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	if([delegate conformsToProtocol:@protocol(MyCoreLocationControllerDelegate)]) {
		[delegate locationUpdate:newLocation];
	}
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
	if([delegate conformsToProtocol:@protocol(MyCoreLocationControllerDelegate)]) {
		[delegate locationError:error];
	}
}


@end
