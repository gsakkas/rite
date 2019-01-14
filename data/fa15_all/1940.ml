
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (x1,x2) = x in x1 + x2 in
    let base = [(0, 0)] List.combine l1 l2 in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,35)-(17,37)
x1 + x2
BopG VarG VarG

(17,35)-(17,42)
a
VarG

(17,35)-(17,42)
((x1 + x2) + carry) / 10
BopG (BopG EmptyG EmptyG) LitG

(17,35)-(17,42)
let (carry , res) = a in
(((x1 + x2) + carry) / 10 , (((x1 + x2) + carry) mod 10) :: res)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(17,35)-(17,42)
(((x1 + x2) + carry) / 10 , (((x1 + x2) + carry) mod 10) :: res)
TupleG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(18,4)-(20,51)
carry
VarG

(18,4)-(20,51)
x1
VarG

(18,4)-(20,51)
x2
VarG

(18,4)-(20,51)
carry
VarG

(18,4)-(20,51)
res
VarG

(18,4)-(20,51)
((x1 + x2) + carry) mod 10
BopG (BopG EmptyG EmptyG) LitG

(18,4)-(20,51)
(x1 + x2) + carry
BopG (BopG EmptyG EmptyG) VarG

(18,4)-(20,51)
x1 + x2
BopG VarG VarG

(18,4)-(20,51)
10
LitG

(18,4)-(20,51)
10
LitG

(18,4)-(20,51)
(((x1 + x2) + carry) mod 10) :: res
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) VarG) LitG]))) Nothing

(18,40)-(18,42)
[]
ListG EmptyG Nothing

*)
