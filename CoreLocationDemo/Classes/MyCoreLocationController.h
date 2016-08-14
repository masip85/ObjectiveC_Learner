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

@end


@interface MyCoreLocationController : NSObject <CLLocationManagerDelegate> {
	CLLocationManager *locationManager;
	id __unsafe_unretained delegate;
}

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, unsafe_unretained) id delegate;

@end
