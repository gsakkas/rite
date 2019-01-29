
let pipe fs =
  let f a x = match x with | [] -> (fun b  -> b) in
  let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = a (x y) in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,48)
fun y -> a (x y)
LamG (AppG (fromList [EmptyG]))

(3,20)-(3,21)
a
VarG

(3,20)-(3,21)
a (x y)
AppG (fromList [AppG (fromList [EmptyG])])

(3,20)-(3,21)
x y
AppG (fromList [VarG])

(3,35)-(3,48)
y
VarG

(3,35)-(3,48)
let base = fun b -> b in
List.fold_left f base fs
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)
