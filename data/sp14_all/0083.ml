
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then (((clone 0 (s2 - s1)) @ l1), l2)
  else if s2 < s1 then (l1, ((clone 0 (s1 - s2)) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h != 0 then h :: t else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = (x mod 10) :: a in
    let base = (match l1 with | h -> h) + (match l2 with | h -> h) in
    let args = [] in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then (((clone 0 (s2 - s1)) @ l1), l2)
  else if s2 < s1 then (l1, ((clone 0 (s1 - s2)) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h != 0 then h :: t else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match snd a with
      | [] ->
          (((fst x) + (snd x)),
            [((fst x) + (snd x)) / 10; ((fst x) + (snd x)) mod 10])
      | h::t -> (0, []) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,17)-(16,32)
match snd a with
| [] -> (fst x + snd x , [(fst x + snd x) / 10 ; (fst x + snd x) mod 10])
| h :: t -> (0 , [])
CaseG (AppG (fromList [EmptyG])) (fromList [(ConsPatG VarPatG VarPatG,Nothing,TupleG (fromList [EmptyG])),(ConPatG Nothing,Nothing,TupleG (fromList [EmptyG]))])

(17,16)-(17,67)
(0 , [])
TupleG (fromList [LitG,ListG (fromList [])])

(18,16)-(18,18)
List.combine (List.rev l1)
             (List.rev l2)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(4,4)-(9,72)
(4,13)-(9,70)
(4,16)-(9,70)
(5,3)-(9,70)
(6,3)-(9,70)
(7,3)-(9,70)
(9,8)-(9,70)
(9,29)-(9,55)
(9,50)-(9,51)
(9,52)-(9,54)
(9,62)-(9,70)
(9,67)-(9,69)
(15,3)-(19,35)
(15,12)-(18,69)
(16,5)-(18,69)
(16,11)-(16,32)
(16,17)-(16,32)
(16,31)-(16,32)
(17,5)-(18,69)
(17,16)-(17,67)
(17,43)-(17,67)
(17,50)-(17,52)
(17,65)-(17,66)
(18,36)-(18,50)
(18,36)-(18,62)
(18,51)-(18,52)
(18,53)-(18,57)
(19,14)-(19,35)
(19,15)-(19,18)
(19,19)-(19,34)
(19,20)-(19,27)
*)
