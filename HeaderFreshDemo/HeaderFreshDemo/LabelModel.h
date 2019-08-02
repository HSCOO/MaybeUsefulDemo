//
//  LabelModel.h
//  HeaderFreshDemo
//
//  Created by hscai on 2019/8/1.
//  Copyright © 2019 HSCOO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListKit/IGListKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LabelModel : NSObject <IGListDiffable>

@property (copy, nonatomic) NSString *text;

@end

NS_ASSUME_NONNULL_END
