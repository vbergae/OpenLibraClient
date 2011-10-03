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

NSString * const kIdKey             = @"ID";
NSString * const kTitleKey          = @"title";
NSString * const kAuthorKey         = @"author";
NSString * const kPublisherKey      = @"publisher";
NSString * const kPublisherDateKey  = @"publisher_date";
NSString * const kPagesKey          = @"pages";
NSString * const kLanguageKey       = @"language";
NSString * const kURLDetailsKey     = @"url_details";
NSString * const kURLDownloadKey    = @"url_download";
NSString * const kCoverKey          = @"cover";
NSString * const kRatingKey         = @"rating";
NSString * const kNumCommentsKey    = @"num_comments";
NSString * const kCategoriesKey     = @"categories";
NSString * const kTagsKey           = @"tags";
static NSDictionary *kDefaults;

@implementation Book

@dynamic attributes;
@synthesize ID              = _ID;
@synthesize title           = _title;
@synthesize author          = _author;
@synthesize publisher       = _publisher;
@synthesize publisherDate   = _publisher_date;
@synthesize pages           = _pages;
@synthesize language        = _language;
@synthesize url_details     = _url_Details;
@synthesize url_download    = _url_Download;
@synthesize cover           = _cover;
@synthesize rating          = _rating;
@synthesize num_comments    = _num_comments;
@synthesize categories      = _categories;
@synthesize tags            = _tags;

+ (void)initialize
{
    kDefaults = [NSDictionary dictionaryWithObjectsAndKeys:
                [NSNumber numberWithInt:0], kIdKey,
                [NSNull null], kTitleKey,
                [NSNull null], kAuthorKey, 
                [NSNull null], kPublisherKey,
                [NSNumber numberWithInt:0], kPublisherDateKey, 
                [NSNumber numberWithInt:0], kPagesKey,
                [NSNull null], kLanguageKey,
                [NSNull null], kURLDetailsKey,
                [NSNull null], kURLDownloadKey,
                [NSNull null], kCoverKey,
                [NSNumber numberWithFloat:0.0], kRatingKey,
                [NSNumber numberWithInt:0], kNumCommentsKey,
                [NSNull null], kCategoriesKey,
                [NSNull null], kTagsKey,
                nil];
}

- (id)init
{
    return [self initWithDictionary:kDefaults];
}

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if (!dictionary) return nil;
    
    self = [super init];
    if (self) {
        for (NSString *key in dictionary) {
            [self setValue:[dictionary valueForKey:key]
                    forKey:key];
        }
    }
    
    return self;
}

#pragma mark -
#pragma mark Memory Management

- (void)dealloc
{
    [self setID:0];
    [self setTitle:nil];
    [self setAuthor:nil];
    [self setPublisher:nil];
    [self setPublisherDate:0];
    [self setPages:0];
    [self setLanguage:nil];
    [self setUrl_details:nil];
    [self setUrl_download:nil];
    [self setCover:nil];
    [self setRating:0.0];
    [self setNum_comments:0];
    [self setCategories:nil];
    [self setTags:nil];
    
    [super dealloc];
}

#pragma mark -
#pragma mark Dynamic Properties

- (NSDictionary *)attributes
{
    return [self dictionaryWithValuesForKeys:
            [NSArray arrayWithObjects:kIdKey, kTitleKey, kAuthorKey,
             kPublisherKey, kPublisherDateKey, kPagesKey, kLanguageKey,
             kURLDetailsKey, kURLDownloadKey, kCoverKey, kRatingKey,
             kNumCommentsKey, kCategoriesKey, kTagsKey, nil]];
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
            author: %@ \
            publisher: %@ \
            publisher_date: %d \
            pages: %d \
            url_details: %@ \
            url_downloads: %@ \
            cover: %@ \
            rating: %f \
            num_comments: %d \
            categories: %@ \
            tags: %@",
            self.ID, self.title, self.author, self.publisher, 
            self.publisherDate, self.pages, self.url_details,
            self.url_download, self.cover, self.rating, self.num_comments,
            self.categories, self.tags];
}

@end
