CaseG VarG [(LitPatG,Nothing,ListG []),(WildPatG,Nothing,AppG [EmptyG,EmptyG])]
match i with
| 0 -> []
| _ -> bigAdd (bigAdd l l)
              (mulByDigit (i - 1) l)
match n with
| 0 -> []
| _ -> digitsOfInt (n / 10) @ [n mod 10]
