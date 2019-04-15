//
//  UIView+DCMaker.m
//  DCViewMaker
//
//  Created by 戴川 on 2019/4/15.
//  Copyright © 2019 DC. All rights reserved.
//

#import "UIView+DCMaker.h"

@implementation UIView (DCMaker)

+(DCViewMaker *)dcMaker_creat{
    DCViewMaker *maker = DCViewMaker.new;
    maker.viewAttribute = DCViewAttribute.new;
    return maker;
    
}
@end
