
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diffsize = (List.length l1) - (List.length l2) in
  if diffsize > 0
  then (l1, (List.append (clone 0 diffsize) l2))
  else ((List.append (clone 0 ((-1) * diffsize)) l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (h1::t1,h2::t2) -> ((h1 + h2) / 10) :: ((h1 + h2) mod 10) :: a
      | _ -> a in
    let base = [0] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diffsize = (List.length l1) - (List.length l2) in
  if diffsize > 0
  then (l1, (List.append (clone 0 diffsize) l2))
  else ((List.append (clone 0 ((-1) * diffsize)) l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (h1,h2) -> ((h1 + h2) / 10) :: ((h1 + h2) mod 10) :: a
      | _ -> a in
    let base = [] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,7)-(18,15)
match x with
| (h1 , h2) -> ((h1 + h2) / 10) :: (((h1 + h2) mod 10) :: a)
| _ -> a
CaseG VarG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,ConAppG (Just EmptyG)),(WildPatG,Nothing,VarG)])

(19,16)-(19,19)
[]
ListG (fromList [])

*)

(* type error slice
(2,44)-(2,45)
(2,44)-(2,66)
(2,49)-(2,66)
(2,50)-(2,55)
(2,56)-(2,57)
(4,4)-(8,60)
(4,17)-(8,58)
(4,20)-(8,58)
(5,3)-(8,58)
(6,3)-(8,58)
(7,26)-(7,44)
(7,27)-(7,32)
(7,33)-(7,34)
(8,8)-(8,58)
(8,9)-(8,53)
(8,10)-(8,21)
(8,22)-(8,49)
(8,23)-(8,28)
(14,3)-(22,35)
(14,12)-(21,48)
(15,5)-(21,48)
(15,11)-(18,15)
(15,13)-(18,15)
(16,7)-(18,15)
(16,13)-(16,14)
(20,5)-(21,48)
(20,16)-(20,28)
(20,16)-(20,34)
(20,29)-(20,31)
(21,15)-(21,29)
(21,15)-(21,41)
(21,30)-(21,31)
(21,37)-(21,41)
(22,14)-(22,35)
(22,15)-(22,18)
(22,19)-(22,34)
(22,20)-(22,27)
*)
