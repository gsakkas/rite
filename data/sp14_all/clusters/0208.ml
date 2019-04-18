CaseG (fromList [(LitPatG,Nothing,LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG),(LitPatG,Nothing,ConAppG (Just EmptyG))])
match depth with
| 0 -> (let halff =
          rand (0 , 2) in
        if halff = 0
        then buildY ()
        else buildX ())
| 1 -> (let halff =
          rand (0 , 2) in
        if halff = 0
        then Cosine (build (rand , depth - 1))
        else Sine (build (rand , depth - 1)))
| 2 -> Average (build (rand , depth - 1) , build (rand , depth - 1))
| 3 -> Times (build (rand , depth - 1) , build (rand , depth - 1))
