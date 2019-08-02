//
//  LableSectionController.m
//  HeaderFreshDemo
//
//  Created by hscai on 2019/8/1.
//  Copyright © 2019 HSCOO. All rights reserved.
//

#import "LableSectionController.h"
#import "LabelModel.h"
#import "LabelCell.h"

@interface LableSectionController() <IGListBindingSectionControllerDataSource>

@end

@implementation LableSectionController


- (instancetype)init{
    if (self = [super init]) {
        self.dataSource = self;
    }
    return self;
}

- (NSArray<id<IGListDiffable>> *)sectionController:(IGListBindingSectionController *)sectionController viewModelsForObject:(id)object{
    return @[object];
}

- (CGSize)sectionController:(IGListBindingSectionController *)sectionController sizeForViewModel:(id)viewModel atIndex:(NSInteger)index{
    CGFloat width = self.collectionContext.containerSize.width;
    return CGSizeMake(width, 100);
}

- (UICollectionViewCell<IGListBindable> *)sectionController:(IGListBindingSectionController *)sectionController cellForViewModel:(id)viewModel atIndex:(NSInteger)index{
    static NSString *identifier = @"LabelCell";
    UICollectionViewCell<IGListBindable> *cell = [self.collectionContext dequeueReusableCellFromStoryboardWithIdentifier:identifier forSectionController:sectionController atIndex:index];

    return cell;
}


@end
