
let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | (b,c)::t -> f b c | [] -> (fun x  -> x) in
  List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | h::t -> f h h | [] -> (fun x  -> x) in
  List.fold_left f base fs;;

*)

(* changed spans
(4,13)-(4,68)
match fs with
| h :: t -> f h h
| [] -> fun x -> x
CaseG VarG [(Nothing,AppG [EmptyG,EmptyG]),(Nothing,LamG EmptyG)]

(4,45)-(4,46)
h
VarG

(4,55)-(4,68)
h
VarG

*)
