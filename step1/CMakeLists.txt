
project (json_test C)

if (CMAKE_C_COMPILER_ID MATCHES "GNU|Clang")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -ansi -pedantic -Wall")
endif()


add_library(lept_json lept_json.c)

add_executable(lept_json_test test.c)

target_link_libraries(lept_json_test lept_json)

