# ATC

> __Retrieve Classification Details for a Anatomical Therapeutic Chemical (ATC) Code__

### Installation & Usage

```R
remotes::install_github('wilsontom/ATC')
```

```R
> library(ATC)

> search_atc_code('A10BA02')

                      Level                                             Value
1     Anatomical Main Group                 A ALIMENTARY TRACT AND METABOLISM
2     Therapeutic Sub-Group                        A10 DRUGS USED IN DIABETES
3 Pharmacological Sub-Group A10B BLOOD GLUCOSE LOWERING DRUGS, EXCL. INSULINS
4        Chemical Sub-Group                                  A10BA Biguanides
5        Chemcial Substance                                         metformin
6                       ATC                                           A10BA02


> search_atc_code('A092X')

Error: Invalid ATC Code
```
