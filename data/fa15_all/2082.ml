
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = (clone 0 ((List.length l1) - (List.length l2))) @ l2 in
       (l1, y))
    else
      (let z = (clone 0 ((List.length l2) - (List.length l1))) @ l1 in
       (z, l2));;

let rec removeZero l =
  match l with | x::xs -> if x = 0 then removeZero xs else l | [] -> [];;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "tba" in
    let base = [] in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = (clone 0 ((List.length l1) - (List.length l2))) @ l2 in
       (l1, y))
    else
      (let z = (clone 0 ((List.length l2) - (List.length l1))) @ l1 in
       (z, l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (d1,d2) ->
          (match a with
           | (carry,result) ->
               if ((d1 + d2) + carry) > 9
               then (1, ((((d1 + d2) + 1) - 10) :: result))
               else (0, ((d1 + d2) :: result))) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,2)-(17,71)
match l with
| [] -> []
| h :: t -> if h = 0
            then removeZero t
            else l
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,ListG EmptyG Nothing)])

(17,26)-(17,60)
[]
ListG EmptyG Nothing

(17,29)-(17,30)
h
VarG

(17,51)-(17,53)
t
VarG

(21,25)-(21,30)
match x with
| (d1 , d2) -> match a with
               | (carry , result) -> if ((d1 + d2) + carry) > 9
                                     then (1 , (((d1 + d2) + 1) - 10) :: result)
                                     else (0 , (d1 + d2) :: result)
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(22,4)-(24,51)
x
VarG

(22,4)-(24,51)
a
VarG

(22,4)-(24,51)
d1
VarG

(22,4)-(24,51)
d2
VarG

(22,4)-(24,51)
carry
VarG

(22,4)-(24,51)
d1
VarG

(22,4)-(24,51)
d2
VarG

(22,4)-(24,51)
result
VarG

(22,4)-(24,51)
d1
VarG

(22,4)-(24,51)
d2
VarG

(22,4)-(24,51)
result
VarG

(22,4)-(24,51)
(d1 + d2) + carry
BopG (BopG EmptyG EmptyG) VarG

(22,4)-(24,51)
((d1 + d2) + carry) > 9
BopG (BopG EmptyG EmptyG) LitG

(22,4)-(24,51)
d1 + d2
BopG VarG VarG

(22,4)-(24,51)
((d1 + d2) + 1) - 10
BopG (BopG EmptyG EmptyG) LitG

(22,4)-(24,51)
(d1 + d2) + 1
BopG (BopG EmptyG EmptyG) LitG

(22,4)-(24,51)
d1 + d2
BopG VarG VarG

(22,4)-(24,51)
d1 + d2
BopG VarG VarG

(22,4)-(24,51)
9
LitG

(22,4)-(24,51)
1
LitG

(22,4)-(24,51)
1
LitG

(22,4)-(24,51)
10
LitG

(22,4)-(24,51)
0
LitG

(22,4)-(24,51)
if ((d1 + d2) + carry) > 9
then (1 , (((d1 + d2) + 1) - 10) :: result)
else (0 , (d1 + d2) :: result)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(22,4)-(24,51)
match a with
| (carry , result) -> if ((d1 + d2) + carry) > 9
                      then (1 , (((d1 + d2) + 1) - 10) :: result)
                      else (0 , (d1 + d2) :: result)
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

(22,4)-(24,51)
(1 , (((d1 + d2) + 1) - 10) :: result)
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) LitG) LitG]))) Nothing])

(22,4)-(24,51)
(0 , (d1 + d2) :: result)
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG VarG]))) Nothing])

(22,4)-(24,51)
(((d1 + d2) + 1) - 10) :: result
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG VarG VarG) LitG) LitG]))) Nothing

(22,4)-(24,51)
(d1 + d2) :: result
ConAppG (Just (TupleG (fromList [VarG,BopG VarG VarG]))) Nothing

(22,15)-(22,17)
0
LitG

(22,15)-(22,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(23,15)-(23,43)
List.combine
VarG

(23,15)-(23,43)
List.combine (List.rev l1)
             (List.rev l2)
AppG (fromList [AppG (fromList [EmptyG])])

(23,24)-(23,43)
List.rev
VarG

(24,4)-(24,51)
l1
VarG

(24,4)-(24,51)
List.rev
VarG

(24,4)-(24,51)
l2
VarG

(24,4)-(24,51)
List.rev l2
AppG (fromList [VarG])

*)
