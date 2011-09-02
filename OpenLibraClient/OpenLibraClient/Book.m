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

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _id         = [[dictionary valueForKey:ID_KEY] intValue];
        _title      = [dictionary valueForKey:TITLE_KEY];
        _author     = [dictionary valueForKey:AUTHOR_KEY];
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

#pragma mark -
#pragma mark Class Methods

+ (Book *)bookWithDictionary:(NSDictionary *)dictionary
{
    return [[[Book alloc] initWithDictionary:dictionary] autorelease];
}

#pragma mark -
#pragma mark Debug methods

- (NSString *)description
{
    return [NSString stringWithFormat:@"Book {\
            id: %d \
            title: %@ \
            author: %@",
            self.id, self.title, self.author];
}

@end
