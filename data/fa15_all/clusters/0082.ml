LetG NonRec [(VarPatG,CaseG EmptyG [(EmptyPatG,Nothing,EmptyG),(EmptyPatG,Nothing,EmptyG)])] (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)
EMPTY
let test =
  match a1 with
  | [] -> 0
  | h :: t -> h in
let sum =
  (l1x + l2x) + test in
((sum / 10) :: a1 , (sum mod 10) :: a2)
