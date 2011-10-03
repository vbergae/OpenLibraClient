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

/**
 This constants must be used as key of dictionary with book properties
 */ 
extern NSString * const kIdKey;
extern NSString * const kTitleKey;
extern NSString * const kAuthorKey;
extern NSString * const kPublisherKey;
extern NSString * const kPublisherDateKey;
extern NSString * const kPagesKey;
extern NSString * const kLanguageKey;
extern NSString * const kURLDetailsKey;
extern NSString * const kURLDownloadKey;
extern NSString * const kCoverKey;
extern NSString * const kRatingKey;
extern NSString * const kNumCommentsKey;
extern NSString * const kCategoriesKey;
extern NSString * const kTagsKey;

/**
 Class to represent a Book in the OpenLibra service.
 
 Books class stores all properties of a book and some helper methods to 
 download, view or comment the book
 */
@interface Book : NSObject {
@private   
    int _ID;
    NSString *_title;
    NSString *_author;
    NSString *_publisher;
    int _publisher_date;
    int _pages;
    NSString *_language;
    NSString *_url_Details;
    NSString *_url_Download;
    NSString *_cover;
    float _rating;
    int _num_comments;
    NSString *_categories;
    NSString *_tags;
}
 
/**
 Returns all attributes inside NSDictionary
 */
@property (nonatomic, readonly) NSDictionary *attributes;
/**
 Unique identifier of the book
 */
@property (nonatomic, assign) int ID;
/**
 Book's title
 */
@property (nonatomic, retain) NSString *title;
/**
 Book's author
 */
@property (nonatomic, retain) NSString *author;
/**
 Book's publisher
 */
@property (nonatomic, retain) NSString *publisher;
/**
 Book's publisher date
 */
@property (nonatomic, assign) int publisherDate;
/**
 Book's pages
 */
@property (nonatomic, assign) int pages;
/**
 Book's language
 */
@property (nonatomic, retain) NSString *language;
/**
 String with the url to book's details
 */
@property (nonatomic, retain) NSString *url_details;
/**
 String with the download url
 */
@property (nonatomic, retain) NSString *url_download;
/**
 String with url to book's cover
 */
@property (nonatomic, retain) NSString *cover;
/**
 Book's rating
 */
@property (nonatomic, assign) float rating;
/**
 Number of comments about this book
 */
@property (nonatomic, assign) int num_comments;
/**
 Book's categories
 */
@property (nonatomic, retain) NSString *categories;
/**
 Book's tags
 */
@property (nonatomic, retain) NSString *tags;


/**
 Intialices a new Book object using given NSDictionary to fill all
 properties
 
 @param NSDictionary Dictionary with all properties in a key/value format
 @return Book
 */
- (id)initWithDictionary:(NSDictionary *)dictionary;

#pragma mark -
#pragma mark Class Methods

/**
 Creates an autoreleased book using given dictionary
 
 @return Book Autoreleased book
 */
+ (Book *)bookWithDictionary:(NSDictionary *)dictionary;

@end
