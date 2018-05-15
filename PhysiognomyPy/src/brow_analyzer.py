import cv2
import numpy
import math
import common

#Analyze eyebrows 
def analyzeBrow(shape, img, real_path):
    # Calculate the distance between eyebrows
    browDistance = abs(shape.part(21).x - shape.part(22).x)
    # Calculate the length between eyesLidHeight and eyesCornerHeight
    eyeWidth = (abs(shape.part(36).x - shape.part(39).x) + abs(shape.part(42).x - shape.part(45).x)) / 2
    
    #Match the type
    browRatio = browDistance / eyeWidth
    browData = [["narrow", str(min(browRatio , 0.5) / max(browRatio , 0.5) * 100)[0:5]], ["middle", str(min(browRatio , 1) / max(browRatio , 1) * 100)[0:5]], ["wide", str(min(browRatio , 1.5) / max(browRatio , 1.5) * 100)[0:5]]]
    browData = sorted(browData, key=lambda s: s[1], reverse=True)
    
    points = cutBrow(shape, img, real_path)
    browStyle = [browData, [eyeWidth, browDistance, abs(points[2] - points[3])]]
    
    return browStyle


# Capture the eyebrows part from the uploade face iamge
def cutBrow(shape, img, real_path):
    # Save the feature points to array
    brow = numpy.array([[shape.part(17).x, shape.part(17).y],
                                                [shape.part(18).x, shape.part(18).y],
                                                [shape.part(19).x, shape.part(19).y],
                                                [shape.part(20).x, shape.part(20).y],
                                                [shape.part(21).x, shape.part(21).y],
                                                [shape.part(22).x, shape.part(22).y],
                                                [shape.part(23).x, shape.part(23).y],
                                                [shape.part(24).x, shape.part(24).y],
                                                [shape.part(25).x, shape.part(25).y],
                                                [shape.part(26).x, shape.part(26).y]
                                                ], numpy.int32)
    # Get the minimum rectangle 
    rect = cv2.minAreaRect(brow)
    box = cv2.boxPoints(rect)
    box = numpy.int0(box)
    # Cut eyebrows from iamge
    points = common.cutImg("brow.jpg", real_path, box, 7, 1 , 1.1, img)
    return points
