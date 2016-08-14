//
//  CoreLocationDemoViewController.h
//  CoreLocationDemo
//
//  Created by Nicholas Vellios on 8/15/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCoreLocationController.h"

@interface CoreLocationDemoViewController : UIViewController <MyCoreLocationControllerDelegate> {
    
	MyCoreLocationController *CLController;
    
    
	IBOutlet UILabel *locLabel;
}

//@property (nonatomic, strong) MyCoreLocationController *CLController;

@end

