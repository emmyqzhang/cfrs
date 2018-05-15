import cv2
import dlib
import sys
import os
import numpy
import common
import glob
import rotation_analyzer
import brow_analyzer
import eye_analyzer
import lip_analyzer


def main(real_path, filename):
    base_path = "C:/Emmy/PhysiognomyPy/"
#     base_path = "C:/MyProject/PhysiognomyPy/"
#     base_path = "D:/Dream/PhysiognomyPy/"
    detector = dlib.get_frontal_face_detector()
    landmark_predictor = dlib.shape_predictor(base_path + "resources/cfrs_shape_predictor_face_landmarks.dat")
    
    img_path = real_path + filename
    
    img = cv2.imread(img_path)
    faces = detector(img, 1)
    
    if len(faces) == 1:
        shape = landmark_predictor(img, faces[0])
        
        imgRotated = rotation_analyzer.rotateImage(shape, img, real_path)
        faces = detector(imgRotated, 1)
        shape = landmark_predictor(imgRotated, faces[0])
                
        browStyle = brow_analyzer.analyzeBrow(shape, imgRotated, real_path)
        eyeStyle = eye_analyzer.analyzeEye(shape, imgRotated, real_path)
        lipStyle = lip_analyzer.analyzeLip(shape, imgRotated, real_path)
        
        result = {"filename":os.path.basename(img_path), "browStyle":[browStyle[0][0][0], browStyle[0][0][1], browStyle[1][0], browStyle[1][1], browStyle[1][2]], "leftEye":eyeStyle[0][0], "rightEye":eyeStyle[1][0], "avgEye":eyeStyle[2][0], "lipStyle":lipStyle}
        
        cutFace(real_path, faces[0], imgRotated)

        leftEyeData = eyeStyle[0]
        rightEyeData = eyeStyle[1]
        avgEyeData = eyeStyle[2]
        print("success")
        print(result)
        print(leftEyeData)
        print(rightEyeData)
        print(avgEyeData)
        browData = browStyle[0]
        print(browData)
    elif len(faces) == 0:
        print("no_face")
    elif len(faces) > 1:
        print("more_face")
    else:
        print("fail")

# Get the face part only from the uploaded image
def cutFace(real_path, face, img):
    box = numpy.int0([[face.left(), face.top()], [face.right(), face.top()], [face.right(), face.bottom()], [face.left(), face.bottom()]])
    points = common.cutImg("face.jpg", real_path, box, (face.right() - face.left()), (face.bottom() - face.top()), 1.1, img)
    return points

main(sys.argv[1], sys.argv[2])


# Testing only
#path = "../images/"
#filename = "qi2.jpg"
#for img_path in glob.glob(os.path.join(path, filename)):
    #main("", img_path)
