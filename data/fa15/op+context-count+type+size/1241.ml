
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
        let prod = o * x in ((10 * o), (bigAdd (mulByDigit prod l1 l))) in
  let base = (1, []) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;


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
    match a with
    | (o,l) ->
        let prod = o * x in ((10 * o), (bigAdd (mulByDigit prod l1) l)) in
  let base = (1, []) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(37,39)-(37,70)
(37,47)-(37,69)
*)

(* type error slice
(4,3)-(11,19)
(4,12)-(11,17)
(4,15)-(11,17)
(7,12)-(7,39)
(7,34)-(7,35)
(7,36)-(7,38)
(16,3)-(28,36)
(16,11)-(28,34)
(16,14)-(28,34)
(28,18)-(28,33)
(28,19)-(28,26)
(28,30)-(28,32)
(31,46)-(31,52)
(31,46)-(31,77)
(31,55)-(31,77)
(31,56)-(31,66)
(34,2)-(39,66)
(34,8)-(37,71)
(34,10)-(37,71)
(35,4)-(37,71)
(37,8)-(37,71)
(37,28)-(37,71)
(37,39)-(37,70)
(37,40)-(37,46)
(37,47)-(37,69)
(37,48)-(37,58)
(38,2)-(39,66)
(38,13)-(38,20)
(38,17)-(38,19)
(39,33)-(39,47)
(39,33)-(39,59)
(39,48)-(39,49)
(39,50)-(39,54)
*)
