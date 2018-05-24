# LmomGPA

## 1. Data
One yeaar block maxima (deficite volumes) for each catchment

## 2. L-moments estimation
at-site - estimated either via lmom package or functions saved in 'aux_dist.R', parameters are estimated with functions gev/gpa.para    
regional - estimated via at-site L-moments: 1st moment = 1, 2nd moment = mean L-CV, rest are regional means     
models fit functions are saved in 'aux_fit_smp.R'     


## 3. Anderson-Darling test
Hanel 2009 - Appendix B ('aux_functions.R')     
at-site - samples are generated via r...(n, xi, alpha, k)     
regional - see samples     

## 4. Bootstrap samples
'aux_fit_smp.R'    
nonpar:     
- calculate residuals 'aux_functions.R'     
- sample years    
- transform back to original scale    
    
average correlation:    
- calculate residuals 'aux_functions.R'     
- cor mat     
- avg cor     
- generate rmvnorm data 'aux_functions.R'     
- transform back to original scale q...(pnorm(x)) 

## 5. Fit samples 
lapply step 2 with saved function call

#Graphics

- Gumbel plot
- QQplot
- Growthcurve
- ratiodiagram
- para.boxplot
