LetG NonRec (fromList [(VarPatG,CaseG (fromList [(TuplePatG (fromList [EmptyPatG]),Nothing,EmptyG)]))]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)
let carry =
  match a with
  | (f , g) -> f in
let newc =
  match x with
  | (f , g) -> if ((f + g) + carry) > 9
               then 1
               else 0 in
let digit =
  match x with
  | (f , g) -> (f + g) + (carry mod 10) in
match a with
| (o , p) -> (newc , digit :: p)
let newc =
  match x with
  | (f , g) -> if ((f + g) + carry) > 9
               then 1
               else 0 in
let digit =
  match x with
  | (f , g) -> (f + g) + (carry mod 10) in
match a with
| (o , p) -> (newc , digit :: p)
