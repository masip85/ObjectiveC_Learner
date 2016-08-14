//
//  HeavyViewController.m
//  HeavyRotation
//
//  Created by ladmin on 21/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HeavyViewController.h"

@implementation HeavyViewController
-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)x
{
    // Reutrn YES if incoming orientation is Portratit
    //or either of the Landscapes,otherwise,return NO
    return (x==UIInterfaceOrientationPortrait) || UIInterfaceOrientationIsLandscape(x);
}



@end
