
<!-- README.md is generated from README.Rmd. Please edit that file -->
Locally Adaptive Data Analytics for Large Separated Data Source
==========

<!-- badges: start -->
<!-- badges: end -->
This is a resource page for the locallasso package which allow to perform data analysis with separated data. 

Background
------------

![alt text](https://github.com/gillescat/locallasso/blob/main/Eq%20local%20lasso.jpg?raw=true)

<img src="https://render.githubusercontent.com/render/math?math=\underset{\alpha \in \R^{d+1}}{\text{min}} \sum_{i=1}^{n}\left(Y_i - \alpha_{0} - \sum_{j=1}^{d_1}\alpha_{j}(X^{cont}_{ij}-x^{cont}_{0j}) -\sum_{l=d_{1}+1}^{d}\alpha_{l}X^{cate}_{il}\right)^2 K\left(\frac{dm(X^{cont}_i,x^{cont}_0)}{max(dm)}\right) + \lambda |\alpha|_1">



Installation
------------

You can install the released version of locallasso with:

``` r
install_github("gillescat/local-lasso")
```
