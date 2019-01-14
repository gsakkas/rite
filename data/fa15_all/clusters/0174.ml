CaseG VarG (fromList [(Nothing,LitG),(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])
match sl with
| [] -> ""
| h :: t -> (let f =
               fun a ->
                 fun x -> a ^ (sep ^ x) in
             let base = h in
             let l = t in
             List.fold_left f base l)
match sl with
| [] -> ""
| h :: t -> (let f =
               fun a ->
                 fun x -> a ^ (sep ^ x) in
             let base = h in
             let l = t in
             List.fold_left f base l)
