//
//  BNRItem.m
//  RandomPossesionns
//
//  Created by ladmin on 13/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem
@synthesize itemName;
@synthesize containedItem,container,serialNumber,valueInDollars,dateCreated;
@synthesize imageKey;
@synthesize thumbnail,thumbnailData;

- (void)setThumbnailDataFromImage:(UIImage *)image
{
    CGSize origImageSize = [image size];
    // The rectangle of the thumbnail
    CGRect newRect = CGRectMake(0, 0, 40, 40);
    // Figure out a scaling ratio to make sure we maintain the same aspect ratio
    float ratio = MAX(newRect.size.width / origImageSize.width,newRect.size.height / origImageSize.height);
    // Create a transparent bitmap context with a scaling factor
    // equal to that of the screen
    UIGraphicsBeginImageContextWithOptions(newRect.size, NO, 0.0);
    // Create a path that is a rounded rectangle
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:newRect
                                                    cornerRadius:5.0];
    // Make all subsequent drawing clip to this rounded rectangle
    [path addClip];
    // Center the image in the thumbnail rectangle
    CGRect projectRect;
    projectRect.size.width = ratio * origImageSize.width;
    projectRect.size.height = ratio * origImageSize.height;
    projectRect.origin.x = (newRect.size.width - projectRect.size.width) / 2.0;
    projectRect.origin.y = (newRect.size.height - projectRect.size.height) / 2.0;
    // Draw the image on it
    [image drawInRect:projectRect];
    // Get the image from the image context, keep it as our thumbnail
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    [self setThumbnail:smallImage];
    // Get the PNG representation of the image and set it as our archivable data
    NSData *data = UIImagePNGRepresentation(smallImage);
    [self setThumbnailData:data];
    // Cleanup image context resources, we're done
    UIGraphicsEndImageContext();
    
}

-(UIImage *)thumbnail
{
    //if there is no thumbnailDta,then I have no thumbnail to return
    if(!thumbnailData){
        return nil;
    }
    //If I have no yet created my thumbnail image from my data,do so now
    if(!thumbnail){
        //Create the image from the data
        thumbnail=[UIImage imageWithData:thumbnailData];
    }
    return thumbnail;
}

-(void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:itemName forKey:@"itemName"];
    [aCoder encodeObject:serialNumber forKey:@"serialNumber"];

    [aCoder encodeObject:dateCreated forKey:@"dateCreated"];

    [aCoder encodeObject:imageKey forKey:@"imageKey"];

    [aCoder encodeInt:valueInDollars forKey:@"ValueInDollars"];
    
    [aCoder encodeObject:thumbnailData forKey:@"thumbnailData"];

}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    
    self=[super init];
    if (self){
        [self setItemName:[aDecoder decodeObjectForKey:@"itemName"]];
        [self setSerialNumber:[aDecoder decodeObjectForKey:@"serialNumber"]];
        [self setImageKey:[aDecoder decodeObjectForKey:@"imageKey"]];
        
        [self setValueInDollars:[aDecoder decodeIntForKey:@"valueInDollars"]];
        
        dateCreated=[aDecoder decodeObjectForKey:@"dateCreated"];

        thumbnailData=[aDecoder decodeObjectForKey:@"thumbnailData"];
        
    }
    return self;
}
+(id) randomItem{
//Create an array of three adjectives
    NSArray *randomAdjectiveList=[NSArray arrayWithObjects:@"Fluffy",@"Rusty",@"Shiny",nil];
    
    // Create an array of three nouns
    NSArray *randomNounList=[NSArray arrayWithObjects:@"Bear",@"Spork",@"Mac", nil];
    
    //Get the index of a random andjective/noun from the lists
    //Note:The % operator,called the modulo operator,gives you 
    //the remainder.So adjectiveIndex is a random number
    // from 0 to 2 inclusive
    
    NSInteger adjectiveIndex=rand()%[randomAdjectiveList count];
    NSInteger nounIndex=rand() %[randomNounList count];
                                 
    //Note that NSInteger is not an object, but type definition 
    // for "unsigned long"
    
    NSString *randomName=[NSString stringWithFormat:@"%@ %@",
                          [randomAdjectiveList objectAtIndex:adjectiveIndex],
                          [randomNounList objectAtIndex:nounIndex]];
    
    int randomValue=rand()% 100;
    
    NSString *randomSerialNumber=[NSString stringWithFormat:@" %c%c%c%c%c",
                                  '0'+rand() %10,
                                  'A'+rand()%26,
                                  '0'+rand()%10,
                                  'A'+rand()%26,
                                  '0'+rand()%10];
    
    BNRItem *newItem=[[self alloc] initWithItemName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];
    return newItem;         

               
                                 
    
}
-(id)init {
    return [self initWithItemName:@"Item"
                   valueInDollars:0 serialNumber:@""];
}
 -(id) initWithItemName:(NSString *)name 
         valueInDollars:(int)value
           serialNumber:(NSString *)sNumber{
     // Call the SuperClass's designated initializer
     self=[super init];
      
     // Disd the superclass's designated initializer succed?
     if(self){
         
     //Give the instance variables initial values
     [self setItemName:name];
     [self setSerialNumber:sNumber];
     [self setValueInDollars:value];
     dateCreated=[[NSDate alloc]init];
     }
     // Return the adress of the newly initialized object
     return self;
 
 }

-(void)setContainedItem:(BNRItem *)i
{
    containedItem=i;
    
    //When given an item to contain, the contained
    //item will be given a pointer to its container
    [i setContainer:self];
}
//-(BNRItem *)containedItem
//{
//    return containedItem;
//}
//-(void)setContainer:(BNRItem *)i
//{
//    container=i;
//}
//-(BNRItem *) container
//{
//    return container;
//}
////-(void) setItemName:(NSString *)str{
////    itemName=str;
////}
////-(NSString *) itemName{
////    return itemName;
////}
//-(void) setSerialNumber:(NSString *)str{
//    serialNumber=str;
//}
//-(NSString *) serialNumber{
//    return serialNumber;
//}
//-(void)setValueInDollars:(int)i{
//    valueInDollars=i;}
//-(int) valueInDollars{
//    return valueInDollars;}
//-(NSDate *)dateCreated{
//    return dateCreated;}
-(NSString *) description{
    NSString *descriptionString=
    [[NSString alloc]initWithFormat:@"%@ (%@): Worth %d,recorded on %@",
     itemName,serialNumber,valueInDollars,dateCreated];
    return descriptionString;
}
@end
