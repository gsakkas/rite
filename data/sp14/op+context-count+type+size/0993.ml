
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
(8,18)-(8,39)
(8,21)-(8,22)
(8,21)-(8,28)
(8,25)-(8,28)
(8,34)-(8,35)
(9,37)-(9,51)
*)

(* type error slice
(8,18)-(8,39)
(8,18)-(8,39)
(8,18)-(8,39)
(8,34)-(8,39)
(8,36)-(8,37)
*)
