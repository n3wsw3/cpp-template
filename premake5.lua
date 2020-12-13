workspace "cpp-template"
	architecture "x86_64"
	startproject "tests"

	configurations {
		"Debug",
		"Release"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

group "Dependencies"
	include "vendor/premake"
	include "tests/vendor"

group ""

include "cpp-project"
include "tests"
