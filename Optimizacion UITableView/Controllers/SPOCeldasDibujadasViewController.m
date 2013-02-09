//
//  SPOCeldasDibujadasViewController.m
//  Optimizacion UITableView
//
//  Created by Sendoa Portuondo on 07/02/13.
//  Copyright (c) 2013 Qbikode Solutions, S.L. All rights reserved.
//

#import "SPOCeldasDibujadasViewController.h"
#import "SPOTableViewCell.h"

@interface SPOCeldasDibujadasViewController ()

@end

@implementation SPOCeldasDibujadasViewController

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
    static NSString *CellIdentifier = @"CeldaDibujada";
    SPOTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (nil == cell) {
        cell = [[SPOTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.title = [NSString stringWithFormat:@"Titulo fila %d", indexPath.row];
    cell.subtitle = [NSString stringWithFormat:@"Subtitulo fila %d", indexPath.row];
    cell.thumbnail = [UIImage imageNamed:@"github-logo"];
    
    return cell;
}

@end
