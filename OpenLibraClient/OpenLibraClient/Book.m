//  This file is part of the OpenLibraClient package.
//
//  Book.h
//  OpenLibraClient
//
//  Created by Víctor Berga on 21/08/11 <victor@victorberga.com>.
//  Copyright 2011 Víctor Berga. All rights reserved.
// 
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.

#import "Book.h"

@implementation Book

@synthesize id      = _id;
@synthesize title   = _title;
@synthesize author  = _author;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

#pragma mark -
#pragma mark Memory Management

- (void)dealloc
{
    [self setId:0];
    [self setTitle:nil];
    [self setAuthor:nil];
    
    [super dealloc];
}

@end
