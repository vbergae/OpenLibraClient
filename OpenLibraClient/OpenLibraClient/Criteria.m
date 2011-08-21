//  This file is part of the OpenLibraClient package.
//
//  Criteria.m
//  OpenLibraClient
//
//  Created by Víctor Berga on 21/08/11 <victor@victorberga.com>.
//  Copyright 2011 Víctor Berga. All rights reserved.
// 
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.

#import "Criteria.h"

@interface Criteria(Private)

- (NSString *)addValuesTo:(NSString *)string;
- (NSString *)addOrderTo:(NSString *)string;
- (NSString *)addMaxItemsTo:(NSString *)string;
- (NSString *)addSinceTo:(NSString *)string;

@end

@implementation Criteria

@synthesize maxItems    = _maxItems;
@synthesize order       = _order;
@synthesize since       = _since;
@synthesize values      = _values;

- (id)init
{
    self = [super init];
    if (self) {
        [self setMaxItems:DEFAULT_MAX_ITEMS];
        [self setOrder:DEFAULT_ORDER];
        [self setSince:DEFAULT_SINCE];
        
        _values = [[NSMutableArray alloc] initWithCapacity:FIELDS_COUNT];
        for (int i = 0; i < FIELDS_COUNT; i++) {
            [_values insertObject:[NSNull null] 
                          atIndex:i];
        }
    }
    
    return self;
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc
{
    [_values release];
    _values = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark Private Instance Methods

- (NSString *)addValuesTo:(NSString *)string
{
    id value;
    
    value = [_values objectAtIndex:FieldId];
    if (value != [NSNull null]) {
        string = [string stringByAppendingFormat:@"&id=%@", value];
    }

    value = [_values objectAtIndex:FieldTitle];
    if (value != [NSNull null]) {
        string = [string stringByAppendingFormat:@"&title=\"%@\"", value];
    }
    
    value = [_values objectAtIndex:FieldAuthor];
    if (value != [NSNull null]) {
        string = [string stringByAppendingFormat:@"&author=\"%@\"", value];
    }
    
    return string;
}

- (NSString *)addOrderTo:(NSString *)string
{
    NSString *order;
    
    switch(self.order) {
        case OrderAsc:
            order = @"a_z";
            break;
        case OrderDesc:
            order = @"z_a";
            break;
        case OrderNewest:
            order = @"newest";
            break;
        case OrderOldest:
            order = @"oldest";
            break;
    }
    
    return [string stringByAppendingFormat:@"&order=%@", order];
}

- (NSString *)addMaxItemsTo:(NSString *)string
{
    return [string stringByAppendingFormat:@"&num_items=%d",
            self.maxItems];
}

- (NSString *)addSinceTo:(NSString *)string
{
    if (self.since != SinceNone) {
        NSString *since;
        
        switch(self.since) {
            case SinceToday:
                since = @"today";
                break;
            case SinceLastWeek:
                since = @"last_week";
                break;
            case SinceLastMonth:
                since = @"last_month";
                break;
            case SinceLastYear:
                since = @"last_year";
                break;
            default:
                break;
        }
        
        string = [string stringByAppendingFormat:@"&since=%@", since]; 
    }
    
    return string;
}

#pragma mark -
#pragma mark Intance Methods

- (void)setField:(Field)field withValue:(NSString *)value
{
    NSAssert(field <= FIELDS_COUNT || field >= 0, 
             @"Field out of range");
    
    [_values replaceObjectAtIndex:field withObject:value];
}

- (void)resetField:(Field)field
{
    NSAssert(field <= FIELDS_COUNT || field >= 0, 
             @"Field out of range");
    [_values replaceObjectAtIndex:field withObject:[NSNull null]];
}

- (NSString *)requestParameters
{
    NSString *parametersString = [[[NSString alloc] init] 
                                  autorelease];
    
    parametersString = [self addValuesTo:parametersString];
    parametersString = [self addOrderTo:parametersString];
    parametersString = [self addSinceTo:parametersString];
    parametersString = [self addMaxItemsTo:parametersString];
    
    return parametersString;
}

@end
