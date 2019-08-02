//
//  LabelCell.m
//  HeaderFreshDemo
//
//  Created by hscai on 2019/8/1.
//  Copyright © 2019 HSCOO. All rights reserved.
//

#import "LabelCell.h"
#import "LabelModel.h"

@interface LabelCell()

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation LabelCell

- (void)awakeFromNib{
    [super awakeFromNib];
    // 一定要在这里翻转，不然有bug，调了我好久😂，手动创建在init:frame里面翻转
    self.contentView.transform = CGAffineTransformMakeRotation(-M_PI);
}

- (void)bindViewModel:(LabelModel *)viewModel{
    if (![viewModel isMemberOfClass:[LabelModel class]]) {
        return;
    }
    self.contentLabel.text = viewModel.text;
}

@end
