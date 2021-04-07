//
//  Person.m
//  17_interview_runtime
//
//  Created by Ankui on 4/7/21.
//

#import "Person.h"


//#define TallMask 1
//#define RichMask 2
//#define HondsomeMask 4

//#define TallMask 0b00000001
//#define RichMask 0b00000010
//#define HondsomeMask 0b00000100


#define TallMask (1<<0) //1
#define RichMask (1<<1)
#define HandsomeMask (1<<2)


@interface Person () {
    char _tallRichHandsome;
}


@end

@implementation Person

- (void)test {
    NSLog(@"%s", __func__);
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _tallRichHandsome = 0b00000011;
    }
    return self;
}

- (void)setTall:(BOOL)tall {
    if (tall) {
        _tallRichHandsome |= TallMask;
    } else {
        _tallRichHandsome &= ~TallMask;
    }
}

- (void)setRich:(BOOL)rich {
    if (rich) {
        _tallRichHandsome |= RichMask;
    } else {
        _tallRichHandsome &= ~RichMask;
    }
}

- (void)setHandsome:(BOOL)handsome {
    if (handsome) {
        _tallRichHandsome |= HandsomeMask;
    } else {
        _tallRichHandsome &= ~HandsomeMask;
    }
}

- (BOOL)isTall {
//    return !!(_tallRichHandsome & 1);
    return !!(_tallRichHandsome & TallMask);
}

- (BOOL)isRich {
//    return !!(_tallRichHandsome & 2);
    return !!(_tallRichHandsome & RichMask);
}

- (BOOL)isHandsome {
//    return !!(_tallRichHandsome & 4);
    return !!(_tallRichHandsome & HandsomeMask);
}

@end
