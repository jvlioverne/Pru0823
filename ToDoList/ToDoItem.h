//
//  ToDoItem.h
//  ToDoList
//
//  Created by Benjas on 05/02/15.
//  Copyright (c) 2015 Benjas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
