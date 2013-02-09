//
//  SPOFlickrImageCell.m
//  Optimizacion UITableView
//
//  Created by Sendoa Portuondo on 08/02/13.
//  Copyright (c) 2013 Qbikode Solutions, S.L. All rights reserved.
//

#import "SPOFlickrImageCell.h"


@interface SPOFlickrImageCell ()

@property (weak, nonatomic) IBOutlet UIImageView *fotoImageView;
@property (weak, nonatomic) IBOutlet UILabel *tituloLabel;

@end

@implementation SPOFlickrImageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)prepareForReuse
{
    self.fotoImageView.image = nil;
}

- (void)setFlickrImageData:(NSDictionary *)imageData
{
    self.tituloLabel.text = imageData[@"title"];
    NSString *urlImagen = [NSString stringWithFormat:@"http://farm%@.static.flickr.com/%@/%@_%@_s.jpg",
                           imageData[@"farm"], imageData[@"server"],
                           imageData[@"id"], imageData[@"secret"]];
    [self.fotoImageView setImageFromURL:[NSURL URLWithString:urlImagen] placeHolderImage:nil];
}

@end
