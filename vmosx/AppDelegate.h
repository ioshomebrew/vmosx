//
//  AppDelegate.h
//  vmosx
//
//  Created by Lion User on 17/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

- (IBAction)videodriver:(id)sender;
- (IBAction)vmwarepatch:(id)sender;
- (IBAction)vmwarestart:(id)sender;
- (IBAction)vmwarerestart:(id)sender;
- (IBAction)vmwarestop:(id)sender;
- (IBAction)ensoniq:(id)sender;
- (IBAction)about:(id)sender;

@end
