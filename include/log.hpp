#pragma once

#include <string>

class Log
{
public:
    virtual ~Log(){};
    virtual void info(const std::string& message) = 0;
    virtual void warning(const std::string& message) = 0;
    virtual void error(const std::string& message) = 0;
};