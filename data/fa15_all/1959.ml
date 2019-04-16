
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
  let f a x = match x with | [] -> [] | h::t -> bigAdd (mulByDigit h l1) t in
  let base = [] in
  let args = tenEx 0 l2 in let res = List.fold_left f base args in res;;


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

(40,15)-(40,75)
let (x1 , x2) = x in
let (carry , res) = a in
(carry @ [0] , bigAdd (mulByDigit x1
                                  x2 @ carry) res)
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),VarG)]) (LetG NonRec (fromList [(TuplePatG (fromList [EmptyPatG]),EmptyG)]) EmptyG)

(41,14)-(41,16)
([] , [])
TupleG (fromList [ListG (fromList [])])

(42,14)-(42,24)
List.rev (helper l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(42,28)-(42,71)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG,WildPatG]),AppG (fromList [EmptyG]))]) VarG

*)

(* type error slice
(37,37)-(37,54)
(37,37)-(37,73)
(37,38)-(37,43)
(37,55)-(37,56)
(37,57)-(37,73)
(37,58)-(37,72)
(40,3)-(42,71)
(40,9)-(40,75)
(40,11)-(40,75)
(40,15)-(40,75)
(40,21)-(40,22)
(42,3)-(42,71)
(42,14)-(42,19)
(42,14)-(42,24)
(42,38)-(42,52)
(42,38)-(42,64)
(42,53)-(42,54)
(42,60)-(42,64)
*)
