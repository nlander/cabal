import Test.Cabal.Prelude

main = withShorterPathForNewBuildStore $ \storeDir -> cabalTest $ withRepo "repo" $ do
  cabalG ["--store-dir=" ++ storeDir] "v2-build" ["hie"]
  env <- getTestEnv
  shouldExist $ testLibInstallDir </> "hie-0.1.0.0" </> "Hie.hie"
  liftIO $ do
    installedDependencyLibDir <- findDependencyInStore storeDir "hie-dependency"
    shouldExist $ installedDependencyLibDir </> "lib" </> "HieDependency.hie"
