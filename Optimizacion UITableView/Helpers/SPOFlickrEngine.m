//
//  SPOFlickrEngine.m
//  Optimizacion UITableView
//
//  Created by Sendoa Portuondo on 08/02/13.
//  Copyright (c) 2013 Qbikode Solutions, S.L. All rights reserved.
//

#import "SPOFlickrEngine.h"
#import "AFJSONRequestOperation.h"

@implementation SPOFlickrEngine

+ (instancetype)sharedClient {
    static SPOFlickrEngine *_sharedClient = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:@"http://api.flickr.com/"]];
    });
    return _sharedClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    // Queremos trabajar con JSON
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

- (void)imagesForTag:(NSString *)tag completionHandler:(FlickrImagesResponseBlock)responseBlock errorHandler:(SPORequestFailureBlock)errorBlock
{
    [self getPath:FLICKR_IMAGE_URL(tag) parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *imagesFromResponse = [responseObject valueForKeyPath:@"photos.photo"];
        responseBlock(imagesFromResponse);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock(operation, error);
    }];
}

@end
