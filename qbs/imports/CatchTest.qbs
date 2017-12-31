import qbs

CppApplication {
    type: ["application", "autotest"]
    consoleApplication: true


    Depends { name : "cpp" }
    Depends { name : "catch2";  cpp.linkWholeArchive: product.linkWholeArchive }

    Group  {
            fileTagsFilter:  product.type
            qbs.installDir:  "tests"
            qbs.install:  true


            cpp.driverFlags: [
                "-std=c++17",
                "-stdlib=libc++",
            ]

    }

    cpp.includePaths : [
        path + "/../../include"
    ]



}
