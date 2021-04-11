//
//  ViewController.m
//  23_interview_runtime_super
//
//  Created by Ankui on 4/9/21.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    // objc_msgSendSuper2({self,
    //                     [ViewController class] // 当前类
    //                    },
    //                    sel_registerName("viewDidLoad"));
    
    /*
     (lldb) x 0x00007ffee01f2048
     0x7ffee01f2048: e8 35 a1 0f 01 00 00 00 b0 6c c0 52 cf 7f 00 00  .5.......l.R....
     0x7ffee01f2058: 20 35 a1 0f 01 00 00 00 5a 35 52 61 ff 7f 00 00   5......Z5Ra....
     (lldb) x/4g 0x00007ffee01f2048
     0x7ffee01f2048: 0x000000010fa135e8 0x00007fcf52c06cb0
     0x7ffee01f2058: 0x000000010fa13520 0x00007fff6152355a
     (lldb) p (Class)0x000000010fa135e8
     (Class) $2 = Person
     (lldb) po 0x00007fcf52c06cb0
     <ViewController: 0x7fcf52c06cb0>
     (lldb) p (Class)0x000000010fa13520
     (Class) $4 = ViewController
     (lldb)
     */
    
    
    [super viewDidLoad];
    

    id cls = [Person class];
    void *obj = &cls;
    [(__bridge id)obj print]; // -[Person print] <ViewController: 0x7fef90c07460>
}


@end
