
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = f (sepConcat (List.map l));;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat " " (List.map f l);;

*)

(* changed spans
(9,25)-(9,49)
sepConcat " " (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(9,36)-(9,48)
" "
LitG

(9,37)-(9,45)
List.map f l
AppG (fromList [VarG])

(9,46)-(9,47)
f
VarG

*)
