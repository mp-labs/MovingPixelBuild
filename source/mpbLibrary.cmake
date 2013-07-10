
# Internal function
function( mpb_library_add_shared name )
    message( "Building SHARED library: ${name}" )
    list( REMOVE_AT ARGV 0 )
    add_library( ${name} SHARED ${ARGV} )
endfunction( mpb_library_add_shared name )

# Internal function
function( mpb_library_add_static name )
    message( "Building STATIC library: ${name}" )
    list( REMOVE_AT ARGV 0 )
    add_library( ${name} STATIC ${ARGV} )
endfunction( mpb_library_add_static name )

function( mpb_library_set_includes name )
    string( TOUPPER ${name} _name )
    list( REMOVE_AT ARGV 0 )
    set( ${_name}_INCLUDES ${ARGV} PARENT_SCOPE )
    message( ${ARGV} )
endfunction( mpb_library_set_includes name )

function( mpb_library_set_cflags name flags )
    string( TOUPPER ${name} _name )
    set( ${_name}_CFLAGS ${flags} )
endfunction( mpb_library_set_cflags name flags )

function( mpb_library_set_lflags name flags )
    string( TOUPPER ${name} _name )
    set( ${_name}_LFLAGS ${flags} )
endfunction( mpb_library_set_lflags name flags )

macro( mpb_library_export name )
    string( TOUPPER ${name} _name )
    set( ${_name}_FOUND     ON                      PARENT_SCOPE )
    set( ${_name}_TARGET    ${${_name}_TARGET}      PARENT_SCOPE )
    set( ${_name}_INCLUDES  ${${_name}_INCLUDES}    PARENT_SCOPE )
    set( ${_name}_CFLAGS    ${${_name}_CFLAGS}      PARENT_SCOPE )
    set( ${_name}_LFLAGS    ${${_name}_LFLAGS}      PARENT_SCOPE )
endmacro( mpb_library_export name )

function( mpb_library_add name VERSION_TAG version SOURCES_TAG )

    string( TOUPPER ${name} _name )

    # Remove the 4 first fixed arguments from the ARGV array
    list( REMOVE_AT ARGV 0 )
    list( REMOVE_AT ARGV 0 )
    list( REMOVE_AT ARGV 0 )
    list( REMOVE_AT ARGV 0 )

    if( NOT "VERSION" STREQUAL ${VERSION_TAG} )
        mpb_fatal_error( "mpb_library_add -> unspecified VERSION" )
    endif( NOT "VERSION" STREQUAL ${VERSION_TAG} )

    if( NOT "SOURCES" STREQUAL ${SOURCES_TAG} )
        mpb_fatal_error( "mpb_library_add -> unspecified SOURCES" )
    endif( NOT "SOURCES" STREQUAL ${SOURCES_TAG} )

    # Parse version string
    mpb_parse_version_string( ${version} version_elements )
    # Retrieve the major
    list( GET version_elements 0 version_major )

    set( ${_name}_TARGET ${name}${version_major} )
    set( ${_name}_TARGET ${${_name}_TARGET} PARENT_SCOPE )

    foreach( src ${ARGV} )
        set( SOURCES ${SOURCES} ${src} )
    endforeach( src )

    if( DEFINED ${_name}_STATIC OR DEFINED MPB_ALL_STATIC )
        mpb_library_add_static( ${${_name}_TARGET} ${SOURCES} )
    else( DEFINED ${_name}_STATIC OR DEFINED MPB_ALL_STATIC )
        mpb_library_add_shared( ${${_name}_TARGET} ${SOURCES} )
    endif( DEFINED ${_name}_STATIC OR DEFINED MPB_ALL_STATIC )

endfunction( mpb_library_add name VERSION_TAG version SOURCES_TAG )
