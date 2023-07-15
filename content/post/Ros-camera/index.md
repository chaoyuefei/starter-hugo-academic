---
title: [ROS] - How to subscribe to a camera topic and process image data using the cv2 library.
subtitle: A brief guide to subscribing to a camera topic published by gazebo in ros1 and efficiently processing image data using the powerful cv2 library.

# Summary for listings and search engines
summary: A brief guide to subscribing to a camera topic published by gazebo in ros1 and efficiently processing image data using the powerful cv2 library.

# Link this post with a project
# projects: [example]

# Date published
date: '2023-07-15T00:00:00Z'

# Date updated
lastmod: '2023-07-15T00:00:00Z'

# Is this an unpublished draft?
draft: false

# Show this page in the Featured widget?
featured: false

# Featured image
# Place an image named `featured.jpg/png` in this page's folder and customize its options here.
image:
  # caption: 'Image credit: [**Unsplash**](https://unsplash.com/photos/CpkOjOcXdUY)'
  focal_point: ''
  placement: 2
  preview_only: false

authors:
  - admin

tags:
  - Ros
  - Gazebo
  - Camera

categories:
  - Tutorial
  - cv2
  - 教程
---

- Ros1 
- Image data generated from gazebo simulation
- Camera's topic is `/camera/rgb/image_raw`

Here is the code:

```python
#!/usr/bin/env python3

import rospy
import cv2
from sensor_msgs.msg import Image
from cv_bridge import CvBridge

def image_callback(msg):
    # Convert the ROS image message to an OpenCV image
    bridge = CvBridge()
    cv_image = bridge.imgmsg_to_cv2(msg, desired_encoding="passthrough")

    # Convert the image to grayscale
    gray_image = cv2.cvtColor(cv_image, cv2.COLOR_BGR2GRAY)

    # Calculate the average gray value
    gray_avg = gray_image.mean()

    # Print the average gray value
    rospy.loginfo("Average Gray Value: {:.2f}".format(gray_avg))

def camera_processing_node():
    # Initialize the ROS node
    rospy.init_node('camera_processing_node')

    # Create a subscriber for the camera topic
    camera_topic = "/camera/rgb/image_raw"  # Replace with the actual topic name
    rospy.Subscriber(camera_topic, Image, image_callback)

    # Spin the ROS node to receive messages
    rospy.spin()

if __name__ == '__main__':
    try:
        camera_processing_node()
    except rospy.ROSInterruptException:
        pass

```

Here is the quick workflow:

1. Have a catkin workspace 

2. Add this script `camera_processing.py`to `src/scripts`

3. Run the code: in a terminal `rosrun fg_gazebo_example camera_processing.py`

4. Results from rosinfo: 

   ```bash
   [INFO] [1689428934.559831, 1518.823000]: Average Gray Value: 36.96
   [INFO] [1689428934.494494, 1518.758000]: Average Gray Value: 36.96
   ```

   