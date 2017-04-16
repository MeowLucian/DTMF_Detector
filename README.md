# DTMF_Detector
Using Matlab to simulate Dual-Tone Multi-Frequency (DTMF) of telephone

# Program Structure :
## Main.m
```
DTMF_tone_generator.m
```
> * button_0 ~ 9
> * button_A ~ D
> * button_Sign, button_Star

* Dual-Tone_multifrequency_generator
<img src="https://raw.githubusercontent.com/MeowLucian/DTMF_Detector/master/Picture/Number_panel.png" width="350">

![Equation](http://latex.codecogs.com/gif.latex?f_s%20%3D%208000%7B%5Crm%7BHz%7D%7D)

![Equation](http://latex.codecogs.com/gif.latex?%5COmega%20%3D%20%5Cfrac%7B%7B2%5Cpi%20f%7D%7D%7B%7Bf_s%20%7D%7D)

<img src="https://raw.githubusercontent.com/MeowLucian/DTMF_Detector/master/Picture/Dual-Tone_multifrequency_generator.png" width="500">

```
button_SoundAll.m
```
* Generate a Tone_file.wav
![Tone_file](https://raw.githubusercontent.com/MeowLucian/DTMF_Detector/master/Picture/Tone_file.PNG)

```
button_Decode.m
```
* Read Tone_file.wav & Decode
* Goertzel algorithm :
<img src="https://raw.githubusercontent.com/MeowLucian/DTMF_Detector/master/Picture/Goertzel_Algorithm.png" width="650">

<img src="https://raw.githubusercontent.com/MeowLucian/DTMF_Detector/master/Picture/Goertzel_Equation.png" width="350">

![Equation](http://latex.codecogs.com/gif.latex?k%20%3D%20%5Cfrac%7Bf%7D%7B%7Bf_s%20%7D%7D%20%5Ctimes%20N)

![Equation](http://latex.codecogs.com/gif.latex?N%3D205)

| DTMF Frequency (Hz) | Frequency Bin : k |
|:-------------------:|:-----------------:|
| 697                 | 18                |
| 770                 | 20                |
| 852                 | 22                |
| 941                 | 24                |
| 1209                | 31                |
| 1336                | 34                |
| 1477                | 38                |
| 1633                | 42                |

<img src="http://latex.codecogs.com/gif.latex?A_k%20%3D%20%5Cfrac%7B2%7D%7BN%7D%5Csqrt%20%7B%5Cleft%7C%20%7BX%28k%29%7D%20%5Cright%7C%5E2%20%7D">

<img src="http://latex.codecogs.com/gif.latex?%7B%5Crm%7BThreshold%7D%7D%20%3D%20%7B%5Crm%7Bsum%7D%7D%28A_k%29/4">

```
button_Clear.m
```
* Clear all windows

# Program GUI :

![Program GUI](https://raw.githubusercontent.com/MeowLucian/DTMF_Detector/master/Picture/MainGUI.png)
Video : https://www.youtube.com/watch?v=yUdI6OeV-q8
![Program GUI gif](https://raw.githubusercontent.com/MeowLucian/DTMF_Detector/master/Picture/GUI_gif.gif)
