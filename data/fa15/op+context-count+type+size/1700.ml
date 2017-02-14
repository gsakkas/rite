
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = if (List.length t) <> 0 then t else [] in
      let l = if (List.length t) <> 0 then "" else sep in
      List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = if (List.length t) <> 0 then "" else sep in
      let l = if (List.length t) <> 0 then t else [] in
      List.fold_left f base l;;

*)

(* changed spans
(7,47)-(7,48)
(7,54)-(7,56)
(8,7)-(9,30)
(8,44)-(8,46)
(8,52)-(8,55)
(9,7)-(9,30)
*)

(* type error slice
(6,7)-(9,30)
(6,13)-(6,24)
(6,19)-(6,24)
(6,21)-(6,22)
(6,23)-(6,24)
(7,7)-(9,30)
(7,18)-(7,56)
(7,47)-(7,48)
(8,19)-(8,30)
(8,19)-(8,32)
(8,31)-(8,32)
(9,7)-(9,21)
(9,7)-(9,30)
(9,22)-(9,23)
(9,24)-(9,28)
*)
