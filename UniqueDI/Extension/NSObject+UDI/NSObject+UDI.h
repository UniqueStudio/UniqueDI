//
//  NSObject+UDI.h
//  UniqueDI
//
//  Created by Macsed on 2021/2/24.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "UDIContext.h"

@interface NSObject (UniqueDI)

@property (nonatomic, strong) UDIContext* attachingContext;

- (instancetype)initWithContext:(UDIContext *)context;

- (void)didAttachContext;

@end
