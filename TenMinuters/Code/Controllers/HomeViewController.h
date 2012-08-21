//
//  HomeViewController.h
//  Ten Minuters
//
//  Created by Chung-Yi Chi on 4/22/12.
//  Copyright (c) 2012 Carnegie Mellon University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NYTNewsWire.h"

@interface HomeViewController : UIViewController {
    
    __weak IBOutlet UILabel *newsTitle;
    __weak IBOutlet UILabel *newsBrief;
    
    NYTNewsWire *lala;
}

@end
