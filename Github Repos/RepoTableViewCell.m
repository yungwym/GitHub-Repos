//
//  RepoTableViewCell.m
//  Github Repos
//
//  Created by Alex Wymer  on 2017-07-17.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "RepoTableViewCell.h"

@interface RepoTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *repoNameLabel;


@end

@implementation RepoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
