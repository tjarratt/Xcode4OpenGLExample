Xcode4 OpenGL Example
=====================

This is an example of using Xcode 4 with OpenGL to draw graphics. I found myself
wanting a stand alone xcode project that I could clone for this exact purpose;
a tool akin to `rails new $PROJECT` is roughly what I wanted. For a first pass,
I've created this repository that you can clone to get started drawing graphics.

Okay, so what does this handle for me?
--------------------------------------

This project includes a simple app delegate, controller and a view.

The view has a simple method for drawing circles, and can easily be extended with
methods to draw points, lines, and other geometric primitives like squares or
rectangles, ellipses, toruses, et cetera.

The controller handles the logic for what to draw, and additionally sets up some
same defaults for OpenGL. This includes setting the area to draw, a simple 2d
projection, and has a -(void) update method that ticks off once per frame, to
update objects and redraw.

Currently it has a very simple animation of a ball bouncing, for an example of
what you could do. This could easily be extended with NSAnimation for an eased
animation that would look gravity, or with a physics library such as Box2D.

Okay, now what?
---------------

Use this to build something cool! Or just play around with OpenGL. If this
helped you learn more about this technology, then my job was done. This is
available under the MIT license, so any modifications you make are your own!

Contributors?
-------------

Feel free to work and show some of your own best practices! Also, if you'd like
to improve this project issue a pull request and I'd be happy to list you as a
contributor.

Some possible areas you might want to fix (off the top of my head)

* window / view resizing
* more methods for drawing primitives on the GLGOpenGLView class
* inclusion of a simple physics system
* keyboard / mouse controls for interacting with the scene
* an example of playing sounds
* any and all best practices related to drawing with multiple buffers
