# ATC

[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active) [![Build Status](https://travis-ci.org/wilsontom/ATC.svg?branch=master)](https://travis-ci.org/wilsontom/ATC) [![Build status](https://ci.appveyor.com/api/projects/status/6eu4ysytsf0oqepn/branch/master?svg=true)](https://ci.appveyor.com/project/wilsontom/atc/branch/master) [![codecov](https://codecov.io/gh/wilsontom/ATC/branch/master/graph/badge.svg)](https://codecov.io/gh/wilsontom/ATC) ![License](https://img.shields.io/badge/license-GNU%20GPL%20v3.0-blue.svg "GNU GPL v3.0")


> __Retrieve Classification Details for an Anatomical Therapeutic Chemical (ATC) Code__

### Installation & Usage

```R
remotes::install_github('wilsontom/ATC')
```

```R
> library(ATC)

# valid ATC code
> search_atc_code('A10BA02')

                      Level                                             Value
1     Anatomical Main Group                 A ALIMENTARY TRACT AND METABOLISM
2     Therapeutic Sub-Group                        A10 DRUGS USED IN DIABETES
3 Pharmacological Sub-Group A10B BLOOD GLUCOSE LOWERING DRUGS, EXCL. INSULINS
4        Chemical Sub-Group                                  A10BA Biguanides
5        Chemcial Substance                                         metformin
6                       ATC                                           A10BA02

# invalid ATC code
> search_atc_code('A092X')

Error: Invalid ATC Code
```
