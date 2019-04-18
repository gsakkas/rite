CaseG (fromList [(LitPatG,Nothing,LitG),(WildPatG,Nothing,AppG (fromList [EmptyG]))])
match n with
| 0 -> 0
| _ -> additivePersistence (sumList (digitsOfInt n))
