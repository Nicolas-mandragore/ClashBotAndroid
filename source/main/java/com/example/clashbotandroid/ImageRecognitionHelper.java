package com.example.clashbotandroid;

import android.graphics.Bitmap;
import org.opencv.android.Utils;
import org.opencv.core.Mat;
import org.opencv.core.Core;
import org.opencv.core.Point;
import org.opencv.core.Rect;
import org.opencv.core.Scalar;
import org.opencv.core.MatOfPoint;
import org.opencv.core.MatOfKeyPoint;
import org.opencv.features2d.FeatureDetector;
import org.opencv.features2d.DescriptorMatcher;
import org.opencv.features2d.ORB;
import org.opencv.features2d.Features2d;
import org.opencv.imgproc.Imgproc;

import java.util.List;

public class ImageRecognitionHelper {

    // Example method to convert Bitmap to Mat
    public static Mat bitmapToMat(Bitmap bitmap) {
        Mat mat = new Mat();
        Utils.bitmapToMat(bitmap, mat);
        return mat;
    }

    // TODO: Add methods for template matching, feature detection, etc.
    // This will be used to detect game elements for automation decisions

}
