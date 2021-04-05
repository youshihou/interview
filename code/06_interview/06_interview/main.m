//
//  main.m
//  06_interview
//
//  Created by Ankui on 4/5/21.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *person = [[Person alloc] init];
        person.age = 1;
        [person setValue:@10 forKey:@"age"];
        
        person.cat = [[Cat alloc] init];
        [person setValue:@20 forKeyPath:@"cat.weight"];
     
        NSLog(@"%@", [person valueForKey:@"age"]);
        NSLog(@"%@", [person valueForKeyPath:@"cat.weight"]);

    }
    return 0;
}
