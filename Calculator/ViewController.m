//
//  ViewController.m
//  Calculator
//
//  Created by Chris Vanderschuere on 10/26/12.
//  Copyright (c) 2012 Chris Vanderschuere. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//Synthesize Properties
@synthesize additionButton, subtractionButton, multiplicationButton;
@synthesize label;
@synthesize calc;


//Actions
//Set value of an operand in model
-(IBAction)digitPressed:(UIButton *)sender{
    if (self.calc.operationType == 0) {
        //No operation type has been set...set operandA
        self.calc.operandA = [NSNumber numberWithInt:(self.calc.operandA.intValue * 10) + sender.tag];
    }
    else{
        //OpertionType has been set... use operandB
        self.calc.operandB = [NSNumber numberWithInt:(self.calc.operandB.intValue * 10) + sender.tag];
    }
    //Call update fuction
    [self updateLabel];

}
-(IBAction)operationPressed:(UIButton *)sender{
    int type;
    
    if (sender.tag == 13) {
        type = multiplyType;
    }
    else if (sender.tag ==10) {
        type = addType;
    }
    else if (sender.tag == 11) {
        type = subtractType;
    }
    
    self.calc.operationType = type;

    [self updateLabel];
    
}
-(IBAction)equalPressed:(UIButton *)sender{
    self.label.text = [self.calc performOperation].stringValue;
    
    //Clear values in model
    self.calc.operandA = self.calc.operandB = nil;
    self.calc.operationType = 0; //Clear previous operation
}

//Update method
-(void) updateLabel{
    //Determine operation type
    NSString *operationType;
    if (self.calc.operationType == addType) {
        operationType = @"+";
    }
    else if(self.calc.operationType == subtractType){
        operationType = @"-";
    }
    else if(self.calc.operationType == multiplyType){
        operationType = @"*";
    }
    else {
        operationType = @"??";
    }

    //Output text
    self.label.text = [NSString stringWithFormat:@"%d %@ %d =", self.calc.operandA.intValue,operationType,self.calc.operandB.intValue];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    //Create model object in memory (Alloc/Init)
    self.calc = [[CalculatorBrain alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
