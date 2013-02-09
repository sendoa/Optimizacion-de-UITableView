//
//  SPOCeldasOptimizadasDesdeXIBViewController.m
//  Optimizacion UITableView
//
//  Created by Sendoa Portuondo on 07/02/13.
//  Copyright (c) 2013 Qbikode Solutions, S.L. All rights reserved.
//

#import "SPOCeldasOptimizadasDesdeXIBViewController.h"
#import "SPOCeldaOptimizadaCell.h"

@interface SPOCeldasOptimizadasDesdeXIBViewController ()

@end

@implementation SPOCeldasOptimizadasDesdeXIBViewController

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
    static NSString *CellIdentifier = @"CeldaXIBOptimizada";
    SPOCeldaOptimizadaCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (nil == cell) {
        // Obtenemos la celda del XIB
        NSArray *nib = [[UINib nibWithNibName:@"SPOCeldaOptimizadaCell" bundle:nil] instantiateWithOwner:self options:nil];
		cell = (SPOCeldaOptimizadaCell*)[nib objectAtIndex:0];
        
    }
    
    cell.titleLabel.text = [NSString stringWithFormat:@"Titulo fila %d", indexPath.row];
    cell.subtitleLabel.text = [NSString stringWithFormat:@"Subtítulo fila %d", indexPath.row];
    
    return cell;
}

@end
