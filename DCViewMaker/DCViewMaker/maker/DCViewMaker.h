//
//  DCViewMaker.h
//  DCViewMaker
//
//  Created by 戴川 on 2019/4/15.
//  Copyright © 2019 DC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DCViewAttribute.h"


NS_ASSUME_NONNULL_BEGIN
@interface DCViewMaker : NSObject
/** view的属性 */
@property (nonatomic, strong) DCViewAttribute *viewAttribute;
/** 介词，为了增加可读性，这里直接返回了self */
@property (nonatomic, strong,readonly) DCViewMaker *with;

@property (nonatomic,copy,readonly) DCViewMaker* (^frame)(CGRect frame);
@property (nonatomic,copy,readonly) DCViewMaker* (^backgroundColor)(UIColor *backgroundColor);
@property (nonatomic,copy,readonly) DCViewMaker* (^cornerRadius)(CGFloat cornerRadius);
@property (nonatomic,copy,readonly) UIView* (^intoView)(UIView *superView);

@end

NS_ASSUME_NONNULL_END
