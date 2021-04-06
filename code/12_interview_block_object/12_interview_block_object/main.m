//
//  main.m
//  12_interview_block_object
//
//  Created by Ankui on 4/6/21.
//

#import <Foundation/Foundation.h>
#import "Person.h"

typedef void(^Block)(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        Person *person = [[Person alloc] init];
//        person.age = 10;
//        Block block = ^{
//            NSLog(@"%d", person.age);
//        };
//        block();
//        NSLog(@"%@", [block class]);
        
        
        
        
        // xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc -fobjc-arc -fobjc-runtime=ios-8.0.0  main.m
        
        Block block;
        {
            Person *person = [[Person alloc] init];
            person.age = 10;
            __weak Person *weakPerson = person;
            block = ^{
                NSLog(@"%d", weakPerson.age);
            };
        }

    }
    return 0;
}
