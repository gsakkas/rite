
let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | h::t -> f h t | [] -> (fun x  -> x) in
  List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | h::t -> f h h | [] -> (fun x  -> x) in
  List.fold_left f base fs;;

*)

(* changed spans
(4,41)-(4,42)
h
VarG

*)
