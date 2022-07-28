---
id: dwxnkggefceh0nl2qn5slq3
title: Quite OK Image Format 
desc: ''
updated: 1658878039736
created: 1658868762247
---


#### Core Skills:
[[tags.lang.C_sharp]][[tags.engine.unity]]

## Abstract
Implementation of the Quite OK Image Format (QoI)[^1] a lossless image compression algorithm in $O(n)$.

## Goal
Starting with just the specification[^2] (and an online decoder for validation), I wanted to implement the QoI format in C#, with unity as a visualizer. 

## Approach
I started with the encoder, and took it in stages, names starting with *qoi_ * are from the spec[^2] but implemented by me.
 - implementation: minimal version
    - *qoi_header* struct and a tailing 7 0x00 and one 0x01 bytes
    - *qoi_op_rgb* and *qoi_op_rgba* the literals and base case for the "chunks" to come
 - I checked that with an online decoder to see that the image came out as expected. 
 - implement the running array and *qoi_op_index* (see spec for details)
 - As the rest of the chuck encodings are based on differentials and "runs", I made a quick image gradient generator. That way I could control how fast the values change, causing the different encodings to be favored. 
    - *qoi_op_diff* for small changes
    - *qoi_op_luma* for larger changes
    - *qoi_op_run* for unbroken sequences of the previous pixel.


## Results

## Conclusion


[^2]: https://qoiformat.org/qoi-specification.pdf
[^1]: https://qoiformat.org/