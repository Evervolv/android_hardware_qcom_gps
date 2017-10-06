ifeq ($(call my-dir),$(call project-path-for,qcom-gps))

# TODO:  Find a better way to separate build configs for ADP vs non-ADP devices
ifneq ($(BOARD_IS_AUTOMOTIVE),true)
  ifneq ($(BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE),)
  LOCAL_PATH := $(call my-dir)

    ifeq ($(BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET),true)

      ifneq ($(filter msm8960 apq8064 ,$(TARGET_BOARD_PLATFORM)),)
        #For msm8960/apq8064 targets
        include $(call all-named-subdir-makefiles,msm8960)
      else ifneq ($(filter msm8974 ,$(TARGET_BOARD_PLATFORM)),)
        #For msm8974 target
        include $(call all-named-subdir-makefiles,msm8974)
      else ifneq ($(filter msm8084 ,$(TARGET_BOARD_PLATFORM)),)
        #For msm8084 target
        include $(call all-named-subdir-makefiles,msm8084)
      else ifneq ($(filter msm8992 msm8994 ,$(TARGET_BOARD_PLATFORM)),)
        #For msm8992/msm8994 targets
        include $(call all-named-subdir-makefiles,msm8994)
      else ifneq ($(filter msm8996 ,$(TARGET_BOARD_PLATFORM)),)
        #For msm8996 target
        include $(call all-named-subdir-makefiles,msm8996)
      else ifneq ($(filter msm8998 ,$(TARGET_BOARD_PLATFORM)),)
        #For msm8998 target
        include $(call all-named-subdir-makefiles,msm8998)
      else ifeq ($(filter msm8916,$(TARGET_BOARD_PLATFORM)),)
        #For all other targets
        GPS_DIRS=core utils loc_api platform_lib_abstractions etc
        include $(call all-named-subdir-makefiles,$(GPS_DIRS))
      endif #TARGET_BOARD_PLATFORM

    else
      ifneq ($(filter msm8909 msm8226 ,$(TARGET_BOARD_PLATFORM)),)
        #For msm8909 target
        GPS_DIRS=msm8909/core msm8909/utils msm8909/loc_api msm8909/etc
        include $(call all-named-subdir-makefiles,$(GPS_DIRS))
      else ifeq ($(filter msm8916 ,$(TARGET_BOARD_PLATFORM)),)
        GPS_DIRS=core utils loc_api platform_lib_abstractions etc
        include $(call all-named-subdir-makefiles,$(GPS_DIRS))
      endif
    endif #BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET

  endif #BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE
endif

endif
