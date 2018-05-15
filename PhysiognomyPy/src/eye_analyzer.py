import cv2
import numpy
import math
import common

#Save the feature of hexagonal
class PolygonFeature:
    #initialization
    def __init__(self, name, lines, distances, aspectRatio, box, boxLines, angles1, angles2):
        self.name = name
        self.lines = lines
        self.distances = distances
        self.aspectRatio = aspectRatio
        self.box = box
        self.boxLines = boxLines
        self.angles1 = angles1
        self.angles2 = angles2
        self.allFeatures1 = lines + distances
        self.allFeatures2 = aspectRatio + angles1 + angles2

#Capture feature of hexagonal
def getPolygonFeature(name, points):
    lineNum = len(points)
#     print(lineNum)
    lines = []
    distances = []
    aspectRatio = []
    boxLines = []
    angles1 = []
    angles2 = []
    # Calculate the length of side
    index = 0
    while index < lineNum:
        if index + 1 < lineNum:
            lines.append(common.calculateDistance(points[index][0], points[index][1], points[index + 1][0], points[index + 1][1]))
        else:
            lines.append(common.calculateDistance(points[index][0], points[index][1], points[index + 1 - lineNum][0], points[index + 1 - lineNum][1]))
        index += 1
#     print(lines)
    
    # Get the minimum circle that covers the hexagonal
    (x, y), radius = cv2.minEnclosingCircle(points)
    # Calculate the distance from the center of the circle to the vertices of the hexagonal
    for point in points:
        distance = common.calculateDistance(point[0], point[1], x, y)
        distances.append(distance)
#     print(distances)

    # Get the minimum rectangle that covers the hexagonal
    rect = cv2.minAreaRect(points)
    box = cv2.boxPoints(rect)
    box = numpy.int0(box)
    boxLine1 = common.calculateDistance(box[0][0], box[0][1], box[1][0], box[1][1])
    boxLine2 = common.calculateDistance(box[1][0], box[1][1], box[2][0], box[2][1])
    
    boxLines.append(min(boxLine1, boxLine2))
    boxLines.append(max(boxLine1, boxLine2))
    # Calculate the aspect ration
    aspectRatio.append(boxLines[0] / boxLines[1])
   
#     print(aspectRatio)
    
    # Calculate internal angle radian 
    # Split the hexagonal into multiple triangles and calculate the length of the triangle's hypotenuse
    index = 0
    hypotenuses = []
    while index < lineNum:
        if index + 2 < lineNum:
            hypotenuses.append(common.calculateDistance(points[index][0], points[index][1], points[index + 2][0], points[index + 2][1]))
        else:
            hypotenuses.append(common.calculateDistance(points[index][0], points[index][1], points[index + 2 - lineNum][0], points[index + 2 - lineNum][1]))
        index += 1
#     print(hypotenuses)
    # Calculate the internal angle radian according to the inverse cosine law
    index = 0
    while index < lineNum:
        if index + 1 < lineNum:
            lineA = lines[index]
            lineB = lines[index + 1]
            lineC = hypotenuses[index]
        else:
            lineA = lines[index]
            lineB = lines[index + 1 - lineNum]
            lineC = hypotenuses[index - lineNum]
        angles1.append(math.acos((numpy.square(lineA) + numpy.square(lineB) - numpy.square(lineC)) / (2 * lineA * lineB)))
        index += 1
        
    # Calculate the arc angle between the minimum circle and the vertices of the hexagonal
    # Calculate the internal angle radian
    index = 0
    while index < lineNum:
        if index + 1 < lineNum:
            lineA = distances[index]
            lineB = distances[index + 1]
            lineC = lines[index]
        else:
            lineA = distances[index]
            lineB = distances[index + 1 - lineNum]
            lineC = lines[index - lineNum]
        angles2.append(math.acos((numpy.square(lineA) + numpy.square(lineB) - numpy.square(lineC)) / (2 * lineA * lineB)))
        index += 1
#     print(angles)
    return PolygonFeature(name, lines , distances, aspectRatio, box, boxLines, angles1, angles2)

# Check similarity 
def checkSimilarity(targets, templets):
    similarities = []
#     maxName = ''
#     maxSimilarityRatio = 0
    for templet in templets:
        for target in targets:
            index1 = 0
            temp = 0
            num1 = len(target.allFeatures1)
            weight = target.boxLines[1] / templet.boxLines[1]
            while index1 < num1:
                temp += target.allFeatures1[index1] / weight / templet.allFeatures1[index1]
                index1 += 1
            
            index2 = 0
            num2 = len(target.allFeatures2)
            while index2 < num2:
                temp += target.allFeatures2[index2] / templet.allFeatures2[index2]
                index2 += 1
        # Set factor X to magnify the difference
        x = 10
        similarityRatio = str((1 - (abs(temp / (num1 + num2) - 1) / len(targets) * x)) * 100)[0:5]
        similarities.append([templet.name, float(similarityRatio)])
         
