
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then ((failwith "Asd"), (failwith "asd"))
      else failwith "asd"), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(7,14)-(7,22)
(7,14)-(7,46)
(7,23)-(7,28)
(7,32)-(7,40)
(7,32)-(7,46)
(7,41)-(7,46)
(8,12)-(8,20)
(8,12)-(8,26)
(8,21)-(8,26)
*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,65)
(2,64)-(2,69)
(5,3)-(5,9)
(5,3)-(8,30)
(6,7)-(8,26)
(6,7)-(8,30)
(7,14)-(7,46)
*)
