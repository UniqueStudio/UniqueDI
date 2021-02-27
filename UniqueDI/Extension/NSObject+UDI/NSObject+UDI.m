//
//  NSObject+UDI.m
//  UniqueDI
//
//  Created by Macsed on 2021/2/24.
//

#import "NSObject+UDI.h"

@implementation NSObject (UniqueDI)

@dynamic attachingContext;

- (void)setAttachingContext:(UDIContext *)context{
    objc_setAssociatedObject(self,@selector(attachingContext),context,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didAttachContext];
}

- (UDIContext *)attachingContext{
    return objc_getAssociatedObject(self, @selector(attachingContext));
}

- (instancetype)initWithContext:(UDIContext *)context{
    self = [self init];
    if (self) {
        [self setAttachingContext:context];
    }
    return self;
}

- (void)didAttachContext{
    
}

@end
