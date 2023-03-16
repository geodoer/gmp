if(TARGET gmp)
    return()
endif()

IF (WIN32)
	if(CMAKE_SIZEOF_VOID_P EQUAL 8)
		set(Gmp_Lib ${CMAKE_CURRENT_LIST_DIR}/lib/win/x64/libgmp-10.lib)
		set(Gmp_Dll ${CMAKE_CURRENT_LIST_DIR}/lib/win/x64/libgmp-10.dll)
	else()
		message(FATAL_ERROR "Todo: Win32")
	endif()
ELSEIF(APPLE)
	message(FATAL_ERROR "Todo: Apple")
ELSEIF(UNIX)
	message(FATAL_ERROR "Todo: UNIX")
ENDIF()

add_library(gmp SHARED IMPORTED)
set_property(
	TARGET gmp 
	PROPERTY 
		IMPORTED_IMPLIB ${Gmp_Lib}
) 
target_include_directories(
	gmp
	INTERFACE ${CMAKE_CURRENT_LIST_DIR}/include
)

macro(copy_gmp_dll Target_Name)
	add_custom_command(TARGET ${Target_Name} POST_BUILD
		COMMAND ${CMAKE_COMMAND} -E copy_if_different 
			${Gmp_Dll} $<TARGET_FILE_DIR:${Target_Name}>
	)
endmacro()
