//
//  UDIManager.h
//  UniqueDI
//
//  Created by Macsed on 2021/2/24.
//


#import <Foundation/Foundation.h>
#import "UDIContext.h"
# import "UDIQueue.h"

@interface UDIManager : NSObject

@property (class,nonatomic,strong,readonly) UDIContext* AppContext;

+ (id)link:(Protocol*)protocol inContext:(UDIContext *)context;
+ (void)bind:(Protocol*)protocol withProperty:(id)property inContext:(UDIContext *)context;

@end

