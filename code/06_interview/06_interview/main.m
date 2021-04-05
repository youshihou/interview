//
//  main.m
//  06_interview
//
//  Created by Ankui on 4/5/21.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Observer.h"
#import "Test.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Observer *observer = [[Observer alloc] init];
//        
//        Person *person = [[Person alloc] init];
//        person.age = 1;
//        [person setValue:@10 forKey:@"age"];
//
//        person.cat = [[Cat alloc] init];
//        [person setValue:@20 forKeyPath:@"cat.weight"];
//
//        NSLog(@"%@", [person valueForKey:@"age"]);
//        NSLog(@"%@", [person valueForKeyPath:@"cat.weight"]);

//        // KVO
//        NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
//        [person addObserver:observer forKeyPath:@"age" options:options context:@"666"];
//
//        // KVC
//        [person setValue:@100 forKey:@"age"];
//
//        [person removeObserver:observer forKeyPath:@"age"];
        
        
        Test *test = [[Test alloc] init];
        
        // KVO
        NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
        [test addObserver:observer forKeyPath:@"age" options:options context:@"666"];

        // KVC
        [test setValue:@10 forKey:@"age"];

        [test removeObserver:observer forKeyPath:@"age"];

        NSLog(@"-------");
    
    }
    return 0;
}
