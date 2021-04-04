//
//  ViewController.m
//  05_interview
//
//  Created by Ankui on 4/4/21.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@property (nonatomic, strong) Person *person;

@end

@implementation ViewController

- (void)dealloc {
    NSLog(@"%s", __func__);
    
    [self.person removeObserver:self forKeyPath:@"age"];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.person = [[Person alloc] init];
    self.person.age = 10;
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.person addObserver:self forKeyPath:@"age" options:options context:@"666"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.person.age = 20;
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
