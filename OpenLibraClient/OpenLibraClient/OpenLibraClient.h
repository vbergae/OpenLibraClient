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

/**
 OpenLibraClient is the main class to fetch requests to OpenLibra Service.
 */
@interface OpenLibraClient : NSObject {
@private
    Criteria *_criteria;
}

/**
 Criteria to make a request to OpenLibra service.
 */
@property (nonatomic, retain) Criteria *criteria;

/**
 Initializer. 
 Creates an instance of OpenLibraClient with the given Criteria.
 
 @param Criteria Search criterium
 @return OpenLibraclient Initialized client
 */
- (id)initWithCriteria:(Criteria *)criteria;

@end
