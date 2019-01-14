
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> [x] @ (clone x (n - 1)));;

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
    let f a x = l2 in
    let base = [] in
    let args = l1 in let (_,res) = List.fold_left f base args in res in
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
(3,45)-(3,48)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG,BopG VarG LitG])]))) Nothing

(22,16)-(22,18)
let (x1 , x2) = x in
([x1 + x2] , [x2])
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(23,4)-(24,68)
x
VarG

(23,4)-(24,68)
x1
VarG

(23,4)-(24,68)
x2
VarG

(23,4)-(24,68)
x2
VarG

(23,4)-(24,68)
x1 + x2
BopG VarG VarG

(23,4)-(24,68)
([x1 + x2] , [x2])
TupleG (fromList [ListG EmptyG Nothing])

(23,4)-(24,68)
[x1 + x2]
ListG (BopG EmptyG EmptyG) Nothing

(23,4)-(24,68)
[x2]
ListG VarG Nothing

(23,15)-(23,17)
([] , [])
TupleG (fromList [ListG EmptyG Nothing])

(24,4)-(24,68)
[]
ListG EmptyG Nothing

(24,15)-(24,17)
List.combine
VarG

(24,15)-(24,17)
List.combine l1 l2
AppG (fromList [VarG])

(24,21)-(24,68)
l2
VarG

*)
