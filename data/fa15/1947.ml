
let bigMul l1 l2 =
  let f a x = failwith "to be implemented" in
  let base = [] in
  let args = List.rev l2 in
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
(3,15)-(3,43)
let (x1 , x2) = x in
let (carry , res) = a in
(carry @ [0] , bigAdd (mulByDigit x1
                                  x2 @ carry) res)
LetG NonRec [(TuplePatG (fromList [EmptyPatG]),VarG)] (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

(4,14)-(4,16)
([] , [])
TupleG [ListG [],ListG []]

(5,23)-(5,25)
helper l1 l2
AppG [VarG,VarG]

(6,3)-(6,64)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec [(TuplePatG (fromList [EmptyPatG]),AppG [EmptyG,EmptyG,EmptyG])] VarG

*)

(* type error slice
(4,3)-(6,64)
(4,14)-(4,16)
(6,3)-(6,64)
(6,21)-(6,35)
(6,21)-(6,47)
(6,38)-(6,42)
*)
