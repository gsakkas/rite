
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> [x] @ (clone x (n - 1)));;

let c y = y;;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (b::b',c::c') = x in [((b + c), (b + c))] @ a in
    let base = [(0, 0)] in
    let args = padZero l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (x1,x2) = x in ([x1 + x2], [x2]) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(3,46)-(3,69)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [EmptyG])))

(24,17)-(24,66)
let (x1 , x2) = x in
([x1 + x2] , [x2])
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),VarG)]) (TupleG (fromList [EmptyG]))

(25,16)-(25,24)
([] , [])
TupleG (fromList [ListG (fromList [])])

(26,16)-(26,29)
List.combine l1 l2
AppG (fromList [VarG])

*)

(* type error slice
(7,4)-(15,44)
(7,13)-(15,42)
(7,16)-(15,42)
(8,3)-(15,42)
(9,3)-(15,42)
(10,3)-(15,42)
(13,5)-(15,42)
(15,10)-(15,42)
(26,5)-(27,52)
(26,16)-(26,23)
(26,16)-(26,29)
(27,19)-(27,33)
(27,19)-(27,45)
(27,41)-(27,45)
*)
