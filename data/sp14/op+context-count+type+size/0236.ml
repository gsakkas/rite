
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
(7,39)-(7,40)
*)

(* type error slice
(6,22)-(6,36)
(6,28)-(6,29)
(6,30)-(6,35)
(6,31)-(6,32)
(7,24)-(7,38)
(7,24)-(7,48)
(7,39)-(7,40)
*)
