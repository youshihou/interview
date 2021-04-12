//
//  Timer.h
//  35_interview_gcd_timer
//
//  Created by Ankui on 4/12/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Timer : NSObject

+ (NSString *)doTask:(void(^)(void))task
               start:(NSTimeInterval)start
            interval:(NSTimeInterval)interval
             repeats:(BOOL)repeats
               async:(BOOL)async;

+ (void)cancelTask:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
