
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b then (true, (failwith "asd")) else failwith "asd"), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(6,24)-(6,48)
(6,25)-(6,29)
(6,32)-(6,40)
(6,41)-(6,46)
(6,54)-(6,62)
(6,54)-(6,68)
(6,63)-(6,68)
*)

(* type error slice
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(5,2)-(5,8)
(5,2)-(6,73)
(6,4)-(6,73)
(6,5)-(6,69)
(6,24)-(6,48)
*)
