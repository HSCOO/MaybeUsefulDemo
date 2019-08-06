//
//  ViewController.m
//  HeaderFreshDemo
//
//  Created by hscai on 2019/8/1.
//  Copyright © 2019 HSCOO. All rights reserved.
//

#import "ViewController.h"
#import "LabelModel.h"
#import <IGListKit/IGListKit.h>
#import "LableSectionController.h"
#import <MJRefresh.h>

static NSInteger const kPerCount = 4;

@interface ViewController ()<IGListAdapterDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IGListAdapter *adapter;

@property (strong, nonatomic) NSMutableArray *models;
/**开始页数*/
@property (assign, nonatomic) NSInteger currentPageNum;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.currentPageNum = 0;
    [self _data];
    [self _collectionViewSetting];
}

- (void)_data{
    
    NSInteger currentCount = self.currentPageNum * kPerCount;
    NSInteger nextPageNum = self.currentPageNum + 1;
    NSInteger nextCount = nextPageNum * kPerCount;
    
    for (NSInteger i = currentCount; i < nextCount; i++) {
        LabelModel *labelModel = [LabelModel new];
        labelModel.text = [NSString stringWithFormat:@"%ld",i];
        [self.models addObject:labelModel];
    }
    
    self.currentPageNum = nextPageNum;
}

- (void)_collectionViewSetting{
    // 翻转collectionview
    self.collectionView.transform = CGAffineTransformMakeRotation(-M_PI);
    self.collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, self.collectionView.bounds.size.width - 8.0);// 为啥是8，打开视图层级看下应该差不多
    
    self.adapter.dataSource = self;
    self.adapter.collectionView = self.collectionView;
    
    // 翻转之后，添加footer
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          
            [self _data];
            [self.adapter performUpdatesAnimated:NO completion:nil];
            [self.collectionView.mj_footer endRefreshing];
        });
    }];
    footer.refreshingTitleHidden = YES;
    footer.stateLabel.hidden = YES;
    
    self.collectionView.mj_footer = footer;
}

#pragma mark - IGListAdapterDataSource -

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return self.models;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    if ([object isMemberOfClass:[LabelModel class]]) {
        return LableSectionController.new;
    }
    return nil;
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter{return  nil;}

#pragma mark - Getter -

- (IGListAdapter *)adapter{
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    }
    return _adapter;
}

- (NSMutableArray *)models{
    if (!_models) {
        _models = [NSMutableArray array];
    }
    return _models;
}


@end
