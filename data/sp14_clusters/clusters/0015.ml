LetG NonRec [TupleG [EmptyG,EmptyG]] (LetG NonRec [EmptyG] EmptyG)
let base = (0 , []) in
let args =
  List.combine (List.rev l1)
               (List.rev l2) in
let (_ , res) =
  List.fold_left f base args in
res
let base = (0 , []) in
let args =
  List.combine (List.rev l1)
               (List.rev l2) in
let (_ , res) =
  List.fold_left f base args in
res
let base = (0 , []) in
let args =
  List.combine l1 l2 in
let (_ , res) =
  List.fold_left f base args in
res
let base = (0 , []) in
let args =
  List.combine l1 l2 in
let (_ , res) =
  List.fold_left f base args in
res
