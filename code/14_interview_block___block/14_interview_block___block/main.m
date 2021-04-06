//___FILEHEADER___

#import <Foundation/Foundation.h>

typedef void(^Block)(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        __block int age = 10;
        __block NSObject *object = [[NSObject alloc] init];
        Block block = ^{
            age = 20;
            object = nil;
            NSLog(@"%d", age);
        };
        block();
    }
    return 0;
}
