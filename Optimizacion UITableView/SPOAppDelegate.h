//
//  SPOAppDelegate.h
//  Optimizacion UITableView
//
//  Created by Sendoa Portuondo on 07/02/13.
//  Copyright (c) 2013 Qbikode Solutions, S.L. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPOFlickrEngine.h"

#define ApplicationDelegate ((SPOAppDelegate *)[UIApplication sharedApplication].delegate)

@interface SPOAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SPOFlickrEngine *flickrEngine;

@end
