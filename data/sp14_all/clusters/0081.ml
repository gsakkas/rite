CaseG VarG (fromList [(LitPatG,Nothing,ListG (fromList [])),(WildPatG,Nothing,ConAppG (Just EmptyG))])
match n with
| 0 -> []
| _ -> x :: (clone x (n - 1))
