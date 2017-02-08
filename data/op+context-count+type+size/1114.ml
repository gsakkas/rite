
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
(8,19)-(8,48)
(8,22)-(8,23)
(8,22)-(8,29)
(8,26)-(8,29)
(8,35)-(8,36)
(8,35)-(8,41)
(8,47)-(8,48)
*)

(* type error slice
(5,3)-(9,61)
(5,3)-(9,61)
(6,11)-(6,13)
(8,7)-(9,61)
(8,7)-(9,61)
(8,13)-(8,48)
(8,35)-(8,41)
(8,40)-(8,41)
(9,7)-(9,61)
(9,25)-(9,61)
(9,38)-(9,52)
(9,38)-(9,61)
(9,53)-(9,54)
*)
