
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = if (List.length t) <> 0 then "" else sep in
      let l = if (List.length t) <> 0 then t else h in
      List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = if (List.length t) <> 0 then "" else sep in
      let l = if (List.length t) <> 0 then t else [h] in
      List.fold_left f base l;;

*)

(* changed spans
(8,50)-(8,51)
*)

(* type error slice
(3,2)-(9,29)
(8,14)-(8,51)
(8,43)-(8,44)
(8,50)-(8,51)
*)

(* all spans
(2,18)-(9,29)
(2,22)-(9,29)
(3,2)-(9,29)
(3,8)-(3,10)
(4,10)-(4,12)
(6,6)-(9,29)
(6,12)-(6,23)
(6,14)-(6,23)
(6,18)-(6,23)
(6,20)-(6,21)
(6,18)-(6,19)
(6,22)-(6,23)
(7,6)-(9,29)
(7,17)-(7,57)
(7,20)-(7,40)
(7,20)-(7,35)
(7,21)-(7,32)
(7,33)-(7,34)
(7,39)-(7,40)
(7,46)-(7,48)
(7,54)-(7,57)
(8,6)-(9,29)
(8,14)-(8,51)
(8,17)-(8,37)
(8,17)-(8,32)
(8,18)-(8,29)
(8,30)-(8,31)
(8,36)-(8,37)
(8,43)-(8,44)
(8,50)-(8,51)
(9,6)-(9,29)
(9,6)-(9,20)
(9,21)-(9,22)
(9,23)-(9,27)
(9,28)-(9,29)
*)
