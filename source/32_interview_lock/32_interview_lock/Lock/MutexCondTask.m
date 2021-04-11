//
//  MutexCondTask.m
//  32_interview_lock
//
//  Created by Ankui on 4/11/21.
//

#import "MutexCondTask.h"
#import <pthread.h>


@interface MutexCondTask ()

@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, assign) pthread_mutex_t lock;
@property (nonatomic, assign) pthread_cond_t cond;

@end

@implementation MutexCondTask

- (void)dealloc {
    pthread_mutex_destroy(&_lock);
    pthread_cond_destroy(&_cond);
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _data = [NSMutableArray array];
        
        pthread_mutex_init(&_lock, NULL);
        pthread_cond_init(&_cond, NULL);
    }
    return self;
}

- (void)testOther {
    [[[NSThread alloc] initWithTarget:self selector:@selector(_remove) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(_add) object:nil] start];
}

- (void)_add {
    pthread_mutex_lock(&_lock);
    sleep(1);
    [self.data addObject:@"666"];
    NSLog(@"%s", __func__);
    pthread_cond_signal(&_cond);
    pthread_mutex_unlock(&_lock);
}

- (void)_remove {
    NSLog(@"remove");
    pthread_mutex_lock(&_lock);
    if (self.data.count == 0) {
        pthread_cond_wait(&_cond, &_lock);
    }
    [self.data removeLastObject];
    NSLog(@"%s", __func__);
    pthread_mutex_unlock(&_lock);
}

@end
