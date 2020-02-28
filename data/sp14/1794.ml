
let stringOfList f l =
  match l with
  | [] -> ""
  | h::t ->
      let m a b = "[" ^ (a ^ ((";" b) ^ "]")) in
      let base = f h in List.fold_left m base l;;


(* fix

let stringOfList f l =
  match l with
  | [] -> ""
  | h::t ->
      let m a b = "[" ^ (a ^ (";" ^ (b ^ "]"))) in
      let base = f h in List.fold_left m base l;;

*)

(* changed spans
(6,31)-(6,38)
";"
LitG

(6,41)-(6,44)
b ^ "]"
AppG [VarG,LitG]

*)

(* type error slice
(6,31)-(6,38)
(6,32)-(6,35)
*)
