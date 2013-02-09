//
//  SPOCeldasUIKitViewController.m
//  Optimizacion UITableView
//
//  Created by Sendoa Portuondo on 07/02/13.
//  Copyright (c) 2013 Qbikode Solutions, S.L. All rights reserved.
//

#import "SPOCeldasUIKitViewController.h"

@interface SPOCeldasUIKitViewController ()

@end

@implementation SPOCeldasUIKitViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Titulo fila %d", indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Subtitulo fila %d", indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"github-logo"];
    
    return cell;
}

@end
