//
//  Book.h
//  coredataapp
//
//  Created by Shawn Arney on 10/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Book : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * title;

@end
