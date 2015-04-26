#include "StringUtil.h"
#include <sstream>

std::string StringUtil::chomp(const std::string& input, std::string toErase) {
    std::string output;
    bool foundText = false;
    std::string holding;
    for (auto c: input) {
        if (toErase.find(c) == toErase.npos) {
            if (holding.size() != 0) {
                output += holding;
                holding = "";
            }
            output.push_back(c);
            foundText = true;
        } else if (foundText) {
            holding.push_back(c);
        }
    }
    return output;
}

std::vector<std::string> StringUtil::split(const std::string &input, const std::string& delim) {
    std::vector<std::string> answer;
    std::string temp;
    for (auto c: input) {
        temp.push_back(c);
        auto i = temp.find(delim);
        if (i != temp.npos) {
            temp.resize(i);
            answer.push_back(temp);
            temp.clear();
        }
    }
    answer.push_back(temp);
    return answer;
}

std::string StringUtil::join(const std::vector<std::string>& input, const std::string& delim) {
    std::string ans;
    if (input.size() == 0) return ans;
    ans = input[0];
    int idx = 1;
    while (idx < input.size()) {
        ans += delim;
        ans += input[idx];
        idx++;
    }
    return ans;
}


std::string StringUtil::replace(std::string input, const std::string &target, const std::string& replaceWith) {
    auto i = input.find(target);
    if (i != input.npos) {
        input.replace(i, target.size(), replaceWith);
    }
    return input;
}

std::string StringUtil::removeComments(std::string input, std::string commentLeader) {
    auto i = input.find(commentLeader);
    if (i != input.npos) {
        input.resize(i);
    }
    return input;
}

std::pair<double, bool> StringUtil::toDouble(const std::string& input) {
    std::istringstream iss(input);
    double val;
    iss >> val;
    return std::make_pair(val, !iss.bad());
}

std::pair<float, bool> StringUtil::toFloat(const std::string& input) {
    std::istringstream iss(input);
    float val;
    iss >> val;
    return std::make_pair(val, !iss.bad());
}

std::pair<int, bool> StringUtil::toInt(const std::string& input) {
    std::istringstream iss(input);
    int val;
    iss >> val;
    return std::make_pair(val, !iss.bad());
}

std::pair<bool,bool> StringUtil::toBool(const std::string& input) {
    std::istringstream iss(input);
    bool val;
    iss >> val;
    return std::make_pair(val, !iss.bad());
}