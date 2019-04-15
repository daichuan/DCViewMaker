//
//  DCViewAttribute.h
//  DCViewMaker
//
//  Created by 戴川 on 2019/4/15.
//  Copyright © 2019 DC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define DCWeakSelf     __weak typeof(self) weak_self = self;


NS_ASSUME_NONNULL_BEGIN

@interface DCViewAttribute : NSObject
//View
@property (nonatomic,assign)        CGRect frame;
@property (nonatomic,assign)        CGFloat cornerRadius; //圆角
@property (nonatomic,strong)        UIColor *backgroundColor;

//Label
@property (nonatomic, assign)       CGFloat font;
@property (nonatomic, assign)       UIFontWeight fontWeight;
@property (nonatomic, copy)         NSString *text;
@property (nonatomic, strong)       UIColor *textColor;
@property (nonatomic, assign)       NSTextAlignment textAlignment;
@property (nonatomic, assign)       NSInteger numberOfLines;

//Button
@property (nonatomic,copy)          NSString *normalText;
@property (nonatomic, strong)       UIColor *normalTextColor;
@property (nonatomic,copy)          NSString *highlightedText;
@property (nonatomic, strong)       UIColor *highlightedTextColor;
@property (nonatomic,copy)          NSString *disabledText;
@property (nonatomic, strong)       UIColor *disabledTextColor;
@property (nonatomic,copy)          NSString *selectedText;
@property (nonatomic, strong)       UIColor *selectedTextColor;
@property (nonatomic, strong)       UIImage *normalImage;
@property (nonatomic, strong)       UIImage *highlightedImage;
@property (nonatomic, strong)       UIImage *disabledImage;
@property (nonatomic, strong)       UIImage *selectedImage;





@end

NS_ASSUME_NONNULL_END
