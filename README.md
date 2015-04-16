## What is CARD?

CARD is a new local descriptor which makes it possible to establish visual correspondences between images, and is widely available for many computer vision applications such as image retrieval, object recognition, structure from motion, augmented reality and many more.
Since our algorithm requires lower computational resource than conventional methods, such as SIFT and SURF, CARD can be suitably used on devices equipped with a low-end CPU, such as mobile phones and in-vehicle processors.
CARD will be presented at Internatinal Conference on Computer Vision (ICCV2011).
Currently our demo software is provided for research purposes only.

## Demo movie

[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/noo5qG9qGIw/0.jpg)](https://youtu.be/Yd007QGkoNo)

## Reference

M.Ambai and Y.Yoshida. CARD: Compact And Real-time Descriptors. in ICCV2011

## Abstract

We propose Compact And Real-time Descriptors (CARD) which can be computed very rapidly and be expressed by short binary codes. An efficient algorithm based on lookup tables is presented for extracting histograms of oriented gradients, which results in approximately 16 times faster computation time per descriptor than that of SIFT. Our lookup-table-based approach can handle arbitrary layouts of bins, such as the grid binning of SIFT and the logpolar binning of GLOH, thus yielding sufficient discrimination power. In addition, we introduce learning-based sparse hashing to convert the extracted descriptors to short binary codes. This conversion is achieved very rapidly by multiplying a very sparse integer weight matrix by the descriptors and aggregating signs of their multiplications. The weight matrix is optimized in a training phase so as to make Hamming distances between encoded training pairs reflect visual dissimilarities between them. Experimental results demonstrate that CARD outperforms previous methods in terms of both computation time and memory usage.

## How to use

Please check ````sample_matching.m````.

## License

See, [CARD Toolbox for Matlab, Software License Agreement](https://github.com/DensoITLab/CARD/blob/master/LICENSE.md)
