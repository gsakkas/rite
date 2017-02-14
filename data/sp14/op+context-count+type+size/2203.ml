
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
(6,30)-(6,37)
(6,35)-(6,36)
*)

(* type error slice
(6,30)-(6,37)
(6,31)-(6,34)
*)
