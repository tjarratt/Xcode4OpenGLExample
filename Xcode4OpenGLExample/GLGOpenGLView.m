//
//  GLGOpenGLView.m
//  Xcode4OpenGLExample
//
//  Created by Tim Jarratt on 7/7/13.
//  Copyright (c) 2013 General Linear Group. All rights reserved.
//

#import "GLGOpenGLView.h"

@implementation GLGOpenGLView

- (id)initWithFrame:(NSRect) frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    
    return self;
}

// this view uses a delegate to handle the logic for what to draw.
// the view itself knows how to draw primitives
- (void) setDelegate:(id) theDelegate {
    delegate = theDelegate;
}

- (void) update {
    // update anything in your view that may need updating (colors, positions, et cetera)
}

// this is an NSView method that we'll use to draw drawing to the screen with OpenGL
- (void) drawRect:(NSRect) dirtyRect {
    // this will set the given color as Red, Green, Blue, Alpha to be used to clear the screen
    glClearColor(0.95, 0.95, 0.95, 0);

    // this will clear the current buffer enabled for drawing colors with the color we defined above
    glClear(GL_COLOR_BUFFER_BIT);

    // if we have a delegate, ask it to draw inside our rect
    if (delegate) {
        [delegate view:self drawInRect:dirtyRect];
    }

    // flush what we've setup so that it is drawn to the screen
    glFlush();
    CGLFlushDrawable([[self openGLContext] CGLContextObj]);
}

- (void) drawCircleAtPoint:(NSPoint) point withRadius:(CGFloat) radius {
    // begin drawing mode with triangles to fill in the space between the points we indicate
    glBegin(GL_TRIANGLE_FAN);

    // we can't draw an actual circle because of the limitations of our screen, which is made of a grid of pixels
    // instead, we can draw an approximation using this simple formula
    int segments = 100;
    CGFloat scale = 2 * M_PI / (float) segments;

    // draw the center of the circle initially
    glVertex2f(point.x, point.y);

    // for each point, we draw a point along the circumference of the circle
    // using the openGL mode GL_TRIANGLE_FAN above, this will fill in the space between
    // the center of the circle and the points we draw below to be filled in with circles
    for (int i = 0; i <= segments; ++i) {
        glVertex2f(point.x + radius * cos(i * scale), point.y + radius * sin(i * scale));
    }

    glEnd();


}

@end
