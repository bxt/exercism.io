import Test.HUnit (Assertion, (@=?), runTestTT, Test(..))
import Control.Monad (void)
import Queens (boardString, canAttack)

testCase :: String -> Assertion -> Test
testCase label assertion = TestLabel label (TestCase assertion)

main :: IO ()
main = void $ runTestTT $ TestList
  [ TestList queenTests ]

emptyBoard, board :: String
emptyBoard = concat [ "O O O O O O O O\n"
                    , "O O O O O O O O\n"
                    , "O O O O O O O O\n"
                    , "O O O O O O O O\n"
                    , "O O O O O O O O\n"
                    , "O O O O O O O O\n"
                    , "O O O O O O O O\n"
                    , "O O O O O O O O\n"
                    ]
board = concat [ "O O O O O O O O\n"
               , "O O O O O O O O\n"
               , "O O O O W O O O\n"
               , "O O O O O O O O\n"
               , "O O O O O O O O\n"
               , "O O O O O O O O\n"
               , "O O O O O O B O\n"
               , "O O O O O O O O\n"
               ]

queenTests :: [Test]
queenTests =
  [ testCase "empty board" $ emptyBoard @=? boardString Nothing Nothing
  , testCase "board" $ board @=? boardString (Just (2, 4)) (Just (6, 6))
  , testCase "attacks" $ do
    False @=? canAttack (2, 3) (4, 7)
    True @=? canAttack (2, 4) (2, 7)
    True @=? canAttack (5, 4) (2, 4)
    True @=? canAttack (1, 1) (6, 6)
    True @=? canAttack (0, 6) (1, 7)
    True @=? canAttack (4, 1) (6, 3)
  ]
