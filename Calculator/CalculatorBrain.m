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
            break; //Break statements are required at the end of a case so the program does not fall to case below
        case subtractType:
            //Do this for subtract
            return [NSNumber numberWithInt:self.operandA.integerValue - self.operandB.integerValue];
            break;
        case multiplyType:
            return [NSNumber numberWithInt:self.operandA.integerValue * self.operandB.integerValue];
            break;
        case divideType:
            return [NSNumber numberWithInt:self.operandA.integerValue / self.operandB.integerValue];
            break;
        default:
            return nil;
            break;
    }
    
}

///NSNumber numberWithInit is equal to the following:
//NSNumber *exampleNumber = [[NSNumber alloc] initWithInt: (some int value)]


@end
