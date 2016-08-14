//
//  QuizViewController.m
//  Quiz
//
//  Created by ladmin on 13/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "QuizViewController.h"

@implementation QuizViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
// Call the init method implemented by the superclass
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //Create two array and make the pointers point to them
        questions=[[NSMutableArray alloc] init];
        answers=[[NSMutableArray alloc] init];
        
        //Add questions and answers to the arrays
        [questions addObject:@"What is 7+7?"];
        [answers addObject:@"14"];
        
        [questions addObject:@"What is the Capital of Vermont?"];
        [answers addObject:@"Montpellier"];
        
        [questions addObject:@"From what is cognac made"];
        [answers addObject:@"Grapes"];
        
        //Return the adress of the new object
        return self;
        
    }

}

- (IBAction)showQuestion:(id)sender{
// Step to the next question
    currentQuestionIndex++;
    
    //Am I past the last Question?
    if (currentQuestionIndex==[questions count]){
    // Go back to the first Question
        currentQuestionIndex=0;
    }

    // Get the String at that index in the questions array
    NSString *question=[questions objectAtIndex:currentQuestionIndex];
    
    //Log the String to the console
    NSLog(@"displaying question: %@ ",question);
    
    //Display the String in the question field
    [questionField setText:question];
    
    //Clear the answerfield
    [answerField setText:@"???"];
    

}

-(IBAction)showAnswer:(id)sender{
// What is the answer to the currrent Question?
    NSString *answer =[answers objectAtIndex:currentQuestionIndex];
    
    //Display in the answer field
    [answerField setText:answer];
}
@end
