//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Chris Vanderschuere on 10/26/12.
//  Copyright (c) 2012 Chris Vanderschuere. All rights reserved.
//

#import <Foundation/Foundation.h>

//This just connects names to numbers so using them later is less confusing
enum operationType {
    addType = 1,
    subtractType = 2,
    multiplyType = 3
    };

@interface CalculatorBrain : NSObject

//Operands
@property (nonatomic, strong) NSNumber *operandA;
@property (nonatomic, strong) NSNumber *operandB;

//Operation type
@property int operationType;

//Function
-(NSNumber *) performOperation;

@end
