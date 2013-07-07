//
//  GLGOpenGLController.h
//  Xcode4OpenGLExample
//
//  Created by Tim Jarratt on 7/7/13.
//  Copyright (c) 2013 General Linear Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLGOpenGLView.h"

@class GLGOpenGLView;
@interface GLGOpenGLController : NSObject {
    NSUInteger framenumber;
    GLGOpenGLView *scene;
}

-(id) initWithWindow:(NSWindow *) window;
-(void) view:(GLGOpenGLView *)view drawInRect:(NSRect) rect;
@end
