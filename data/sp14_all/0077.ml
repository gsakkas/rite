
let pipe fs = let f a x c = a in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x c = x (let fn d = d in fn) in
  let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,29)-(2,30)
x (let fn = fun d -> d in fn)
AppG [LetG NonRec [(EmptyPatG,EmptyG)] EmptyG]

*)

(* type error slice
(2,15)-(2,76)
(2,21)-(2,30)
(2,23)-(2,30)
(2,25)-(2,30)
(2,29)-(2,30)
(2,52)-(2,66)
(2,52)-(2,76)
(2,67)-(2,68)
*)
