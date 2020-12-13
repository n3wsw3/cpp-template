project "tests"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files {
        "src/**.cpp"
	}

	includedirs {
        "%{wks.location}/cpp-project/include",
		"vendor/googletest/googletest/include"
	}

	links {
		"cpp-project",
		"gtest"
	}

	filter "system:linux"
		linkoptions {"-pthread"}

	filter "system:windows"
		systemversion "latest"
	
    filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
