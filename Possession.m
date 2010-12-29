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

+(id)randomPossession
{
	//Create two arrays with a list of possible adjectives and nouns
	//Note: When using NSArray's arraywithObjects:, you can pass as many 
	//objects as you like.  At the end of that list, you put nil to 
	//signify that there are no more objects - otherwise you will crash.
	//The nil value is not added to the array, but is used by the method to
	//determine the end of hte list.
	NSArray *randomAdjectiveList = [NSArray arrayWithObjects:@"Fluffy", @"Rusty", @"Shiny", nil];
	NSArray *randomNounList = [NSArray arrayWithObjects:@"Bear", @"Spork",@"Mac",nil];
	
	//Get the index of a random adjective/noun from the lists
	//Note: The % operator, called the modulo operator, gives you the 
	//remainder.  So adjectiveIndex is a random number
	//from 0 to 2 inclusive, in this case.
	int adjectiveIndex = random()%[randomAdjectiveList count];
	int nounIndex = random()%[randomNounList count];
	
	NSString *randomName = [NSString stringWithFormat:@"%@ %@",
							[randomAdjectiveList objectAtIndex:adjectiveIndex],
							[randomNounList objectAtIndex:nounIndex]];
	
	int randomValue = random() % 100;
	
	NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
							'0' + random() % 10,
							'A' + random() % 26,
							'0' + random() % 10,
							'A' + random() % 26,
							'0' + random() % 10];
	//Once again, ingnore the memory problems iwth this method
	//We use "self" instead of the name of the class in class methods...
	//Keep reading to find out why
	Possession *newPossession = 
		[[[self alloc] initWithPossessionName:randomName
							  valueInDollars:randomValue
								serialNumber:randomSerialNumber] autorelease];
	return newPossession;
}

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
	dateCreated = [[[NSDate date] alloc] init];
	
	//Return the address of the newly initialzied object
	return self;
}

#pragma mark Action methods

-(NSString *)description
{
	NSString *descriptionString = 
	[[[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, Recorded on %@",
	 possessionName,
	 serialNumber,
	 valueInDollars,
	  dateCreated] autorelease];
	
	return descriptionString;
}
	
@end
