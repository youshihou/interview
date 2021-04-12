//
//  ViewController.m
//  33_interview_readwrite
//
//  Created by Ankui on 4/12/21.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

//@property (nonatomic, assign) pthread_rwlock_t lock;

@property (nonatomic, strong) dispatch_queue_t queue;

@end

@implementation ViewController

- (void)dealloc {
//    pthread_rwlock_destroy(&_lock);
}

- (void)viewDidLoad {
    [super viewDidLoad];

//    pthread_rwlock_init(&_lock, NULL);
//
//    dispatch_queue_t queue = dispatch_queue_create(0, 0);
//    for (NSInteger i = 0; i < 10; i++) {
//        dispatch_async(queue, ^{
//            [self read];
//        });
//        dispatch_async(queue, ^{
//            [self write];
//        });
//    }
    
    self.queue = dispatch_queue_create("rwqueue", DISPATCH_QUEUE_CONCURRENT);
    for (NSInteger i = 0; i < 10; i++) {
        [self read];
        [self read];
        [self read];
        [self write];
    }
}

- (void)read {
//    pthread_rwlock_rdlock(&_lock);
//    sleep(1);
//    NSLog(@"%s", __func__);
//    pthread_rwlock_unlock(&_lock);
    
    dispatch_async(self.queue, ^{
        sleep(1);
        NSLog(@"read");
    });
}

- (void)write {
//    pthread_rwlock_wrlock(&_lock);
//    sleep(1);
//    NSLog(@"%s", __func__);
//    pthread_rwlock_unlock(&_lock);
    
    dispatch_barrier_async(self.queue, ^{
        sleep(1);
        NSLog(@"write");
    });
}

@end
