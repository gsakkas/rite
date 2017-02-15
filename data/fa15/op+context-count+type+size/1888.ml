
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
  let f a x = (0, (bigAdd ((mulByDigit x l2) a))) in
  let base = (0, [0]) in
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
(37,14)-(37,49)
(37,15)-(37,16)
(37,18)-(37,48)
(37,19)-(37,25)
(37,26)-(37,47)
(37,27)-(37,44)
(37,45)-(37,46)
(38,2)-(39,66)
(38,13)-(38,21)
(38,14)-(38,15)
(38,18)-(38,19)
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
(5,3)-(13,43)
(5,12)-(13,41)
(5,15)-(13,41)
(12,14)-(12,40)
(12,35)-(12,36)
(12,37)-(12,39)
(20,3)-(29,36)
(20,11)-(29,34)
(20,14)-(29,34)
(29,18)-(29,33)
(29,19)-(29,26)
(29,30)-(29,32)
(34,37)-(34,43)
(34,37)-(34,68)
(34,46)-(34,68)
(34,47)-(34,57)
(37,2)-(39,66)
(37,8)-(37,49)
(37,10)-(37,49)
(37,14)-(37,49)
(37,18)-(37,48)
(37,19)-(37,25)
(37,26)-(37,47)
(37,27)-(37,44)
(37,28)-(37,38)
(38,2)-(39,66)
(38,13)-(38,21)
(38,17)-(38,20)
(39,33)-(39,47)
(39,33)-(39,59)
(39,48)-(39,49)
(39,50)-(39,54)
*)
