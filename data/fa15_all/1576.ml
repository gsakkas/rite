
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then clone l1 ((List.length l2) - (List.length l1))
  else clone l2 ((List.length l1) - (List.length l2));;

let rec removeZero l = failwith "to be implemented";;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = failwith "to be implemented" in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | h::t -> if h = 0 then removeZero t else l | _ -> [];;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + sum) / 10) :: ((h + sum) mod 10) :: t
      | _ -> [sum / 10; sum mod 10] in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(6,8)-(6,54)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(7,8)-(7,54)
if List.length l1 > List.length l2
then (l1 , clone 0
                 (List.length l1 - List.length l2) @ l2)
else (l1 , l2)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(9,24)-(9,52)
match l with
| h :: t -> if h = 0
            then removeZero t
            else l
| _ -> []
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,IteG EmptyG EmptyG EmptyG),(WildPatG,Nothing,ListG (fromList []))])

(13,17)-(13,45)
let sum = fst x + snd x in
match a with
| h :: t -> ((h + sum) / 10) :: (((h + sum) mod 10) :: t)
| _ -> [sum / 10 ; sum mod 10]
LetG NonRec (fromList [(VarPatG,BopG EmptyG EmptyG)]) (CaseG EmptyG (fromList [(ConsPatG EmptyPatG EmptyPatG,Nothing,EmptyG),(WildPatG,Nothing,EmptyG)]))

(14,16)-(14,44)
[]
ListG (fromList [])

(15,16)-(15,44)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(16,5)-(16,52)
List.fold_left f base args
AppG (fromList [VarG])

*)

(* type error slice
(2,44)-(2,66)
(2,49)-(2,66)
(2,50)-(2,55)
(4,4)-(7,56)
(4,13)-(7,54)
(4,16)-(7,54)
(5,3)-(7,54)
(7,8)-(7,13)
(7,8)-(7,54)
(12,3)-(17,35)
(12,12)-(16,52)
(17,14)-(17,35)
(17,15)-(17,18)
(17,19)-(17,34)
(17,20)-(17,27)
*)
