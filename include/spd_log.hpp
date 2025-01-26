#pragma once

#include "log.hpp"

#include <spdlog/spdlog.h>

#include <string>

class SpdLog final : public Log
{
public:
    SpdLog(std::string file_name);

    SpdLog(const SpdLog& other) = delete;

    ~SpdLog() override;

    SpdLog& operator=(const SpdLog& other) = delete;

    void info(const std::string& message) override;
    void warning(const std::string& message) override;
    void error(const std::string& message) override;

private:
    std::string _file_name{""};
};