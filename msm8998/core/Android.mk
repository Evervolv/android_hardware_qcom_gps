ifneq ($(BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE),)
ifneq ($(BUILD_TINY_ANDROID),true)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libloc_core
LOCAL_LICENSE_KINDS := SPDX-license-identifier-BSD
LOCAL_LICENSE_CONDITIONS := notice
LOCAL_VENDOR_MODULE := true
LOCAL_MODULE_OWNER := qti
LOCAL_MODULE_TAGS := optional

ifeq ($(TARGET_DEVICE),apq8026_lw)
LOCAL_CFLAGS += -DPDK_FEATURE_SET
else ifeq ($(BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET),true)
LOCAL_CFLAGS += -DPDK_FEATURE_SET
endif

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libutils \
    liblog \
    libcutils \
    libgps.utils \
    libdl \
    libloc_pla \
    libprocessgroup

LOCAL_SRC_FILES += \
    LocApiBase.cpp \
    LocAdapterBase.cpp \
    ContextBase.cpp \
    LocDualContext.cpp \
    loc_core_log.cpp \
    SystemStatus.cpp

LOCAL_CFLAGS += \
    -fno-short-enums \
    -D_ANDROID_ \
    -Wall \
    -Werror \
    -Wno-format \
    -Wno-sign-compare \
    -Wno-unneeded-internal-declaration \
    -Wno-unused-const-variable \
    -Wno-unused-parameter \
    -Wno-delete-incomplete \
    -Wno-switch \

LOCAL_CPPFLAGS += \
    -Wno-overloaded-virtual \
    -Wno-reorder \

LOCAL_C_INCLUDES:= \
    $(TARGET_OUT_HEADERS)/gps.utils \
    $(TARGET_OUT_HEADERS)/libloc_pla \
    $(TARGET_OUT_HEADERS)/liblocation_api

LOCAL_COPY_HEADERS_TO:= libloc_core/
LOCAL_COPY_HEADERS:= \
    LocApiBase.h \
    LocAdapterBase.h \
    ContextBase.h \
    LocDualContext.h \
    LBSProxyBase.h \
    UlpProxyBase.h \
    loc_core_log.h \
    LocAdapterProxyBase.h \
    SystemStatus.h

LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)

endif # not BUILD_TINY_ANDROID
endif # BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE
