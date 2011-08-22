//  This file is part of the OpenLibraClient package.
//
//  OpenLibraClient.h
//  OpenLibraClient
//
//  Created by Víctor Berga on 21/08/11 <victor@victorberga.com>.
//  Copyright 2011 Víctor Berga. All rights reserved.
// 
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.

#import <Foundation/Foundation.h>

#import "Criteria.h"
#import "Book.h"
#import "SBJson.h"

#define API_HOST    @"openlibra.com"
#define API_PATH    @"/api/v1/get/?"

/**
 OpenLibraClient is the main class to fetch requests to OpenLibra Service.
 */
@interface OpenLibraClient : NSObject {
@private
    Criteria *_criteria;
    NSMutableData *_responseData;
    NSMutableArray *_books;
}

/**
 Criteria to make a request to OpenLibra service.
 */
@property (nonatomic, retain) Criteria *criteria;
/**
 URL Request for the OpenLibra Service
 */
@property (nonatomic, readonly) NSURLRequest *serviceURLRequest;
/**
 Array with all books returned by the service
 */
@property (nonatomic, readonly) NSArray *books;

/**
 Initializer. 
 Creates an instance of OpenLibraClient with the given Criteria.
 
 @param Criteria Search criterium
 @return OpenLibraclient Initialized client
 */
- (id)initWithCriteria:(Criteria *)criteria;

#pragma mark -
#pragma mark Instance Methods

/**
 Send an asyncrhonous request to the OpenLibra Service.
 */
- (void)fetchRequest;

@end
