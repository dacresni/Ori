cmake_minimum_required(VERSION 3.16)

project(Ori VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
find_package(Qt6 6.2 COMPONENTS Quick Gui REQUIRED )
# qt_standard_project_setup()

qt_add_executable(Ori
    main.cpp
)

qt_add_qml_module(Ori
    URI hello
    VERSION 1.0
    QML_FILES
        main.qml
)
target_link_libraries(Ori PRIVATE Qt6::Gui Qt6::Quick)
