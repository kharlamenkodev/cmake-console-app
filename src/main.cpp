#include "spd_log.hpp"

#include <memory>

#include <unused.hpp>

int main(int argc, char** argv)
{
    unused::Unused unused_args(argc, argv);

    std::unique_ptr<Log> log = std::make_unique<SpdLog>("hello.log");

    log->info("Hello from cmake comsole app template!");

    return 0;
}