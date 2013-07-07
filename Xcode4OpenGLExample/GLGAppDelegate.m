//
//  GLGAppDelegate.m
//  Xcode4OpenGLExample
//
//  Created by Tim Jarratt on 7/7/13.
//  Copyright (c) 2013 General Linear Group. All rights reserved.
//

#import "GLGAppDelegate.h"

@implementation GLGAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    GLGOpenGLController *controller = [[GLGOpenGLController alloc] initWithWindow: [self window]];

    NSTimer *mainTimer = [NSTimer timerWithTimeInterval: (1.0 / 30.0)
                                                 target: controller
                                               selector: @selector(update)
                                               userInfo: nil
                                                repeats: YES];


    [[NSRunLoop mainRunLoop] addTimer:mainTimer forMode:NSRunLoopCommonModes];
}

@end
