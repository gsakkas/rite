CaseG VarG [(LitPatG,Nothing,LitG),(WildPatG,Nothing,AppG [EmptyG])]
match n with
| 0 -> 0
| _ -> additivePersistence (sumList (digitsOfInt n))
