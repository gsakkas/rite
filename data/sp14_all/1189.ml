
let stringOfList f l = let mid = List.map f l in "[" ^ (mid "]");;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "; " (List.map f l);;

*)

(* changed spans
(2,24)-(2,65)
sepConcat "; " (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(2,24)-(2,65)
(2,34)-(2,42)
(2,34)-(2,46)
(2,56)-(2,65)
(2,57)-(2,60)
*)
