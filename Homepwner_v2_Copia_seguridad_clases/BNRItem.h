//
//  BNRItem.h
//  RandomPossesionns
//
//  Created by ladmin on 13/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject <NSCoding>
@property(nonatomic,strong) BNRItem *containedItem;
@property(nonatomic,weak)BNRItem *container;

@property(nonatomic,copy)NSString *itemName;
@property(nonatomic,copy)NSString *serialNumber;
@property(nonatomic)int valueInDollars;
@property(nonatomic,readonly,strong)NSDate *dateCreated;
@property(nonatomic,copy)NSString *imageKey;

@property (nonatomic,strong) UIImage *thumbnail;
@property(nonatomic,strong) NSData *thumbnailData;

-(void)setThumbnailDataFromImage:(UIImage *)image;

+(id) randomItem;
-(id)initWithItemName:(NSString *)name
      valueInDollars:(int)value
        serialNumber:(NSString *) sNumber;
//
//-(void) setContainedItem:(BNRItem *)i;
//- (BNRItem *)containedItem;
//
//-(void)setContainer:(BNRItem *)i;
//-(BNRItem *)container;
//
//-(void) setItemName:(NSString *)str;
//- (NSString *) itemName;
//
//- (void) setSerialNumber:(NSString *)str;
//- (NSString *)serialNumber;
//
//- (void) setValueInDollars:(int)i;
//-(int) valueInDollars;
//
//-(NSDate *) dateCreated;

@end
