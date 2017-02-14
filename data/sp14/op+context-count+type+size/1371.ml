
let pipe fs =
  let f a x d = a x d in
  let base p = p in List.fold_left f base (List.rev fs);;


(* fix

let pipe fs =
  let f a x d = d in let base p = p in List.fold_left f base (List.rev fs);;

*)

(* changed spans
(3,16)-(3,17)
(3,16)-(3,21)
(3,18)-(3,19)
(4,2)-(4,55)
*)

(* type error slice
(3,2)-(4,55)
(3,8)-(3,21)
(3,10)-(3,21)
(3,12)-(3,21)
(3,16)-(3,17)
(3,16)-(3,21)
(4,20)-(4,34)
(4,20)-(4,55)
(4,35)-(4,36)
*)
