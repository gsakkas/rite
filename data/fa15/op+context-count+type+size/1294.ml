
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
(6,6)-(7,22)
(6,15)-(6,58)
(6,24)-(6,58)
(6,34)-(6,36)
(6,34)-(6,39)
(6,37)-(6,39)
(6,44)-(6,47)
(6,44)-(6,58)
(6,50)-(6,53)
(6,56)-(6,58)
(7,8)-(7,22)
(7,21)-(7,22)
*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,65)
(2,64)-(2,69)
(5,3)-(5,9)
(5,3)-(7,22)
(6,6)-(7,22)
(6,6)-(7,22)
(6,15)-(6,58)
(6,24)-(6,58)
(6,44)-(6,58)
(7,8)-(7,11)
(7,8)-(7,17)
(7,8)-(7,22)
*)
