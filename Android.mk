LOCAL_PATH:= $(call my-dir)

svc_c_flags =	\
	-Wall -Wextra
ifneq ($(TARGET_USES_64_BIT_BINDER),true)
ifneq ($(TARGET_IS_64_BIT),true)
svc_c_flags += -DBINDER_IPC_32BIT=1
endif
endif

#include $(CLEAR_VARS)
#LOCAL_SHARED_LIBRARIES := liblog
#LOCAL_SRC_FILES := bctest.c binder.c
#LOCAL_CFLAGS += $(svc_c_flags)
#LOCAL_MODULE := bctest
#LOCAL_MODULE_TAGS := optional
#include $(BUILD_EXECUTABLE)

#include $(CLEAR_VARS)
#LOCAL_SHARED_LIBRARIES := liblog libselinux
#LOCAL_SRC_FILES := service_manager.c binder.c
#LOCAL_CFLAGS += $(svc_c_flags)
#LOCAL_MODULE := service_manager
#LOCAL_MODULE_TAGS := optional
#include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
#LOCAL_SHARED_LIBRARIES := liblog libselinux
LOCAL_SRC_FILES := test_client.c binder.c
#LOCAL_CFLAGS += $(svc_c_flags)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_MODULE := test_client
LOCAL_MODULE_TAGS := optional
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
#LOCAL_SHARED_LIBRARIES := liblog libselinux
LOCAL_SRC_FILES := test_server.c binder.c
#LOCAL_CFLAGS += $(svc_c_flags)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_MODULE := test_server
LOCAL_MODULE_TAGS := optional
include $(BUILD_EXECUTABLE)
