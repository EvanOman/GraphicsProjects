set_property(GLOBAL PROPERTY CXX_STANDARD 11)
set_property(GLOBAL PROPERTY CXX_STANDARD_REQUIRED ON)

set (SOURCEFILES
	hw2.cpp
	MeshBuilder.cpp
    Mesh.cpp
)

set (HEADERFILES
	MeshBuilder.h
    Mesh.h
    glinclude.h
    util.h
)

source_group("Header Files" FILES ${HEADERFILES})

set(CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS} --std=c++11)

add_subdirectory(glfw-3.1)

include_directories(glfw-3.1/include)
include_directories(glm)
include_directories(.)

add_executable(hw2 ${HEADERFILES} ${SOURCEFILES})

target_link_libraries(hw2 glfw ${GLFW_LIBRARIES})
