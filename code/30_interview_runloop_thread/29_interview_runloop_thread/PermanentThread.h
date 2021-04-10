//
//  PermanentThread.h
//  29_interview_runloop_thread
//
//  Created by Ankui on 4/10/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PermanentThread : NSObject

- (void)start;
- (void)stop;
- (void)doTask:(void(^)(void))task;

@end

NS_ASSUME_NONNULL_END
