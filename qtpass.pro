#-------------------------------------------------
#
#   QtPass is a GUI for pass,
#           the standard unix password manager.
#
# Project created by QtCreator 2014-07-30T21:56:15
#
#-------------------------------------------------

VERSION    = 1.0.4
TEMPLATE   = app
QT        += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

macx {
    TARGET = QtPass
    QMAKE_MAC_SDK = macosx
} else {
    TARGET = qtpass
}

SOURCES   += main.cpp\
             mainwindow.cpp \
             configdialog.cpp \
             storemodel.cpp \
             util.cpp \
             usersdialog.cpp \ 
             keygendialog.cpp \
             progressindicator.cpp \
             trayicon.cpp \
    passworddialog.cpp \
    process.cpp \
    settings.cpp

HEADERS   += mainwindow.h \
             configdialog.h \
             storemodel.h \
             util.h \
             usersdialog.h \
             keygendialog.h \
             progressindicator.h \
             trayicon.h \
    passworddialog.h \
    process.h \
    settings.h

FORMS     += mainwindow.ui \
             configdialog.ui \
             usersdialog.ui \ 
             keygendialog.ui \
    passworddialog.ui

QMAKE_CXXFLAGS_WARN_ON += -Wno-unknown-pragmas

nosingleapp {
    QMAKE_CXXFLAGS += -DSINGLE_APP=0
} else {
    SOURCES += singleapplication.cpp
    HEADERS += singleapplication.h
    QT      += network
    QMAKE_CXXFLAGS += -DSINGLE_APP=1
}

TRANSLATIONS    +=  localization/localization_nl_NL.ts \
                    localization/localization_de_DE.ts \
                    localization/localization_es_ES.ts \
                    localization/localization_gl_ES.ts \
                    localization/localization_hu_HU.ts \
                    localization/localization_sv_SE.ts \
                    localization/localization_pl_PL.ts \
                    localization/localization_ru_RU.ts \
                    localization/localization_he_IL.ts \
                    localization/localization_zh_CN.ts \
                    localization/localization_ar_MA.ts

CODECFORSRC     = UTF-8
CODECFORTR      = UTF-8


RESOURCES   += resources.qrc

win32 {
    RC_FILE = windows.rc
    static {
        QMAKE_LFLAGS += -static-libgcc -static-libstdc++
    }
    QMAKE_LFLAGS += -Wl,--dynamicbase -Wl,--nxcompat
    LIBS    += -lmpr
} else:macx {
    ICON = artwork/icon.icns
    QMAKE_INFO_PLIST = Info.plist
} else:bsd {
    LIBS += -L/usr/local/lib
}
OTHER_FILES += LICENSE \
               README.md

isEmpty(PREFIX) {
 PREFIX = $$(PREFIX)
}

isEmpty(PREFIX) {
 PREFIX = /usr/local/bin
}
target.path = $$PREFIX/

INSTALLS    += target

DEFINES += "VERSION=\"\\\"$$VERSION\\\"\""
