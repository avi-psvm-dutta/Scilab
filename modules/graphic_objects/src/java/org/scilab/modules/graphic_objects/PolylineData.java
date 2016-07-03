/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 3.0.7
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package org.scilab.modules.graphic_objects;

public class PolylineData {
  public static Object getDataX(int uid) { return PolylineDataJNI.getDataX(uid); }

  public static Object getDataY(int uid) { return PolylineDataJNI.getDataY(uid); }

  public static Object getDataZ(int uid) { return PolylineDataJNI.getDataZ(uid); }

  public static Object getShiftX(int uid) { return PolylineDataJNI.getShiftX(uid); }

  public static Object getShiftY(int uid) { return PolylineDataJNI.getShiftY(uid); }

  public static Object getShiftZ(int uid) { return PolylineDataJNI.getShiftZ(uid); }

  public static int isZCoordSet(int uid) {
    return PolylineDataJNI.isZCoordSet(uid);
  }

  public static int isXShiftSet(int uid) {
    return PolylineDataJNI.isXShiftSet(uid);
  }

  public static int isYShiftSet(int uid) {
    return PolylineDataJNI.isYShiftSet(uid);
  }

  public static int isZShiftSet(int uid) {
    return PolylineDataJNI.isZShiftSet(uid);
  }

  public static int createPolylineData(int uidFrom, int uidTo) {
    return PolylineDataJNI.createPolylineData(uidFrom, uidTo);
  }

  public static int translatePolyline(int uid, double x, double y, double z, int flagX, int flagY, int flagZ) {
    return PolylineDataJNI.translatePolyline(uid, x, y, z, flagX, flagY, flagZ);
  }

  public static int translatePoint(int uid, int index, double x, double y, double z, int flagX, int flagY, int flagZ) {
    return PolylineDataJNI.translatePoint(uid, index, x, y, z, flagX, flagY, flagZ);
  }

  public static int setPointValue(int uid, int index, double x, double y, double z) {
    return PolylineDataJNI.setPointValue(uid, index, x, y, z);
  }

  public static int insertPoint(int uid, int index, double x, double y, double z) {
    return PolylineDataJNI.insertPoint(uid, index, x, y, z);
  }

  public static int removePoint(int uid, int index) {
    return PolylineDataJNI.removePoint(uid, index);
  }

}
