
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n > 0 then (l1, ((clone 0 n) @ l2)) else (((clone 0 (0 - n)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,accList) = a in
      let (x1,x2) = x in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: accList)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in
    if carry = 1 then 1 :: res else res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    let (carry,accList) = a in
    (((carry + (x * i)) / 10), (((carry + (x * i)) mod 10) :: accList)) in
  let base = (0, []) in
  let newlist = List.rev (0 :: l) in
  let (_,res) = List.fold_left f base newlist in removeZero res;;

let bigMul l1 l2 =
  let f a x =
    let (bit,l) = a in
    let movedList = List.append l [0] in ((bit + 1), (bigAdd movedList x)) in
  let base = (0, []) in
  let f' a x = List.append a (mulByDigit x l1) in
  let base' = [] in
  let args = List.fold_left f' base' l2 in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n > 0 then (l1, ((clone 0 n) @ l2)) else (((clone 0 (0 - n)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,accList) = a in
      let (x1,x2) = x in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: accList)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in
    if carry = 1 then 1 :: res else res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    let (carry,accList) = a in
    (((carry + (x * i)) / 10), (((carry + (x * i)) mod 10) :: accList)) in
  let base = (0, []) in
  let newlist = List.rev (0 :: l) in
  let (_,res) = List.fold_left f base newlist in removeZero res;;

let bigMul l1 l2 =
  let f a x =
    let (ll,accumulate) = a in
    let multed = mulByDigit x l1 in
    let accumulate = List.append accumulate [0] in
    (l1, (bigAdd accumulate multed)) in
  let base = (l1, [0]) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(33,5)-(34,75)
let (ll , accumulate) = a in
let multed =
  mulByDigit x l1 in
let accumulate =
  List.append accumulate [0] in
(l1 , bigAdd accumulate
             multed)
LetG NonRec [(TuplePatG (fromList [EmptyPatG]),VarG)] (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

(35,15)-(35,16)
l1
VarG

(35,18)-(35,20)
[0]
ListG [LitG]

(36,3)-(39,50)
let args = l2 in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec [(VarPatG,VarG)] (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

*)

(* type error slice
(4,4)-(6,79)
(4,13)-(6,77)
(4,16)-(6,77)
(6,22)-(6,40)
(6,35)-(6,36)
(6,37)-(6,39)
(11,4)-(21,37)
(11,12)-(21,35)
(11,15)-(21,35)
(12,3)-(21,35)
(21,3)-(21,13)
(21,3)-(21,35)
(21,19)-(21,34)
(21,20)-(21,27)
(21,31)-(21,33)
(23,4)-(29,66)
(23,20)-(29,64)
(23,22)-(29,64)
(24,3)-(29,64)
(27,3)-(29,64)
(28,3)-(29,64)
(29,3)-(29,64)
(29,50)-(29,60)
(29,50)-(29,64)
(32,3)-(39,50)
(32,9)-(34,75)
(32,11)-(34,75)
(33,5)-(34,75)
(33,19)-(33,20)
(34,5)-(34,75)
(34,21)-(34,32)
(34,21)-(34,38)
(34,33)-(34,34)
(34,35)-(34,38)
(34,36)-(34,37)
(34,42)-(34,75)
(34,54)-(34,74)
(34,55)-(34,61)
(34,72)-(34,73)
(36,3)-(39,50)
(36,10)-(36,47)
(36,16)-(36,27)
(36,16)-(36,47)
(36,28)-(36,29)
(36,30)-(36,47)
(36,31)-(36,41)
(38,3)-(39,50)
(38,14)-(38,28)
(38,14)-(38,40)
(38,29)-(38,31)
(39,17)-(39,31)
(39,17)-(39,43)
(39,32)-(39,33)
(39,39)-(39,43)
*)
