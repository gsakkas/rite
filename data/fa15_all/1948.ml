
let rec helper x = if x = 0 then 1 else 10 * (helper (x - 1));;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in [carry] @ res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    let carry = i * x in
    match a with
    | h::t -> ((h + carry) / 10) :: ((h + carry) mod 10) :: t
    | _ -> [carry / 10; carry mod 10] in
  let base = [] in removeZero (List.fold_left f base (List.rev l));;

let rec tenEx x y =
  match y with | [] -> [] | h::t -> (tenEx (x + 1) t) @ [(helper x) * h];;

let bigMul l1 l2 =
  let f a x =
    let (x1,x2) = x in
    let (carry,res) = a in
    match x2 with | [] -> [] | h::t -> bigAdd ((mulByDigit h l1), res) in
  let base = (0, []) in
  let args = l1 (tenEx 0 l2) in
  let (carry,res) = List.fold_left f base args in [carry] @ res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in [carry] @ res in
  removeZero (add (padZero l1 l2));;

let rec helper l1 l2 =
  match l1 with | [] -> [] | h::t -> (h, l2) :: (helper t l2);;

let rec mulByDigit i l =
  let f a x =
    let carry = i * x in
    match a with
    | h::t -> ((h + carry) / 10) :: ((h + carry) mod 10) :: t
    | _ -> [carry / 10; carry mod 10] in
  let base = [] in removeZero (List.fold_left f base (List.rev l));;

let bigMul l1 l2 =
  let f a x =
    let (x1,x2) = x in
    let (carry,res) = a in
    ((carry @ [0]), (bigAdd ((mulByDigit x1 x2) @ carry) res)) in
  let base = ([], []) in
  let args = List.rev (helper l1 l2) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(2,16)-(2,62)
EMPTY
EmptyG

(35,1)-(35,1)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
LamG VarPatG (LamG VarPatG EmptyG)

(43,5)-(43,71)
(carry @ [0] , bigAdd (mulByDigit x1
                                  x2 @ carry) res)
TupleG (fromList [AppG (fromList [EmptyG])])

(44,15)-(44,16)
[]
ListG (fromList [])

(45,14)-(45,29)
List.rev (helper l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(46,3)-(46,64)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG,WildPatG]),AppG (fromList [EmptyG]))]) VarG

*)

(* type error slice
(6,4)-(12,20)
(6,13)-(12,18)
(11,41)-(11,57)
(11,42)-(11,53)
(11,54)-(11,56)
(17,4)-(26,37)
(17,12)-(26,35)
(26,19)-(26,34)
(26,20)-(26,27)
(26,28)-(26,30)
(28,4)-(34,69)
(28,20)-(34,67)
(28,22)-(34,67)
(34,54)-(34,66)
(34,55)-(34,63)
(34,64)-(34,65)
(40,3)-(46,64)
(40,9)-(43,71)
(40,11)-(43,71)
(41,5)-(43,71)
(42,5)-(43,71)
(42,23)-(42,24)
(43,5)-(43,71)
(43,27)-(43,29)
(43,40)-(43,46)
(43,40)-(43,71)
(43,47)-(43,71)
(43,48)-(43,65)
(43,49)-(43,59)
(43,62)-(43,64)
(45,14)-(45,16)
(45,14)-(45,29)
(46,21)-(46,35)
(46,21)-(46,47)
(46,36)-(46,37)
*)
