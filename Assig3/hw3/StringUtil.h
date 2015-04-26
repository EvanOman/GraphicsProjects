#pragma once

#include <string>
#include <vector>
#include <sstream>

class StringUtil {
public:
    // Removes all characters in 'toErase' from 'input'
    static std::string chomp(const std::string& input, std::string toErase=" \t\n");
    
    // Converts a string in the form ....delim....delim...delim.. into a vector
    // of elements, with delim eliminated.  Leading, trailing, and repeated
    // delimeters are represented by empty strings.
    static std::vector<std::string> split(const std::string &input, const std::string& delim);
    
    static std::string join(const std::vector<std::string>& input, const std::string& delim);
    
    // replace, in input, all occurences of target with replaceWith
    static std::string replace(std::string input, const std::string &target, const std::string& replaceWith);
    
    // Removes comments, where comments start with commentLeader and continue
    // to end of line.
    static std::string removeComments(std::string input, std::string commentLeader="//");
    
    // convert a string to a double.  Boolean is true if conversion was
    // successful, false otherwise
    static std::pair<double, bool> toDouble(const std::string& input);
    
    static std::pair<float, bool> toFloat(const std::string& input);
    
    // convert a string to an integer.  Boolean is true if conversion was
    // successful, false otherwise
    static std::pair<int, bool> toInt(const std::string& input);
    
    // convert a string to a boolean.  Second boolean is true if conversion was
    // successful, false otherwise
    static std::pair<bool,bool> toBool(const std::string& input);
    
    template <typename T> static std::string toString(T t) {
        std::ostringstream oss;
        oss << t;
        return oss.str();
    }
};