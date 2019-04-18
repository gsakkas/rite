CaseG (fromList [(WildPatG,Just (BopG VarG LitG),ListG (fromList []))])
match n with
| _ when n < 0 -> []
