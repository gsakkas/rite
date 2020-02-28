
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let pipe fs =
  let f a x n = x (a n) in let base n = n in List.fold_left f base fs;;

let stringOfList f l = "[" ^ ((sepConcat "; " (List.map f l)) ^ "]");;

let rec clone x n = pipe stringOfList x n;;


(* fix

let rec cloneHelper x n = if x <= 0 then [] else cloneHelper x (n - 1);;

let rec clone x n = cloneHelper x n;;

*)

(* changed spans
(14,21)-(14,42)
cloneHelper x n
AppG [VarG,VarG]

*)

(* type error slice
(9,4)-(10,72)
(9,10)-(10,70)
(10,46)-(10,60)
(10,46)-(10,70)
(10,68)-(10,70)
(12,4)-(12,71)
(12,18)-(12,69)
(14,21)-(14,25)
(14,21)-(14,42)
(14,26)-(14,38)
*)
