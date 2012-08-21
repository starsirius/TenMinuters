//
//  DetailViewController.h
//  Ten Minuters
//
//  Created by Chung-Yi Chi on 5/13/12.
//  Copyright (c) 2012 Carnegie Mellon University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"

@interface DetailViewController : UIViewController <UIWebViewDelegate> {
    __weak IBOutlet UIWebView *webview;
    News *news;
}
@property (nonatomic, retain) News *news;

@end
