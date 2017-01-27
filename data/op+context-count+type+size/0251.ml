
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = "" in
      let l = [(fun x  -> x ^ sep)] in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(8,15)-(8,36)
(8,17)-(8,34)
(8,27)-(8,28)
(8,27)-(8,34)
(8,29)-(8,30)
(8,31)-(8,34)
*)

(* type error slice
(6,7)-(8,63)
(6,13)-(6,24)
(6,15)-(6,24)
(6,19)-(6,20)
(6,19)-(6,24)
(6,21)-(6,22)
(6,23)-(6,24)
(7,7)-(8,63)
(7,18)-(7,20)
(8,7)-(8,63)
(8,15)-(8,36)
(8,17)-(8,34)
(8,27)-(8,28)
(8,27)-(8,34)
(8,29)-(8,30)
(8,31)-(8,34)
(8,40)-(8,54)
(8,40)-(8,63)
(8,55)-(8,56)
(8,57)-(8,61)
(8,62)-(8,63)
*)
