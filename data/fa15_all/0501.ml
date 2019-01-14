
let rec mulByDigit i l =
  let f a x =
    let (carry,acc) = a in
    let res = (x * i) + carry in ((res / 10), ((res mod 10) :: acc)) in
  let base = (0, []) in let args = List.rev in List.fold_left f base args;;


(* fix

let rec mulByDigit i l =
  let f a x =
    let (carry,acc) = a in
    let res = (x * i) + carry in ((res / 10), ((res mod 10) :: acc)) in
  let base = (0, []) in
  let args = List.rev (0 :: l) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(6,35)-(6,43)
List.rev (0 :: l)
AppG (fromList [ConAppG (Just (TupleG (fromList [VarG,LitG]))) Nothing])

(6,47)-(6,73)
l
VarG

(6,47)-(6,73)
0
LitG

(6,47)-(6,73)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

(6,47)-(6,73)
0 :: l
ConAppG (Just (TupleG (fromList [VarG,LitG]))) Nothing

*)
