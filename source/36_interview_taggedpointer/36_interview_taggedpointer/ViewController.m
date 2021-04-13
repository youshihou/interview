//
//  ViewController.m
//  36_interview_taggedpointer
//
//  Created by Ankui on 4/13/21.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, copy) NSString *name;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // MAC平台最低有效位为1         MASK = 1UL
    // iOS平台最高有效位为1（第64位） MASK = (1UL<<63)
    // (ptr & MASK) == MASK

    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    for (NSInteger i = 0; i < 10000; i++) {
        dispatch_async(queue, ^{
            // 会有多条线程同时执行release方法进行释放对象, 可以将nonatomic改成atomic，也可以将下面一句进行加锁
//            self.name = [NSString stringWithFormat:@"abcdefghijk"];
            
            // tagged pointer不是oc对象，不会调用setter方法，而是将指针的值直接赋值给self.name
            self.name = [NSString stringWithFormat:@"abc"];
        });
    }

}

// MRC
//- (void)setName:(NSString *)name {
//    if (_name != name) {
//        [_name relase];
//        _name = [name copy];
//    }
//}

@end
