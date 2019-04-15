//
//  DCButtonMaker.m
//  DCViewMaker
//
//  Created by 戴川 on 2019/4/15.
//  Copyright © 2019 DC. All rights reserved.
//

#import "DCButtonMaker.h"

@implementation DCButtonMaker

#pragma mark - setter && getter
-(DCButtonMaker *)with{
    return self;
}

-(DCButtonMaker * _Nonnull (^)(NSString * _Nonnull))normalText{
    DCWeakSelf
    return ^DCButtonMaker * _Nonnull(NSString *normalText) {
        weak_self.viewAttribute.normalText = normalText;
        return weak_self;
    };
}

-(DCButtonMaker * _Nonnull (^)(UIColor * _Nonnull))normalTextColor{
    DCWeakSelf
    return ^DCButtonMaker * _Nonnull(UIColor *normalTextColor) {
        weak_self.viewAttribute.normalTextColor = normalTextColor;
        return weak_self;
    };
}

-(DCButtonMaker * _Nonnull (^)(UIImage * _Nonnull))normalImage{
    DCWeakSelf
    return ^DCButtonMaker * _Nonnull(UIImage *normalImage) {
        weak_self.viewAttribute.normalImage = normalImage;
        return weak_self;
    };
}

-(DCButtonMaker * _Nonnull (^)(NSString * _Nonnull))highlightedText{
    DCWeakSelf
    return ^DCButtonMaker * _Nonnull(NSString *highlightedText) {
        weak_self.viewAttribute.highlightedText = highlightedText;
        return weak_self;
    };
}

-(DCButtonMaker * _Nonnull (^)(UIColor * _Nonnull))highlightedTextColor{
    DCWeakSelf
    return ^DCButtonMaker * _Nonnull(UIColor *highlightedTextColor) {
        weak_self.viewAttribute.highlightedTextColor = highlightedTextColor;
        return weak_self;
    };
}

-(DCButtonMaker * _Nonnull (^)(UIImage * _Nonnull))highlightedImage{
    DCWeakSelf
    return ^DCButtonMaker * _Nonnull(UIImage *highlightedImage) {
        weak_self.viewAttribute.highlightedImage = highlightedImage;
        return weak_self;
    };
}

-(DCButtonMaker * _Nonnull (^)(NSString * _Nonnull))disabledText{
    DCWeakSelf
    return ^DCButtonMaker * _Nonnull(NSString *disabledText) {
        weak_self.viewAttribute.disabledText = disabledText;
        return weak_self;
    };
}

-(DCButtonMaker * _Nonnull (^)(UIColor * _Nonnull))disabledTextColor{
    DCWeakSelf
    return ^DCButtonMaker * _Nonnull(UIColor *disabledTextColor) {
        weak_self.viewAttribute.disabledTextColor = disabledTextColor;
        return weak_self;
    };
}

-(DCButtonMaker * _Nonnull (^)(UIImage * _Nonnull))disabledImage{
    DCWeakSelf
    return ^DCButtonMaker * _Nonnull(UIImage *disabledImage) {
        weak_self.viewAttribute.disabledImage = disabledImage;
        return weak_self;
    };
}

-(DCButtonMaker * _Nonnull (^)(NSString * _Nonnull))selectedText{
    DCWeakSelf
    return ^DCButtonMaker * _Nonnull(NSString *selectedText) {
        weak_self.viewAttribute.selectedText = selectedText;
        return weak_self;
    };
}
- (DCButtonMaker * _Nonnull (^)(UIColor * _Nonnull))selectedTextColor{
    DCWeakSelf
    return ^DCButtonMaker * _Nonnull(UIColor *selectedTextColor) {
        weak_self.viewAttribute.selectedTextColor = selectedTextColor;
        return weak_self;
    };
}

-(DCButtonMaker * _Nonnull (^)(UIImage * _Nonnull))selectedImage{
    DCWeakSelf
    return ^DCButtonMaker * _Nonnull(UIImage *selectedImage) {
        weak_self.viewAttribute.selectedImage = selectedImage;
        return weak_self;
    };
}
-(DCButtonMaker * _Nonnull (^)(CGFloat))font{
    DCWeakSelf
    return ^DCButtonMaker* (CGFloat font){
        weak_self.viewAttribute.font = font;
        return weak_self;
    };
}

-(DCButtonMaker * _Nonnull (^)(UIFontWeight))fontWeight{
    DCWeakSelf
    return ^DCButtonMaker* (UIFontWeight fontWeight){
        weak_self.viewAttribute.fontWeight = fontWeight;
        return weak_self;
    };
}


-(DCButtonMaker * _Nonnull (^)(CGRect))frame{
    DCWeakSelf
    return ^DCButtonMaker * _Nonnull(CGRect frame) {
        weak_self.viewAttribute.frame = frame;
        return weak_self;
    };
}

- (DCButtonMaker * _Nonnull (^)(UIColor * _Nonnull))backgroundColor{
    DCWeakSelf
    return ^DCButtonMaker * _Nonnull(UIColor * _Nonnull backgroundColor) {
        weak_self.viewAttribute.backgroundColor = backgroundColor;
        return weak_self;
    };
}
- (DCButtonMaker * _Nonnull (^)(CGFloat))cornerRadius{
    DCWeakSelf
    return ^DCButtonMaker * _Nonnull(CGFloat cornerRadius) {
        weak_self.viewAttribute.cornerRadius = cornerRadius;
        return weak_self;
    };
}
- (UIButton * _Nonnull (^)(UIView * _Nonnull))intoView{
    DCWeakSelf
    return ^UIButton * _Nonnull(UIView * _Nonnull superView) {
        DCViewAttribute *viewAttribute = weak_self.viewAttribute;
        UIButton *button = [[UIButton alloc]initWithFrame:viewAttribute.frame];
        button.backgroundColor = viewAttribute.backgroundColor;
        if(viewAttribute.cornerRadius > 0){
            button.clipsToBounds = YES;
            button.layer.cornerRadius = viewAttribute.cornerRadius;
        }
        [button setTitle:viewAttribute.normalText forState:UIControlStateNormal];
        [button setTitle:viewAttribute.highlightedText forState:UIControlStateHighlighted];
        [button setTitle:viewAttribute.selectedText forState:UIControlStateSelected];
        [button setTitle:viewAttribute.disabledText forState:UIControlStateDisabled];
        
        [button setTitleColor:viewAttribute.normalTextColor forState:UIControlStateNormal];
        [button setTitleColor:viewAttribute.highlightedTextColor forState:UIControlStateHighlighted];
        [button setTitleColor:viewAttribute.selectedTextColor forState:UIControlStateSelected];
        [button setTitleColor:viewAttribute.disabledTextColor forState:UIControlStateDisabled];

        [button setImage:viewAttribute.normalImage forState:UIControlStateNormal];
        [button setImage:viewAttribute.highlightedImage forState:UIControlStateHighlighted];
        [button setImage:viewAttribute.selectedImage forState:UIControlStateSelected];
        [button setImage:viewAttribute.disabledImage forState:UIControlStateDisabled];

        
        button.titleLabel.font = [UIFont systemFontOfSize:viewAttribute.font weight:viewAttribute.fontWeight];
        
        [superView addSubview:button];
        return button;
    };
}
@end
