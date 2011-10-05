//  This file is part of the OpenLibraClient package.
//
//  TestBook.m
//  OpenLibraClientGHTests
//
//  Created by Víctor Berga on 30/09/11 <victor@victorberga.com>.
//  Copyright 2011 Víctor Berga. All rights reserved.
// 
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.

#import <GHUnitIOS/GHUnit.h> 
#import "Book.h"

@interface TestBook : GHTestCase { }
@end

@implementation TestBook

- (void)testInit
{
    GHAssertTrue(false, @"Jenginks test - EXPECTED");
    
    Book *book = nil;
    NSDictionary *dict = nil;
    
    // [0]
    GHTestLog(@"[0] Init should create empty book");
    book = [[Book alloc] init];
    GHAssertNotNil(book, @"init book fails");
    
    // [1]
    GHTestLog(@"[1] Init should setup all variables to null values");
    dict = [NSDictionary dictionaryWithObjectsAndKeys:
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
    GHAssertTrue([dict isEqualToDictionary:book.attributes],
                 @"Properties setup to null values fails on initialization");
    
    [book release];
}

- (void)testInitWithDictionary
{
    Book *book = nil;
    NSDictionary *dict = nil;
    
    // [0]
    GHTestLog(@"[0] Init with nil NSDictionary should return nil Book");
    book = [[Book alloc] initWithDictionary:nil];
    GHAssertNil(book, @"Intializacion with nil dictionary fails");
    [book release];

    // [1]
    GHTestLog(@"[1] Init with unknown keys should thow an exception");
    dict = [NSDictionary dictionaryWithObjectsAndKeys:
            @"fooKey", @"foo",
            @"barKey", @"key", 
            nil];
    GHAssertThrows([[Book alloc] initWithDictionary:dict],
                   @"Init with unkown keys fails");

    // [2]    
    GHTestLog(@"[2] Init with at least one known key should return valid book");
    dict = [NSDictionary dictionaryWithObject:@"foo" 
                                       forKey:@"title"];
    book = [[Book alloc] initWithDictionary:dict];
    NSLog(@"dict1: %@", dict);
    GHAssertTrue([[book title] isEqualToString:@"foo"],
                 @"Initialization with at least one known key fails");
    [book release];

    // [3]    
    GHTestLog(@"[3] Init with all properties defined in NSDictionary \
              should create an unique book");
    dict = [NSDictionary dictionaryWithObjectsAndKeys:
            [NSNumber numberWithInt:1], kIdKey,
            @"Somre Title", kTitleKey,
            @"Some author", kAuthorKey, 
            @"Some publisher", kPublisherKey,
            [NSNumber numberWithInt:2000], kPublisherDateKey, 
            [NSNumber numberWithInt:300], kPagesKey,
            @"es", kLanguageKey,
            @"http://www.foo.com/book/details", kURLDetailsKey,
            @"http://www.foo.com/book/download", kURLDownloadKey,
            @"http://www.foo.com/book/cover", kCoverKey,
            [NSNumber numberWithFloat:4.5], kRatingKey,
            [NSNumber numberWithInt:5], kNumCommentsKey,
            @"foo,bar", kCategoriesKey,
            @"foo, bar", kTagsKey,
            nil];
    book = [[Book alloc] initWithDictionary:dict];
    GHAssertNotNil(book, @"Init with all properties fails");
    GHAssertTrue([dict isEqualToDictionary:book.attributes],
                 @"Properties setup fails on initialization");
    GHAssertTrue([[dict valueForKey:kIdKey] intValue] == book.ID, 
                 @"book.id fails");
    GHAssertTrue([[dict valueForKey:kTitleKey] isEqualToString:book.title],
                 @"book.title fails");
    GHAssertTrue([[dict valueForKey:kAuthorKey] isEqualToString:book.author],
                 @"book.author fails");
    GHAssertTrue([[dict valueForKey:kPublisherKey] isEqualToString:book.publisher],
                 @"book.publisher fails");
    GHAssertTrue([[dict valueForKey:kPublisherDateKey] 
                  intValue] == book.publisherDate,
                 @"book.publisherDate fails");
    GHAssertTrue([[dict valueForKey:kPagesKey] intValue] == book.pages,
                 @"book.pages fails");
    GHAssertTrue([[dict valueForKey:kLanguageKey] isEqualToString:book.language],
                 @"book.language fails");
    GHAssertTrue([[dict valueForKey:kURLDetailsKey] 
                  isEqualToString:book.url_details],
                 @"book.url_details fails");    
    GHAssertTrue([[dict valueForKey:kURLDownloadKey] 
                  isEqualToString:book.url_download],
                 @"book.url_download fails");    
    GHAssertTrue([[dict valueForKey:kCoverKey] isEqualToString:book.cover],
                 @"book.cover fails");
    GHAssertTrue([[dict valueForKey:kRatingKey] floatValue] == book.rating,
                 @"book.rating fails");
    GHAssertTrue([[dict valueForKey:kNumCommentsKey] 
                  intValue] == book.num_comments,
                 @"book.num_comments fails");    
    GHAssertTrue([[dict valueForKey:kCategoriesKey] 
                  isEqualToString:book.categories],
                 @"book.categories fails");
    GHAssertTrue([[dict valueForKey:kTagsKey] isEqualToString:book.tags],
                 @"book.tags fails");    
    [book release];
}

@end
