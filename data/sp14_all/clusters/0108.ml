AppG (fromList [VarG,AppG (fromList [EmptyG]),BopG EmptyG EmptyG])
helper (x - 1) l (bigAdd l
                         accum)
helper (f :: acc) f (x - 1)
helper (i - 1) (bigAdd acc l)
       l
