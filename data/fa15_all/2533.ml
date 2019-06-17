
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
      match a with
      | [] -> []
      | h::t ->
          let (j,k) = h in
          if (j + k) > 10
          then (j = (1 k)) = ((j + k) - 10)
          else (j = (0 k)) = ((j + k) - 10) in
    let base = (0, 0) in
    let args = List.combine (clone l1 (List.length l2)) in
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
(16,7)-(22,44)
let (x1 , x2) = x in
let (a1 , a2) = a in
if (x1 + x2) > 10
then (1 , (((x1 + x2) + a1) - 10) :: a2)
else (0 , ((x1 + x2) + a1) :: a2)
LetG NonRec [(TuplePatG (fromList [EmptyPatG]),VarG)] (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

(23,20)-(23,21)
[]
ListG []

(24,16)-(24,56)
List.rev (List.combine l1 l2)
AppG [AppG [EmptyG,EmptyG]]

*)

(* type error slice
(4,4)-(8,60)
(4,13)-(8,58)
(4,16)-(8,58)
(5,3)-(8,58)
(6,3)-(8,58)
(7,18)-(7,23)
(7,18)-(7,32)
(7,24)-(7,25)
(8,8)-(8,58)
(8,41)-(8,57)
(8,42)-(8,52)
(8,47)-(8,48)
(14,3)-(26,35)
(14,12)-(25,52)
(15,5)-(25,52)
(15,11)-(22,44)
(16,7)-(22,44)
(16,13)-(16,14)
(17,15)-(17,17)
(19,11)-(22,44)
(20,11)-(22,44)
(21,16)-(21,27)
(21,16)-(21,44)
(21,21)-(21,26)
(21,22)-(21,23)
(21,30)-(21,44)
(22,16)-(22,27)
(22,16)-(22,44)
(22,21)-(22,26)
(22,22)-(22,23)
(22,30)-(22,44)
(23,5)-(25,52)
(23,16)-(23,22)
(24,29)-(24,56)
(24,30)-(24,35)
(24,36)-(24,38)
(25,19)-(25,33)
(25,19)-(25,45)
(25,34)-(25,35)
(25,36)-(25,40)
(26,14)-(26,35)
(26,15)-(26,18)
(26,19)-(26,34)
(26,20)-(26,27)
*)
