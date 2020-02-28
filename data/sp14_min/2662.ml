
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    (let f x = let xx = (x * x) * x in (xx, (xx < 512)) in
     ((wwhile (f, 2)), b));;


(* fix

let h x = let xx = (x * x) * x in (xx, (xx < 512));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(6,5)-(7,27)
(h , b)
TupleG [VarG,VarG]

*)

(* type error slice
(2,45)-(2,78)
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(2,67)-(2,69)
(2,76)-(2,78)
(5,3)-(5,9)
(5,3)-(7,27)
(6,5)-(7,27)
(6,12)-(6,56)
(7,6)-(7,26)
(7,7)-(7,22)
(7,8)-(7,14)
(7,15)-(7,21)
(7,16)-(7,17)
(7,19)-(7,20)
*)
