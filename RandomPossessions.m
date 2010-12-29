#import <Foundation/Foundation.h>

#import "Possession.h"

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	NSMutableArray *items = [[[NSMutableArray alloc] init] autorelease];
	[items addObject:@"one"];
	[items addObject:@"two"];
	[items addObject:@"three"];
	[items insertObject:@"Zero" atIndex:0];
	
	for(int i = 0; i < 10; i++){
		[items addObject:[Possession randomPossession]];
	}
	
	for (Possession *item in items) {
		NSLog(@"%@", item);
	}
    [pool drain];
    return 0;
}
