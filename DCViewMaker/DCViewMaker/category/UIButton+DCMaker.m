//
//  UIButton+DCMaker.m
//  DCViewMaker
//
//  Created by 戴川 on 2019/4/15.
//  Copyright © 2019 DC. All rights reserved.
//

#import "UIButton+DCMaker.h"

@implementation UIButton (DCMaker)
+(DCButtonMaker *)dcMaker_creat{
    DCButtonMaker *maker = DCButtonMaker.new;
    maker.viewAttribute = DCViewAttribute.new;
    return maker;
}

@end
