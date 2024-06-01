# Low Light Image Enhancement

## How to Run

1. Upload a .jpg image into the _images_ folder
2. Write the following in the Command Window of MATLAB:
```
addpath('.\images')
```

3. Read the uploaded image.
```
img_in = imread('FILE_NAME.jpg');
```

4. Initialize the input values (mu, rho, ds, ss, flag=1) and run the main function.
```
[T_init,T_out,img_out,img_denoised] = main(img_in,mu,rho,ds,ss,flag);
```
## Input Values Preset For Each Image

|Image|mu|rho|ds|ss|
|-----|--|---|--|--|
|buildings|0.3|1.1|1.0|0.5|
|forest|0.01|1.25|10.0|1.0|
|hotel|0.045|1.134|5.0|0.75|
|park|0.01|1.25|10.0|1.0|
|rain|0.5|1.09|0.3|4.0|
|track|0.3|1.15|1.0|0.5|
