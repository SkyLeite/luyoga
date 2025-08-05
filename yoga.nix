{
  stdenv,
  cmake,
  fetchFromGitHub,
  ninja,
  pkg-config,
}:
stdenv.mkDerivation {
  pname = "yoga";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "facebook";
    repo = "yoga";
    rev = "82671c0";
    hash = "sha256-BWgBgq6H6aa8Nu089DsJbG2ABTl5qCcN8m7i2Ao+WpM=";
  };

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [
    cmake
  ];

  patchPhase = ''
    runHook prePatch

    substituteInPlace ./CMakeLists.txt \
      --replace-fail "add_subdirectory(tests)" ""

    substituteInPlace ./yoga/CMakeLists.txt \
      --replace-fail "add_library(yogacore STATIC" "add_library(yogacore SHARED"

    runHook postPatch
  '';

  configurePhase = ''
    runHook preConfigure

    cmake -B build -S . -D CMAKE_BUILD_TYPE="Release" -D BUILD_SHARED_LIBS=ON

    runHook postConfigure
  '';

  buildPhase = ''
    cmake --build build
  '';

  installPhase = ''
    mkdir -p $out/lib
    cp ./build/yoga/libyogacore.so $out/lib/
  '';
}
