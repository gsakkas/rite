
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
(4,43)-(4,44)
(4,45)-(4,46)
(4,55)-(4,68)
*)

(* type error slice
(4,13)-(4,68)
(4,13)-(4,68)
(4,19)-(4,21)
(4,41)-(4,42)
(4,41)-(4,46)
(4,45)-(4,46)
(5,2)-(5,16)
(5,2)-(5,26)
(5,17)-(5,18)
(5,24)-(5,26)
*)
