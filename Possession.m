//
//  Possession.m
//  RandomPossessions
//
//  Created by Travis Spangle on 12/28/10.
//  Copyright 2010 Peak Systems. All rights reserved.
//

#import "Possession.h"

@implementation Possession
@synthesize possessionName, serialNumber, valueInDollars, dateCreated;

#pragma mark init methods

-(id)init
{
	return [self initWithPossessionName:@"Possession"
						 valueInDollars:0
						   serialNumber:@""];
}

-(id)initWithPossessionName:(NSString *)name
{
	return [self initWithPossessionName:name
						 valueInDollars:0
						   serialNumber:@""];
}

- (id)initWithPossessionName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber
{
	//Call the superclass's designated initializer
	self = [super init];
	
	//did the initialization fail?
	if (!self)
		return nil;
	
	//Give the instance variables initial values
	[self setPossessionName:name];
	[self setValueInDollars:value];
	[self setSerialNumber:sNumber];
	dateCreated = [[[NSDate] alloc] init];
	
	//Return the address of the newly initialzied object
	return self;
}

#pragma mark Action methods

-(NSString *)description
{
	NSString *descriptionString = 
	[[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, Recorded on %@",
	 possessionName,
	 serialNumber,
	 valueInDollars,
	 dateCreated];
	
	return descriptionString;
}
	
@end
