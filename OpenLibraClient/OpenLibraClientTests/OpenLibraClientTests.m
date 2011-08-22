//
//  OpenLibraClientTests.m
//  OpenLibraClientTests
//
//  Created by Víctor Berga on 21/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OpenLibraClientTests.h"

@implementation OpenLibraClientTests

- (void)setUp
{
    [super setUp];
    
    _client = [[OpenLibraClient alloc] init];
    STAssertNotNil(_client, @"OpenLibraClient not instantiated");
}

- (void)tearDown
{
    [_client release];
    _client = nil;
    
    [super tearDown];
}

- (void)testServiceURLRequest
{
    NSURL *expected;
    NSURL *returned;
    
    // [0] Default URL Request
    expected = [NSURL  URLWithString:@"http://openlibra.com/api/v1/get/?&order=a_z&num_items=10"];
    returned = [_client.serviceURLRequest URL];
    STAssertTrue([returned isEqual:expected],
                 @"[0] Default url request fails");
    
    // [1] Request for book with id 589
    [_client.criteria setField:FieldId withValue:@"589"];
    expected = [NSURL URLWithString:@"http://openlibra.com/api/v1/get/?&id=589&order=a_z&num_items=10"];
    returned = [_client.serviceURLRequest URL];
    STAssertTrue([returned isEqual:expected],
                 @"[1] Request for book with id 589 fails");
}

@end
