
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
(8,22)-(8,23)
(8,22)-(8,29)
(8,26)-(8,29)
(8,35)-(8,36)
*)

(* type error slice
(8,19)-(8,40)
(8,19)-(8,40)
(8,19)-(8,40)
(8,35)-(8,40)
(8,37)-(8,38)
*)
