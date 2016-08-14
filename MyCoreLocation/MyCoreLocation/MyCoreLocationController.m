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
        
        // Creo Location Manager
		locationManager = [[CLLocationManager alloc] init];
		[locationManager setDelegate: self];
        //Creo Centro de notificaciones
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(backgroundEvent:) 
                                                     name:@"UIApplicationDidEnterBackgroundNotification"
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(foregroundEvent:) 
                                                     name:@"UIapplicationWillEnterForeground"
                                                   object:nil];

        
        
	}
	
	return self;
}

- (void) backgroundEvent:(NSNotification *) notification {
    NSLog(@"The app just went into the background");
    //Shut down the memory/processor intensive things and save any states for when the app is reinitialised
}

- (void) foregroundEvent:(NSNotification *) notification {
    NSLog(@"The app just went into the foreground");
    //Shut down the memory/processor intensive things and save any states for when the app is reinitialised
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

-(void)dealloc{
    NSLog(@"MyCoreLocation dealloc");

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
