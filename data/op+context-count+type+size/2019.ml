
let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) = wwhile (((f b), ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (let y x = let xx = f x in (xx, (xx != x)) in (y, b));;

*)

(* changed spans
(6,32)-(6,33)
(6,32)-(6,35)
(6,32)-(6,48)
(6,32)-(6,53)
(6,34)-(6,35)
(6,40)-(6,43)
(6,40)-(6,48)
(6,42)-(6,43)
(6,47)-(6,48)
(6,52)-(6,53)
*)

(* type error slice
(3,26)-(3,27)
(3,26)-(3,29)
(3,28)-(3,29)
(4,19)-(4,25)
(4,19)-(4,36)
(4,27)-(4,28)
(4,27)-(4,36)
(4,30)-(4,36)
(6,22)-(6,28)
(6,22)-(6,53)
(6,32)-(6,33)
(6,32)-(6,35)
(6,32)-(6,48)
(6,32)-(6,53)
(6,34)-(6,35)
(6,40)-(6,41)
(6,40)-(6,43)
(6,40)-(6,48)
(6,42)-(6,43)
(6,52)-(6,53)
*)
