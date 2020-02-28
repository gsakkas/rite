
let pipe fs =
  let f a x d = a x d in
  let base p = p in List.fold_left f base (List.rev fs);;


(* fix

let pipe fs =
  let f a x d = d in let base p = p in List.fold_left f base (List.rev fs);;

*)

(* changed spans
(3,17)-(3,22)
d
VarG

*)

(* type error slice
(3,3)-(4,56)
(3,9)-(3,22)
(3,11)-(3,22)
(3,13)-(3,22)
(3,17)-(3,18)
(3,17)-(3,22)
(4,21)-(4,35)
(4,21)-(4,56)
(4,36)-(4,37)
*)
