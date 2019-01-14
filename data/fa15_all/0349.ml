
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (x h) :: a in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,21)-(6,22)
a ^ x
AppG (fromList [VarG])

(6,27)-(6,28)
(^)
VarG

(7,6)-(7,58)
x
VarG

*)
