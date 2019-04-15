//
//  DCLabelMaker.m
//  DCViewMaker
//
//  Created by 戴川 on 2019/4/15.
//  Copyright © 2019 DC. All rights reserved.
//


#import "DCLabelMaker.h"

@implementation DCLabelMaker

#pragma mark - setter && getter
-(DCLabelMaker * _Nonnull (^)(CGFloat))font{
    DCWeakSelf
    return ^DCLabelMaker* (CGFloat font){
        weak_self.viewAttribute.font = font;
        return weak_self;
    };
}

-(DCLabelMaker * _Nonnull (^)(UIFontWeight))fontWeight{
    DCWeakSelf
    return ^DCLabelMaker* (UIFontWeight fontWeight){
        weak_self.viewAttribute.fontWeight = fontWeight;
        return weak_self;
    };
}

- (DCLabelMaker * _Nonnull (^)(NSString * _Nonnull))text{
    DCWeakSelf
    return ^DCLabelMaker* (NSString * text){
        weak_self.viewAttribute.text = text;
        return weak_self;
    };
}

- (DCLabelMaker * _Nonnull (^)(UIColor * _Nonnull))textColor{
    DCWeakSelf
    return ^DCLabelMaker* (UIColor *textColor){
        weak_self.viewAttribute.textColor = textColor;
        return weak_self;
    };
}

- (DCLabelMaker * _Nonnull (^)(NSTextAlignment))textAlignment{
    DCWeakSelf
    return ^DCLabelMaker* (NSTextAlignment textAlignment){
        weak_self.viewAttribute.textAlignment = textAlignment;
        return weak_self;
    };
}

- (DCLabelMaker * _Nonnull (^)(NSInteger))numberOfLines{
    DCWeakSelf
    return ^DCLabelMaker* (NSInteger numberOfLines){
        weak_self.viewAttribute.numberOfLines = numberOfLines;
        return weak_self;
    };
}


-(DCLabelMaker * _Nonnull (^)(CGRect))frame{
    DCWeakSelf
    return ^DCLabelMaker * _Nonnull(CGRect frame) {
        weak_self.viewAttribute.frame = frame;
        return weak_self;
    };
}

- (DCLabelMaker * _Nonnull (^)(UIColor * _Nonnull))backgroundColor{
    DCWeakSelf
    return ^DCLabelMaker * _Nonnull(UIColor * _Nonnull backgroundColor) {
        weak_self.viewAttribute.backgroundColor = backgroundColor;
        return weak_self;
    };
}
- (DCLabelMaker * _Nonnull (^)(CGFloat))cornerRadius{
    DCWeakSelf
    return ^DCLabelMaker * _Nonnull(CGFloat cornerRadius) {
        weak_self.viewAttribute.cornerRadius = cornerRadius;
        return weak_self;
    };
}
- (UILabel * _Nonnull (^)(UIView * _Nonnull))intoView{
    DCWeakSelf
    return ^UILabel * _Nonnull(UIView * _Nonnull superView) {
        DCViewAttribute *viewAttribute = weak_self.viewAttribute;
        UILabel *label = [[UILabel alloc]initWithFrame:viewAttribute.frame];
        label.backgroundColor = viewAttribute.backgroundColor;
        if(viewAttribute.cornerRadius > 0){
            label.clipsToBounds = YES;
            label.layer.cornerRadius = viewAttribute.cornerRadius;
        }
        label.text = viewAttribute.text;
        label.textColor = viewAttribute.textColor;
        label.font = [UIFont systemFontOfSize:viewAttribute.font weight:viewAttribute.fontWeight];
        label.textAlignment = viewAttribute.textAlignment;
        label.numberOfLines = viewAttribute.numberOfLines;
        
        [superView addSubview:label];
        return label;
    };
}
@end
