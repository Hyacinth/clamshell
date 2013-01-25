//
//  DMMURLParser.h
//  Monacle
//
//  Created by Delisa Mason on 1/24/13.
//  Copyright (c) 2013 Delisa Mason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMMURLParser : NSObject

@property (nonatomic, retain) NSArray *variables;

- (id)initWithURLString:(NSString *)url;
- (NSString *)valueForVariable:(NSString *)varName;

@end
