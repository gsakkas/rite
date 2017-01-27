
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let a = List.length l1 in
  let b = List.length l2 in
  if a = b
  then (l1, l2)
  else
    if a < b
    then (((clone 0 (b - a)) @ l1), l2)
    else (l1, ((clone 0 (a - b)) @ l2));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then padZero (0 :: l1) l2
    else padZero l1 (0 :: l2);;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then padZero (0 :: l1) l2
    else padZero l1 (0 :: l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let c = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + c) / 10) :: (h + (c mod 10)) :: t
      | _ -> [c / 10; c mod 10] in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let a = List.length l1 in
  let b = List.length l2 in
  if a = b
  then (l1, l2)
  else
    if a < b
    then (((clone 0 (b - a)) @ l1), l2)
    else (l1, ((clone 0 (a - b)) @ l2));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then padZero (0 :: l1) l2
    else padZero l1 (0 :: l2);;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then padZero (0 :: l1) l2
    else padZero l1 (0 :: l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,result) = a in
      let (x1,x2) = x in
      let res = (x1 + x2) + carry in
      let newCarry = res / 10 in
      match result with
      | [] -> (newCarry, [newCarry; res mod 10])
      | h::t -> (newCarry, (newCarry :: (res mod 10) :: t)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(36,16)-(36,19)
(36,16)-(36,21)
(36,16)-(36,31)
(36,20)-(36,21)
(36,26)-(36,29)
(36,26)-(36,31)
(36,30)-(36,31)
(37,7)-(39,32)
(38,19)-(38,20)
(38,19)-(38,24)
(38,19)-(38,30)
(38,19)-(38,56)
(38,23)-(38,24)
(38,28)-(38,30)
(38,36)-(38,37)
(38,36)-(38,56)
(38,41)-(38,42)
(38,41)-(38,49)
(38,47)-(38,49)
(38,55)-(38,56)
(39,14)-(39,32)
(39,15)-(39,16)
(39,15)-(39,21)
(39,19)-(39,21)
(39,23)-(39,24)
(39,23)-(39,31)
(40,5)-(42,52)
(40,16)-(40,18)
(43,20)-(43,27)
(43,28)-(43,30)
(43,31)-(43,33)
*)

(* type error slice
(35,5)-(42,52)
(35,11)-(39,32)
(35,13)-(39,32)
(36,7)-(39,32)
(36,16)-(36,19)
(36,16)-(36,21)
(36,20)-(36,21)
(37,7)-(39,32)
(37,13)-(37,14)
(38,19)-(38,56)
(40,5)-(42,52)
(40,16)-(40,18)
(41,5)-(42,52)
(41,16)-(41,24)
(41,16)-(41,44)
(41,26)-(41,38)
(41,26)-(41,44)
(41,39)-(41,41)
(41,42)-(41,44)
(42,5)-(42,52)
(42,19)-(42,33)
(42,19)-(42,45)
(42,34)-(42,35)
(42,36)-(42,40)
(42,41)-(42,45)
*)
