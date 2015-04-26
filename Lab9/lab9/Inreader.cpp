#include "Inreader.h"
#include "util.h"

Inreader::Inreader(std::string filename):
ifs(filename) {
    assertMsg(ifs, "Error loading file");
}

std::string Inreader::getString() {
    toNextToken();
    std::string ans;
    ifs >> ans;
    assertMsg(ifs, "Error reading string");
    return ans;
}

int Inreader::getInt() {
    toNextToken();
    int ans;
    ifs >> ans;
    assertMsg(ifs, "Error reading int");
    return ans;
}

float Inreader::getFloat() {
    toNextToken();
    float ans;
    ifs >> ans;
    assertMsg(ans, "Error reading float");
    return ans;
}

std::string Inreader::getLine() {
    toNextToken();
    std::string str;
    std::getline(ifs, str, '\n');
    return str;
}

bool Inreader::expect(char c) {
    if (ifs.peek() == c) {
        ifs.get();
        return true;
    }
    return false;
}

bool Inreader::atEof() {
    toNextToken();
    return ifs.eof();
}

void Inreader::toNextToken() {
    bool progress = false;
    do {
        progress = false;
        if (ifs.peek() == '#') {
            std::string garbage;
            std::getline(ifs, garbage, '\n');
            progress = true;
        }
        if (ifs.peek() == ' ') {
            ifs.get();
            progress = true;
        }
        if (ifs.peek() == '\t') {
            ifs.get();
            progress = true;
        }
        if (ifs.peek() == '\n') {
            ifs.get();
            progress = true;
        }
        assertMsg(ifs || ifs.eof(), "Error advancing to next token");
    } while (progress == true);
}