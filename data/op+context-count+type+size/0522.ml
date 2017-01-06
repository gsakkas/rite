
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then ((failwith "Asd"), (failwith "asd"))
      else failwith "asd"), b);;



let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;


(* changed spans
(7,14)-(7,28)
(7,32)-(7,46)
(8,7)-(8,26)
*)

(* type error slice
(7,14)-(7,28)
*)
