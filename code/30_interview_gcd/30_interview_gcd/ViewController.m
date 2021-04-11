//
//  ViewController.m
//  30_interview_gcd
//
//  Created by Ankui on 4/10/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        NSLog(@"1");
//        [self performSelector:@selector(test1) withObject:nil];
        [self performSelector:@selector(test1) withObject:nil afterDelay:0.];
        NSLog(@"3");
//        [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    });
}

- (void)test1 {
    NSLog(@"2");
}

- (void)test {
    // !!! 使用sync往当前串行队列中添加任务，会卡住当前的串行队列，产生死锁 ！！！

    
    // dispatch_sync / dispatch_async 用来控制是否开启新线程
    // 队列的类型，决定了任务的执行方式（并发、串行）
    // 并发队列、串行队列、主队列（特殊的串行队列）
    
    
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//    dispatch_sync(queue, ^{
//        NSLog(@"%@", [NSThread currentThread]);
//    });
//    dispatch_async(queue, ^{
//        for (NSInteger i = 0; i < 5; i++) {
//            NSLog(@"task1 %@", [NSThread currentThread]);
//        }
//    });
//    dispatch_async(queue, ^{
//        for (NSInteger i = 0; i < 5; i++) {
//            NSLog(@"task2 %@", [NSThread currentThread]);
//        }
//    });
    
    
    
    // 产生死锁！！！
    // dispatch_sync 立即在当前线程执行任务，执行完后才能继续执行后续任务
//    NSLog(@"1");
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        NSLog(@"2");
//    });
//    NSLog(@"3");

    
    // dispatch_async 不要求立即在当前线程同步执行任务
//    NSLog(@"1");
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"2 %@", [NSThread currentThread]);
//    });
//    NSLog(@"3");
    
    
    
//    NSLog(@"1");
//    dispatch_queue_t queue = dispatch_queue_create("xxqueue", DISPATCH_QUEUE_SERIAL);
//    dispatch_async(queue, ^{ // 子线程执行任务
//        NSLog(@"2 %@", [NSThread currentThread]);
//        dispatch_sync(queue, ^{ // 产生死锁！！！
//            NSLog(@"3");
//        });
//        NSLog(@"4");
//    });
//    NSLog(@"5");
    
    
    
//    NSLog(@"1");
//    dispatch_queue_t queue = dispatch_queue_create("xxqueue", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t queue2 = dispatch_queue_create("xxxqueue", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(queue, ^{ // 子线程执行任务
//        NSLog(@"2 %@", [NSThread currentThread]);
//        dispatch_sync(queue2, ^{
//            NSLog(@"3 %@", [NSThread currentThread]);
//        });
//        NSLog(@"4");
//    });
//    NSLog(@"5");

    
    
//    NSLog(@"1");
//    dispatch_queue_t queue = dispatch_queue_create("xxqueue", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t queue2 = dispatch_queue_create("xxxqueue", DISPATCH_QUEUE_SERIAL);
//    dispatch_async(queue, ^{ // 子线程执行任务
//        NSLog(@"2 %@", [NSThread currentThread]);
//        dispatch_sync(queue2, ^{
//            NSLog(@"3 %@", [NSThread currentThread]);
//        });
//        NSLog(@"4");
//    });
//    NSLog(@"5");
    
    
    
    NSLog(@"1");
    dispatch_queue_t queue = dispatch_queue_create("xxqueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{ // 子线程执行任务
        NSLog(@"2 %@", [NSThread currentThread]);
        dispatch_sync(queue, ^{
            NSLog(@"3 %@", [NSThread currentThread]);
        });
        NSLog(@"4");
    });
    NSLog(@"5");


}

@end
