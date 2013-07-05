
if( NOT GOOGLE_TEST_DIR )
    mpb_error_fatal( "Cannot find Google test, set GOOGLE_TEST_DIR" )
endif( NOT GOOGLE_TEST_DIR )

add_subdirectory( ${GOOGLE_TEST_DIR} )
include_directories( ${GOOGLE_TEST_DIR}/include )
