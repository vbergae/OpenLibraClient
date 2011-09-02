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


@implementation Book

@synthesize id              = _id;
@synthesize title           = _title;
@synthesize author          = _author;
@synthesize publisher       = _publisher;
@synthesize publisherDate   = _publisherDate;
@synthesize pages           = _pages;
@synthesize language        = _language;
@synthesize URLDetails      = _URLDetails;
@synthesize URLDownload     = _URLDownload;
@synthesize cover           = _cover;
@synthesize rating          = _rating;
@synthesize numComments     = _numComments;
@synthesize categories      = _categories;
@synthesize tags            = _tags;

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _id             = [[dictionary valueForKey:kIdKey] intValue];
        _title          = [dictionary valueForKey:kTitleKey];
        _author         = [dictionary valueForKey:kAuthorKey];
        _publisher      = [dictionary valueForKey:kPublisherKey];
        _publisherDate  = [[dictionary valueForKey:kPublisherDateKey] intValue];
        _pages          = [[dictionary valueForKey:kPagesKey] intValue];
        _language       = [dictionary valueForKey:kLanguageKey];
        _URLDetails     = [dictionary valueForKey:kURLDetailsKey];
        _URLDownload    = [dictionary valueForKey:kURLDownloadKey];
        _cover          = [dictionary valueForKey:kCoverKey];
        _rating         = [[dictionary valueForKey:kRatingKey] floatValue];
        _numComments    = [[dictionary valueForKey:kNumCommentsKey] intValue];
        _categories     = [dictionary valueForKey:kCategoriesKey];
        _tags           = [dictionary valueForKey:kTagsKey];
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
    [self setPublisher:nil];
    [self setPublisherDate:0];
    [self setPages:0];
    [self setLanguage:nil];
    [self setURLDetails:nil];
    [self setURLDownload:nil];
    [self setCover:nil];
    [self setRating:0.0];
    [self setNumComments:0];
    [self setCategories:nil];
    [self setTags:nil];
    
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
            self.id, self.title, self.author, self.publisher, 
            self.publisherDate, self.pages, self.URLDetails,
            self.URLDownload, self.cover, self.rating, self.numComments,
            self.categories, self.tags];
}

@end
