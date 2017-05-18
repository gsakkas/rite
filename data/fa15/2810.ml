
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = match h with | h::[] -> h in
      let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = match a with | "" -> x | _ -> a ^ (sep ^ x) in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,31)
(7,17)-(7,42)
(7,23)-(7,24)
(7,41)-(7,42)
(8,14)-(8,15)
*)

(* type error slice
(3,2)-(8,42)
(3,2)-(8,42)
(6,6)-(8,42)
(6,12)-(6,31)
(6,14)-(6,31)
(6,22)-(6,31)
(6,27)-(6,28)
(6,29)-(6,30)
(7,17)-(7,42)
(7,17)-(7,42)
(7,23)-(7,24)
(8,6)-(8,42)
(8,14)-(8,15)
(8,19)-(8,33)
(8,19)-(8,42)
(8,34)-(8,35)
(8,41)-(8,42)
*)

(* all spans
(2,18)-(8,42)
(2,22)-(8,42)
(3,2)-(8,42)
(3,8)-(3,10)
(4,10)-(4,12)
(6,6)-(8,42)
(6,12)-(6,31)
(6,14)-(6,31)
(6,18)-(6,31)
(6,20)-(6,21)
(6,18)-(6,19)
(6,22)-(6,31)
(6,27)-(6,28)
(6,23)-(6,26)
(6,29)-(6,30)
(7,6)-(8,42)
(7,17)-(7,42)
(7,23)-(7,24)
(7,41)-(7,42)
(8,6)-(8,42)
(8,14)-(8,15)
(8,19)-(8,42)
(8,19)-(8,33)
(8,34)-(8,35)
(8,36)-(8,40)
(8,41)-(8,42)
*)
