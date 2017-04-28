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

<img src="https://raw.githubusercontent.com/MeowLucian/DTMF_Detector/master/Picture/Equation_1.PNG">

<img src="https://raw.githubusercontent.com/MeowLucian/DTMF_Detector/master/Picture/Equation_2.PNG">

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

<img src="https://raw.githubusercontent.com/MeowLucian/DTMF_Detector/master/Picture/Equation_3.PNG">

<img src="https://raw.githubusercontent.com/MeowLucian/DTMF_Detector/master/Picture/Equation_4.PNG">

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

<img src="https://raw.githubusercontent.com/MeowLucian/DTMF_Detector/master/Picture/Equation_5.PNG">

<img src="https://raw.githubusercontent.com/MeowLucian/DTMF_Detector/master/Picture/Equation_6.PNG">

```
button_Clear.m
```
* Clear all windows

# Program GUI :

![Program GUI](https://raw.githubusercontent.com/MeowLucian/DTMF_Detector/master/Picture/MainGUI.png)
Video : https://www.youtube.com/watch?v=yUdI6OeV-q8
![Program GUI gif](https://raw.githubusercontent.com/MeowLucian/DTMF_Detector/master/Picture/GUI_gif.gif)
