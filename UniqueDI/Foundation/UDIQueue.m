//
//  UDIQueue.m
//  UniqueDI
//
//  Created by Macsed on 2021/2/25.
//

#import "UDIQueue.h"

@interface UDIQueue()

@property (nonatomic,retain) NSMutableArray *queue;

@end

@implementation UDIQueue

- (instancetype)init{
    self = [super init];
    if (self){
        self.queue = [[NSMutableArray alloc]init];
    }
    
    return self;
}

- (BOOL)isEmpty{
    return [self.queue count] == 0;
}

- (void)push:(id)obj{
    if (!self.queue) {
        self.queue = [[NSMutableArray alloc]init];
    }
    
    [self.queue addObject:obj];
}

- (id)pop{
    if (!self.queue){
        return nil;
    }
    if ([self.queue count] == 0){
        return nil;
    }
    id returnValue = [self.queue firstObject];
    [self.queue removeObjectAtIndex:0];
    return returnValue;
}

@end
