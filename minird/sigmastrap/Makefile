TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

TOOL_NAME = sigmastrap

sigmastrap_FILES = main.cpp logger.cpp
sigmastrap_CFLAGS = -fobjc-arc
sigmastrap_CODESIGN_FLAGS = -Sentitlements.plist
sigmastrap_INSTALL_PATH = /usr/local/bin

include $(THEOS_MAKE_PATH)/tool.mk
