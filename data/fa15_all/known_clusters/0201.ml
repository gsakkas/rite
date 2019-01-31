IteG (BopG EmptyG EmptyG) VarG (LetG NonRec (fromList [EmptyG]) EmptyG)
if l = []
then d
else (let h :: t = l in
      if t = []
      then d
      else (let (x , y) = h in
            if x = k
            then y
            else assoc (d , k , t)))
