//
//  UDIQueue.h
//  UniqueDI
//
//  Created by Macsed on 2021/2/25.
//

#import <Foundation/Foundation.h>

@interface UDIQueue : NSObject

@property (readonly,assign) BOOL isEmpty;

- (instancetype)init;
- (void)push:(id)obj;
- (id)pop;

@end
