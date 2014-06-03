Propagation Kernels
===================

A MATLAB implementation of the propagation graph kernel for general 
graphs (propagation\_kernel.m) and grid graphs (propagation\_kernel\_matrix.m). 
The propagation kernel is described in:

> Neumann, M. Patricia, N., Garnett, R., and Kersting, K. Efficient
> Graph Kernels by Randomization. (2013). Machine Learning and
> Knowledge Discovery in Databases: European Conference (ECML/PKDD
> 2012), pp. 378--392.

This implementation supports arbitrary user-defined base kernels and
transformations as well as neighborhoods for the grid version. 

Usage
-----

Add the directory to your MATLAB path and use `help
propagation_kernel` to view the documentation. A simple demos for both 
implementations are provided in the `demo/` directory.
