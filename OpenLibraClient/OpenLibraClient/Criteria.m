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
+ (NSArray *)ApiFieldNames;

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
        // Setup initial values
        [self setMaxItems:DEFAULT_MAX_ITEMS];
        [self setOrder:DEFAULT_ORDER];
        [self setSince:DEFAULT_SINCE];
        
        // Setup initial field values
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
    for (int i = 0; i < FIELDS_COUNT; ++i) {
        value = [_values objectAtIndex:i];
        
        if (value != [NSNull null]) {
            NSString *field = [[Criteria ApiFieldNames] objectAtIndex:i];
            
            if ([value rangeOfString:@" "].location != NSNotFound) {
                value = [NSString stringWithFormat:@"\"%@\"", value]; 
            }
            
            string = [string stringByAppendingFormat:@"&%@=%@", 
                      field, value];            
        }
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

- (void)resetAllFields
{
    for (int i = 0; i < [_values count]; ++i) {
        [self resetField:i];
    }
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

#pragma mark -
#pragma mark Class methods

+ (NSArray *)ApiFieldNames
{
    NSMutableArray *fields = [NSMutableArray arrayWithCapacity:FIELDS_COUNT];
    
    for (int i = 0; i < FIELDS_COUNT; ++i) {
        switch (i) {
            case FieldId:
                [fields insertObject:@"id" atIndex:i];
                break;                
            case FieldTitle:
                [fields insertObject:@"book_title" atIndex:i];
                break;                
            case FieldAuthor:
                [fields insertObject:@"book_author" atIndex:i];
                break;
            case FieldPublisher:
                [fields insertObject:@"publisher" atIndex:i];
                break;
            case FieldPublisherDate:
                [fields insertObject:@"publisher_date" atIndex:i];
                break;
            case FieldLang:
                [fields insertObject:@"lang" atIndex:i];
                break;
            case FieldKeyworkd:
                [fields insertObject:@"keywork" atIndex:i];
                break;
            case FieldCategory:
                [fields insertObject:@"category" atIndex:i];
                break;
            case FieldCategoryId:
                [fields insertObject:@"category_id" atIndex:i];
                break;
            case FieldSubcategory:
                [fields insertObject:@"subcategory" atIndex:i];
                break;
            case FieldSubcategoryId:
                [fields insertObject:@"subcategory_id" atIndex:i];
            case FieldCriteria:
                [fields insertObject:@"criteria" atIndex:i];
                break;
            case FieldTag:
                [fields insertObject:@"any_tags" atIndex:i];
            default:
                break;
        }
    }
    
    return fields;
}

@end
