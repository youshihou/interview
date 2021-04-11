//
//  MutexRecursiveTask.m
//  32_interview_lock
//
//  Created by Ankui on 4/11/21.
//

#import "MutexRecursiveTask.h"
#import <pthread.h>

@interface MutexRecursiveTask ()

@property (nonatomic, assign) pthread_mutex_t lock;

@end

@implementation MutexRecursiveTask

- (void)dealloc {
    pthread_mutex_destroy(&_lock);
}

- (instancetype)init {
    self = [super init];
    if (self) {
        pthread_mutexattr_t attr;
        pthread_mutexattr_init(&attr);
        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
        pthread_mutex_init(&_lock, &attr);
        pthread_mutexattr_destroy(&attr);
        
        // 递归锁：允许同一个线程对一把锁进行重复加锁
    }
    return self;
}

- (void)testOther {
    pthread_mutex_lock(&_lock);
    NSLog(@"%s", __func__);
    static NSInteger count = 0;
    if (count < 10) {
        count++;
        [self testOther];
    }
    pthread_mutex_unlock(&_lock);
}

@end
