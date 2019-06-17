
let helper (f,b) =
  let x = f b in match b with | x -> (x, (x != b)) | _ -> (x, true);;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;


(* fix

let helper (f,b) = let f b = let x = f b in (x, (x != b)) in f;;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;

*)

(* changed spans
(3,3)-(3,68)
let f =
  fun b ->
    (let x = f b in
     (x , x <> b)) in
f
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] VarG

*)

(* type error slice
(2,4)-(3,70)
(2,13)-(3,68)
(3,3)-(3,68)
(3,18)-(3,68)
(3,59)-(3,68)
(6,15)-(6,16)
(6,15)-(6,18)
(6,60)-(6,66)
(6,60)-(6,73)
(6,67)-(6,73)
(6,68)-(6,69)
(8,22)-(8,28)
(8,22)-(8,49)
(8,29)-(8,49)
(8,30)-(8,45)
(8,31)-(8,37)
*)
