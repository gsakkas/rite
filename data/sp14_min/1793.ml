
let stringOfList f l =
  match l with
  | [] -> ""
  | h::t ->
      let g a x = a ^ (";" ^ x) in
      let base = f h in let x = f t in List.fold_left g base x;;


(* fix

let stringOfList f l =
  match l with
  | [] -> ""
  | h::t ->
      let g a x = a ^ (";" ^ x) in
      let base = f h in let x = t in List.fold_left g base l;;

*)

(* changed spans
(7,33)-(7,36)
t
VarG

(7,62)-(7,63)
l
VarG

*)

(* type error slice
(3,3)-(7,63)
(7,18)-(7,19)
(7,18)-(7,21)
(7,20)-(7,21)
(7,33)-(7,34)
(7,33)-(7,36)
(7,35)-(7,36)
*)
