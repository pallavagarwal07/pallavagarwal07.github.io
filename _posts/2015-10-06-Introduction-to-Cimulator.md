---
title: "Introduction to Cimulator"
layout: default
img: cimulator.png
img-alt: Screenshot of Cimulator working
tags: post
---

Cimulator is a tool that can help you see you program in action. That means no more
mysterious floating point exceptions, no more hidden runtime errors. With Cimulator,
you can actually see your program run step by step and debug the errors as they occur.

You can change the speed of the Simulation using the slider on the top left hand side,
or even pause the simulation altogether using the Pause button on the top right of the
screen. The reset button, just next to the Pause button can be used to stop a running
simulation, and reset everything. When the reset button is pressed, the gcc output of
the program is displayed in the output space.

Once you are done with the coding part, enter the input in the input box.
The input box is a text area where the user can enter input for the program in the
ace editor, and as the input is read by the program, it gets highlighted in the box.
Once you start a simulation, the input box becomes non-editable.

To start the simulation, press the submit button, which is below the input and output box,
upon completion of the coding part and the input part. The following scenarios could occur:

- If gcc was unable to compile your program, it would display the gcc compile error
- If the output of gcc and output interpreter was the same, “Simulation made successfully”
is displayed, and simulation starts
- If the gcc output did not match because of runtime in the program

The output box is a textbox where the output of the program gets displayed. The output
gets added to the box as an when a printf statement is encountered, not altogether. Every
time something new gets printed, the output box flashes green.

When the program is running, the corresponding line of the code is highlighted
to provide a indication of where the simulation is, currently. When the code highlighting
hits a conditional (if statement), its colour changes to green or red depending on
whether the condition is evaluated to true or false (resp.).

If an error is encountered during the execution of the program, a popup will denote
the error and the line in which the error was encountered will be highlighted in
the editor in the background.

In case you encounter any bugs in Cimulator, please report them using the
Bug Report button on the bottom right.

The following two videos should get you familiar with what to expect with
Cimulator (watch in HD).

<br/>
<div class="embed-responsive embed-responsive-16by9">
<iframe width="560" height="315" src="https://www.youtube.com/embed/bx9V0sw_n-M" frameborder="0" allowfullscreen></iframe>
</div><br/>
<div class="embed-responsive embed-responsive-16by9">
<iframe width="560" height="315" src="https://www.youtube.com/embed/t0nSdXk-8Zw" frameborder="0" allowfullscreen></iframe>
</div>
<br/>
<br/>
<br/>
<br/>

####_Not a beginner? We have something for you too!_
<div id="dropContent">With the current implementation, the c file generated from your code
is stored inside the directory and run without any isolation. Thus, it can be used
to execute custom code and take control of the docker instance this project runs on.
Your task is to use this to your advantage to obtain the directory listing of the
folder the code file gets generated in. First two people to complete this
task will get a treat from me (Pallav Agarwal) in CCD :).</div>

<br/><br/>
