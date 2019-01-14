
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((List.map sepConcat "; " l) ^ "]");;


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
(9,31)-(9,39)
sepConcat "; " (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(9,55)-(9,56)
List.map
VarG

(9,55)-(9,56)
f
VarG

(9,55)-(9,56)
List.map f l
AppG (fromList [VarG])

*)
