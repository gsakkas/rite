
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    (let fin (f',b') = let nfb = f' b' in (nfb, (nfb = b')) in
     ((fin (f, b)), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fin bt = (bt, ((f bt) = bt)) in (fin, b));;

*)

(* changed spans
(6,4)-(7,23)
(6,14)-(6,59)
(6,23)-(6,59)
(6,33)-(6,35)
(6,33)-(6,38)
(6,36)-(6,38)
(6,42)-(6,59)
(6,43)-(6,46)
(6,49)-(6,52)
(6,55)-(6,57)
(7,5)-(7,22)
(7,20)-(7,21)
*)

(* type error slice
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(5,2)-(5,8)
(5,2)-(7,23)
(6,4)-(7,23)
(6,4)-(7,23)
(6,14)-(6,59)
(6,23)-(6,59)
(6,42)-(6,59)
(7,5)-(7,22)
(7,6)-(7,18)
(7,7)-(7,10)
*)
