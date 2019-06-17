AppG [BopG EmptyG EmptyG,VarG,AppG [EmptyG,EmptyG]]
helper (x - 1) l (bigAdd l
                         accum)
helper (f :: acc) f (x - 1)
helper (i - 1) (bigAdd acc l)
       l
