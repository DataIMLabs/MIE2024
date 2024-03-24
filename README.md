# MIE2024 Masterclass R & Shiny

## Introduction

At the MIE2024 conference, we presented a brief masterclass on R and Shiny. The masterclass was aimed at researchers working primarily with survey data.

As we anticipated, two 45min sessions were hardly sufficient to cover all relevant topics in sufficient depth We therefore decided to make our code examples public in the form of an R Package.

Feel free to contact the package maintainer ([david\@dataim.nl](mailto:david@dataim.nl){.email}) for any technical matters or follow-up questions.

## Getting started with the package

<details>

<summary>Clone the package or download the package ZIP file</summary>

Traditional git clone:

```         
git clone https://github.com/DataIMLabs/MIE2024/
```

Github clone via GitHub's command line interface (CLI):

```         
gh repo clone DataIMLabs/MIE2024
```

Zip download: [<https://github.com/DataIMLabs/MIE2024/archive/refs/heads/main.zip>]

</summary>

</details>

<details>

<summary>Install package requirements (if needed)</summary>

``` r
install.packages("plotly", "shiny")
```

</details>


```stl
solid cube_corner
  facet normal 0.0 -1.0 0.0
    outer loop
      vertex 0.0 0.0 0.0
      vertex 1.0 0.0 0.0
      vertex 0.0 0.0 1.0
    endloop
  endfacet
  facet normal 0.0 0.0 -1.0
    outer loop
      vertex 0.0 0.0 0.0
      vertex 0.0 1.0 0.0
      vertex 1.0 0.0 0.0
    endloop
  endfacet
  facet normal -1.0 0.0 0.0
    outer loop
      vertex 0.0 0.0 0.0
      vertex 0.0 0.0 1.0
      vertex 0.0 1.0 0.0
    endloop
  endfacet
  facet normal 0.577 0.577 0.577
    outer loop
      vertex 1.0 0.0 0.0
      vertex 0.0 1.0 0.0
      vertex 0.0 0.0 1.0
    endloop
  endfacet
endsolid
```
