#ifndef UTIL_H
#define UTIL_H

#include <vector>
#include <iostream>

// Generic function that calculates the size in bytes of a C++ vector
template <typename T>
size_t vectorByteSize(std::vector<T> v) {
    return v.size() * sizeof(T);
}

// This line creates the "assertGLOk()" macro which will check to see if
// there is an OpenGL error set.  If so, it outputs the file and line where
// this error was encountered, the OpenGL error number, and aborts the program
#define assertGLOk() do{GLenum err = glGetError(); if (err != GL_NO_ERROR){std::cerr<<"OpenGL Error: "<<__FILE__<<":"<<__LINE__<<" "<<err<<std::endl;abort();}}while(0)

// This line creates an assert macro that allows you to assert a condition and
// provide a human-readable message if the condition is not met
#define assertMsg(cond,msg) do{if (!(cond)){std::cerr<<__FILE__<<":"<<__LINE__<<" "<<msg<<std::endl;abort();}}while(0)

#endif