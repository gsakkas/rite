
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
        let prod = (mulByDigit (x l)) + o in
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
(31,56)-(31,78)
(31,57)-(31,67)
(34,3)-(45,50)
(34,9)-(40,49)
(34,11)-(40,49)
(37,20)-(37,38)
(37,20)-(37,42)
(37,21)-(37,31)
(37,32)-(37,37)
(37,33)-(37,34)
(42,3)-(45,50)
(43,5)-(44,61)
(43,18)-(43,30)
(43,25)-(43,30)
(44,5)-(44,55)
(44,5)-(44,61)
(44,6)-(44,14)
(44,15)-(44,22)
(44,56)-(44,57)
(45,17)-(45,31)
(45,17)-(45,43)
(45,32)-(45,33)
(45,39)-(45,43)
*)
