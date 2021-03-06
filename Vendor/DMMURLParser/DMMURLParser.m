//
//  DMMURLParser.m
//  ClamShell
//
//  Created by Delisa Mason on 1/24/13.
//  Copyright (c) 2013 Delisa Mason. All rights reserved.
//

#import "DMMURLParser.h"

@implementation DMMURLParser

- (id) initWithURL:(NSURL *) url
{
  self = [super init];
  if (self != nil) {
    NSArray *components = [[url absoluteString] componentsSeparatedByString:@"//"];
    if (components.count < 2) {
      self.variables = @{};
    } else {
      NSString *query = components[1];
      NSArray *queryPairs = [query componentsSeparatedByString:@"&"];
      NSMutableDictionary *pairs = [NSMutableDictionary dictionary];
      for (NSString *queryPair in queryPairs) {
        NSArray *bits = [queryPair componentsSeparatedByString:@"="];
        if ([bits count] != 2) { continue; }

        NSString *key = [[bits objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *value = [[bits objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

        [pairs setObject:value forKey:key];
        self.variables = pairs;
      }
    }
  }
  return self;
}

- (NSString *)valueForVariable:(NSString *)varName
{
  return self.variables[varName];
}

@end