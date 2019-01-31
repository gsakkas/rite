LetG NonRec (fromList [ListG EmptyG Nothing]) (LetG NonRec (fromList [EmptyG]) EmptyG)
let base = [] in
let args = [] in
List.fold_left f base args
let base = [] in
let args = l2 in
List.fold_left f base args
