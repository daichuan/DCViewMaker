//
//  DCLabelMaker.h
//  DCViewMaker
//
//  Created by 戴川 on 2019/4/15.
//  Copyright © 2019 DC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DCViewAttribute.h"

NS_ASSUME_NONNULL_BEGIN

@interface DCLabelMaker : NSObject
/** 介词，为了增加可读性，这里直接返回了self */
@property (nonatomic, strong,readonly) DCLabelMaker *with;
/** view的属性 */
@property (nonatomic, strong) DCViewAttribute *viewAttribute;

@property (nonatomic,copy,readonly) DCLabelMaker* (^font)(CGFloat font);
@property (nonatomic,copy,readonly) DCLabelMaker* (^fontWeight)(UIFontWeight fontWeight);
@property (nonatomic,copy,readonly) DCLabelMaker* (^text)(NSString *text);
@property (nonatomic,copy,readonly) DCLabelMaker* (^textColor)(UIColor *textColor);
@property (nonatomic,copy,readonly) DCLabelMaker* (^textAlignment)(NSTextAlignment textAlignment);
@property (nonatomic,copy,readonly) DCLabelMaker* (^numberOfLines)(NSInteger numberOfLines);

@property (nonatomic,copy,readonly) DCLabelMaker* (^frame)(CGRect frame);
@property (nonatomic,copy,readonly) DCLabelMaker* (^backgroundColor)(UIColor *backgroundColor);
/** 如果设置了cornerRadius label的clipsToBounds属性将自动设置为YES，如果要修改可以在创建完label后修改 */
@property (nonatomic,copy,readonly) DCLabelMaker* (^cornerRadius)(CGFloat cornerRadius);
@property (nonatomic,copy,readonly) UILabel* (^intoView)(UIView *superView);
@end

NS_ASSUME_NONNULL_END
