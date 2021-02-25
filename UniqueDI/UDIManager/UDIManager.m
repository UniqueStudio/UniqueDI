//
//  UDIManager.m
//  UniqueDI
//
//  Created by Macsed on 2021/2/24.
//

#import "UDIManager.h"

@implementation UDIManager

static UDIContext *appContext;

+ (UDIContext *)AppContext{
    if (!appContext){
        appContext = [[UDIContext alloc]initWithName:@"AppContext" superContext:nil];
    }
    return appContext;
}

+ (id)link:(Protocol*)protocol inContext:(UDIContext *)context{
    UDIQueue *queue = [[UDIQueue alloc]init];
    if (context) {
        [queue push:context];
    }else{
        [queue push: [UDIManager AppContext]];
    }
    
    while (![queue isEmpty]) {
        UDIContext *curContext = [queue pop];
        id result = [UDIManager trueLink:protocol inContext:curContext];
        if (result){
            return result;
        }
        for (UDIContext *subContext in [curContext subContexts]) {
            [queue push:subContext];
        }
    }
    
    return nil;
}

+ (id)trueLink:(Protocol*)protocol inContext:(UDIContext *)context{
    id result;
    if (context) {
        result = [context link:protocol];
    }else{
        result = nil;
    }
    return result;
}

+ (void)bind:(Protocol*)protocol withProperty:(id)property inContext:(UDIContext *)context{
    UDIContext *bindingContext = context;
    if (!bindingContext) {
        bindingContext = [UDIManager AppContext];
    }
    [bindingContext bind:property forProtocol:protocol];
}

@end
