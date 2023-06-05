import Test.Cabal.Prelude
main = setupAndCabalTest $ do
    withPackageDb $ do
        setup_install []
