DEFINES += "EVOPEDIA_VERSION=\"\\\"0.4.0\\\"\""
DEFINES += "EVOPEDIA_WEBSITE=\"\\\"http://evopedia.info\\\"\""
DEFINES += "EVOPEDIA_DUMP_SITE=\"\\\"http://dumpathome.evopedia.info/dumps/finished\\\"\""
DEFINES += "EVOPEDIA_BUG_SITE=\"\\\"https://bugs.maemo.org/enter_bug.cgi?product=evopedia\\\"\""
DEFINES += "MAPTILES_LOCATION=\"\\\"/home/user/MyDocs/.maps\\\"\""

QT += core gui network
INCLUDEPATH += src
SOURCES += src/main.cpp \
 src/mainwindow.cpp \
 src/storagebackend.cpp \
 src/title.cpp \
 src/titleiterator.cpp \
 src/titlelistmodel.cpp \
    src/evopedia.cpp \
    src/bzreader.cpp \
    src/evopediawebserver.cpp \
    src/utils.cpp \
    src/map.cpp \
    src/flickable.cpp \
    src/dumpsettings.cpp \
    src/mapwindow.cpp \
    src/flickablemap.cpp
HEADERS += src/mainwindow.h \
 src/storagebackend.h \
 src/title.h \
 src/titlelistmodel.h \
 src/titleiterator.h \
    src/evopedia.h \
    src/bzreader.h \
    src/evopediawebserver.h \
    src/utils.h \
    src/map.h \
    src/geotitle.h \
    src/flickable.h \
    src/dumpsettings.h \
    src/mapwindow.h \
    src/flickablemap.h

TRANSLATIONS += src/tr/evopedia_de.ts src/tr/evopedia_fr.ts

CONFIG += warn_on
unix:LIBS += -lbz2
MOBILITY =
FORMS += src/mainwindow.ui \
    src/dumpSettings.ui \
    src/mapwindow.ui
DEFINES += QT_NO_CAST_TO_ASCII
DEFINES += QT_NO_CAST_FROM_BYTEARRAY

OTHER_FILES += \
    src/evopedia.desktop \
    src/evopedia.js \
    src/header.html \
    src/wikipedia48.png \
    src/wikipedia.png \
    src/transtbl.dat \
    src/random.png \
    src/maparticle.png \
    src/map.png \
    src/main.css \
    src/magnify-clip.png \
    src/footer.html

RESOURCES += \
    src/resources.qrc

unix {
  #VARIABLES
  isEmpty(PREFIX) {
    PREFIX = /usr/local
  }
  BINDIR = $$PREFIX/bin
  DATADIR =$$PREFIX/share

  DEFINES += DATADIR=\\\"$$DATADIR\\\" PKGDATADIR=\\\"$$PKGDATADIR\\\"

  #MAKE INSTALL

  INSTALLS += target desktop iconxpm

  target.path =$$BINDIR

  desktop.path = $$DATADIR/applications/hildon
  desktop.files += $${TARGET}.desktop

  iconxpm.path = $$DATADIR/pixmaps
  iconxpm.files += src/wikipedia48.png
}
