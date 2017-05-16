
let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) = wwhile (fun y  -> fun b  -> (((f b), true), b));;


(* fix

let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (let y x = let xx = f x in (xx, (xx != x)) in (y, b));;

*)

(* changed spans
(6,28)-(6,68)
(6,39)-(6,67)
(6,49)-(6,67)
(6,50)-(6,63)
(6,51)-(6,56)
(6,54)-(6,55)
(6,58)-(6,62)
(6,65)-(6,66)
*)

(* type error slice
(4,18)-(4,24)
(4,18)-(4,36)
(4,25)-(4,36)
(6,21)-(6,27)
(6,21)-(6,68)
(6,28)-(6,68)
*)

(* all spans
(2,16)-(4,48)
(3,2)-(4,48)
(3,25)-(3,28)
(3,25)-(3,26)
(3,27)-(3,28)
(4,2)-(4,48)
(4,5)-(4,12)
(4,18)-(4,36)
(4,18)-(4,24)
(4,25)-(4,36)
(4,26)-(4,27)
(4,29)-(4,35)
(4,42)-(4,48)
(6,14)-(6,68)
(6,21)-(6,68)
(6,21)-(6,27)
(6,28)-(6,68)
(6,39)-(6,67)
(6,49)-(6,67)
(6,50)-(6,63)
(6,51)-(6,56)
(6,52)-(6,53)
(6,54)-(6,55)
(6,58)-(6,62)
(6,65)-(6,66)
*)
