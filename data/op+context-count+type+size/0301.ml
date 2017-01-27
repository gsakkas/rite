
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
(43,16)-(43,18)
*)

(* type error slice
(35,5)-(45,52)
(35,11)-(42,58)
(35,13)-(42,58)
(36,7)-(42,58)
(36,28)-(36,29)
(37,7)-(42,58)
(37,21)-(37,22)
(38,7)-(42,58)
(39,7)-(42,58)
(39,22)-(39,30)
(40,7)-(42,58)
(41,16)-(41,24)
(41,16)-(41,48)
(41,26)-(41,48)
(41,27)-(41,35)
(43,5)-(45,52)
(43,16)-(43,18)
(44,5)-(45,52)
(44,16)-(44,24)
(44,16)-(44,44)
(44,26)-(44,38)
(44,26)-(44,44)
(44,39)-(44,41)
(44,42)-(44,44)
(45,19)-(45,33)
(45,19)-(45,45)
(45,34)-(45,35)
(45,36)-(45,40)
(45,41)-(45,45)
*)
