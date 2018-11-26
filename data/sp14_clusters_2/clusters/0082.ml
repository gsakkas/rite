LetG NonRec (fromList [VarG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))
let (b1 , b2) = a in
match x with
| (fir , sec) -> if (fir + sec) < 10
                 then ([] , (fir + sec) :: b2)
                 else ([] , (fir + sec) :: b2)
let h :: t = l in
match l with
| [] -> []
| h :: t -> listReverse t
let h :: t = l in
match l with
| [] -> []
| h :: t -> listReverse t
