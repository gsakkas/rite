CaseG VarG (fromList [(Nothing,LitG),(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])
match sl with
| [] -> ""
| h :: t -> (let f =
               fun a ->
                 fun x -> a ^ (sep ^ x) in
             let base = h in
             let l = t in
             List.fold_left f base l)
match l with
| [] -> "[]"
| x :: xs -> (let g =
                fun a ->
                  fun x -> a ^ ("; " ^ f x) in
              let base = "[" ^ f x in
              List.fold_left g base
                             xs ^ "]")
match l with
| [] -> "[]"
| x :: xs -> (let g =
                fun a ->
                  fun x -> a ^ ("; " ^ f x) in
              let base = "[" ^ f x in
              List.fold_left g base
                             xs ^ "]")
match l with
| [] -> "[]"
| x :: xs -> (let g =
                fun a ->
                  fun x -> a ^ ("; " ^ f x) in
              let base = "[" ^ f x in
              List.fold_left g base
                             xs ^ "]")
match l with
| [] -> "[]"
| x :: xs -> (let g =
                fun a ->
                  fun x -> a ^ ("; " ^ f x) in
              let base = "[" ^ f x in
              List.fold_left g base
                             xs ^ "]")
