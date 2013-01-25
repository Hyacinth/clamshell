//
//  DMMSearchResult.m
//  ClamShell
//
//  Created by Delisa Mason on 1/24/13.
//  Copyright (c) 2013 Delisa Mason. All rights reserved.
//

#import "DMMSearchResult.h"
@interface DMMSearchResult ()

@property (nonatomic, strong) NSString *delimiter;

@end

@implementation DMMSearchResult

- (id) initWithName: (NSString *) name path: (NSString *) path type: (NSString *) type
{
  self = [super init];
  if (self) {
    self.name = name;
    self.path = path;
    self.type = type;
    [self parseHTMLFileName];
  }
  return self;
}

- (void) parseHTMLFileName
{
  NSRegularExpression *exp = [NSRegularExpression regularExpressionWithPattern:@"\\/([A-Za-z0-9]+)\\.html" options:NSRegularExpressionDotMatchesLineSeparators error:nil];

  NSArray *matches = [exp matchesInString:self.path
                                  options:0
                                    range:NSMakeRange(0, [self.path length])];

  if (matches.count > 0) {
    NSTextCheckingResult *match = matches[0];
    NSRange matchRange = [match rangeAtIndex:1];

    self.htmlFileName = [self.path substringWithRange:matchRange];
  }
}

@end
