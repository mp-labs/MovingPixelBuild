
function( mpb_qt5_find_mocable_headers rootDir variable )
    file( GLOB_RECURSE hpps ${rootDir}/*.hpp )
    set( variable ${hpps} PARENT_SCOPE )
endfunction( mpb_qt5_find_mocable_headers rootDir variable )

function( mpb_qt5_find_headers rootDir variable )
    file( GLOB_RECURSE hxxs ${rootDir}/*.hxx )
    file( GLOB_RECURSE inls ${rootDir}/*.inl )
    set( variable ${hxxs} ${inls} PARENT_SCOPE )
endfunction( mpb_qt5_find_headers rootDir variable )

function( mpb_qt5_find_sources rootDir variable )
    file( GLOB_RECURSE cpps ${rootDir}/*.cpp )
    set( variable ${cpps} PARENT_SCOPE )
endfunction( mpb_qt5_find_sources rootDir variable )
