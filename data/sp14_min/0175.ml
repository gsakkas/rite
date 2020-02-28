
let stringOfList f l = "[" ^ ((List.map f l) ^ "]");;


(* fix

let stringOfList f l = "[" ^ ((List.fold_left (^) "" (List.map f l)) ^ "]");;

*)

(* changed spans
(2,31)-(2,45)
List.fold_left (^) ""
               (List.map f l)
AppG [VarG,LitG,AppG [EmptyG,EmptyG]]

*)

(* type error slice
(2,30)-(2,52)
(2,31)-(2,45)
(2,32)-(2,40)
(2,46)-(2,47)
*)
