#include "XlFontManager.hxx"
/* Generated by GIWS (version 2.0.2) with command:
giws --disable-return-size-array --output-dir src/jni/ --throws-exception-on-error --description-file src/jni/XlFontManager.giws.xml
*/
/*

This is generated code.

This software is a computer program whose purpose is to hide the complexity
of accessing Java objects/methods from C++ code.

Copyright (C) 2012 - 2016 - Scilab Enterprises

This file is hereby licensed under the terms of the GNU GPL v2.0,
pursuant to article 5.3.4 of the CeCILL v.2.1.
This file was originally licensed under the terms of the CeCILL v2.1,
and continues to be available under such terms.
For more information, see the COPYING file which you should have received
along with this program.
*/

namespace org_scilab_modules_renderer_utils_textRendering {

                // Static declarations (if any)
                
// Returns the current env

JNIEnv * XlFontManager::getCurrentEnv() {
JNIEnv * curEnv = NULL;
jint res=this->jvm->AttachCurrentThread(reinterpret_cast<void **>(&curEnv), NULL);
if (res != JNI_OK) {
throw GiwsException::JniException(getCurrentEnv());
}
return curEnv;
}
// Destructor

XlFontManager::~XlFontManager() {
JNIEnv * curEnv = NULL;
this->jvm->AttachCurrentThread(reinterpret_cast<void **>(&curEnv), NULL);
curEnv->DeleteGlobalRef(this->instance);
curEnv->DeleteGlobalRef(this->instanceClass);
}
// Constructors
XlFontManager::XlFontManager(JavaVM * jvm_) {
jmethodID constructObject = NULL ;
jobject localInstance ;
jclass localClass ;

const std::string construct="<init>";
const std::string param="()V";
jvm=jvm_;

JNIEnv * curEnv = getCurrentEnv();

localClass = curEnv->FindClass( this->className().c_str() ) ;
if (localClass == NULL) {
  throw GiwsException::JniClassNotFoundException(curEnv, this->className());
}

this->instanceClass = static_cast<jclass>(curEnv->NewGlobalRef(localClass));

/* localClass is not needed anymore */
curEnv->DeleteLocalRef(localClass);

if (this->instanceClass == NULL) {
throw GiwsException::JniObjectCreationException(curEnv, this->className());
}


constructObject = curEnv->GetMethodID( this->instanceClass, construct.c_str() , param.c_str() ) ;
if(constructObject == NULL){
throw GiwsException::JniObjectCreationException(curEnv, this->className());
}

localInstance = curEnv->NewObject( this->instanceClass, constructObject ) ;
if(localInstance == NULL){
throw GiwsException::JniObjectCreationException(curEnv, this->className());
}
 
this->instance = curEnv->NewGlobalRef(localInstance) ;
if(this->instance == NULL){
throw GiwsException::JniObjectCreationException(curEnv, this->className());
}
/* localInstance not needed anymore */
curEnv->DeleteLocalRef(localInstance);

                /* Methods ID set to NULL */
jobjectArray_getInstalledFontsNameID=NULL;
jintgetSizeInstalledFontsNameID=NULL;
jintgetSizeAvailableFontsNameID=NULL;
jobjectArray_getAvailableFontsNameID=NULL;
jbooleanisAvailableFontNamejstringjava_lang_StringID=NULL;
jintaddFontjstringjava_lang_StringID=NULL;
jintchangeFontjintintjstringjava_lang_StringID=NULL;
jintchangeFontWithPropertyjintintjstringjava_lang_StringjbooleanbooleanjbooleanbooleanID=NULL;
voidresetXlFontManagerID=NULL;
jintaddFontFromFilenamejstringjava_lang_StringID=NULL;
jintchangeFontFromFilenamejintintjstringjava_lang_StringID=NULL;


}

XlFontManager::XlFontManager(JavaVM * jvm_, jobject JObj) {
        jvm=jvm_;

        JNIEnv * curEnv = getCurrentEnv();

jclass localClass = curEnv->GetObjectClass(JObj);
        this->instanceClass = static_cast<jclass>(curEnv->NewGlobalRef(localClass));
        curEnv->DeleteLocalRef(localClass);

        if (this->instanceClass == NULL) {
throw GiwsException::JniObjectCreationException(curEnv, this->className());
        }

        this->instance = curEnv->NewGlobalRef(JObj) ;
        if(this->instance == NULL){
throw GiwsException::JniObjectCreationException(curEnv, this->className());
        }
        /* Methods ID set to NULL */
        jobjectArray_getInstalledFontsNameID=NULL;
jintgetSizeInstalledFontsNameID=NULL;
jintgetSizeAvailableFontsNameID=NULL;
jobjectArray_getAvailableFontsNameID=NULL;
jbooleanisAvailableFontNamejstringjava_lang_StringID=NULL;
jintaddFontjstringjava_lang_StringID=NULL;
jintchangeFontjintintjstringjava_lang_StringID=NULL;
jintchangeFontWithPropertyjintintjstringjava_lang_StringjbooleanbooleanjbooleanbooleanID=NULL;
voidresetXlFontManagerID=NULL;
jintaddFontFromFilenamejstringjava_lang_StringID=NULL;
jintchangeFontFromFilenamejintintjstringjava_lang_StringID=NULL;


}

// Generic methods

void XlFontManager::synchronize() {
if (getCurrentEnv()->MonitorEnter(instance) != JNI_OK) {
throw GiwsException::JniMonitorException(getCurrentEnv(), "XlFontManager");
}
}

void XlFontManager::endSynchronize() {
if ( getCurrentEnv()->MonitorExit(instance) != JNI_OK) {
throw GiwsException::JniMonitorException(getCurrentEnv(), "XlFontManager");
}
}
// Method(s)

char** XlFontManager::getInstalledFontsName (){

JNIEnv * curEnv = getCurrentEnv();

if (jobjectArray_getInstalledFontsNameID==NULL) { /* Use the cache */
 jobjectArray_getInstalledFontsNameID = curEnv->GetMethodID(this->instanceClass, "getInstalledFontsName", "()[Ljava/lang/String;" ) ;
if (jobjectArray_getInstalledFontsNameID == NULL) {
throw GiwsException::JniMethodNotFoundException(curEnv, "getInstalledFontsName");
}
}
                        jobjectArray res =  static_cast<jobjectArray>( curEnv->CallObjectMethod( this->instance, jobjectArray_getInstalledFontsNameID ));
                        if (curEnv->ExceptionCheck()) {
throw GiwsException::JniCallMethodException(curEnv);
}if (res != NULL) { int lenRow;
 lenRow = curEnv->GetArrayLength(res);

char **arrayOfString;
arrayOfString = new char *[lenRow];
for (jsize i = 0; i < lenRow; i++){
jstring resString = reinterpret_cast<jstring>(curEnv->GetObjectArrayElement(res, i));
const char *tempString = curEnv->GetStringUTFChars(resString, 0);
arrayOfString[i] = new char[strlen(tempString) + 1];

strcpy(arrayOfString[i], tempString);
curEnv->ReleaseStringUTFChars(resString, tempString);
curEnv->DeleteLocalRef(resString);
}

curEnv->DeleteLocalRef(res);
return arrayOfString;
 } else { 
curEnv->DeleteLocalRef(res);
return NULL;
}
}

int XlFontManager::getSizeInstalledFontsName (){

JNIEnv * curEnv = getCurrentEnv();

if (jintgetSizeInstalledFontsNameID==NULL) { /* Use the cache */
 jintgetSizeInstalledFontsNameID = curEnv->GetMethodID(this->instanceClass, "getSizeInstalledFontsName", "()I" ) ;
if (jintgetSizeInstalledFontsNameID == NULL) {
throw GiwsException::JniMethodNotFoundException(curEnv, "getSizeInstalledFontsName");
}
}
                        jint res =  static_cast<jint>( curEnv->CallIntMethod( this->instance, jintgetSizeInstalledFontsNameID ));
                        
return res;

}

int XlFontManager::getSizeAvailableFontsName (){

JNIEnv * curEnv = getCurrentEnv();

if (jintgetSizeAvailableFontsNameID==NULL) { /* Use the cache */
 jintgetSizeAvailableFontsNameID = curEnv->GetMethodID(this->instanceClass, "getSizeAvailableFontsName", "()I" ) ;
if (jintgetSizeAvailableFontsNameID == NULL) {
throw GiwsException::JniMethodNotFoundException(curEnv, "getSizeAvailableFontsName");
}
}
                        jint res =  static_cast<jint>( curEnv->CallIntMethod( this->instance, jintgetSizeAvailableFontsNameID ));
                        
return res;

}

char** XlFontManager::getAvailableFontsName (){

JNIEnv * curEnv = getCurrentEnv();

if (jobjectArray_getAvailableFontsNameID==NULL) { /* Use the cache */
 jobjectArray_getAvailableFontsNameID = curEnv->GetMethodID(this->instanceClass, "getAvailableFontsName", "()[Ljava/lang/String;" ) ;
if (jobjectArray_getAvailableFontsNameID == NULL) {
throw GiwsException::JniMethodNotFoundException(curEnv, "getAvailableFontsName");
}
}
                        jobjectArray res =  static_cast<jobjectArray>( curEnv->CallObjectMethod( this->instance, jobjectArray_getAvailableFontsNameID ));
                        if (curEnv->ExceptionCheck()) {
throw GiwsException::JniCallMethodException(curEnv);
}if (res != NULL) { int lenRow;
 lenRow = curEnv->GetArrayLength(res);

char **arrayOfString;
arrayOfString = new char *[lenRow];
for (jsize i = 0; i < lenRow; i++){
jstring resString = reinterpret_cast<jstring>(curEnv->GetObjectArrayElement(res, i));
const char *tempString = curEnv->GetStringUTFChars(resString, 0);
arrayOfString[i] = new char[strlen(tempString) + 1];

strcpy(arrayOfString[i], tempString);
curEnv->ReleaseStringUTFChars(resString, tempString);
curEnv->DeleteLocalRef(resString);
}

curEnv->DeleteLocalRef(res);
return arrayOfString;
 } else { 
curEnv->DeleteLocalRef(res);
return NULL;
}
}

bool XlFontManager::isAvailableFontName (char const* fontname){

JNIEnv * curEnv = getCurrentEnv();

if (jbooleanisAvailableFontNamejstringjava_lang_StringID==NULL) { /* Use the cache */
 jbooleanisAvailableFontNamejstringjava_lang_StringID = curEnv->GetMethodID(this->instanceClass, "isAvailableFontName", "(Ljava/lang/String;)Z" ) ;
if (jbooleanisAvailableFontNamejstringjava_lang_StringID == NULL) {
throw GiwsException::JniMethodNotFoundException(curEnv, "isAvailableFontName");
}
}
jstring fontname_ = curEnv->NewStringUTF( fontname );
if (fontname != NULL && fontname_ == NULL)
{
throw GiwsException::JniBadAllocException(curEnv);
}


                        jboolean res =  static_cast<jboolean>( curEnv->CallBooleanMethod( this->instance, jbooleanisAvailableFontNamejstringjava_lang_StringID ,fontname_));
                        curEnv->DeleteLocalRef(fontname_);

return (res == JNI_TRUE);

}

int XlFontManager::addFont (char const* fontName){

JNIEnv * curEnv = getCurrentEnv();

if (jintaddFontjstringjava_lang_StringID==NULL) { /* Use the cache */
 jintaddFontjstringjava_lang_StringID = curEnv->GetMethodID(this->instanceClass, "addFont", "(Ljava/lang/String;)I" ) ;
if (jintaddFontjstringjava_lang_StringID == NULL) {
throw GiwsException::JniMethodNotFoundException(curEnv, "addFont");
}
}
jstring fontName_ = curEnv->NewStringUTF( fontName );
if (fontName != NULL && fontName_ == NULL)
{
throw GiwsException::JniBadAllocException(curEnv);
}


                        jint res =  static_cast<jint>( curEnv->CallIntMethod( this->instance, jintaddFontjstringjava_lang_StringID ,fontName_));
                        curEnv->DeleteLocalRef(fontName_);

return res;

}

int XlFontManager::changeFont (int index, char const* fontName){

JNIEnv * curEnv = getCurrentEnv();

if (jintchangeFontjintintjstringjava_lang_StringID==NULL) { /* Use the cache */
 jintchangeFontjintintjstringjava_lang_StringID = curEnv->GetMethodID(this->instanceClass, "changeFont", "(ILjava/lang/String;)I" ) ;
if (jintchangeFontjintintjstringjava_lang_StringID == NULL) {
throw GiwsException::JniMethodNotFoundException(curEnv, "changeFont");
}
}
jstring fontName_ = curEnv->NewStringUTF( fontName );
if (fontName != NULL && fontName_ == NULL)
{
throw GiwsException::JniBadAllocException(curEnv);
}


                        jint res =  static_cast<jint>( curEnv->CallIntMethod( this->instance, jintchangeFontjintintjstringjava_lang_StringID ,index, fontName_));
                        curEnv->DeleteLocalRef(fontName_);

return res;

}

int XlFontManager::changeFontWithProperty (int index, char const* fontName, bool isBold, bool isItalic){

JNIEnv * curEnv = getCurrentEnv();

if (jintchangeFontWithPropertyjintintjstringjava_lang_StringjbooleanbooleanjbooleanbooleanID==NULL) { /* Use the cache */
 jintchangeFontWithPropertyjintintjstringjava_lang_StringjbooleanbooleanjbooleanbooleanID = curEnv->GetMethodID(this->instanceClass, "changeFontWithProperty", "(ILjava/lang/String;ZZ)I" ) ;
if (jintchangeFontWithPropertyjintintjstringjava_lang_StringjbooleanbooleanjbooleanbooleanID == NULL) {
throw GiwsException::JniMethodNotFoundException(curEnv, "changeFontWithProperty");
}
}
jstring fontName_ = curEnv->NewStringUTF( fontName );
if (fontName != NULL && fontName_ == NULL)
{
throw GiwsException::JniBadAllocException(curEnv);
}


jboolean isBold_ = (static_cast<bool>(isBold) ? JNI_TRUE : JNI_FALSE);

jboolean isItalic_ = (static_cast<bool>(isItalic) ? JNI_TRUE : JNI_FALSE);

                        jint res =  static_cast<jint>( curEnv->CallIntMethod( this->instance, jintchangeFontWithPropertyjintintjstringjava_lang_StringjbooleanbooleanjbooleanbooleanID ,index, fontName_, isBold_, isItalic_));
                        curEnv->DeleteLocalRef(fontName_);

return res;

}

void XlFontManager::resetXlFontManager (){

JNIEnv * curEnv = getCurrentEnv();

if (voidresetXlFontManagerID==NULL) { /* Use the cache */
 voidresetXlFontManagerID = curEnv->GetMethodID(this->instanceClass, "resetXlFontManager", "()V" ) ;
if (voidresetXlFontManagerID == NULL) {
throw GiwsException::JniMethodNotFoundException(curEnv, "resetXlFontManager");
}
}
                         curEnv->CallVoidMethod( this->instance, voidresetXlFontManagerID );
                        
}

int XlFontManager::addFontFromFilename (char const* FontFilename){

JNIEnv * curEnv = getCurrentEnv();

if (jintaddFontFromFilenamejstringjava_lang_StringID==NULL) { /* Use the cache */
 jintaddFontFromFilenamejstringjava_lang_StringID = curEnv->GetMethodID(this->instanceClass, "addFontFromFilename", "(Ljava/lang/String;)I" ) ;
if (jintaddFontFromFilenamejstringjava_lang_StringID == NULL) {
throw GiwsException::JniMethodNotFoundException(curEnv, "addFontFromFilename");
}
}
jstring FontFilename_ = curEnv->NewStringUTF( FontFilename );
if (FontFilename != NULL && FontFilename_ == NULL)
{
throw GiwsException::JniBadAllocException(curEnv);
}


                        jint res =  static_cast<jint>( curEnv->CallIntMethod( this->instance, jintaddFontFromFilenamejstringjava_lang_StringID ,FontFilename_));
                        curEnv->DeleteLocalRef(FontFilename_);

return res;

}

int XlFontManager::changeFontFromFilename (int index, char const* FontFilename){

JNIEnv * curEnv = getCurrentEnv();

if (jintchangeFontFromFilenamejintintjstringjava_lang_StringID==NULL) { /* Use the cache */
 jintchangeFontFromFilenamejintintjstringjava_lang_StringID = curEnv->GetMethodID(this->instanceClass, "changeFontFromFilename", "(ILjava/lang/String;)I" ) ;
if (jintchangeFontFromFilenamejintintjstringjava_lang_StringID == NULL) {
throw GiwsException::JniMethodNotFoundException(curEnv, "changeFontFromFilename");
}
}
jstring FontFilename_ = curEnv->NewStringUTF( FontFilename );
if (FontFilename != NULL && FontFilename_ == NULL)
{
throw GiwsException::JniBadAllocException(curEnv);
}


                        jint res =  static_cast<jint>( curEnv->CallIntMethod( this->instance, jintchangeFontFromFilenamejintintjstringjava_lang_StringID ,index, FontFilename_));
                        curEnv->DeleteLocalRef(FontFilename_);

return res;

}

}
