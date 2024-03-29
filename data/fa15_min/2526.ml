
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
    let f a x = a + x in
    let base = 0 in
    let args = List.combine (l1 l2) in
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
(15,17)-(15,22)
let (x1 , x2) = x in
let (a1 , a2) = a in
if (x1 + x2) > 10
then (1 , (((x1 + x2) + a1) - 10) :: a2)
else (0 , ((x1 + x2) + a1) :: a2)
LetG NonRec [(TuplePatG (fromList [EmptyPatG]),VarG)] (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

(16,16)-(16,17)
(0 , [])
TupleG [LitG,ListG []]

(17,16)-(17,36)
List.rev (List.combine l1 l2)
AppG [AppG [EmptyG,EmptyG]]

*)

(* type error slice
(4,4)-(8,60)
(4,13)-(8,58)
(4,16)-(8,58)
(5,3)-(8,58)
(6,3)-(8,58)
(8,8)-(8,58)
(8,41)-(8,57)
(8,42)-(8,52)
(8,47)-(8,48)
(14,3)-(19,35)
(14,12)-(18,52)
(17,5)-(18,52)
(17,16)-(17,28)
(17,16)-(17,36)
(17,29)-(17,36)
(17,30)-(17,32)
(18,19)-(18,33)
(18,19)-(18,45)
(18,41)-(18,45)
(19,14)-(19,35)
(19,15)-(19,18)
(19,19)-(19,34)
(19,20)-(19,27)
*)
