# Demo: iOS UI
This is a repository containing several applications that serve as demos for how to do various things with the user interface in an iOS application.

## ActivitySpy
An application that tries to "spy" on everything that goes on in an iOS application. Intended as a way to get a feel for the lifecycle of various components in an iOS application.

## ControlSink
Demonstrates a number of the different iOS controls.

## NibLoadingDemo
Demonstrates how to create an application screen using Nibs (aka 'xib' files).

## Pickers
Demonstrates how to use a standard Date picker as well as how to create a custom picker, which displays one of many options (colleges, in this case).

## PinchZoom
Demonstrates how to use gesture recognizers in iOS--each of the different kind of gesture recognizers is instantiated and registered with the main view, but in order to make it clear which one is being triggered, it displays some "debug text" at the bottom.

## TableViews
Demonstrates some UITableView functionality. Currently consists of one child project, TableFun, but I'm probably going to add a few more (eventually).

## ViewSwitcher
An application that manages a child ViewController in the body of the canvas "by hand", activated when the user pushes a Toolbar button at the bottom. Also (briefly) displays how to use the "block animation" facilities of iOS, which replace the (deprecated but not removed, as of iOS 17) "beginAnimations/commitAnimations" API.
