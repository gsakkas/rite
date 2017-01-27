
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b then ((failwith "asd"), true) else failwith "asd"), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(6,27)-(6,35)
(6,27)-(6,48)
(6,36)-(6,41)
(6,44)-(6,48)
(6,55)-(6,63)
(6,55)-(6,69)
(6,64)-(6,69)
*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,40)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,65)
(2,64)-(2,69)
(2,67)-(2,69)
(5,3)-(5,9)
(5,3)-(6,73)
(6,7)-(6,69)
(6,7)-(6,73)
(6,27)-(6,48)
(6,44)-(6,48)
(6,72)-(6,73)
*)
