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
@synthesize additionButton, subtractionButton;
@synthesize label;
@synthesize calc;

//Actions
//Set value of an operand in model
-(IBAction)digitPressed:(UIButton *)sender{
    if (self.calc.operationType == 0) {
        //No operation type has been set...set operandA
        self.calc.operandA = [NSNumber numberWithInt:(self.calc.operandA.intValue * 10) + sender.tag];
        self.label.text = self.calc.operandA.stringValue; //Update Label
    }
    else{
        //OpertionType has been set... use operandB
        self.calc.operandB = [NSNumber numberWithInt:(self.calc.operandB.intValue * 10) + sender.tag];
        self.label.text = self.calc.operandB.stringValue; //Update Label
    }

}
-(IBAction)operationPressed:(UIButton *)sender{
    self.calc.operationType = sender.tag; //This works because we set the tag of the buttons in Interface Builder to be the same as our enum operationType
}
-(IBAction)equalPressed:(UIButton *)sender{
    
    //Determine operation type
    NSString *operationType; //You need to declare your NSString object here because you can't declare variables in switch statements
    switch (self.calc.operationType) {
        case addType:
            operationType = @"+";
            break;
        case subtractType:
            operationType = @"-";
            break;
        case multiplyType:
            operationType = @"x";
            break;
        case divideType:
            operationType = @"/";
            break;
        default:
            operationType = @"";
            break;
    }
    
    //Output text
    //This converts the variables we gave, in the format we gave, into a string to give to the label
    self.label.text = [NSString stringWithFormat:@"%d %@ %d = %.2f", self.calc.operandA.intValue,operationType,self.calc.operandB.intValue, [self.calc performOperation].floatValue];

    //Clear values in model
    self.calc.operandA = self.calc.operandB = nil;
    
    self.calc.operationType = 0; //Clear previous operation
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    //Create model object in memory (Alloc/Init)
    //We only have to create this object and not all of the label/buttons because the other objects are being created by interface builder
    self.calc = [[CalculatorBrain alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
