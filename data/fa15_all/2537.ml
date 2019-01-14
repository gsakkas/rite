
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (j,k) -> if (j + k) > 10 then (1, ((j + k) - 10)) else (0, (j + k)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if (x1 + x2) > 10
      then (1, ((((x1 + x2) + a1) - 10) :: a2))
      else (0, (((x1 + x2) + a1) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,6)-(17,75)
let (x1 , x2) = x in
let (a1 , a2) = a in
if (x1 + x2) > 10
then (1 , (((x1 + x2) + a1) - 10) :: a2)
else (0 , ((x1 + x2) + a1) :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(17,17)-(17,75)
a
VarG

(17,17)-(17,75)
let (a1 , a2) = a in
if (x1 + x2) > 10
then (1 , (((x1 + x2) + a1) - 10) :: a2)
else (0 , ((x1 + x2) + a1) :: a2)
LetG NonRec (fromList [VarG]) (IteG EmptyG EmptyG EmptyG)

(17,25)-(17,26)
x1
VarG

(17,30)-(17,32)
x2
VarG

(17,42)-(17,56)
(((x1 + x2) + a1) - 10) :: a2
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) VarG) LitG]))) Nothing

(17,48)-(17,49)
x1 + x2
BopG VarG VarG

(17,53)-(17,55)
x1
VarG

(17,53)-(17,55)
x2
VarG

(17,53)-(17,55)
a1
VarG

(17,63)-(17,75)
a2
VarG

(17,67)-(17,74)
((x1 + x2) + a1) :: a2
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) VarG]))) Nothing

(17,72)-(17,73)
x1 + x2
BopG VarG VarG

(18,4)-(20,51)
x1
VarG

(18,4)-(20,51)
x2
VarG

(18,4)-(20,51)
a1
VarG

(18,4)-(20,51)
a2
VarG

*)
