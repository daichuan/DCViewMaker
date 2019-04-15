#### 链式编程
---
链式编程简单的说就是将多个方法用点语法连接起来，让代码更加简洁，可读性更强。例如`Masonry`，`SDAutoLayout`;
```objc
make.left.right.mas_equalTo(0);
```
这一行代码，就同时实现了设置左右两边间距都为0；

#### Masonry怎么实现链式调用的
---
* 在`Masonry`中，`.left  .right  .top  .bottom`等方法，都是返回一个`MASConstraintMaker`实例类，里面有left、right等属性来保存每次调用的信息；
```objc
- (MASConstraintMaker *)left;
```
* 在`Masonry`中，`offset(15)`等方法，可以接受一个参数，然后返回的还是`MASConstraintMaker`实例类，怎么接受参数呢？Masonry返回了一个block，这个block的返回值是`MASConstraintMaker`，并且可以接收一个参数；
```objc
- (MASConstraint * (^)(CGFloat offset))offset;
```
* 在`Masonry`中，为了方便阅读，还有一种方法，什么都没有处理直接返回`MASConstraintMaker`实例类;
```objc
- (MASConstraintMaker *)with;
```

#### 创建我们自己的链式调用
---
我觉的我们可以通过链式调用来设置view的一些属性，例如Label，首先我们要想象一下我们最终实现好调用的样子，
```objc
   [UILabel dcMaker_creat].frame(CGRectMake(100, 200, 100, 50))
    .text(@"this is a label")
    .textColor([UIColor redColor])
    .font(15).fontWeight(UIFontWeightMedium)
    .textAlignment(NSTextAlignmentLeft)
    .numberOfLines(2)
    .intoView(self.view);
```
这种方式更像`SDAutoLayout`,我个人更喜欢这种风格，因为我觉得没必要像`Masonry`那样通过`mas_makeConstraints:^(MASConstraintMaker *make) {}];`把`MASConstraintMaker`抛出来，然后在block中设置属性。我觉的可以通过某个方法拿到一个maker，然后就可以不停的点语法设置属性，个人觉得这样用起来非常爽哈哈哈；

* 先说一下整体思路，首先我们需要一个类似于`MASConstraintMaker`的中间类，这个类可以一直调用点语法设置属性，并且能保存设置的这些属性，最后这个类还需要一个方法来返回一个`view`;

* 接下来就是具体实现了，首先我们创建一个类`DCLabelMaker`，然后外面要通过这类来设置属性，外面怎么调用呢？肯定是这样`.font(15).text(@"label")`，怎么才能实现这样的效果，模仿`Masonry`我们添加一个类型为block的属性，这个block的返回值还是`DCLabelMaker`；
```objc
@property (nonatomic,copy,readonly) DCLabelMaker* (^font)(CGFloat font);
```
这样外面用的时候就是`maker.font(15)`，这样，因为返回的是`DCLabelMaker`，所以还能接着调用点语法；这样就实现了连续通过点语法调用。
* 这里有一点需要注意，因为外部只是通过点语法来调用，点语法就是get方法，外部是不能调用set方法来修改的，因此这里设置成`readonly`。`Masonry`直接设置了一个方法
`- (MASConstraint* (^)(CGFloat offset))offset;`为什么我们用属性呢？因为属性在调用之后会有联想提示，只要敲出`.font`,会自动补全后面需要传的参数，这样外部编写的时候会非常舒服；
* 最核心的难题被我们解决了，接下就看这个属性的get方法怎么实现了，其实很简单，只要把传进来的参数保存起来就可以了。这里我新创建了一个Model`DCViewAttribute`用来专门存储设置的属性；
```objc
-(DCLabelMaker * _Nonnull (^)(CGFloat))font{
    __weak typeof(self) weak_self = self;
    return ^DCLabelMaker* (CGFloat font){
        weak_self.viewAttribute.font = font;
        return weak_self;
    };
}
```

* 属性设置完之后，我们就可以返回一个view了，因为一个view肯定是要添加到一个superView上的，因此我们设置一个方法`intoView(superView)`,这个block接受一个参数view，把要创建的view添加到这个view上，然后返回出来；

.h文件添加属性
```objc
@property (nonatomic,copy,readonly) UILabel* (^intoView)(UIView *superView);
```
.m文件实现方法
```objc
- (UILabel * _Nonnull (^)(UIView * _Nonnull))intoView{
    __weak typeof(self) weak_self = self;
    return ^UILabel * _Nonnull(UIView * _Nonnull superView) {
        DCViewAttribute *viewAttribute = weak_self.viewAttribute;
        UILabel *label = [[UILabel alloc]initWithFrame:viewAttribute.frame];
        label.font = [UIFont systemFontOfSize:viewAttribute.font];
        [superView addSubview:label];
        return label;
    };
}
```

* 这样我们的maker就已经完成了，然后我们只需要给UILabel添加一个分类方法，来创建一个maker就大功告成了；
```obcj
.h
+ (DCLabelMaker *)dcMaker_creat;

.m
+(DCLabelMaker *)dcMaker_creat{
    DCLabelMaker *maker = DCLabelMaker.new;
    maker.viewAttribute = DCViewAttribute.new;
    return maker;
}
```

大功告成！！！

这样外部调用的时候就如我们上面所想的样子了
```objc
   [UILabel dcMaker_creat].frame(CGRectMake(100, 200, 100, 50))
    .text(@"this is a label")
    .textColor([UIColor redColor])
    .font(15).fontWeight(UIFontWeightMedium)
    .textAlignment(NSTextAlignmentLeft)
    .numberOfLines(2)
    .intoView(self.view);
```



参考链接https://blog.csdn.net/cAj3Z1hurtGNR2/article/details/78103850