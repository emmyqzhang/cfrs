import cv2
import numpy
import math
import common


# Analyze Lips
def analyzeLip(shape, img, real_path):
    lip = numpy.array([[shape.part(48).x, shape.part(48).y],
                                                [shape.part(50).x, shape.part(50).y],
                                                [shape.part(51).x, shape.part(51).y],
                                                [shape.part(52).x, shape.part(52).y],
                                                [shape.part(54).x, shape.part(54).y],
                                                [shape.part(56).x, shape.part(56).y],
                                                [shape.part(57).x, shape.part(57).y],
                                                [shape.part(58).x, shape.part(58).y]
                                                ], numpy.int32)
    
    # Calculate the thickness of lips
    # Get the minimum rectangle 
    rect = cv2.minAreaRect(lip)
    box = cv2.boxPoints(rect)
    box = numpy.int0(box)
    boxLine1 = common.calculateDistance(box[0][0], box[0][1], box[1][0], box[1][1])
    boxLine2 = common.calculateDistance(box[1][0], box[1][1], box[2][0], box[2][1])
    # Calculate the aspect ration
    aspectRatio = max(boxLine1, boxLine2) / min(boxLine1, boxLine2)
    # Match the type of thickness
    # Threshold value 3 and 2.4 are set based on experience and experimental evidence
    if aspectRatio > 3:
        lipStyle = "thin"
    elif aspectRatio < 2.4:
        lipStyle = "thick"
    else: 
        lipStyle = "normal"
    
    # Judge the angle of lips
    pointA = numpy.array([shape.part(48).x, shape.part(48).y] , numpy.int32)  # coordinates of left corner of the mouth
    pointB = numpy.array([shape.part(54).x, shape.part(54).y], numpy.int32)  # coordinates of righ corner of the mouth
    angle = common.calculateAngle(pointA, pointB) * 180 / math.pi
    # angle > 10: incline
    if angle > 5 and angle < 355:
        lipStyle = "incline"
    
    # Determine the thickness of upperlip and lowerlip
    upperLip = max(common.calculateDistance(shape.part(50).x, shape.part(50).y, shape.part(61).x, shape.part(61).y), common.calculateDistance(shape.part(51).x, shape.part(51).y, shape.part(62).x, shape.part(62).y), common.calculateDistance(shape.part(52).x, shape.part(52).y, shape.part(63).x, shape.part(63).y))
    lowerLip = max(common.calculateDistance(shape.part(58).x, shape.part(58).y, shape.part(67).x, shape.part(67).y), common.calculateDistance(shape.part(57).x, shape.part(57).y, shape.part(66).x, shape.part(66).y), common.calculateDistance(shape.part(56).x, shape.part(56).y, shape.part(65).x, shape.part(65).y))
    # 1:1.3~1.5/1.6
    if upperLip > lowerLip:
        lipStyle = "upperLipThick"
    elif upperLip * 1.76 < lowerLip:  # 10%
        lipStyle = "lowerLipThick"
    
    # Capture mouth image
    cutLip(real_path, box, img)
    
    return lipStyle


# Capture mouth image
def cutLip(real_path, box, img):
    points = common.cutImg("lip.jpg", real_path, box, 21, 9 , 1.5, img)
    return points
