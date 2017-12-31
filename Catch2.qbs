import qbs 1.0

Project {
    DynamicLibrary {
        Depends { name: "cpp" }
        name  : "catch2"
        Group {
            name   : "sources"
            prefix : "include/"

            files : [
                "catch2.h",
                "catch_with_main.hpp",
                "reporters/*.h",
                "reporters/*.hpp",
                "reporters/*.cpp",
                "clara/*.hpp",
                "internal/*.h",
                "internal/*.hpp",
                "internal/*.cpp"
            ]
        }

        cpp.includePaths : [
            "include"
        ]
        cpp.cxxFlags : [
            "-g3"
        ]

        cpp.driverFlags: [
            "-std=c++17",
            "-stdlib=libc++",
        ]

        FileTagger {
            patterns: "catch_with_main.hpp"
            fileTags: ["cpp"]
        }


        Export {
            Depends { name : "cpp" }
            cpp.includePaths : [
                "include"
            ]
        }
        Group  {
            fileTagsFilter:  product.type
            qbs.installDir:  "tests"
            qbs.install:  true
        }
    }

}
