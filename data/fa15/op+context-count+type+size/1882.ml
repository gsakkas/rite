
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (c,a1::a2) = a in
      let v = (x1 + x2) + c in ((v / 10), ([v / 10] @ ([v mod 10] @ a2))) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i < 1
  then []
  else (match i with | 1 -> l | _ -> bigAdd l (mulByDigit (i - 1) l));;

let bigMul l1 l2 =
  let f a x = bigAdd (mulByDigit x l2) a in
  let base = [0] in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (c,a1::a2) = a in
      let v = (x1 + x2) + c in ((v / 10), ([v / 10] @ ([v mod 10] @ a2))) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i < 1
  then []
  else
    (match i with
     | 1 -> l
     | 10 -> l @ [0]
     | _ -> bigAdd l (mulByDigit (i - 1) l));;

let bigMul l1 l2 =
  let f a x =
    let (c,a') = a in
    let m = mulByDigit x l2 in let s = bigAdd m a' in ((c + 1), s) in
  let base = (0, [0]) in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(34,7)-(34,69)
(34,37)-(34,43)
(37,2)-(39,66)
(37,14)-(37,20)
(37,14)-(37,40)
(37,21)-(37,38)
(37,39)-(37,40)
(38,2)-(39,66)
(38,13)-(38,16)
(38,14)-(38,15)
(39,2)-(39,66)
(39,13)-(39,15)
(39,19)-(39,66)
(39,33)-(39,47)
(39,33)-(39,59)
(39,48)-(39,49)
(39,50)-(39,54)
(39,55)-(39,59)
(39,63)-(39,66)
*)

(* type error slice
(18,7)-(18,66)
(18,7)-(18,66)
(18,19)-(18,20)
(18,24)-(18,65)
(18,24)-(18,65)
(18,44)-(18,54)
(18,44)-(18,56)
(18,64)-(18,65)
(20,3)-(29,36)
(20,11)-(29,34)
(20,14)-(29,34)
(21,2)-(29,34)
(29,2)-(29,12)
(29,2)-(29,34)
(37,2)-(39,66)
(37,8)-(37,40)
(37,10)-(37,40)
(37,14)-(37,20)
(37,14)-(37,40)
(39,19)-(39,66)
(39,33)-(39,47)
(39,33)-(39,59)
(39,48)-(39,49)
*)
