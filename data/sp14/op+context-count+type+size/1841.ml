
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
(6,28)-(6,53)
(6,29)-(6,49)
(6,30)-(6,35)
(6,31)-(6,32)
(6,33)-(6,34)
(6,37)-(6,48)
(6,38)-(6,43)
(6,41)-(6,42)
(6,46)-(6,47)
(6,51)-(6,52)
*)

(* type error slice
(3,25)-(3,26)
(3,25)-(3,28)
(4,18)-(4,24)
(4,18)-(4,36)
(4,25)-(4,36)
(4,26)-(4,27)
(6,21)-(6,27)
(6,21)-(6,53)
(6,28)-(6,53)
(6,29)-(6,49)
*)
