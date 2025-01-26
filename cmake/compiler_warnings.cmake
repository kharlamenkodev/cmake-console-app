
option(WARNINGS_AS_ERRORS "Treat compiler warnings as errors" ON)

macro(_set_flags)
    set(GCC_COMMON_WARNINGS
            -Wall
            -Wextra # reasonable and standard
            -Wpedantic # warn if non-standard C++ is used
            -Wshadow # warn the user if a variable declaration shadows one from a parent context
            -Wnon-virtual-dtor # warn the user if a class with virtual functions has a non-virtual destructor. This helps catch hard to track down memory errors
            -Wold-style-cast # warn for c-style casts
            -Wcast-align # warn for potential performance problem casts
            -Wunused # warn on anything being unused
            -Woverloaded-virtual # warn if you overload (not override) a virtual function
            -Wcast-qual # warn on dropping const or volatile qualifiers
            -Wconversion # warn on type conversions that may lose data
            -Wsign-conversion # warn on sign conversions
            -Wnull-dereference # warn if a null dereference is detected
            -Wformat=2 # warn on security issues around functions that format output (ie printf)
            )

    set(CLANG_WARNINGS
            ${GCC_COMMON_WARNINGS}
    )

    set(GCC_WARNINGS
            ${GCC_COMMON_WARNINGS}
            -Wdouble-promotion # warn if float is implicit promoted to double
            -Wmisleading-indentation # warn if indentation implies blocks where blocks do not exist
            -Wduplicated-cond # warn if if / else chain has duplicated conditions
            -Wduplicated-branches # warn if if / else branches have duplicated code
            -Wlogical-op # warn about logical operations being used where bitwise were probably wanted
    )

    if (WARNINGS_AS_ERRORS)
        set(GCC_WARNINGS ${GCC_WARNINGS} -Werror)
        set(CLANG_WARNINGS ${CLANG_WARNINGS} -Werror)
    endif ()

    if (CMAKE_CXX_COMPILER_ID MATCHES ".*Clang")
        set(flags ${CLANG_WARNINGS})
    elseif (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
        set(flags ${GCC_WARNINGS})
    else ()
        message(WARNING "No compiler warnings set for '${CMAKE_CXX_COMPILER_ID}' compiler.")
        return()
    endif ()
endmacro()

function(enable_target_compiler_warnings target scope)
    set(scopes PUBLIC INTERFACE PRIVATE)

    if (NOT scope IN_LIST scopes)
        message(FATAL_ERROR "'scope' argument should be one of ${scopes} ('${scope}' received)")
    endif ()

    _set_flags()

    message(STATUS "Setting restrictive compilation warnings")
    message(STATUS "Treat warnings as errors: ${WARNINGS_AS_ERRORS}")
    message(STATUS "Flags: ${flags}")
    message(STATUS "Setting restrictive compilation warnings - done")

    target_compile_options(${target} ${scope} ${flags})
endfunction()