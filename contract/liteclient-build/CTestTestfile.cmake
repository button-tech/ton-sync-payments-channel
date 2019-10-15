# CMake generated Testfile for 
# Source directory: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client
# Build directory: /Users/erage/go/src/github.com/prazd/ton_build_sctipts/liteclient-build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test-ed25519 "test-ed25519")
set_tests_properties(test-ed25519 PROPERTIES  _BACKTRACE_TRIPLES "/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/CMakeLists.txt;374;add_test;/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/CMakeLists.txt;0;")
add_test(test-vm "test-vm" "--regression" "/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/test/regression-tests.ans" "--filter" "-Bench")
set_tests_properties(test-vm PROPERTIES  _BACKTRACE_TRIPLES "/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/CMakeLists.txt;375;add_test;/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/CMakeLists.txt;0;")
add_test(test-fift "test-fift" "--regression" "/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/test/regression-tests.ans" "--filter" "-Bench")
set_tests_properties(test-fift PROPERTIES  _BACKTRACE_TRIPLES "/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/CMakeLists.txt;376;add_test;/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/CMakeLists.txt;0;")
add_test(test-cells "test-cells" "--regression" "/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/test/regression-tests.ans" "--filter" "-Bench")
set_tests_properties(test-cells PROPERTIES  _BACKTRACE_TRIPLES "/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/CMakeLists.txt;377;add_test;/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/CMakeLists.txt;0;")
add_test(test-net "test-net")
set_tests_properties(test-net PROPERTIES  _BACKTRACE_TRIPLES "/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/CMakeLists.txt;378;add_test;/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/CMakeLists.txt;0;")
add_test(test-actors "test-tdactor")
set_tests_properties(test-actors PROPERTIES  _BACKTRACE_TRIPLES "/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/CMakeLists.txt;379;add_test;/Users/erage/go/src/github.com/prazd/ton_build_sctipts/lite-client/CMakeLists.txt;0;")
subdirs("third-party/crc32c")
subdirs("tdutils")
subdirs("memprof")
subdirs("tdactor")
subdirs("tdnet")
subdirs("tddb")
subdirs("tdtl")
subdirs("tl")
subdirs("terminal")
subdirs("keys")
subdirs("tl-utils")
subdirs("adnl")
subdirs("crypto")
subdirs("lite-client")
