### Table of Contents

1. [Overview](#Overview)
2. [Getting Started](#Getting Started)
3. [Description](#Description)
4. [Features](#Features)
5. [Usage](#Usage)
6. [Limitation](#Limitation)
7. [License](#License)

### Overview

* Drowsiness Alert system will detect that a person’s eyes are closed for a few seconds and will alert the driver when drowsiness is detected.

* It is a technology that can prevent accidents from happening, which are caused by drivers who fell asleep while driving.

### Getting Started

1. Prerequisites:

* The requirement for this Python project is a webcam through which we will capture images. You need to have Python (3.6 version    recommended) installed on your system, then using pip, you can install the necessary packages.

* OpenCV – pip install OpenCV-python (face and eye detection).

* mixer pygame module for loading and playing sounds
 ```
  pip install pygame
 ```

* Dlib , a C++ library with Python bindings which needs to installed in the system for face detection and facial landmark detection.

### Description 

* It uses dlib for face detection and eye landmark detection . The frontal face detector in dlib works very well

* It is an open source C++ library implementing a variety of machine learning algorithms, including classification, regression, clustering, data transformation, and structured prediction.

* Dlib features functionality such as threading, networking, numerical algorithms, image processing, data compression, etc.


### Features

* Capturing image as input from a camera.

* Converting RGB to Gray scale

* Detect the face in the image.

* Detect Region of interest ( eye ).

* Calculate Blinking ratio.

![Eye](https://github.com/himani-de/driver_drowsiness_alert/blob/master/images/eye.png)


### Usage

* Below function returns midpoint which will gives us the midpoint value between the upper points and the bottom points for both left and the right eye

```
def midpoint(p1 ,p2):  #basic function to find the midpoint
          return int((p1.x + p2.x)/2), int((p1.y + p2.y)/2)
    
```

* Get the Blinking Ratio 

```
def get_blinking_ratio(eye_points, facial_landmarks): # funtion to detect the blinking ratio.
    
            left_point = (facial_landmarks.part(eye_points[0]).x, facial_landmarks.part(eye_points[0]).y) # 0 is the index value of 42
            right_point = (facial_landmarks.part(eye_points[3]).x, facial_landmarks.part(eye_points[3]).y) # 3 is the index value of 45
            center_top = midpoint(facial_landmarks.part(eye_points[1]), facial_landmarks.part(eye_points[2])) # 1, 2 are the index value of43,44
            center_bottom = midpoint(facial_landmarks.part(eye_points[5]), facial_landmarks.part(eye_points[4])) # 5,4 are the index value of 47,46
            
            hor_line = cv2.line(frame, left_point, right_point, (0, 255, 0), 2)
            ver_line = cv2.line(frame, center_top, center_bottom, (0, 255, 0), 2)
                
            # this will draw horizontal and vertical line on the eye    
            hor_line_length = hypot((left_point[0] - right_point[0]), (left_point[1] - right_point[1]))
            ver_line_length = hypot((center_top[0] - center_bottom[0]), (center_top[1] - center_bottom[1]))          
            
            ratio = hor_line_length / ver_line_length # finding ratio
            return ratio
```


* Check the Blinking Ratio with Eyes closed.


![Eye_Ratio](https://github.com/himani-de/driver_drowsiness_alert/blob/master/images/Eye_Ratio.png)


### Limitation 

This code has been tested on following operating systems.
 * Ubuntu 18.04
 * Windows 10
 
This code has been tested on following Python Versions. 
* Python 3.6
* Python 3.7.3

### Licence

Released under MIT license, see [LICENSE](LICENSE.md) for details.


