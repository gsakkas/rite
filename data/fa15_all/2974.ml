
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = match x with | [] -> x | hd::tl -> a ^ (sep ^ hd) in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x in let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,19)-(6,68)
x
VarG

*)

(* type error slice
(6,19)-(6,68)
(6,25)-(6,26)
(6,40)-(6,41)
(6,54)-(6,68)
(6,56)-(6,57)
*)
