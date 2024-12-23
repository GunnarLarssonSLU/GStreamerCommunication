cmake_minimum_required(VERSION 3.10)
project(QtGstreamerExample LANGUAGES CXX)

# We want Qt to automatically generate moc files for classes using Q_OBJECT.
set(CMAKE_AUTOMOC ON)
# If you have .ui forms or .qrc resources, also set:
# set(CMAKE_AUTOUIC ON)
# set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 1) Find Qt5 (Widgets module for GUI apps)
find_package(Qt5 COMPONENTS Widgets REQUIRED)

# 2) Find GStreamer using pkg-config
find_package(PkgConfig REQUIRED)
pkg_check_modules(GSTREAMER REQUIRED gstreamer-1.0)

# 3) Source files for your project
add_executable(QtGstreamerExample
    main.cpp
    gstreamerworker.cpp
    gstreamerworker.h
)

# 4) Include paths for GStreamer
target_include_directories(QtGstreamerExample PRIVATE
    ${GSTREAMER_INCLUDE_DIRS}
)

# 5) Link against Qt5 Widgets and GStreamer libraries
target_link_libraries(QtGstreamerExample PRIVATE
    Qt5::Widgets
    ${GSTREAMER_LIBRARIES}
)

# Optionally, if you need to link to other GStreamer plugins, do:
# pkg_check_modules(GSTREAMER_PB REQUIRED gstreamer-pbutils-1.0)
# And then add ${GSTREAMER_PB_LIBRARIES} to the link line, etc.

