
let stringOfList f l =
  match l with
  | [] -> "[]"
  | x::xs ->
      let g a x = a ^ ("; " ^ (f x)) in
      let base = f x in List.fold_left f base xs;;


(* fix

let stringOfList f l =
  match l with
  | [] -> "[]"
  | x::xs ->
      let g a x = a ^ ("; " ^ (f x)) in
      let base = f x in List.fold_left g base xs;;

*)

(* changed spans
(7,40)-(7,41)
g
VarG

*)

(* type error slice
(6,23)-(6,37)
(6,29)-(6,30)
(6,31)-(6,36)
(6,32)-(6,33)
(7,25)-(7,39)
(7,25)-(7,49)
(7,40)-(7,41)
*)
