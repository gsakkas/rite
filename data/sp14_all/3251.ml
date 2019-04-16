
let t x = x + 1;;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = x in
    let base = failwith "to be implemented" in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let t x = x + 1;;

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
      let carry = match a with | (x,y) -> x in
      match x with
      | (addend_a,addend_b) ->
          let new_carry = ((carry + addend_a) + addend_b) / 10 in
          let digit = ((carry + addend_a) + addend_b) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,17)-(16,18)
let carry =
  match a with
  | (x , y) -> x in
match x with
| (addend_a , addend_b) -> (let new_carry =
                              ((carry + addend_a) + addend_b) / 10 in
                            let digit =
                              ((carry + addend_a) + addend_b) mod 10 in
                            match a with
                            | (x , y) -> (new_carry , digit :: y))
LetG NonRec (fromList [(VarPatG,CaseG EmptyG (fromList [(TuplePatG (fromList [EmptyPatG]),Nothing,EmptyG)]))]) (CaseG EmptyG (fromList [(TuplePatG (fromList [EmptyPatG]),Nothing,EmptyG)]))

(17,16)-(17,44)
(0 , [])
TupleG (fromList [LitG,ListG (fromList [])])

*)

(* type error slice
(4,44)-(4,45)
(4,44)-(4,66)
(4,49)-(4,66)
(4,50)-(4,55)
(4,56)-(4,57)
(6,4)-(9,70)
(6,13)-(9,68)
(6,16)-(9,68)
(7,3)-(9,68)
(8,10)-(8,57)
(8,11)-(8,16)
(8,17)-(8,18)
(9,8)-(9,68)
(9,13)-(9,67)
(9,14)-(9,61)
(9,15)-(9,20)
(9,62)-(9,63)
(12,3)-(12,70)
(12,51)-(12,61)
(12,51)-(12,63)
(12,62)-(12,63)
(15,3)-(20,35)
(15,12)-(19,52)
(16,5)-(19,52)
(16,11)-(16,18)
(16,13)-(16,18)
(16,17)-(16,18)
(17,5)-(19,52)
(18,5)-(19,52)
(18,16)-(18,24)
(18,16)-(18,45)
(18,25)-(18,45)
(18,26)-(18,38)
(18,42)-(18,44)
(19,5)-(19,52)
(19,19)-(19,33)
(19,19)-(19,45)
(19,34)-(19,35)
(19,41)-(19,45)
(19,49)-(19,52)
(20,3)-(20,13)
(20,3)-(20,35)
(20,14)-(20,35)
(20,15)-(20,18)
(20,19)-(20,34)
(20,20)-(20,27)
*)
