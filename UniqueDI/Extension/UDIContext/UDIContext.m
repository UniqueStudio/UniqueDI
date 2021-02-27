//
//  UDIContext.m
//  UniqueDI
//
//  Created by Macsed on 2021/2/24.
//

#import "UDIContext.h"

@interface UDIContext()

@property (nonatomic,readwrite,copy) NSString* name;
@property (nonatomic,readwrite,copy) NSArray<UDIContext *>* subContexts;
@property (nonatomic,readwrite,strong) UDIContext* superContext;
@property (nonatomic,copy) NSMapTable* kvStore;

@end

@implementation UDIContext

- (instancetype)initWithName:(NSString*)name superContext:(UDIContext*)context{
    self = [super init];
    if (self){
        [self setName:name];
        [self setSuperContext:context];
        [self setSubContexts: [NSArray new]];
        [self setKvStore:[[NSMapTable alloc]initWithKeyOptions:NSPointerFunctionsStrongMemory valueOptions:NSPointerFunctionsWeakMemory capacity:0]];
    }
    return self;
}

- (void)setSuperContext:(UDIContext *)superContext{
    _superContext = superContext;
    if (superContext){
        NSMutableArray *newArr = [[NSMutableArray alloc]initWithArray:superContext.subContexts];
        [newArr addObject:self];
        [superContext setSubContexts:newArr];
    }
}

- (void)bind:(id)object forProtocol:(Protocol *)protocol{
    [self.kvStore setObject:object forKey:protocol];
}

- (id)link:(Protocol*)protocol{
    id instance = [self.kvStore objectForKey:protocol];
    if (instance){
        if ([instance conformsToProtocol:protocol]){
            return instance;
        }else{
            return nil;
        }
    }
    return nil;
}


@end

