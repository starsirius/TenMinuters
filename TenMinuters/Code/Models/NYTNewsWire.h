//
//  NYTNewsWire.h
//  Ten Minuters
//
//  Created by Chung-Yi Chi on 4/28/12.
//  Copyright (c) 2012 Carnegie Mellon University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsProviderProtocol.h"
#import <RestKit/RestKit.h>

@interface NYTNewsWire : NSObject <NewsProviderProtocol, RKRequestDelegate> {
@private
    NSString *apiKey;
    NSMutableDictionary *sectionSubscription;
    NSMutableDictionary *newsDict;
}

@property (nonatomic, retain) NSString *apiKey;
@property (nonatomic, retain) NSMutableDictionary *sectionSubscription;
@property (nonatomic, retain) NSMutableDictionary *newsDict;

- (id)initWithApiKey:(NSString *)key;

- (NSArray *)getSections;

- (id)enableSection:(NSString *)section;

- (id)disableSection:(NSString *)section;

@end
