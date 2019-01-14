
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ sep in
      let base = h ^ sep in let l = h in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(7,28)-(7,64)
x
VarG

(7,36)-(7,37)
let base = h in
let l = sl in
List.fold_left f base l
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(7,41)-(7,64)
sl
VarG

(7,41)-(7,64)
let l = sl in
List.fold_left f base l
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

*)
