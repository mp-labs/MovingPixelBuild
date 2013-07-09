
if( NOT GOOGLE_TEST_DIR )
    mpb_error_fatal( "Cannot find Google test, set GOOGLE_TEST_DIR" )
endif( NOT GOOGLE_TEST_DIR )

set( MPB_TESTS_ENABLED ON )

enable_testing()

add_subdirectory( ${GOOGLE_TEST_DIR} )
include_directories( ${GOOGLE_TEST_DIR}/include )

function( mpb_test_add name )
    list( REMOVE_AT ARGV 0 )
    set( test_name test_${name} )
    add_executable( ${test_name} ${ARGV} )
    target_link_libraries( ${test_name} gtest gtest_main )
    get_target_property( test_exec ${test_name} LOCATION )
    add_test( ${name} ${test_name} )
endfunction( mpb_test_add name )

function( mpb_test_link_libraries name )
    list( REMOVE_AT ARGV 0 )
    target_link_libraries( test_${name} ${ARGV} )
endfunction( mpb_test_link_libraries name )
