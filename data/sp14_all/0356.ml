
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) @ l2;;

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
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (y,z) ->
          let sum = y + z in
          (match a with
           | h::t -> ((sum + h) / 10) :: ((sum + h) mod 10) :: t
           | _ -> [sum / 10; sum mod 10]) in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(6,8)-(6,60)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(7,8)-(7,60)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,24)-(9,52)
match l with
| [] -> []
| h :: t -> if h = 0
            then removeZero t
            else l
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,IteG EmptyG EmptyG EmptyG),(ConPatG Nothing,Nothing,ListG (fromList []))])

(13,17)-(13,45)
match x with
| (y , z) -> (let sum =
                y + z in
              match a with
              | h :: t -> ((sum + h) / 10) :: (((sum + h) mod 10) :: t)
              | _ -> [sum / 10 ; sum mod 10])
CaseG VarG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)])

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
(4,4)-(7,62)
(4,13)-(7,60)
(4,16)-(7,60)
(5,3)-(7,60)
(7,8)-(7,60)
(7,56)-(7,57)
(12,3)-(17,35)
(12,12)-(16,52)
(17,14)-(17,35)
(17,15)-(17,18)
(17,19)-(17,34)
(17,20)-(17,27)
*)
