//
//  ViewController.m
//  DCViewMaker
//
//  Created by 戴川 on 2019/4/15.
//  Copyright © 2019 DC. All rights reserved.
//

#import "ViewController.h"
#import "DCViewMaker/DCMaker.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /** 使用说明
     可以直接通过加方法dcMaker_creat生成一个maker,然后就可以一直通过点语法设置属性了，在设置完所有属性，最后调用intoView方法。传入要添加的父视图就可以返回一个view了
     最后别忘了调用intoView
     最后别忘了调用intoView
     最后别忘了调用intoView
     如下
     UIView *view = [UIView dcMaker_creat]
     .frame(CGRectMake(100, 100, 100, 50))
     .cornerRadius(10)
     .backgroundColor([UIColor cyanColor])
     .intoView(self.view);
     */
    
    [self __addUIView];
    [self __addUILabel];
    [self __addUIButton];
    
}

#pragma mark - private

- (void)__addUIView{
    [UIView dcMaker_creat]
    .frame(CGRectMake(100, 100, 100, 50))
    .cornerRadius(10)
    .backgroundColor([UIColor cyanColor])
    .intoView(self.view);
}

- (void)__addUILabel{
    [UILabel dcMaker_creat].frame(CGRectMake(100, 200, 100, 50))
    .text(@"this is a label")
    .font(15).textColor([UIColor redColor])
    .fontWeight(UIFontWeightMedium)
    .backgroundColor([UIColor blackColor])
    .cornerRadius(10)
    .textAlignment(NSTextAlignmentLeft)
    .numberOfLines(2)
    .intoView(self.view);
}

- (void)__addUIButton{
    [UIButton dcMaker_creat].frame(CGRectMake(100, 300, 100, 50))
    .normalText(@"normal")
    .normalTextColor([UIColor blueColor])
    .highlightedText(@"highlighted")
    .highlightedTextColor([UIColor yellowColor])
    .backgroundColor([UIColor redColor])
    .intoView(self.view);
}
@end
