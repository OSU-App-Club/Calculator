//
//  ViewController.h
//  Calculator
//
//  Created by Chris Vanderschuere on 10/26/12.
//  Copyright (c) 2012 Chris Vanderschuere. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIButton *additionButton;
@property (nonatomic, strong) IBOutlet UIButton *subtractionButton;
@property (nonatomic, strong) IBOutlet UILabel *label;

//Add model object
@property (nonatomic, strong) CalculatorBrain *calc;

//Actions
- (IBAction)digitPressed:(UIButton *)sender;
- (IBAction)operationPressed:(UIButton *)sender;
- (IBAction)equalPressed:(UIButton *)sender;

//Update
- (void) updateLabel;



@end
