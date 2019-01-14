
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat "; " List.map (f, l)) ^ "]");;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  let newList = List.map f l in "[" ^ ((sepConcat "; " newList) ^ "]");;

*)

(* changed spans
(9,23)-(9,69)
let newList = List.map f l in
"[" ^ (sepConcat "; "
                 newList ^ "]")
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(9,27)-(9,28)
List.map
VarG

(9,27)-(9,28)
f
VarG

(9,27)-(9,28)
l
VarG

(9,27)-(9,28)
"[" ^ (sepConcat "; "
                 newList ^ "]")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(9,30)-(9,62)
sepConcat "; " newList
AppG (fromList [VarG,LitG])

(9,59)-(9,60)
newList
VarG

*)
