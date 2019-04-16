CaseG VarG (fromList [(VarPatG,Nothing,AppG (fromList [EmptyG])),(LitPatG,Nothing,IteG EmptyG EmptyG EmptyG)])
match depth with
| 0 -> if true
       then buildX ()
       else buildY ()
| n -> buildSine (build (rand , depth - 1))
