//  This file is part of the OpenLibraClient package.
//
//  OpenLibraClient.m
//  OpenLibraClient
//
//  Created by Víctor Berga on 21/08/11 <victor@victorberga.com>.
//  Copyright 2011 Víctor Berga. All rights reserved.
// 
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.

#import "OpenLibraClient.h"

@implementation OpenLibraClient

@synthesize criteria = _criteria;

- (id)init
{
    self = [super init];
    if (self) {
        [self setCriteria:[[[Criteria alloc] init] autorelease]];
    }
    
    return self;
}

- (id)initWithCriteria:(Criteria *)criteria
{
    self = [super init];
    if (self) {
        [self setCriteria:criteria];
    }
    
    return self;
}

#pragma mark -
#pragma mark Memory Management

- (void)dealloc
{
    [self setCriteria:nil];
    
    [super dealloc];
}

@end
