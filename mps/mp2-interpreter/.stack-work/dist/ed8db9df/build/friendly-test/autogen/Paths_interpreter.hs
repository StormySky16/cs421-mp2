{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_interpreter (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,3,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\drago\\Documents\\GitHub\\cs421-mp2\\mps\\mp2-interpreter\\.stack-work\\install\\3160b525\\bin"
libdir     = "C:\\Users\\drago\\Documents\\GitHub\\cs421-mp2\\mps\\mp2-interpreter\\.stack-work\\install\\3160b525\\lib\\x86_64-windows-ghc-8.10.7\\interpreter-0.3.0.0-DfqsPnkfGS656fZGO0GUQQ-friendly-test"
dynlibdir  = "C:\\Users\\drago\\Documents\\GitHub\\cs421-mp2\\mps\\mp2-interpreter\\.stack-work\\install\\3160b525\\lib\\x86_64-windows-ghc-8.10.7"
datadir    = "C:\\Users\\drago\\Documents\\GitHub\\cs421-mp2\\mps\\mp2-interpreter\\.stack-work\\install\\3160b525\\share\\x86_64-windows-ghc-8.10.7\\interpreter-0.3.0.0"
libexecdir = "C:\\Users\\drago\\Documents\\GitHub\\cs421-mp2\\mps\\mp2-interpreter\\.stack-work\\install\\3160b525\\libexec\\x86_64-windows-ghc-8.10.7\\interpreter-0.3.0.0"
sysconfdir = "C:\\Users\\drago\\Documents\\GitHub\\cs421-mp2\\mps\\mp2-interpreter\\.stack-work\\install\\3160b525\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "interpreter_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "interpreter_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "interpreter_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "interpreter_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "interpreter_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "interpreter_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
