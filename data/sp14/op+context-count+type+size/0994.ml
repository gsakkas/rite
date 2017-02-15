
let t x = x + 1;;

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if x = "a" then x :: a else a in
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
(8,18)-(8,47)
(8,21)-(8,22)
(8,21)-(8,28)
(8,25)-(8,28)
(8,34)-(8,35)
(8,34)-(8,40)
(8,46)-(8,47)
*)

(* type error slice
(5,2)-(9,60)
(5,2)-(9,60)
(6,10)-(6,12)
(8,6)-(9,60)
(8,6)-(9,60)
(8,12)-(8,47)
(8,34)-(8,40)
(8,39)-(8,40)
(9,6)-(9,60)
(9,24)-(9,60)
(9,37)-(9,51)
(9,37)-(9,60)
(9,52)-(9,53)
*)
