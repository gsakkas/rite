
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = ([0], [0]) in
    let args = ([List.rev (List.hd l1)], [List.rev (List.hd l2)]) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x',x'') = x in
      let (c,s) = a in
      ((((c + x') + x'') / 10), ((((c + x') + x'') mod 10) :: s)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,17)-(15,45)
let (x' , x'') = x in
let (c , s) = a in
(((c + x') + x'') / 10 , (((c + x') + x'') mod 10) :: s)
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),VarG)]) (LetG NonRec (fromList [(TuplePatG (fromList [EmptyPatG]),EmptyG)]) EmptyG)

(16,17)-(16,20)
0
LitG

(16,22)-(16,25)
[]
ListG (fromList [])

(17,16)-(17,66)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(3,45)-(3,46)
(3,45)-(3,67)
(3,50)-(3,67)
(3,51)-(3,56)
(3,57)-(3,58)
(5,4)-(8,70)
(5,17)-(8,68)
(5,20)-(8,68)
(6,3)-(8,68)
(7,14)-(7,61)
(7,15)-(7,20)
(7,21)-(7,22)
(8,8)-(8,68)
(8,9)-(8,63)
(8,10)-(8,57)
(8,11)-(8,16)
(8,58)-(8,59)
(14,3)-(19,35)
(14,12)-(18,52)
(17,5)-(18,52)
(17,16)-(17,66)
(17,18)-(17,26)
(17,18)-(17,39)
(17,27)-(17,39)
(17,28)-(17,35)
(17,36)-(17,38)
(18,19)-(18,33)
(18,19)-(18,45)
(18,41)-(18,45)
(19,14)-(19,35)
(19,15)-(19,18)
(19,19)-(19,34)
(19,20)-(19,27)
*)
