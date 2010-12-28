#import <Foundation/Foundation.h>

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	NSMutableArray *items = [[[NSMutableArray alloc] init] autorelease];
	[items addObject:@"one"];
	[items addObject:@"two"];
	[items addObject:@"three"];
	[items insertObject:@"Zero" atIndex:0];
	
	for(int i = 0; i < [items count]; i++){
		NSLog(@"%@", [items objectAtIndex:i]);
	}
	
    [pool drain];
    return 0;
}
