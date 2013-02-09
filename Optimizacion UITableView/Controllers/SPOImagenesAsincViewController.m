//
//  SPOImagenesAsincViewController.m
//  Optimizacion UITableView
//
//  Created by Sendoa Portuondo on 08/02/13.
//  Copyright (c) 2013 Qbikode Solutions, S.L. All rights reserved.
//

#import "SPOImagenesAsincViewController.h"
#import "SPOFlickrEngine.h"
#import "SPOFlickrImageCell.h"

@interface SPOImagenesAsincViewController ()

@property (copy, nonatomic) NSArray *imagenesDeFlickr;

@end

@implementation SPOImagenesAsincViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    // Obtenemos las imágenes de Flickr de la red
    [ApplicationDelegate.flickrEngine imagesForTag:@"bilbao" completionHandler:^(NSArray *imageURLs) {
        self.imagenesDeFlickr= imageURLs;
        [self.tableView reloadData];
    } errorHandler:^(MKNetworkOperation *operation, NSError *error) {
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.imagenesDeFlickr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CeldaImagenFlickr";
    SPOFlickrImageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Obtenemos información de la imagen actual
    NSDictionary *datosImagenFlickr = self.imagenesDeFlickr[indexPath.row];
    [cell setFlickrImageData:datosImagenFlickr];
    
    return cell;
}

@end
