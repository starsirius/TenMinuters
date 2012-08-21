//
//  ContentRequesterProtocol.h
//  Ten Minuters
//
//  Created by Chung-Yi Chi on 5/9/12.
//  Copyright (c) 2012 Carnegie Mellon University. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ContentRequesterProtocol <NSObject>

- (void)content:(int)type didLoadResponse:(NSMutableArray *)response;

@end
