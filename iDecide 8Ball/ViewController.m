//
//  ViewController.m
//  iDecide 8Ball
//
//  Created by csuftitan on 2/7/24.
//

#import "ViewController.h"
@interface ViewController () {
    NSMutableArray* strArray;
    NSMutableSet* set;
}

@property (strong, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) IBOutlet UILabel *label;
@property bool cycled;

@end

@implementation ViewController

@synthesize button=button;
@synthesize label=label;
@synthesize cycled=cycled;

- (void)viewDidLoad {
    [super viewDidLoad];
    label.text = @"Ask me a question";
    strArray = [[NSMutableArray alloc]
                initWithObjects:@"Not sure at this time", @"Save your money",
@"Find a new job", @"Move to Italy", @"Get married", @"Break up", @"Study harder", @"Travel more", @"Visit your family",
@"Drop the course", nil];
    set = [[NSMutableSet alloc] init];
    cycled = false;
}

- (IBAction)buttonPressed:(id)sender {
    int count = (int)[strArray count];
    int answerIndex = -1;
    
    if ([set count] == count) {
           [set removeAllObjects];
           [label setText:@"Ask me again!"];
           return;
       }
    
    while (true) {
        answerIndex = [self generateRandomNumberWithLower:0 andUpper:count];
        if (![set containsObject:@(answerIndex)]) {
            [set addObject:@(answerIndex)];
            [label setText:strArray[answerIndex]];
            break;
        }
    }

}

- (int)generateRandomNumberWithLower:(int)lowerIndex andUpper:(int)upperIndex {
    return lowerIndex + arc4random() % (upperIndex - lowerIndex);
}
@end

