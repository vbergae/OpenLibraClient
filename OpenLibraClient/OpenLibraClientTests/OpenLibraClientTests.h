//
//  OpenLibraClientTests.h
//  OpenLibraClientTests
//
//  Created by Víctor Berga on 21/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "OpenLibraClient.h"

@interface OpenLibraClientTests : SenTestCase {
@private
    OpenLibraClient *_client;
}

- (void)testServiceURLRequest;

@end
