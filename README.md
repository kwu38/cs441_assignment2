Kevin Wu
CS441 Project 2 2048

This program is a my version of the viral mobile-game 2048. The data structures
I used were a 2-d array of labels that contain the visual aspect and a 2-d
array of integers that contain the actual numeral values. Each tile will change 
colors depending on the number values. Like Professor Madden said in class, 
you should not have separate code with changing indicies for each direction.
I have one function that slides everything to the left and also a function
that rotates the table. So to slide right, you simply rotate twice and slide left
and then rotate twice to get back to the original table. When they are no
possible moves anymore, an alert is displayed and you choose to play again.

