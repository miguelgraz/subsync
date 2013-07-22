subsync
=======

A project to resync subtitles

## Objective

Sync a subtitle with a framerate different from its original, considering that we know the original framerate and the desired one.

## How to use it

Simply clone the repo and run, change the framerates on lines 5 (the original) and 6 (the desired), also change the filename of your original subtitle on line 8.
Run `ruby subsync.rb` and it'll create or change the `output.rb` (unless you change the output file).

## Problems

It simply doesn't work as I expected, in my head if we have the two framerates and the distance between subtitles we could apply the proportion and discover the proper distance to resync the subtitle but in my tests the `output.srt` is always a bit out of the time, you can test it with the current `output.srt` and the right `Rise of the Guardians OK 23.976 FPS` subtitle.
Obviously I have something wrong in my maths, if you have another idea on how to do it feel free to change the code as you want or ping me and let's fix this together.