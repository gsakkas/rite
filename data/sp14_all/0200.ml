
let rec listReverse l =
  match l with | [] -> 0 | hd::tl -> (listReverse tl) :: hd;;


(* fix

let rec last l = match l with | x::[] -> x | hd::tl -> last tl | [] -> [];;

let rec removeLast l =
  match l with | x::[] -> [] | hd::tl -> hd :: (removeLast tl) | [] -> [];;

let rec listReverse l =
  let x = last l in let y = removeLast l in x :: (listReverse y);;

*)

(* changed spans
(3,3)-(3,60)
let x = last l in
let y = removeLast l in
x :: (listReverse y)
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(3,3)-(3,60)
(3,24)-(3,25)
(3,38)-(3,60)
*)
