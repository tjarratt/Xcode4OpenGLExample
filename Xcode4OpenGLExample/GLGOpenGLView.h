//
//  GLGOpenGLView.h
//  Xcode4OpenGLExample
//
//  Created by Tim Jarratt on 7/7/13.
//  Copyright (c) 2013 General Linear Group. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GLGOpenGLController.h"

@class GLGOpenGLController;
@interface GLGOpenGLView : NSOpenGLView {
    GLGOpenGLController *delegate;
}

- (void) update;
- (void) setDelegate:(id) delegate;
- (void) drawCircleAtPoint:(NSPoint) point withRadius:(CGFloat) radius;
@end
