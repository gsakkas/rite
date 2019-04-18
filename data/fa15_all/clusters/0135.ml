LetG NonRec (fromList [(VarPatG,CaseG (fromList [(ConsPatG EmptyPatG EmptyPatG,Nothing,EmptyG),(ConPatG Nothing,Nothing,EmptyG)]))]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)
let test =
  match a1 with
  | [] -> 0
  | h :: t -> h in
let sum =
  (l1x + l2x) + test in
((sum / 10) :: a1 , (sum mod 10) :: a2)
