
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
  let f' aa xx = List.append aa (mulByDigit xx l1) in
  let base' = [[]] in
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
(9,37)-(9,75)
(9,40)-(9,41)
(9,40)-(9,45)
(9,44)-(9,45)
(9,51)-(9,61)
(9,51)-(9,63)
(9,69)-(9,70)
(9,69)-(9,75)
(23,4)-(29,66)
(23,20)-(29,64)
(23,22)-(29,64)
(24,3)-(29,64)
(27,3)-(29,64)
(28,3)-(29,64)
(29,3)-(29,64)
(29,50)-(29,60)
(29,50)-(29,64)
(36,3)-(39,50)
(36,10)-(36,51)
(36,18)-(36,29)
(36,18)-(36,51)
(36,30)-(36,32)
(36,33)-(36,51)
(36,34)-(36,44)
(37,3)-(39,50)
(37,15)-(37,19)
(37,16)-(37,18)
(38,14)-(38,28)
(38,14)-(38,40)
(38,29)-(38,31)
(38,32)-(38,37)
*)
