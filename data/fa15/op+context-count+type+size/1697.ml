
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x a in
      let base = h ^ (sepConcat sep t) in
      let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a in
      let base = if (List.length t) <> 0 then "" else sep in
      let l = if (List.length t) <> 0 then t else [] in
      List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,19)
(6,18)-(6,21)
(7,17)-(7,18)
(7,17)-(7,38)
(7,19)-(7,20)
(7,21)-(7,38)
(7,22)-(7,31)
(7,32)-(7,35)
(7,36)-(7,37)
(8,6)-(8,42)
(8,14)-(8,15)
(8,19)-(8,33)
(8,19)-(8,42)
(8,34)-(8,35)
(8,36)-(8,40)
(8,41)-(8,42)
*)

(* type error slice
(3,2)-(8,42)
(3,2)-(8,42)
(6,6)-(8,42)
(6,12)-(6,21)
(6,14)-(6,21)
(6,18)-(6,19)
(6,18)-(6,21)
(7,17)-(7,18)
(7,17)-(7,38)
(7,19)-(7,20)
(8,6)-(8,42)
(8,14)-(8,15)
(8,19)-(8,33)
(8,19)-(8,42)
(8,34)-(8,35)
(8,41)-(8,42)
*)
