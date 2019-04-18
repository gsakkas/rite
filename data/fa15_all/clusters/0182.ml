CaseG (fromList [(LitPatG,Nothing,ListG (fromList [EmptyG])),(WildPatG,Nothing,AppG (fromList [EmptyG]))])
match i with
| 0 -> [0]
| _ -> bigAdd (bigAdd l l)
              (mulByDigit (i - 1) l)
