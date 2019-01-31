
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x a in
      let base = h ^ (sepConcat sep t) in
      let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a in
      let base = if (List.length t) <> 0 then "" else sep in
      let l = if (List.length t) <> 0 then t else [] in
      List.fold_left f base l;;

*)

(* changed spans
(7,32)-(7,35)
if List.length t <> 0
then ""
else sep
IteG (BopG EmptyG EmptyG) LitG VarG

(7,36)-(7,37)
List.length
VarG

(7,36)-(7,37)
List.length t
AppG (fromList [VarG])

(7,36)-(7,37)
List.length t <> 0
BopG (AppG (fromList [EmptyG])) LitG

(8,6)-(8,42)
sep
VarG

(8,6)-(8,42)
0
LitG

(8,6)-(8,42)
""
LitG

(8,14)-(8,15)
List.length
VarG

(8,14)-(8,15)
List.length t
AppG (fromList [VarG])

(8,14)-(8,15)
List.length t <> 0
BopG (AppG (fromList [EmptyG])) LitG

(8,14)-(8,15)
if List.length t <> 0
then t
else []
IteG (BopG EmptyG EmptyG) VarG (ListG EmptyG Nothing)

(8,19)-(8,42)
t
VarG

(8,19)-(8,42)
0
LitG

(8,19)-(8,42)
[]
ListG EmptyG Nothing

*)
