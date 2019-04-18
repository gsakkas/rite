
let stringOfList f l = List.map (f, l);;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "; " l;;

*)

(* changed spans
(2,24)-(2,39)
sepConcat "; " l
AppG (fromList [VarG,LitG])

*)

(* type error slice
(2,24)-(2,32)
(2,24)-(2,39)
(2,33)-(2,39)
*)
