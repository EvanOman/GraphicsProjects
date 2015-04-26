set_property(GLOBAL PROPERTY CXX_STANDARD 11)
set_property(GLOBAL PROPERTY CXX_STANDARD_REQUIRED ON)

set (SOURCEFILES
    CircleInclude.cpp
    Framebuffer.cpp
    Inreader.cpp
    Mesh.cpp
    OBJLoader.cpp
    Texture.cpp
    Shader.cpp
    StringUtil.cpp
    TorusInclude.cpp
	hw3.cpp
)

set (HEADERFILES
    CircleInclude.h
    Framebuffer.h
    Inreader.h
    Mesh.h
    OBJLoader.h
    Shader.h
    ShaderCode.h
    StringUtil.h
    TorusInclude.h
    Texture.h
	glinclude.h
	util.h
)

source_group("Header Files" FILES ${HEADERFILES})

set(CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS} --std=c++11)

add_subdirectory(glfw-3.1)

include_directories(glfw-3.1/include)
include_directories(glm)
include_directories(.)

add_executable(hw3 ${HEADERFILES} ${SOURCEFILES})

target_link_libraries(hw3 glfw ${GLFW_LIBRARIES})
