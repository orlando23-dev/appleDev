//
//  PersistStatus.h
//  OnlineGBooks
//
//  Created by Ding Orlando on 2/13/13.
//  Copyright (c) 2013 Ding Orlando. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface PersistStatus : NSManagedObject

@property (nonatomic) int32_t iCurrentPage;

@end
