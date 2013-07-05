
include( mpbVersion )

function( mpb_display_title_bar size char )
    string( RANDOM LENGTH ${size} ALPHABET ${char} result )
    message( ${result} )
endfunction( mpb_display_title_bar size char )

function( mpb_display_title text )
    string( LENGTH ${text} text_len )
    math( EXPR text_len "(80 - ${text_len}) / 2" )
    mpb_display_title_bar( 80 "#" )
    string( RANDOM LENGTH ${text_len} ALPHABET " " result )
    message( "${result}${text}" )
    mpb_display_title_bar( 80 "#" )
endfunction( mpb_display_title text )

mpb_display_title( "Moving Pixel Build (MPB) ${MPB_VERSION_STRING}" )
message( "CMake:                    ${CMAKE_VERSION}" )
message( "MPB Root Directory:       ${MPBUILD_ROOT_DIR}" )
message( "Project Root Directory:   ${PROJECT_SOURCE_DIR}" )
message( "Project Build Directory:  ${PROJECT_BINARY_DIR}" )
message( "Platform:                 ${CMAKE_SYSTEM_NAME}" )
message( "Architecture:             ${CMAKE_SYSTEM_PROCESSOR}" )

include( mpbLibrary )
