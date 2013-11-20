
local action = _ACTION or ""

solution "imui"
	location ( "build" )
	configurations { "Debug", "Release" }
	platforms {"native", "x64", "x32"}
  
	project "example"
		kind "ConsoleApp"
		language "C++"
		files { "example/example.c", "src/*", "lib/*" }
		includedirs { "src", "lib" }
		targetdir("build")
	 
		configuration { "linux" }
			 links { "X11","Xrandr", "rt", "GL", "GLU", "pthread" }

		configuration { "windows" }
			 links { "glu32","opengl32", "gdi32", "winmm", "user32" }

		configuration { "macosx" }
			links { "glfw3" }
			linkoptions { "-framework OpenGL", "-framework Cocoa", "-framework IOKit" }

		configuration "Debug"
			defines { "DEBUG" }
			flags { "Symbols", "ExtraWarnings"}

		configuration "Release"
			defines { "NDEBUG" }
			flags { "Optimize", "ExtraWarnings"}    
