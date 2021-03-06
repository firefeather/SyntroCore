# This file is part of Syntro
#
# Copyright (c) 2012 Pansenti, LLC. All rights reserved.
#

TEMPLATE = app
TARGET = SyntroControl

win32* {
    DESTDIR = Release
}
else {
    DESTDIR = Output
}

QT += core gui network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += release

# No debug in release builds
unix:QMAKE_CXXFLAGS_RELEASE -= -g

unix {
	macx {
		target.path = /usr/local/bin
	}
	else {
		target.path = /usr/bin
	}

        INCLUDEPATH += ../SyntroLib \
                ../SyntroGUI \
                ../SyntroControlLib

        QMAKE_LIBDIR += ../SyntroLib \
                ../SyntroGUI \
                ../SyntroControlLib

	INSTALLS += target
        LIBS += -lSyntroLib -lSyntroGUI -lSyntroControlLib
}

DEFINES += QT_NETWORK_LIB

INCLUDEPATH += GeneratedFiles \
	GeneratedFiles/release \
	../Common \
        ../SyntroControlLib \
	.

win32-g++:LIBS += -L"$(SYNTRODIR)/bin"

win32-msvc*:LIBS += -L"$(SYNTRODIR)/lib"

win32 {
        DEFINES += _CRT_SECURE_NO_WARNINGS
        INCLUDEPATH += $(SYNTRODIR)/include
        LIBS += -lSyntroLib -lSyntroGUI -lSyntroControlLib
}

MOC_DIR += GeneratedFiles/release

OBJECTS_DIR += release

UI_DIR += GeneratedFiles

RCC_DIR += GeneratedFiles

include(SyntroControl.pri)

