//
//  SPOFlickrEngine.h
//  Optimizacion UITableView
//
//  Created by Sendoa Portuondo on 08/02/13.
//  Copyright (c) 2013 Qbikode Solutions, S.L. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"

#warning Esta clave de Flickr la he creado para las pruebas de esta app. Por favor, no la utilices para tus propias apps. Solicita una a Flickr.
#define FLICKR_API_KEY @"1d7e725902af3080ba163155f9af5371"
#define FLICKR_IMAGE_URL(__TAG__) [NSString stringWithFormat:@"services/rest/?method=flickr.photos.search&api_key=%@&tags=%@&per_page=200&format=json&nojsoncallback=1", FLICKR_API_KEY, __TAG__]

@interface SPOFlickrEngine : AFHTTPClient

typedef void (^FlickrImagesResponseBlock)(NSArray* imageURLs);
typedef void (^SPORequestFailureBlock)(AFHTTPRequestOperation *operation, NSError *error);

+ (SPOFlickrEngine *)sharedClient;
- (void) imagesForTag:(NSString*) tag completionHandler:(FlickrImagesResponseBlock) imageURLBlock errorHandler:(SPORequestFailureBlock) errorBlock;

@end
