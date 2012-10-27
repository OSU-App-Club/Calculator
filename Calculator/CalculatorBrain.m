//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Chris Vanderschuere on 10/26/12.
//  Copyright (c) 2012 Chris Vanderschuere. All rights reserved.
//

#import "CalculatorBrain.h"

@implementation CalculatorBrain

//Sythesize Getter/Setting (Also set name of backing variables)
@synthesize operandA = _operandA;
@synthesize operandB = _operandB;
@synthesize operationType = _operationType;

//Implement Function
-(NSNumber*) performOperation{
    switch (self.operationType) {
        case addType:
            //Do this for add
            return [NSNumber numberWithInt:self.operandA.integerValue + self.operandB.integerValue];
            break;
        case subtractType:
            //Do this for subtract
            return [NSNumber numberWithInt:self.operandA.integerValue - self.operandB.integerValue];
        default:
            
            return nil;
            break;
    }
    
}

///NSNumber numberWithInit is equal to the following:
//NSNumber *exampleNumber = [[NSNumber alloc] initWithInt: (some int value)]


@end
