
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) = wwhile (let xx = (b * b) * b in ((xx, (xx < 100)), b));;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile ((let d x = let xx = f b in (xx, (xx = b)) in d), b);;

*)

(* changed spans
(6,30)-(6,74)
(6,40)-(6,41)
(6,40)-(6,45)
(6,40)-(6,50)
(6,44)-(6,45)
(6,49)-(6,50)
(6,56)-(6,69)
(6,61)-(6,69)
(6,66)-(6,69)
*)

(* type error slice
(3,14)-(3,15)
(3,14)-(3,17)
(4,41)-(4,47)
(4,41)-(4,57)
(4,49)-(4,50)
(4,49)-(4,57)
(6,22)-(6,28)
(6,22)-(6,74)
(6,30)-(6,74)
(6,56)-(6,69)
(6,56)-(6,74)
*)
