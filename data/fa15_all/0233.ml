
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (f, (b = ff)) in (n, b));;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = (f b))) in (n, b));;

*)

(* changed spans
(7,37)-(7,38)
ff
VarG

(7,45)-(7,47)
f b
AppG (fromList [VarG])

(7,53)-(7,59)
f
VarG

(7,53)-(7,59)
b
VarG

*)
