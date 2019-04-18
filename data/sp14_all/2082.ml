
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
(17,3)-(17,72)
match l with
| [] -> []
| h :: t -> if h = 0
            then removeZero t
            else l
CaseG (fromList [(ConsPatG VarPatG VarPatG,Nothing,IteG EmptyG EmptyG EmptyG),(ConPatG Nothing,Nothing,ListG (fromList []))])

(17,27)-(17,61)
[]
ListG (fromList [])

(17,70)-(17,72)
if h = 0
then removeZero t
else l
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) VarG

(21,17)-(21,31)
match x with
| (d1 , d2) -> match a with
               | (carry , result) -> if ((d1 + d2) + carry) > 9
                                     then (1 , (((d1 + d2) + 1) - 10) :: result)
                                     else (0 , (d1 + d2) :: result)
CaseG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,CaseG (fromList [(TuplePatG (fromList [EmptyPatG]),Nothing,EmptyG)]))])

(22,16)-(22,18)
(0 , [])
TupleG (fromList [LitG,ListG (fromList [])])

(23,16)-(23,44)
List.combine (List.rev l1)
             (List.rev l2)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(22,5)-(24,52)
(22,16)-(22,18)
(24,5)-(24,52)
(24,19)-(24,33)
(24,19)-(24,45)
(24,36)-(24,40)
*)
