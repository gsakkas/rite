LetG NonRec (fromList [(VarPatG,BopG EmptyG EmptyG)]) (IteG EmptyG EmptyG EmptyG)
let x = reverseInt n 0 / 10
and y =
  reverseInt n 0 mod 10 in
if (x = 0) && (y = 0)
then []
else y :: (digitsOfInt x)
