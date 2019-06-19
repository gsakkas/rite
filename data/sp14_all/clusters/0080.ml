IteG (BopG EmptyG EmptyG) (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG) (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)
if carry <> []
then (let ch :: _ = carry in
      let tens =
        ((x1 + x2) + ch) / 10 in
      let ones =
        ((x1 + x2) + ch) mod 10 in
      ([tens] , tens :: (ones :: res)))
else (let tens =
        (x1 + x2) / 10 in
      let ones = (x1 + x2) mod 10 in
      ([tens] , tens :: (ones :: res)))
