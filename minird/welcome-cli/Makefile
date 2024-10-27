TARGET := iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TOOL_NAME = welcome-cli

welcome-cli_FILES = main.cpp
welcome-cli_CFLAGS = -fobjc-arc
welcome-cli_CODESIGN_FLAGS = -Sentitlements.plist
welcome-cli_INSTALL_PATH = /usr/local/bin

include $(THEOS_MAKE_PATH)/tool.mk
