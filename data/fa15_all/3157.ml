
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
    let f a x =
      let (y,z) = x in let b::b' = y in let c::c' = z in [b + c] @ a in
    let base = [] in
    let args = (l1, l2) in let (_,res) = List.fold_left f base args in res in
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

(25,7)-(25,69)
let (x1 , x2) = x in
([x1 + x2] , [x2])
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),VarG)]) (TupleG (fromList [EmptyG]))

(26,16)-(26,18)
([] , [])
TupleG (fromList [ListG (fromList [])])

(27,16)-(27,24)
List.combine l1 l2
AppG (fromList [VarG])

*)

(* type error slice
(27,5)-(27,75)
(27,16)-(27,24)
(27,42)-(27,56)
(27,42)-(27,68)
(27,64)-(27,68)
*)
