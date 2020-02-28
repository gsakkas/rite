LetG NonRec [(VarPatG,VarG)] (AppG [EmptyG])
let args = l2 in
let (_ , res) =
  List.fold_left f base args in
res
EMPTY
let rest' = t in
helper (seen' , rest')
let seen' = seen in
let rest' = t in
helper (seen' , rest')
