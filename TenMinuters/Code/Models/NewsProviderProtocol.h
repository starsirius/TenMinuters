//
//  NewsProviderProtocol.h
//  Ten Minuters
//
//  Created by Chung-Yi Chi on 4/28/12.
//  Copyright (c) 2012 Carnegie Mellon University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "News.h"

@protocol NewsProviderProtocol <NSObject>

/**
 * Get a certain number of recently published news from this provider.
 * @param number - the number of recent news to return
 * @return An array of news
 */
- (NSMutableArray *)getRecentNews:(int)number;

/**
 * Get the unique id of this provider.
 * @return interger Id of this provider.
 */
- (int)getProviderId;

@end
