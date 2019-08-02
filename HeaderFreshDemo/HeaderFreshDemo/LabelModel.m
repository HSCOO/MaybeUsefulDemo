//
//  LabelModel.m
//  HeaderFreshDemo
//
//  Created by hscai on 2019/8/1.
//  Copyright © 2019 HSCOO. All rights reserved.
//

#import "LabelModel.h"

@implementation LabelModel

- (nonnull id<NSObject>)diffIdentifier {
    return self.text;
}

- (BOOL)isEqualToDiffableObject:(LabelModel <IGListDiffable>*)object {
    return [self isEqual:object];
}

- (BOOL)isEqual:(LabelModel *)object
{
    if (self == object) {
        return YES;
    } else if (self == nil || object == nil || ![object isKindOfClass:[self class]]) {
        return NO;
    }
    return
    (_text == object->_text ? YES : [_text isEqual:object->_text]);
}

@end
