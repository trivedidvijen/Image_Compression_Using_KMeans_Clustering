# Image Compression using K-Means Clustering

## Introduction

This was initially developed during Fall 2017 as part of ***Neural Networks & Fuzzy Logic*** course project in Matlab R2015a

## Problem Statement

Implementing the K-means clustering algorithm and applying it to compress an image. This is done by using the K-means algorithm for image compression by reducing the number of colours that occur in an image to only those that are most common in that image.

## K-means Clustering

The K-means algorithm is a method to automatically cluster similar data examples together. Concretely, you are given a training set and want to group the data into a few clusters".

The intuition behind K-means is an iterative procedure that starts by guessing the initial centroids, and then refine  this guess by repeatedly assigning examples to their closest centroids and then recomputing the centroids based on the assignments.

The inner-loop of the algorithm repeatedly carries out two steps: 

1. Assigning each training example to its closest centroid
2. Recomputing the mean of each centroid using the points assigned to it

**_Note:_** The K-means algorithm will always converge to some final set of means for the centroids.

In practice the K-means algorithm is usually run a few times with different random initializations. One way to choose between these different solutions from different random initializations is to choose the one with the lowest cost function value (distortion).

## Image compression with K-means

In a straightforward 24-bit color representation of an image, each pixel is represented as three 8-bit unsigned integers (ranging from 0 to 255) that specify the red, green and blue intensity values. This encoding is often refered to as the RGB encoding. Our image contains thousands of colors, and we  reduced the number of colors to 16 colors.

By making this reduction, it is possible to represent (compress) the photo in an efficient way. Specifically, we only need to store the RGB values of the 16 selected colors, and for each pixel in the image we need to only store the index of the colour at that location (where only 4 bits were necessary to represent 16 possibilities).

Here we  use the K-means algorithm to select the 16 colors that will be used to represent the compressed image. Concretely, we have treated every pixel in the original image as a data example and use the K-means algorithm to find the 16 colors that best group (cluster) the pixels in the 3-dimensional RGB space. Once we have computed the cluster centroids on the image, we  then use the 16 colors to replace the pixels in the original image.

**_Note:_** The script kMeans.m is the entry point for the code. Rest all are supporting functions called internally.

**Original Image**

!["Original Image"](onion.png)

**Compressed Image**

!["Compressed Image"](onion_compressed.png)

## Conclusion
The original image required 24 bits for each one of the 128*128 pixel locations, resulting in total size of $135 *198 *24 = 641,520$ bits. The new representation requires some overhead storage in form of a dictionary of 16 colors, each of which require 24 bits, but the image itself then only requires 4 bits per pixel location. The final number of  bits used is therefore $16 * 24 + 135 * 198 * 4 = 107,304$ bits, which corresponds to compressing the original image by about a factor of 6.

Comparing the size of the Original and Compressed Images, we can observe that the compression ratio of $4.4 : 1$ is achieved.