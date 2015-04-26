set_property(GLOBAL PROPERTY CXX_STANDARD 11)
set_property(GLOBAL PROPERTY CXX_STANDARD_REQUIRED ON)

set (SOURCEFILES
	opengl-test.cpp
)

set (HEADERFILES
)

source_group("Header Files" FILES ${HEADERFILES})

set(CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS} --std=c++11)

add_subdirectory(glfw-3.1)

include_directories(glfw-3.1/include)
include_directories(.)

add_executable(opengl-test ${HEADERFILES} ${SOURCEFILES})

target_link_libraries(opengl-test glfw ${GLFW_LIBRARIES})
