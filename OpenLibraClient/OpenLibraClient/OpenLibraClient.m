//  This file is part of the OpenLibraClient package.
//
//  OpenLibraClient.m
//  OpenLibraClient
//
//  Created by Víctor Berga on 21/08/11 <victor@victorberga.com>.
//  Copyright 2011 Víctor Berga. All rights reserved.
// 
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.

#import "OpenLibraClient.h"
#import "SBJson.h"

@implementation OpenLibraClient

@synthesize criteria    = _criteria;
@synthesize books       = _books;
@synthesize delegate    = _delegate;
@dynamic serviceURLRequest;

- (id)init
{
    self = [super init];
    if (self) {
        [self setCriteria:[[[Criteria alloc] init] autorelease]];
    }
    
    return self;
}

- (id)initWithCriteria:(Criteria *)criteria
{
    self = [self init];
    if (self) {
        [self setCriteria:criteria];
    }
    
    return self;
}

#pragma mark -
#pragma mark Memory Management

- (void)dealloc
{
    [self setCriteria:nil];
    
    [_responseData release];
    _responseData = nil;
    
    [_books release];
    _books = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark Dynamic properties

- (NSURLRequest *)serviceURLRequest
{
    NSString *urlString = [[NSString stringWithFormat:@"http://%@%@%@",
                           API_HOST, API_PATH, 
                           [self.criteria requestParameters]] 
                           stringByAddingPercentEscapesUsingEncoding:
                           NSUTF8StringEncoding];

    return [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
}

#pragma mark -
#pragma mark Instance Methods

- (void)fetchRequest
{
    if ([self.delegate respondsToSelector:@selector(willStartConnection:)]) {
        [self.delegate willStartConnection:self];
    }
    
    NSLog(@"request: %@", self.serviceURLRequest);
    NSURLConnection *theConnection = [[NSURLConnection alloc] 
                                      initWithRequest:self.serviceURLRequest
                                      delegate:self 
                                      startImmediately:YES];
    
    if ([self.delegate 
         respondsToSelector:@selector(openLibraClient:didStartConnection:)]) {
        [self.delegate openLibraClient:self 
                    didStartConnection:theConnection];
    }
    
    if (!theConnection) {
        NSError *error = [NSError errorWithDomain:@"ConnectionError" 
                                             code:1 
                                         userInfo:nil];
        
        if ([self.delegate respondsToSelector:
             @selector(openLibraClient:didFailConnectionWithError:)]) 
        {
            [self.delegate openLibraClient:self 
                didFailConnectionWithError:error];
        }
    }
}

#pragma mark -
#pragma mark NSURLConnection delegate

- (void)connection:(NSURLConnection *)connection 
    didReceiveData:(NSData *)data
{
    if (!_responseData) {
        _responseData = [[NSMutableData alloc] initWithData:data];
    } else {
        [_responseData appendData:data];
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Check reponse syntax
    NSString *jsonString = [[[NSString alloc] initWithData:_responseData 
                                                 encoding:NSUTF8StringEncoding] 
                            autorelease];
    if ([jsonString length] > 0) {
        jsonString = [jsonString substringFromIndex:1]; 
        jsonString = [jsonString substringToIndex:jsonString.length - 2];
        
        NSArray *booksRaw = [jsonString JSONValue];
        
        // Clean previous books
        if (_books) [_books release];
        _books = [[NSMutableArray alloc] initWithCapacity:booksRaw.count];
        
        for (NSDictionary *book in booksRaw) {
            [_books addObject:[[Book alloc] initWithDictionary:book]];
        }        
    }
    
    // Send message to delegate
    if ([self.delegate 
         respondsToSelector:@selector(openLibraClientDidFinishLoading:)]) {
        [self.delegate openLibraClientDidFinishLoading:self];
    }
    
    // Clean up data
    [connection release];
    [_responseData release];
    _responseData = nil;    
}

- (void)connection:(NSURLConnection *)connection 
  didFailWithError:(NSError *)error
{
    [connection release];
    [_responseData release];
    _responseData = nil;
    
    if ([self.delegate respondsToSelector:
         @selector(openLibraClient:didFailConnectionWithError:)]) 
    {
        [self.delegate openLibraClient:self 
            didFailConnectionWithError:error];
    }
}

@end