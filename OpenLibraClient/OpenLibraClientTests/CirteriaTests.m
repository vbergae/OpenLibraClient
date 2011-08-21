//
//  CirteriaTests.m
//  OpenLibraClient
//
//  Created by Víctor Berga on 21/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CirteriaTests.h"

@implementation CirteriaTests

- (void)setUp
{
    _criteria = [[Criteria alloc] init];
    STAssertNotNil(_criteria, @"Criteria intantation fails");
    
    STAssertTrue([_criteria maxItems] == DEFAULT_MAX_ITEMS, 
                 @"Setting initial max items fails");
    STAssertTrue([_criteria order] == DEFAULT_ORDER, 
                 @"Setting initial order fails");
    STAssertTrue([_criteria since] == DEFAULT_SINCE,
                 @"Setting initial since fails");
    
    for (id parameter in _criteria.values) {
        STAssertTrue(parameter == [NSNull null], 
                     @"Setting initial value for fields fails");
    }
}

- (void)tearDown
{
    [_criteria release];
    _criteria = nil;
}

#pragma mark -
#pragma mark Unit tests

- (void)testSetFieldWithValue
{
    NSString *expected;
    NSString *value;
    
    expected = @"1";
    [_criteria setField:FieldId withValue:expected];
    value = [_criteria.values objectAtIndex:FieldId];
    STAssertTrue(value == expected, @"Fails setting FieldId valye");
    
    expected = @"author name";
    [_criteria setField:FieldAuthor withValue:expected];
    value = [_criteria.values objectAtIndex:FieldAuthor];
    STAssertTrue(value == expected, @"Fails setting FieldAuthor valye");
    
    expected = @"book title";
    [_criteria setField:FieldTitle withValue:expected];
    value = [_criteria.values objectAtIndex:FieldTitle];
    STAssertTrue(value == expected, @"Fails setting FieldTitle valye");
    
    STAssertThrows([_criteria setField:10 withValue:@"exception"],
                   @"Inserting out of range field show throw an exception");
    STAssertThrows([_criteria setField:-10 withValue:@"exception"],
                   @"Inserting out of range field show throw an exception");
}

- (void)testResetField
{
    NSString *expected;
    id value;
    
    expected = @"1";
    [_criteria setField:FieldId withValue:expected];
    value = [_criteria.values objectAtIndex:FieldId];
    STAssertTrue(value == expected, @"Fails setting FieldId valye");
    
    [_criteria resetField:FieldId];
    value = [_criteria.values objectAtIndex:FieldId];
    STAssertTrue(value == [NSNull null], @"Reset field fails");

    STAssertThrows([_criteria setField:10 withValue:@"exception"],
                   @"Inserting out of range field show throw an exception");
    STAssertThrows([_criteria setField:-10 withValue:@"exception"],
                   @"Inserting out of range field show throw an exception");
}

- (void)testRequestParameters
{
    NSString *requestPath;
    NSString *expected;
    
    //[0] Default path
    expected = @"&order=a_z&num_items=10";
    requestPath = [_criteria requestParameters];
    STAssertTrue([requestPath isEqualToString:expected], 
                 @"[0] Default request path fails");
    
    //[1] Add sinze last month for example
    [_criteria setSince:SinceLastMonth];
    expected = @"&order=a_z&since=last_month&num_items=10";
    requestPath = [_criteria requestParameters];
    STAssertTrue([requestPath isEqualToString:expected], 
                 @"[1] Default request path plus sinze last month fails");

    //[2] Add sinze today
    [_criteria setSince:SinceToday];
    expected = @"&order=a_z&since=today&num_items=10";
    requestPath = [_criteria requestParameters];
    STAssertTrue([requestPath isEqualToString:expected], 
             @"[2] Default request path plus sinze today fails");

    //[3] Add sinze last week
    [_criteria setSince:SinceLastWeek];
    expected = @"&order=a_z&since=last_week&num_items=10";
    requestPath = [_criteria requestParameters];
    STAssertTrue([requestPath isEqualToString:expected], 
                 @"[3] Default request path plus sinze last week fails");

    //[4] Add sinze last year
    [_criteria setSince:SinceLastYear];
    expected = @"&order=a_z&since=last_year&num_items=10";
    requestPath = [_criteria requestParameters];
    STAssertTrue([requestPath isEqualToString:expected], 
                 @"[4] Default request path plus sinze last year fails");

    //[5] Set sinze to none
    [_criteria setSince:SinceNone];
    expected = @"&order=a_z&num_items=10";
    requestPath = [_criteria requestParameters];
    STAssertTrue([requestPath isEqualToString:expected], 
                 @"[5] Default request with sinze set to none fails");
    
    /*

     
     // Test order parameter
     
     //[6] Set order to desc
     _criteria->setOrder(OrderDesc);
     requestPath = _criteria->requestPath();
     QVERIFY2("&order=z_a&num_items=10" == requestPath,
     "[6] Set order to OrderDesc fails");
     
     //[7] Set order to newest
     _criteria->setOrder(OrderNewest);
     requestPath = _criteria->requestPath();
     QVERIFY2("&order=newest&num_items=10" == requestPath,
     "[7] Set order to OrderNewest fails");
     
     //[8] Set order to oldest
     _criteria->setOrder(OrderOldest);
     requestPath = _criteria->requestPath();
     QVERIFY2("&order=oldest&num_items=10" == requestPath,
     "[6] Set order to OrderOldest fails");
     
     //[9] Set order to asc
     _criteria->setOrder(OrderAsc);
     requestPath = _criteria->requestPath();
     QVERIFY2("&order=a_z&num_items=10" == requestPath,
     "[9] Set order to OrderAsc fails");
     */
}

@end
