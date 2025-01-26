function(target_link_third_party target)

    find_package(unused REQUIRED)
    find_package(spdlog REQUIRED)
    find_package(cxxopts REQUIRED)
 
    target_link_libraries(
        ${target} PUBLIC
        unused::unused
        cxxopts::cxxopts
        spdlog::spdlog
        fmt::fmt
    )
    
endfunction()
