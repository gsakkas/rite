
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
(6,19)-(6,20)
(6,19)-(6,22)
(7,18)-(7,19)
(7,18)-(7,38)
(7,20)-(7,21)
(7,23)-(7,32)
(7,23)-(7,38)
(7,33)-(7,36)
(7,37)-(7,38)
(8,7)-(8,43)
(8,15)-(8,16)
(8,20)-(8,34)
(8,20)-(8,43)
(8,35)-(8,36)
(8,37)-(8,41)
(8,42)-(8,43)
*)

(* type error slice
(3,3)-(8,43)
(3,3)-(8,43)
(6,7)-(8,43)
(6,13)-(6,22)
(6,15)-(6,22)
(6,19)-(6,20)
(6,19)-(6,22)
(7,18)-(7,19)
(7,18)-(7,38)
(7,20)-(7,21)
(8,7)-(8,43)
(8,15)-(8,16)
(8,20)-(8,34)
(8,20)-(8,43)
(8,35)-(8,36)
(8,42)-(8,43)
*)
