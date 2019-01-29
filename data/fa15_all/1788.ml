
let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | h::t -> f h | [] -> (fun x  -> x) in
  List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | [] -> (fun x  -> x) | h::t -> f (fun x  -> x) h in
  List.fold_left f base fs;;

*)

(* changed spans
(4,13)-(4,62)
match fs with
| [] -> fun x -> x
| h :: t -> f (fun x -> x) h
CaseG VarG (fromList [(Nothing,LamG EmptyG),(Nothing,AppG (fromList [EmptyG]))])

(4,37)-(4,38)
x
VarG

(4,37)-(4,38)
f (fun x -> x) h
AppG (fromList [VarG,LamG EmptyG])

(4,37)-(4,40)
fun x -> x
LamG VarG

(5,2)-(5,26)
h
VarG

*)
