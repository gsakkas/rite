
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat "; " (List.map f l)) ^ "]");;

let rec clone x n = stringOfList x n List.map x n;;


(* fix

let rec cloneHelper x n = if x <= 0 then [] else cloneHelper x (n - 1);;

let rec clone x n = cloneHelper x n;;

*)

(* changed spans
(11,21)-(11,50)
cloneHelper x n
AppG [VarG,VarG]

*)

(* type error slice
(9,4)-(9,71)
(9,18)-(9,69)
(9,20)-(9,69)
(9,24)-(9,69)
(9,28)-(9,29)
(11,21)-(11,33)
(11,21)-(11,50)
*)
