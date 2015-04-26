#ifndef INREADER_H
#define INREADER_H

#include <string>
#include <fstream>

class Inreader {
public:
    Inreader(std::string filename);
    
    std::string getString();
    
    int getInt();
    
    float getFloat();
    
    std::string getLine();
    
    bool expect(char c);
    
    bool atEof();
    
private:
    void toNextToken();
    
    std::ifstream ifs;
};

#endif