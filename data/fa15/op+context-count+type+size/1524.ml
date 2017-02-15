
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
(7,46)-(7,47)
(7,53)-(7,55)
(8,6)-(9,29)
(8,43)-(8,45)
(8,51)-(8,54)
(9,6)-(9,29)
*)

(* type error slice
(6,6)-(9,29)
(6,12)-(6,23)
(6,18)-(6,23)
(6,20)-(6,21)
(6,22)-(6,23)
(7,6)-(9,29)
(7,17)-(7,55)
(7,46)-(7,47)
(8,17)-(8,32)
(8,18)-(8,29)
(8,30)-(8,31)
(9,6)-(9,20)
(9,6)-(9,29)
(9,21)-(9,22)
(9,23)-(9,27)
*)
