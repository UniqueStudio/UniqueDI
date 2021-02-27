# UniqueDI
 Objective-C Version of Unique Dependency Injection

---

## Summary
Objective-C 版本的Unique Dependency Injection，其实准确来讲应该只能算Dependency Inversion.
得益于Objective-C的NSObject隐型基类，使用category+associated objec的方式实现的上下文管理 & 宏定义实现的API在使用上会感觉更自然更舒适。
目前仍处于0.0.1版本，可能仍有大改动等情况出现
## Progress
- [x] Bind & Link
- [x] Context 隔离
- [ ] FindContext
- [ ] Debug Tools
- [ ] ...

## Requirements
iOS 10.0+

## How to Use
已接入 `CocoaPod` , 使用 `pod 'UniqueDI','~> 0.0.1'` 即可接入

### Context 上下文
为了实现上下文的隔离，你需要显式设置其所属的上下文。


⚠️注意：虽然当Context未指定时，我们将会默认使用AppContext作为其Context，但为了防止Context不正确导致的问题，我们仍应进行显式设置。
```objective-c

- (instancetype)initWithContext:(UDIContext *)context; //初始化时直接传入Context

//Example
[UIViewController initWithContext:<#(UDIContext *)#>];

- (void)setAttachingContext:(UDIContext *)context; //或者手动为其指定Context

//Example
UIViewController *viewcontroller = [[UIViewController alloc]init];
[viewcontroller setAttachingContext:<#(UDIContext *)#>];

```
可通过以下方式来获取上下文
```objective-c

@property (nonatomic, strong) UDIContext* attachingContext; //直接通过getter获取该属性

//Example
UDIContext *currentContext = viewcontroller.attachingContext;


UDIAppContext //通过宏定义获取AppContext

//Example
[self setAttachingContext:UDIAppContext];

```

### bind
将依赖注册进当前所在上下文。

注册进去的依赖是weak的,也就是说，注册依赖不会影响本身的生命周期

```objective-c
UDIBIND(aProtocol, aProperty); //将aProperty绑定到当前所在的上下文，其类型为id<aProtocol>

//Example
UDIBIND(myProtocol,self);

```
同时，如果想要在attach context之后直接执行自动的bind，则建议直接使用下面的方式
```objective-c
- (void)didAttachContext; //会在 - (void)setAttachingContext:(UDIContext *)context 之后直接调用

//Example
@implementation MyClass
- (void)didAttachContext{
    UDIBIND(myProtocol,self);
}
//...
@end
```
### link
从当前所在上下文注入依赖

由于Context中存储的是weak，所以此处是可能拿到nil的，请注意这一可能。
```objective-c
UDILINK(aProtocol, aProperty); //从当前上下文中获取id<aProtocol>类型的依赖并将其赋值给aProperty。因此，这一宏定义展开其实为aProperty的getter，且其是懒加载的，只有调用aProperty的时候才回去获取依赖并赋值。

//Example
@interface MyClass

@property(nonatomic,strong) id<MyProtocol> my; //必须先声明这一属性

@end

@implementation MyClass

UDILINK(MyProtocol,my); //然后再进行Link

@end

```

如果说你只是在某一处会使用这一依赖，那么我们也可以使用inline
```objective-c
UDILINKINLINE(aProtocol); //从当前上下文中获取id<aProtocol>类型的依赖。其实现实际上是一个类似^id<aProtocol>{}的block。

//Example
[UDILINKINLINE(MyProtocol) myFunction];
```

## LICENSE

this repo is Under The MIT LICENSE
