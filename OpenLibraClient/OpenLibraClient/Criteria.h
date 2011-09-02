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
#define FIELDS_COUNT        12
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
    FieldId             = 0,
    FieldTitle          = 1,
    FieldAuthor         = 2,
    FieldPublisher      = 3,
    FieldPublisherDate  = 4,
    FieldLang           = 5,
    FieldKeyworkd       = 6,
    FieldCategory       = 7,
    FieldCategoryId     = 8,
    FieldSubcategory    = 9,
    FieldCriteria       = 10,
    FieldTag            = 11
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

/**
 Criteria class.
 
 Defines the criteria searchs to make the request to OpenLibra API.
 */
@interface Criteria : NSObject {
@private    
    int _maxItems;
    Order _order;
    Since _since;
    NSMutableArray *_values;
}

/**
 Number of items to show in the response
 */
@property (nonatomic, assign) int maxItems;
/**
 Order to sort the response
 */
@property (nonatomic, assign) Order order;
/**
 Since when a book is available
 */
@property (nonatomic, assign) Since since;
/**
 Array with all the values of the fields
 */
@property (nonatomic, readonly) NSArray *values;

/**
 Sets a value for the given field.
 
 @param Field Field to set
 @param NSString Value for the field
 */
- (void)setField:(Field)field withValue:(NSString *)value;

/**
 Resets the value of the given field to null.
 
 @param Field Field to reset
 */
- (void)resetField:(Field)field;

/**
 Resets all fields.
 */
- (void)resetAllFields;

/**
 Creates the string for the request url.
 
 @return NSString String to use in the url request to api
 */
- (NSString *)requestParameters;

@end
