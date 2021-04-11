//
//  MutexTask.m
//  32_interview_lock
//
//  Created by Ankui on 4/11/21.
//

#import "MutexTask.h"
#import <pthread.h>

@interface MutexTask ()

@property (nonatomic, assign) pthread_mutex_t ticketlock;
@property (nonatomic, assign) pthread_mutex_t moneylock;

@end

@implementation MutexTask

- (instancetype)init {
    self = [super init];
    if (self) {
        // 静态初始化，定义时初始化
//        pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
        
        pthread_mutexattr_t attr;
        pthread_mutexattr_init(&attr);
        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
        
        pthread_mutex_init(&_ticketlock, &attr);
        pthread_mutexattr_init(&attr);
        pthread_mutex_init(&_moneylock, &attr);
        pthread_mutexattr_destroy(&attr);
    }
    return self;
}

- (void)_saleTicket {
    pthread_mutex_lock(&_ticketlock);
    [super _saleTicket];
    pthread_mutex_unlock(&_ticketlock);
}

- (void)_saveMoney {
    pthread_mutex_lock(&_moneylock);
    [super _saveMoney];
    pthread_mutex_unlock(&_moneylock);
}

- (void)_takeMoney {
    pthread_mutex_lock(&_moneylock);
    [super _takeMoney];
    pthread_mutex_unlock(&_moneylock);
}

@end