#         if maxSimilarityRatio < similarityRatio:
#             maxSimilarityRatio = similarityRatio
#             maxName = templet.name
    
    similarities = sorted(similarities, key=lambda s: s[1], reverse=True)
    results = []
    for i in range(0, 5):
        results.append(similarities[i])
#     results = [[maxName, maxSimilarityRatio], similarities]
#     results = [maxName, maxSimilarityRatio]
    return results

#Features of 24 eyes templates 
def analyzeEye(shape, img, real_path):    
    eYan = [83, 51], [126, 36], [161, 40], [198, 69], [152, 88], [122, 86]
    templet1 = getPolygonFeature('eYan', numpy.array(eYan, numpy.int32))
    
    FengYan = [44, 65], [100, 47], [143, 48], [186, 72], [145, 87], [94, 85]
    templet2 = getPolygonFeature('FengYan', numpy.array(FengYan, numpy.int32))
    
    GeYan = [82, 52], [132, 35], [171, 35], [207, 50], [149, 69], [103, 69]
    templet3 = getPolygonFeature('GeYan', numpy.array(GeYan, numpy.int32))
    
    HeYan = [90, 75], [137, 57], [175, 57], [206, 70], [176, 87], [129, 89]
    templet4 = getPolygonFeature('HeYan', numpy.array(HeYan, numpy.int32))
    
    HuYan = [70, 52], [103, 35], [139, 36], [188, 69], [147, 91], [95, 85]
    templet5 = getPolygonFeature('HuYan', numpy.array(HuYan, numpy.int32))
    
    KongQueYan = [75, 59], [134, 46], [167, 47], [197, 68], [156, 90], [110, 86]
    templet6 = getPolygonFeature('KongQueYan', numpy.array(KongQueYan, numpy.int32))
    
    LangYan = [60, 67], [108, 47], [152, 45], [187, 61], [139, 84], [101, 85]
    templet7 = getPolygonFeature('LangYan', numpy.array(LangYan, numpy.int32))
    
    LongYan = [61, 68], [111, 44], [158, 47], [196, 69], [145, 87], [106, 84]
    templet8 = getPolygonFeature('LongYan', numpy.array(LongYan, numpy.int32))
    
    SheYan = [64, 68], [113, 40], [158, 41], [199, 67], [149, 85], [115, 85]
    templet9 = getPolygonFeature('SheYan', numpy.array(SheYan, numpy.int32))
    
    ShiFengYan = [48, 60], [112, 58], [152, 66], [185, 90], [117, 92], [77, 80]
    templet10 = getPolygonFeature('ShiFengYan', numpy.array(ShiFengYan, numpy.int32))
    
    TaoHuaYan = [70, 73], [114, 47], [171, 44], [199, 61], [174, 77], [119, 88]
    templet11 = getPolygonFeature('TaoHuaYan', numpy.array(TaoHuaYan, numpy.int32))
    
    XiaMu = [50, 59], [98, 37], [165, 43], [192, 70], [149, 92], [104, 88]
    templet12 = getPolygonFeature('XiaMu', numpy.array(XiaMu, numpy.int32))
    
    YanYan = [52, 65], [102, 39], [151, 35], [195, 54], [154, 78], [94, 83]
    templet13 = getPolygonFeature('YanYan', numpy.array(YanYan, numpy.int32))
    
    YuanYan = [83, 71], [129, 52], [175, 50], [210, 77], [160, 88], [119, 88]
    templet14 = getPolygonFeature('YuanYan', numpy.array(YuanYan, numpy.int32))
    
    YuanYangYan = [70, 62], [110, 43], [149, 42], [187, 63], [148, 83], [102, 81]
    templet15 = getPolygonFeature('YuanYangYan', numpy.array(YuanYangYan, numpy.int32))
    
    GuiYan = [61, 73], [88, 50], [125, 48], [167, 66], [121, 86], [93, 86]
    templet16 = getPolygonFeature('GuiYan', numpy.array(GuiYan, numpy.int32))
    
    YuYan = [44, 80], [109, 49], [162, 46], [194, 82], [174, 88], [136, 86]
    templet17 = getPolygonFeature('YuYan', numpy.array(YuYan, numpy.int32))
     
    XiongYan = [54, 65], [129, 47], [116, 19], [206, 80], [170, 91], [96, 86]
    templet18 = getPolygonFeature('XiongYan', numpy.array(XiongYan, numpy.int32))
     
    YangYan = [43, 68], [95, 44], [145, 41], [191, 69], [169, 82], [81, 82]
    templet19 = getPolygonFeature('YangYan', numpy.array(YangYan, numpy.int32))
     
    LuanYan = [40, 67], [98, 38], [158, 42], [190, 73], [142, 83], [77, 77]
    templet20 = getPolygonFeature('LuanYan', numpy.array(LuanYan, numpy.int32))
     
    ZhuYan = [54, 73], [104, 38], [146, 40], [180, 78], [146, 92], [88, 92]
    templet21 = getPolygonFeature('ZhuYan', numpy.array(ZhuYan, numpy.int32))
     
    MingFengYan = [60, 64], [112, 49], [166, 50], [207, 69], [177, 81], [83, 79]
    templet22 = getPolygonFeature('MingFengYan', numpy.array(MingFengYan, numpy.int32))
     
    XiangYan = [56, 70], [110, 47], [154, 53], [185, 71], [157, 86], [89, 84]
    templet23 = getPolygonFeature('XiangYan', numpy.array(XiangYan, numpy.int32))
     
    ZuiYan = [57, 67], [117, 37], [161, 39], [204, 69], [176, 82], [98, 79]
    templet24 = getPolygonFeature('ZuiYan', numpy.array(ZuiYan, numpy.int32))
    
    templets = [templet1, templet2, templet3, templet4, templet5, templet6, templet7, templet8, templet9, templet10, templet11, templet12, templet13, templet14, templet15, templet16
                , templet17, templet18, templet19, templet20, templet21, templet22, templet23, templet24
                ]

    leftEye = numpy.array([[shape.part(36).x, shape.part(36).y],
                                        [shape.part(37).x, shape.part(37).y],
                                        [shape.part(38).x, shape.part(38).y],
                                        [shape.part(39).x, shape.part(39).y],
                                        [shape.part(40).x, shape.part(40).y],
                                        [shape.part(41).x, shape.part(41).y]
                                        ], numpy.int32)
    
    rightEye = numpy.array([[shape.part(42).x, shape.part(42).y],
                                        [shape.part(43).x, shape.part(43).y],
                                        [shape.part(44).x, shape.part(44).y],
                                        [shape.part(45).x, shape.part(45).y],
                                        [shape.part(46).x, shape.part(46).y],
                                        [shape.part(47).x, shape.part(47).y]
                                        ], numpy.int32)
    
    reversedRightEye = numpy.array([
        [shape.part(42).x * 2 - shape.part(45).x, shape.part(45).y],
        [shape.part(42).x * 2 - shape.part(44).x, shape.part(44).y],
        [shape.part(42).x * 2 - shape.part(43).x, shape.part(43).y],
        [shape.part(42).x, shape.part(42).y],
        [shape.part(42).x * 2 - shape.part(47).x, shape.part(47).y],
        [shape.part(42).x * 2 - shape.part(46).x, shape.part(46).y]], numpy.int32)
            
    targetsLeft = getPolygonFeature('targetLeft', leftEye)
    targetsRight = getPolygonFeature('rightEye', rightEye)
    targetsReversedRight = getPolygonFeature('reversedRightEye', reversedRightEye)
    targetsAvg = [targetsLeft, targetsReversedRight]
   
    leftEye = checkSimilarity([targetsLeft], templets)
    rightEye = checkSimilarity([targetsReversedRight], templets)
    avgStyle = checkSimilarity(targetsAvg, templets)
    
    #Get the points  of left eye
    points1 = cutLeftEye(real_path, targetsLeft.box, img)
    #Get the points of right eye
    points2 = cutRightEye(real_path, targetsRight.box, img)
    #Overlap of right eye and left eye
    overlap(points1, points2, real_path + "left_eye.jpg", real_path + "right_eye.jpg", real_path + 'avg_eye.jpg')
    
    return [leftEye, rightEye, avgStyle]

#Cut the part of left eye from image
def cutLeftEye(real_path, box, img):
    points = common.cutImg("left_eye.jpg", real_path, box, 16, 9 , 1.5, img)
    return points;

#Cut the part of right eye from image
def cutRightEye(real_path, box, img):
    points = common.cutImg("right_eye.jpg", real_path, box, 16, 9 , 1.5, img)
    return points;

#Merge left eye and right eye
def overlap(points1, points2, img_path1, img_path2, new_img_path):
    cy1 = 0
    # Find the smallest image
    cy2 = min(points1[1] - points1[0], points2[1] - points2[0])
    cx1 = 0
    # Find the smallest image
    cx2 = min(points1[3] - points1[2], points2[3] - points2[2])
    img1 = cv2.imread(img_path1)
    # Overlap right eye
    img2 = cv2.flip(cv2.imread(img_path2), 1)
    # Transparency and weight are inversely proportional
    overlapping = cv2.addWeighted(img1[ cy1:cy2, cx1:cx2], 0.6, img2[ cy1:cy2, cx1:cx2], 0.6, 0)
    # Save the overlap iamge
    cv2.imwrite(new_img_path, overlapping)
