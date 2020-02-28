
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (o,l) ->
          let sum = x + o in
          if sum < 10 then (0, (sum :: l)) else (1, ((sum - 10) :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      (List.map combine (List.rev (List.combine l1 l2))) @ [0] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0 then [0] else if i = 1 then l else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    match a with
    | (o,l) ->
        let prod = mulByDigit x l in
        if prod < 10
        then (0, (prod :: l))
        else ((prod / 10), ((prod mod 10) :: l)) in
  let base = (0, []) in
  let args =
    let combine (a,b) = a + b in
    (List.map combine (List.rev (List.combine l1 l2))) @ [0] in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (o,l) ->
          let sum = x + o in
          if sum < 10 then (0, (sum :: l)) else (1, ((sum - 10) :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      (List.map combine (List.rev (List.combine l1 l2))) @ [0] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0 then [0] else if i = 1 then l else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    match a with | (o,l) -> ((10 * o), (bigAdd (mulByDigit o l1) l)) in
  let base = (1, []) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(37,9)-(40,49)
(10 * o , bigAdd (mulByDigit o
                             l1) l)
TupleG [BopG EmptyG EmptyG,AppG [EmptyG,EmptyG]]

(41,15)-(41,16)
1
LitG

(43,5)-(44,61)
l2
VarG

*)

(* type error slice
(4,4)-(11,20)
(4,13)-(11,18)
(4,16)-(11,18)
(7,13)-(7,40)
(7,14)-(7,34)
(7,15)-(7,20)
(7,35)-(7,36)
(7,37)-(7,39)
(10,11)-(10,47)
(10,12)-(10,41)
(10,13)-(10,18)
(10,42)-(10,43)
(10,44)-(10,46)
(16,4)-(28,37)
(16,12)-(28,35)
(16,15)-(28,35)
(28,19)-(28,34)
(28,20)-(28,27)
(28,28)-(28,30)
(28,31)-(28,33)
(31,47)-(31,53)
(31,47)-(31,78)
(31,54)-(31,55)
(31,56)-(31,78)
(31,57)-(31,67)
(31,76)-(31,77)
(37,9)-(40,49)
(37,20)-(37,30)
(37,20)-(37,34)
(37,33)-(37,34)
(38,9)-(40,49)
(38,12)-(38,16)
(38,12)-(38,21)
(38,19)-(38,21)
(39,14)-(39,30)
(39,18)-(39,29)
(39,19)-(39,23)
(39,27)-(39,28)
(40,14)-(40,49)
(40,15)-(40,26)
(40,16)-(40,20)
(40,28)-(40,48)
(40,29)-(40,42)
(40,30)-(40,34)
*)
