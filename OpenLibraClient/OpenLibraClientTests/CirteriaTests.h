//
//  CirteriaTests.h
//  OpenLibraClient
//
//  Created by Víctor Berga on 21/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

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
