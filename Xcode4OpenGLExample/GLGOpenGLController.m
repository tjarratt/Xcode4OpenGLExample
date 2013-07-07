//
//  GLGOpenGLController.m
//  Xcode4OpenGLExample
//
//  Created by Tim Jarratt on 7/7/13.
//  Copyright (c) 2013 General Linear Group. All rights reserved.
//

#import "GLGOpenGLController.h"

@implementation GLGOpenGLController

// the controller's init method is a good place to setup objects
// that you may want to draw in your scene, or other objects you will later use
- (id) initWithWindow:(NSWindow *) window {
    if (self = [super init]) {
        // create our screen with the current dimensions of our window
        scene = [[GLGOpenGLView alloc] initWithFrame:[[NSScreen mainScreen] frame]];

        // setup this controller as the delegate for our view
        [scene setDelegate:self];

        // use best resolutions if available
        [scene setWantsBestResolutionOpenGLSurface:YES];

        // setup our current drawing context
        [[scene openGLContext] makeCurrentContext];

        // add this view to our window's view hierarchy
        [[window contentView] addSubview:scene];

        // create a simple 2d projection
        const GLfloat width = [scene bounds].size.width;
        const GLfloat height = [scene bounds].size.height;

        // this code sets the drawable area for our view - between the point (0, 0) and (width, height)
        // and it says that we should project from the points we specify in our view or controller using
        // glVertex3f, etc onto pixel space using a simple orthographic projection which is the identity
        // the upside of this is that you can specify pixels to draw directly
        // eg: drawing at pixel (0, 0) is the pixel at the bottom left corner
        // and the pixel (width, height) is the top right corner
        glMatrixMode (GL_PROJECTION);
        glLoadIdentity();
        glViewport(0, 0, width, height);
        glOrtho(0, width, 0, height, -1, 1);
        
        [[scene openGLContext] update];

        // setup our frame number
        framenumber = 0;
    }

    return self;
}

// this method is called once per game update tick.
// the application delegate sets up an NSTimer that calls this 30 times per second
// so it is important that this method does not block for longer than 33 milliseconds
- (void) update {
    [scene update];
    [scene display];
    framenumber += 1;
}

// this delegate method on the controller allows the view to tell the controller which
// view needs to be updated, and which rect inside of it is dirty.
// if the rect contains objects that need to be redrawn, you can do that here
- (void) view:(GLGOpenGLView *)view drawInRect:(NSRect)rect {
    CGFloat x = rect.size.width / 2.0;
    CGFloat y = rect.size.height / 2.0;

    // at t=0, our circle should be at 0, y
    // at t= 100, our circle should be at x, y
    // this is a very simple, linear animation, with no easing
    CGFloat scale = framenumber % 100 / 100.0;
    if (scale > 0.5) {
        scale = 0.5 - (scale - 0.5);
    }

    // setup a color to use for drawing and draw a circle at this point
    glColor3f(0.98, 0.3, 0.08);
    CGFloat radius = 50.0;
    CGFloat currentY = y * scale * 5 + radius;
    [view drawCircleAtPoint:NSMakePoint(x, currentY) withRadius:radius];
}
@end
