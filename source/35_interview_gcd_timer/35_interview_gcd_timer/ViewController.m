//
//  ViewController.m
//  35_interview_gcd_timer
//
//  Created by Ankui on 4/12/21.
//

#import "ViewController.h"
#import "Timer.h"

@interface ViewController ()

//@property (nonatomic, strong) dispatch_source_t timer;

@property (nonatomic, strong) NSString *task;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%s", __func__);
    
//    dispatch_queue_t queue = dispatch_get_main_queue();
//    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC, 1 * NSEC_PER_SEC);
//    dispatch_source_set_event_handler(timer, ^{
//        NSLog(@"666");
//    });
//    dispatch_resume(timer);
//    self.timer = timer;
    
    self.task = [Timer doTask:^{
        NSLog(@"666 %@", [NSThread currentThread]);
    } start:2 interval:1 repeats:YES async:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [Timer cancelTask:self.task];
}

@end
