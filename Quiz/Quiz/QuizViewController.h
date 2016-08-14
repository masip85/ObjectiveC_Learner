//
//  QuizViewController.h
//  Quiz
//
//  Created by ladmin on 13/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizViewController : UIViewController{
    int currentQuestionIndex;
//The model objects
    NSMutableArray *questions;
    NSMutableArray *answers;
//The View Objects
    IBOutlet UILabel *questionField;
    IBOutlet UILabel *answerField;
}

-(IBAction)showQuestion:(id)sender;
-(IBAction)showAnswer:(id)sender;


@end
