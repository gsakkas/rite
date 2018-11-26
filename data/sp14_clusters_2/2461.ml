
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = List.map f (sepConcat f l);;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ";" (List.map f l)) ^ "]");;

*)

(* changed spans
(9,32)-(9,33)
(^)
VarG

(9,34)-(9,49)
"["
LitG

(9,35)-(9,44)
(^)
VarG

(9,35)-(9,44)
sepConcat ";" (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(9,45)-(9,46)
List.map
VarG

(9,45)-(9,46)
List.map f l
AppG (fromList [VarG])

(9,45)-(9,46)
";"
LitG

*)
