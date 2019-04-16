
let t x = x + 1;;

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if x = "a" then a ^ x in
      let base = sep in let l = t in List.fold_left f base l;;


(* fix

let t x = x + 1;;

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = sep in let l = t in List.fold_left f base l;;

*)

(* changed spans
(8,19)-(8,40)
x ^ a
AppG (fromList [VarG])

*)

(* type error slice
(8,19)-(8,40)
(8,35)-(8,40)
(8,37)-(8,38)
(8,40)-(8,40)
*)
