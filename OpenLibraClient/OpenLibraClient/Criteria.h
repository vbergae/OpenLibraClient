//  This file is part of the OpenLibraClient package.
//
//  Criteria.h
//  OpenLibraClient
//
//  Created by Víctor Berga on 21/08/11 <victor@victorberga.com>.
//  Copyright 2011 Víctor Berga. All rights reserved.
// 
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.

#import <Foundation/Foundation.h>

/**
 Current number fields wicht Criteria supports
 */
#define FIELDS_COUNT        3
/**
 Default max results
 */
#define DEFAULT_MAX_ITEMS   10
/**
 Default order
 */
#define DEFAULT_ORDER       OrderAsc
/**
 Default since
 */
#define DEFAULT_SINCE       SinceNone

/**
 Field names.
 Enum with the fields names
 */
typedef enum {
    FieldId         = 0,
    FieldTitle      = 1,
    FieldAuthor     = 2
} Field;

/**
 Order types.
 Enum with the types of orders.
 */
typedef enum {
    OrderAsc        = 0,
    OrderDesc       = 1,
    OrderNewest     = 2,
    OrderOldest     = 3
} Order;

/**
 Sinze posibilities.
 Enum with the Sinze posibilities.
 */
typedef enum {
    SinceNone       = 0,
    SinceToday      = 1,
    SinceLastWeek   = 2,
    SinceLastMonth  = 3,
    SinceLastYear   = 4
} Since;

@interface Criteria : NSObject {
@private    
    int _maxItems;
    Order _order;
    Since _since;
    NSMutableArray *_values;
}

@property (nonatomic, assign) int maxItems;
@property (nonatomic, assign) Order order;
@property (nonatomic, assign) Since since;
@property (nonatomic, readonly) NSArray *values;

- (void)setField:(Field)field withValue:(NSString *)value;
- (void)resetField:(Field)field;
- (NSString *)requestParameters;

@end
