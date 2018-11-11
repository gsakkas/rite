
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = List.map sepConcat f (f l);;


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
(9,23)-(9,31)
"[" ^ (sepConcat ";"
                 (List.map f l) ^ "]")
AppG [LitG,AppG [EmptyG,EmptyG]]

(9,32)-(9,41)
(^)
VarG

(9,32)-(9,41)
(^)
VarG

(9,32)-(9,41)
sepConcat ";" (List.map f
                        l) ^ "]"
AppG [AppG [EmptyG,EmptyG],LitG]

(9,32)-(9,41)
sepConcat ";" (List.map f l)
AppG [LitG,AppG [EmptyG,EmptyG]]

(9,32)-(9,41)
"["
LitG

(9,44)-(9,49)
";"
LitG

(9,45)-(9,46)
List.map
VarG

(9,45)-(9,46)
List.map f l
AppG [VarG,VarG]

*)
