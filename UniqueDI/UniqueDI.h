//
//  UniqueDI.h
//  UniqueDI
//
//  Created by Macsed on 2021/2/24.
//

#import "NSObject+UDI.h"
#import "UDIManager.h"

#define UDILINK(aProtocol, aProperty) \
- (id<aProtocol>)aProperty \
{ \
    if (!_##aProperty) { \
        Protocol *protocol = @protocol(aProtocol);        \
        UDIContext *context = self.attachingContext;  \
        id<aProtocol> obj = (id<aProtocol>)[UDIManager link: protocol inContext:context]; \
        _##aProperty = obj; \
    } \
    return _##aProperty; \
}

#define UDIBIND(aProtocol, aProperty) \
Protocol *protocol = @protocol(aProtocol);\
[UDIManager bind:protocol withProperty:aProperty inContext:self.attachingContext];
