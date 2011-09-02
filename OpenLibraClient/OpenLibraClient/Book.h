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

#import <Foundation/Foundation.h>

#define ID_KEY          @"ID"
#define TITLE_KEY       @"title"
#define AUTHOR_KEY      @"author"

/**
 Class to represent a Book in the OpenLibra service.
 
 Books class stores all properties of a book and some helper methods to 
 download, view or comment the book
 */
@interface Book : NSObject {
@private   
    int _id;
    NSString *_title;
    NSString *_author;
}
    
/**
 Unique identifier of the book
 */
@property (nonatomic, assign) int id;
/**
 Book's title
 */
@property (nonatomic, retain) NSString *title;
/**
 Book's author
 */
@property (nonatomic, retain) NSString *author;

- (id)initWithDictionary:(NSDictionary *)dictionary;

#pragma mark -
#pragma mark Class Methods

/**
 Creates an autoreleased book using given dictionary
 
 @return Book Autoreleased book
 */
+ (Book *)bookWithDictionary:(NSDictionary *)dictionary;

@end
