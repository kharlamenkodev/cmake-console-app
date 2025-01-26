#include "spd_log.hpp"

SpdLog::SpdLog(std::string file_name)
    : _file_name{std::move(file_name)}
{}

SpdLog::~SpdLog()
{}

void SpdLog::info(const std::string& message)
{
    spdlog::info(message);
}

void SpdLog::warning(const std::string& message)
{
    spdlog::warn(message);
}

void SpdLog::error(const std::string& message)
{
    spdlog::error(message);
}
