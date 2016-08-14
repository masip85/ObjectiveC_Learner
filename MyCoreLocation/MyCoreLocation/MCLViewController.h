//
//  MCLViewController.h
//  MyCoreLocation
//
//  Created by ladmin on 13/03/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCoreLocationController.h"

@interface MCLViewController : UIViewController<MyCoreLocationControllerDelegate> {
    
	MyCoreLocationController *CLController;
}
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@end
