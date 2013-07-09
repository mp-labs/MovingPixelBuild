
include( mpbVersion )

function( mpb_error_fatal message )
    message( FATAL_ERROR ${message} )
endfunction( mpb_error_fatal message )

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

# Parse a version string and returns it as a list
function( mpb_parse_version_string version output )
    set( ${output} )
    set( version_string ${version} )
    string( FIND ${version_string} "." idx )
    while( idx GREATER -1 )
        # Take the first part
        string( SUBSTRING ${version} 0 ${idx} part )
        # Store it in the result
        set( ${output} ${${output}} ${part} )
        # Increment the index
        math( EXPR idx  "${idx} + 1" )
        # Remote the beginning of the string
        string( SUBSTRING ${version_string} ${idx} -1 version_string )
        # Repeat the search
        string( FIND ${version_string} "." idx )
    endwhile( idx GREATER -1 )

    string( FIND ${version_string} " " idx )
    while( idx GREATER -1 )
        # Take the first part
        string( SUBSTRING ${version_string} 0 ${idx} part )
        # Store it in the result
        set( ${output} ${${output}} ${part} )
        # Increment the index
        math( EXPR idx  "${idx} + 1" )
        # Remote the beginning of the string
        string( SUBSTRING ${version_string} ${idx} -1 version_string )
        # Repeat the search
        string( FIND ${version_string} " " idx )
    endwhile( idx GREATER -1 )

    set( ${output} ${${output}} ${version_string} )
    set( ${output} ${${output}} PARENT_SCOPE )

endfunction( mpb_parse_version_string version output_variable )

mpb_display_title( "Moving Pixel Build (MPB) ${MPB_VERSION_STRING}" )
message( "CMake:                    ${CMAKE_VERSION}" )
message( "Project Root Directory:   ${PROJECT_SOURCE_DIR}" )
message( "Project Build Directory:  ${PROJECT_BINARY_DIR}" )
message( "Platform:                 ${CMAKE_SYSTEM_NAME}" )
message( "Architecture:             ${CMAKE_SYSTEM_PROCESSOR}" )

include( mpbLibrary )
