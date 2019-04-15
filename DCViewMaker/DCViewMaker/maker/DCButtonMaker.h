//
//  DCButtonMaker.h
//  DCViewMaker
//
//  Created by 戴川 on 2019/4/15.
//  Copyright © 2019 DC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DCViewAttribute.h"
NS_ASSUME_NONNULL_BEGIN

@interface DCButtonMaker : NSObject

/** 介词，为了增加可读性，这里直接返回了self */
@property (nonatomic, strong,readonly) DCButtonMaker *with;
/** view的属性 */
@property (nonatomic, strong) DCViewAttribute *viewAttribute;

@property (nonatomic,copy,readonly) DCButtonMaker* (^normalText)(NSString *normalText);
@property (nonatomic,copy,readonly) DCButtonMaker* (^highlightedText)(NSString *highlightedText);
@property (nonatomic,copy,readonly) DCButtonMaker* (^disabledText)(NSString *disabledText);
@property (nonatomic,copy,readonly) DCButtonMaker* (^selectedText)(NSString *selectedText);

@property (nonatomic,copy,readonly) DCButtonMaker* (^normalTextColor)(UIColor *normalTextColor);
@property (nonatomic,copy,readonly) DCButtonMaker* (^highlightedTextColor)(UIColor *highlightedTextColor);
@property (nonatomic,copy,readonly) DCButtonMaker* (^disabledTextColor)(UIColor *disabledTextColor);
@property (nonatomic,copy,readonly) DCButtonMaker* (^selectedTextColor)(UIColor *selectedTextColor);

@property (nonatomic,copy,readonly) DCButtonMaker* (^normalImage)(UIImage *normalImage);
@property (nonatomic,copy,readonly) DCButtonMaker* (^highlightedImage)(UIImage *highlightedImage);
@property (nonatomic,copy,readonly) DCButtonMaker* (^disabledImage)(UIImage *disabledImage);
@property (nonatomic,copy,readonly) DCButtonMaker* (^selectedImage)(UIImage *selectedImage);

@property (nonatomic,copy,readonly) DCButtonMaker* (^font)(CGFloat font);
@property (nonatomic,copy,readonly) DCButtonMaker* (^fontWeigth)(CGFloat fontWeigth);


@property (nonatomic,copy,readonly) DCButtonMaker* (^frame)(CGRect frame);
@property (nonatomic,copy,readonly) DCButtonMaker* (^backgroundColor)(UIColor *backgroundColor);
/** 如果设置了cornerRadius label的clipsToBounds属性将自动设置为YES，如果要修改可以在创建完label后修改 */
@property (nonatomic,copy,readonly) DCButtonMaker* (^cornerRadius)(CGFloat cornerRadius);
@property (nonatomic,copy,readonly) UIButton* (^intoView)(UIView *superView);


@end

NS_ASSUME_NONNULL_END
