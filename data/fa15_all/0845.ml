
let padZero l1 l2 = (List.length l1) - (List.length l2);;

let rec removeZero l = failwith "to be implemented";;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = failwith "to be implemented" in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n ->
      if n < 0
      then (((clone 0 (n * (-1))) @ l1), l2)
      else (((clone 0 n) @ l2), l1);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (fst,sec) = x in
      let (fst',sec') =
        if (fst + sec) > 9 then (((fst + sec) - 10), 1) else ((fst + sec), 0) in
      let (carry,digits) = a in
      let (carry',digits') =
        if sec' = 1 then (1, (digits @ [fst'])) else (0, (digits @ [fst'])) in
      (carry', digits') in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(2,21)-(2,56)
match List.length l1 - List.length l2 with
| 0 -> (l1 , l2)
| n -> if n < 0
       then (clone 0
                   (n * (-1)) @ l1 , l2)
       else (clone 0 n @ l2 , l1)
CaseG (fromList [(VarPatG,Nothing,IteG EmptyG EmptyG EmptyG),(LitPatG,Nothing,TupleG (fromList [EmptyG]))])

(4,24)-(4,52)
match l with
| [] -> l
| h :: t -> if h = 0
            then removeZero t
            else l
CaseG (fromList [(ConsPatG VarPatG VarPatG,Nothing,IteG EmptyG EmptyG EmptyG),(ConPatG Nothing,Nothing,VarG)])

(8,17)-(8,45)
let (fst , sec) = x in
let (fst' , sec') =
  if (fst + sec) > 9
  then ((fst + sec) - 10 , 1)
  else (fst + sec , 0) in
let (carry , digits) = a in
let (carry' , digits') =
  if sec' = 1
  then (1 , digits @ [fst'])
  else (0 , digits @ [fst']) in
(carry' , digits')
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),VarG)]) (LetG NonRec (fromList [(TuplePatG (fromList [EmptyPatG]),EmptyG)]) EmptyG)

(9,16)-(9,44)
(0 , [])
TupleG (fromList [LitG,ListG (fromList [])])

(10,16)-(10,44)
List.rev (List.combine l1
                       l2) @ [(0 , 0)]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(2,58)
(2,13)-(2,56)
(2,16)-(2,56)
(2,21)-(2,56)
(7,3)-(12,35)
(7,12)-(11,52)
(12,14)-(12,35)
(12,15)-(12,18)
(12,19)-(12,34)
(12,20)-(12,27)
*)
