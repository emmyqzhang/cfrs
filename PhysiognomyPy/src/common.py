import numpy
import math
import cv2
from numpy import expand_dims


# Calculate the distance between two points 
def calculateDistance(x1, y1, x2, y2):
    distance = numpy.sqrt(numpy.square(x1 - x2) + numpy.square(y1 - y2))
    return distance


# Calculate the angle of horizontal line
def calculateAngle(pointA, pointB):
    angle = math.atan(abs(pointB[1] - pointA[1]) / (pointB[0] - pointA[0]))
    if pointB[1] > pointA[1]:
        angle = 2 * math.pi - angle
    return angle


def cutImg(filename, real_path, box, x_size, y_size, expand_size, img):
    expand_size -= 1
    
    x1 = min(box[0][0], box[1][0], box[2][0], box[3][0])
    x2 = max(box[0][0], box[1][0], box[2][0], box[3][0])
    y1 = min(box[0][1], box[1][1], box[2][1], box[3][1])
    y2 = max(box[0][1], box[1][1], box[2][1], box[3][1])
    
    xline = x2 - x1
    yline = y2 - y1
    
    if ((xline * y_size) - (yline * x_size)) < 0:
        y = int(yline * expand_size)
        x = int((yline + 2 * y) / y_size * x_size - xline)
        
        if (x % 2) == 0:
            cy1 = y1 - y
            cy2 = y2 + y
            cx1 = x1 - int(x / 2)
            cx2 = x2 + int(x / 2)
#             print("--1--", cy1, cy2, cx1, cx2)
        else:
            cy1 = y1 - y
            cy2 = y2 + y
            cx1 = x1 - int(x / 2)
            cx2 = x2 + int(x / 2) + 1
#             print("--2--", cy1, cy2, cx1, cx2)
    else:
        x = int(xline * expand_size)
        y = int((xline + 2 * x) / x_size * y_size - yline)
         
        if (y % 2) == 0:
            cy1 = y1 - int(y / 2)
            cy2 = y2 + int(y / 2)
            cx1 = x1 - x
            cx2 = x2 + x
#             print("--3--", cy1, cy2, cx1, cx2)
        else:
            cy1 = y1 - int(y / 2)
            cy2 = y2 + int(y / 2) + 1
            cx1 = x1 - x
            cx2 = x2 + x
#             print("--4--", cy1, cy2, cx1, cx2)
    cv2.imwrite(real_path + filename, img[ cy1:cy2, cx1:cx2])
    return [cy1, cy2, cx1, cx2]
