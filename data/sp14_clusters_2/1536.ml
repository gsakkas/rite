
let sqsum xs =
  let rec f a x = match xs with | [] -> a | hd::tl -> f (f a hd) tl in
  let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in
  let base = match xs with | [] -> 4 | hd::tl -> f (f 2 hd) tl in
  List.fold_left f base xs;;

*)

(* changed spans
(3,2)-(4,42)
let f =
  fun a -> fun x -> a * a in
let base =
  match xs with
  | [] -> 4
  | hd :: tl -> f (f 2 hd) tl in
List.fold_left f base xs
LetG NonRec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(3,18)-(3,67)
a
VarG

(3,18)-(3,67)
a
VarG

(3,18)-(3,67)
a * a
BopG VarG VarG

(3,18)-(3,67)
let base =
  match xs with
  | [] -> 4
  | hd :: tl -> f (f 2 hd) tl in
List.fold_left f base xs
LetG NonRec (fromList [CaseG EmptyG (fromList [(Nothing,EmptyG)])]) (AppG (fromList [EmptyG]))

(3,40)-(3,41)
4
LitG

(3,59)-(3,60)
2
LitG

*)
