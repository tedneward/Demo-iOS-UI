# Demo: iOS UI
This is a repository containing several applications that serve as demos for how to do various things with the user interface in an iOS application.

## BonjourMonde
... because "Hello World" is boring, let's do it in French! (Sort of.) Also shows how the LaunchScreen.storyboard is displayed before the Main.storyboard comes up. Other than that, it's Baby's First iOS App (tm).

## ActivitySpy
An application that tries to "spy" on everything that goes on in an iOS application. Intended as a way to get a feel for the lifecycle of various components in an iOS application.

## AlertDemo
An application that shows how to do a simple UIAlertController. (TODO: Expand this to show off different flavors/variations.)

## Appearance
Demos how to set global appearance settings on UIKit constructs. (TODO: Expand this.)

## ControlSink
Demonstrates a number of the different iOS controls.

## GestureFun
Show how to install different gesture recognizers. (TODO: Compare to PinchZoom, make sure there's no duplication here.)

## NibLoadingDemo
Demonstrates how to create an application screen using Nibs (aka 'xib' files).

## Pickers
Demonstrates how to use a standard Date picker as well as how to create a custom picker, which displays one of many options (colleges, in this case).

## PinchZoom
Demonstrates how to use gesture recognizers in iOS--each of the different kind of gesture recognizers is instantiated and registered with the main view, but in order to make it clear which one is being triggered, it displays some "debug text" at the bottom.

## SleepyApp
What happens when you do a `Thread.sleep` (simulating doing some intensive work) in your event-handler method? You freeze up your UI, that's what. How do you avoid doing that? Use GCD.

## TableViews
Demonstrates some UITableView functionality. Currently consists of one child project, TableFun, but I'm probably going to add a few more (eventually).

## ViewSwitcher
An application that manages a child ViewController in the body of the canvas "by hand", activated when the user pushes a Toolbar button at the bottom. Also (briefly) displays how to use the "block animation" facilities of iOS, which replace the (deprecated but not removed, as of iOS 17) "beginAnimations/commitAnimations" API.
