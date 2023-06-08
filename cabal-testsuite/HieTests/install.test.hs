import Distribution.Simple.LocalBuildInfo (absoluteInstallDirs, libdir, localPkgDescr, CopyDest(NoCopyDest))
import Test.Cabal.Prelude

main = cabalTest $ withRepo "repo" $ do
  cabal "v2-build" ["hie"]
  lbi <- getLocalBuildInfoM
  let installedLibPath = libdir $ absoluteInstallDirs (localPkgDescr lbi) lbi NoCopyDest
  shouldExist $ installedLibPath </> "Hie.hie"
