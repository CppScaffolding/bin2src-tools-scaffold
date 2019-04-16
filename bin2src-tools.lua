-- scaffold geniefile for bin2src-tools

bin2src-tools_script = path.getabsolute(path.getdirectory(_SCRIPT))
bin2src-tools_root = path.join(bin2src-tools_script, "bin2src-tools")

bin2src-tools_includedirs = {
	path.join(bin2src-tools_script, "config"),
	bin2src-tools_root,
}

bin2src-tools_libdirs = {}
bin2src-tools_links = {}
bin2src-tools_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { bin2src-tools_includedirs }
	end,

	_add_defines = function()
		defines { bin2src-tools_defines }
	end,

	_add_libdirs = function()
		libdirs { bin2src-tools_libdirs }
	end,

	_add_external_links = function()
		links { bin2src-tools_links }
	end,

	_add_self_links = function()
		links { "bin2src-tools" }
	end,

	_create_projects = function()

project "bin2src-tools"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		bin2src-tools_includedirs,
	}

	defines {}

	files {
		path.join(bin2src-tools_script, "config", "**.h"),
		path.join(bin2src-tools_root, "**.h"),
		path.join(bin2src-tools_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
