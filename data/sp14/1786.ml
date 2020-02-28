
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
(4,14)-(4,69)
match fs with
| h :: t -> f h h
| [] -> fun x -> x
CaseG VarG [(ConsPatG EmptyPatG EmptyPatG,Nothing,AppG [EmptyG,EmptyG]),(ConPatG Nothing,Nothing,LamG EmptyPatG EmptyG)]

(4,44)-(4,45)
h
VarG

(4,46)-(4,47)
h
VarG

*)

(* type error slice
(4,14)-(4,69)
(4,20)-(4,22)
(4,42)-(4,43)
(4,42)-(4,47)
(4,46)-(4,47)
(5,3)-(5,17)
(5,3)-(5,27)
(5,18)-(5,19)
(5,25)-(5,27)
*)
