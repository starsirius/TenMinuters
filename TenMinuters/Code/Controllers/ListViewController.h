//
//  ListViewController.h
//  Ten Minuters
//
//  Created by Chung-Yi Chi on 4/28/12.
//  Copyright (c) 2012 Carnegie Mellon University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import "NYTNewsWire.h"
#import "ContentRequesterProtocol.h"

@interface ListViewController : UITableViewController <ContentRequesterProtocol> {
    NSMutableArray *newsList;
}
@property (nonatomic, retain) NSMutableArray *newsList;

@end
