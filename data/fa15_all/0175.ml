
let stringOfList f l = "[" ^ ((List.map f l) ^ "]");;


(* fix

let stringOfList f l = "[" ^ ((List.fold_left (^) "" (List.map f l)) ^ "]");;

*)

(* changed spans
(2,30)-(2,44)
List.fold_left
VarG

(2,30)-(2,44)
(^)
VarG

(2,30)-(2,44)
List.fold_left (^) ""
               (List.map f l)
AppG (fromList [VarG,AppG (fromList [EmptyG]),LitG])

(2,30)-(2,44)
""
LitG

*)
