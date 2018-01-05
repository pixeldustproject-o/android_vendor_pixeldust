LOCAL_PATH:= $(call my-dir)

#######################################
# init.pixeldust.rc
#######################################
include $(CLEAR_VARS)
LOCAL_MODULE := init.pixeldust.rc
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional eng
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

#######################################
# init.sehide.rc
#######################################
include $(CLEAR_VARS)
LOCAL_MODULE := init.sehide.rc
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional eng
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)
