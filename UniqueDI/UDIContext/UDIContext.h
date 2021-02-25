//
//  UDIContext.h
//  UniqueDI
//
//  Created by Macsed on 2021/2/24.
//

#import <Foundation/Foundation.h>

@interface UDIContext : NSObject 

@property (nonatomic,readonly,copy) NSString* name;
@property (nonatomic,readonly,copy) NSArray<UDIContext *>* subContexts;
@property (nonatomic,readonly) UDIContext* superContext;

- (instancetype)initWithName:(NSString*)name superContext:(UDIContext*)context;

- (void)bind:(id)object forProtocol:(Protocol *)protocol;
- (id)link:(Protocol*)protocol;

@end
