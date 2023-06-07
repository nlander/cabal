import Distribution.Simple.LocalBuildInfo (absoluteInstallDirs, libdir, localPkgDescr, CopyDest(NoCopyDest))
import Test.Cabal.Prelude

main = setupAndCabalTest $ do
    withPackageDb $ do
        setup_install []
        lbi <- getLocalBuildInfoM
        let installedLibPath = libdir $ absoluteInstallDirs (localPkgDescr lbi) lbi NoCopyDest
	shouldExist $ installedLibPath </> "Hie.hie"
