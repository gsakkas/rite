
let stringOfList f l = "[" ^ ((List.map (f "; ") l) ^ "]");;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat "; " (List.map f l)) ^ "]");;

*)

(* changed spans
(2,17)-(2,58)
(2,31)-(2,39)
(2,40)-(2,48)
(2,43)-(2,47)
*)

(* type error slice
(2,29)-(2,58)
(2,30)-(2,51)
(2,31)-(2,39)
(2,52)-(2,53)
*)

(* all spans
(2,17)-(2,58)
(2,19)-(2,58)
(2,23)-(2,58)
(2,27)-(2,28)
(2,23)-(2,26)
(2,29)-(2,58)
(2,52)-(2,53)
(2,30)-(2,51)
(2,31)-(2,39)
(2,40)-(2,48)
(2,41)-(2,42)
(2,43)-(2,47)
(2,49)-(2,50)
(2,54)-(2,57)
*)
