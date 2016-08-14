//
//  CoreLocationController.h
//  CoreLocationDemo
//
//  Created by Nicholas Vellios on 8/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol MyCoreLocationControllerDelegate
@required

- (void)locationUpdate:(CLLocation *)location;
- (void)locationError:(NSError *)error;
- (void) backgroundEvent:(NSNotification *) notification;
- (void) foregroundEvent:(NSNotification *) notification;


@end


@interface MyCoreLocationController : NSObject <CLLocationManagerDelegate> {
//	CLLocationManager *locationManager;
//	id __weak delegate;
}

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, weak) id delegate;

@end
