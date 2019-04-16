IteG (BopG EmptyG EmptyG) VarG (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)
if i < 2
then l
else (let total =
        bigAdd l l in
      bigAdd total
             (mulByDigit (i - 1) l))
