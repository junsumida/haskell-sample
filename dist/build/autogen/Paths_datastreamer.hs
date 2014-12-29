module Paths_datastreamer (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,0,1], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/user/github/scotty-web-app/.cabal-sandbox/bin"
libdir     = "/home/user/github/scotty-web-app/.cabal-sandbox/lib/x86_64-linux-ghc-7.8.3/datastreamer-0.0.1"
datadir    = "/home/user/github/scotty-web-app/.cabal-sandbox/share/x86_64-linux-ghc-7.8.3/datastreamer-0.0.1"
libexecdir = "/home/user/github/scotty-web-app/.cabal-sandbox/libexec"
sysconfdir = "/home/user/github/scotty-web-app/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "datastreamer_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "datastreamer_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "datastreamer_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "datastreamer_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "datastreamer_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
