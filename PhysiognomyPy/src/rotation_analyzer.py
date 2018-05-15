import cv2
import numpy
import math
import common


def rotateImage(shape, img, real_path) :
    pointA = numpy.array([shape.part(39).x, shape.part(39).y] , numpy.int32)  # Coordinates of left eyesCornerHeight
    pointB = numpy.array([shape.part(42).x, shape.part(42).y], numpy.int32)  # Coordinates of right eyesCornerHeight
    angle = common.calculateAngle(pointA, pointB)
            
    height, width = img.shape[:2]
    degree = (0 - angle * 180 / math.pi)
    # the size after rotation
    heightNew = int(width * math.fabs(math.sin(math.radians(degree))) + height * math.fabs(math.cos(math.radians(degree))))
    widthNew = int(height * math.fabs(math.sin(math.radians(degree))) + width * math.fabs(math.cos(math.radians(degree))))
    
    matRotation = cv2.getRotationMatrix2D((width / 2, height / 2), degree, 1)
    
    matRotation[0, 2] += (widthNew - width) / 2  
    matRotation[1, 2] += (heightNew - height) / 2  
    
    imgRotation = cv2.warpAffine(img, matRotation, (widthNew, heightNew), borderValue=(255, 255, 255))
    
    cv2.imwrite(real_path+"rotate.jpg", imgRotation)
    
    return imgRotation
