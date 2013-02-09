//
//  SPOFlickrEngine.m
//  Optimizacion UITableView
//
//  Created by Sendoa Portuondo on 08/02/13.
//  Copyright (c) 2013 Qbikode Solutions, S.L. All rights reserved.
//

#import "SPOFlickrEngine.h"

@implementation SPOFlickrEngine

+ (instancetype)sharedClient {
    static SPOFlickrEngine *_sharedClient = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedClient = [[self alloc] initWithHostName:@"api.flickr.com"];
    });
    return _sharedClient;
}

- (void)imagesForTag:(NSString *)tag completionHandler:(FlickrImagesResponseBlock)responseBlock errorHandler:(SPORequestFailureBlock)errorBlock
{
    MKNetworkOperation *operation = [self operationWithPath:FLICKR_IMAGE_URL(tag)];
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        [completedOperation responseJSONWithCompletionHandler:^(id jsonObject) {
            NSArray *imagesFromResponse = [jsonObject valueForKeyPath:@"photos.photo"];
            NSLog(@"%@", imagesFromResponse);
            responseBlock(imagesFromResponse);
        }];
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        errorBlock(completedOperation, error);
    }];
    
    [self enqueueOperation:operation];
}

@end
