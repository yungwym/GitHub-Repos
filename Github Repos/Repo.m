//
//  Repo.m
//  Github Repos
//
//  Created by Alex Wymer  on 2017-07-17.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "Repo.h"

@implementation Repo

- (instancetype)initWithRepo:(NSString *)repoName
{
    self = [super init];
    if (self) {
 
        _repoName = repoName; 
        
    }
    return self;
}

@end
