//
//  ViewController.m
//  05_interview
//
//  Created by Ankui on 4/4/21.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (nonatomic, strong) Person *person1;
@property (nonatomic, strong) Person *person2;

@end

@implementation ViewController

- (void)printMethodNamesOfClass:(Class)cls {
    unsigned int count;
    Method *list = class_copyMethodList(cls, &count);
    NSMutableString *names = [NSMutableString string];
    for (int i = 0; i < count; i++) {
        Method method = list[i];
        NSString *name = NSStringFromSelector(method_getName(method));
        [names appendString:name];
        [names appendString:@", "];
    }
    free(list);
    NSLog(@"%@ %@", cls, names);
}

- (void)dealloc {
    NSLog(@"%s", __func__);
    
    [self.person1 removeObserver:self forKeyPath:@"age"];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.person1 = [[Person alloc] init];
    self.person1.age = 1;
    
    self.person2 = [[Person alloc] init];
    self.person2.age = 2;
    
//    NSLog(@"before: %@ %@", object_getClass(self.person1), object_getClass(self.person2));
//    NSLog(@"before: %p %p",
//          [self.person1 methodForSelector:@selector(setAge:)],
//          [self.person2 methodForSelector:@selector(setAge:)]);

    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.person1 addObserver:self forKeyPath:@"age" options:options context:@"666"];
    
//    NSLog(@"after: %@ %@", object_getClass(self.person1), object_getClass(self.person2));
//    NSLog(@"after: %p %p",
//          [self.person1 methodForSelector:@selector(setAge:)],
//          [self.person2 methodForSelector:@selector(setAge:)]);
    
//    NSLog(@"class: %p %p", object_getClass(self.person1), object_getClass(self.person2));
//    NSLog(@"meta-class: %p %p",
//          object_getClass(object_getClass(self.person1)),
//          object_getClass(object_getClass(self.person2)));

    
//    NSLog(@"class: %@ %@", object_getClass(self.person1), object_getClass(self.person2));
//    NSLog(@"class: %@ %@", [self.person1 class], [self.person2 class]);

    [self printMethodNamesOfClass:object_getClass(self.person1)];
    [self printMethodNamesOfClass:object_getClass(self.person2)];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.person1.age = 20;
    
    [self.person1 willChangeValueForKey:@"age"];
    [self.person1 didChangeValueForKey:@"age"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSLog(@"observe %@ - %@ change %@ %@", object, keyPath, change, context);
//    if (context == <#context#>) {
//        <#code to be executed upon observing keypath#>
//    } else {
//        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
//    }
}

@end
