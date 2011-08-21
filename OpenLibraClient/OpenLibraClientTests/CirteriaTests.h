//  This file is part of the OpenLibraClient package.
//
//  CirteriaTests.h
//  OpenLibraClient
//
//  Created by Víctor Berga on 21/08/11 <victor@victorberga.com>.
//  Copyright 2011 Víctor Berga. All rights reserved.
// 
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import "Criteria.h"

@interface CirteriaTests : SenTestCase {
@private
    Criteria *_criteria;
}

- (void)testSetFieldWithValue;
- (void)testResetField;
- (void)testRequestParameters;

@end
