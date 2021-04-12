//
//  ProxyTask.h
//  34_interview_timer
//
//  Created by Ankui on 4/12/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProxyTask : NSObject

+ (instancetype)proxyWithTarget:(id)target;
@property (nonatomic, weak) id target;

@end

NS_ASSUME_NONNULL_END
