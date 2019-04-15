//
//  DCViewMaker.m
//  DCViewMaker
//
//  Created by 戴川 on 2019/4/15.
//  Copyright © 2019 DC. All rights reserved.
//

#define DCWeakSelf     __weak typeof(self) weak_self = self;

#import "DCViewMaker.h"

@implementation DCViewMaker

#pragma mark - setter && getter
-(DCViewMaker *)with{
    return self;
}

-(DCViewMaker * _Nonnull (^)(CGRect))frame{
    DCWeakSelf
    return ^DCViewMaker * _Nonnull(CGRect frame) {
        weak_self.viewAttribute.frame = frame;
        return weak_self;
    };
}

- (DCViewMaker * _Nonnull (^)(UIColor * _Nonnull))backgroundColor{
    DCWeakSelf
    return ^DCViewMaker * _Nonnull(UIColor * _Nonnull backgroundColor) {
        weak_self.viewAttribute.backgroundColor = backgroundColor;
        return weak_self;
    };
}
- (DCViewMaker * _Nonnull (^)(CGFloat))cornerRadius{
    DCWeakSelf
    return ^DCViewMaker * _Nonnull(CGFloat cornerRadius) {
        weak_self.viewAttribute.cornerRadius = cornerRadius;
        return weak_self;
    };
}
- (UIView * _Nonnull (^)(UIView * _Nonnull))intoView{
    DCWeakSelf
    return ^UIView * _Nonnull(UIView * _Nonnull superView) {
        DCViewAttribute *viewAttribute = weak_self.viewAttribute;
        UIView *view = [[UIView alloc]initWithFrame:viewAttribute.frame];
        view.backgroundColor = viewAttribute.backgroundColor;
        view.layer.cornerRadius = viewAttribute.cornerRadius;
        [superView addSubview:view];
        return view;
    };
}
@end
