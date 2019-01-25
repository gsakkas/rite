LetG NonRec (fromList [VarG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))
let (h1 , h2) :: t = l in
match k with
| h2 -> h1
| _ -> if l = []
       then d
       else assoc (d , k , t)
let (h1 , h2) :: t = l in
match k with
| h2 -> h1
| _ -> if l = []
       then d
       else assoc (d , k , t)
let h :: t = l in
match h with
| 0 -> removeZero t
| _ -> l
let h :: t = l in
match h with
| 0 -> removeZero t
| _ -> l
let h :: t = l in
match h with
| 0 -> removeZero t
| _ -> l
let h :: t = l in
match h with
| 0 -> removeZero t
| _ -> l
