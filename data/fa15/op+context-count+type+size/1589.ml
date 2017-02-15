
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      match a with
      | (c,d) ->
          if ((i + j) + c) > 9
          then (1, ((((i + j) + c) mod 10) :: d))
          else (0, ((((i + j) + c) mod 10) :: d)) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let carryFunc p = let z = List.rev p in match z with | h::t -> List.rev t;;

let intListToInt l = int_of_string (sepConcat "" (List.map string_of_int l));;

let rec mulByDigit i l =
  if i > 0 then bigAdd l (mulByDigit (i - 1) l) else [];;

let bigMul l1 l2 =
  let f a x =
    match a with
    | (r,v) ->
        let sum = intListToInt (mulByDigit (intListToInt l1) x) in
        if (sum + r) > 9
        then
          ((intListToInt (carryFunc (mulByDigit (intListToInt l1) x))),
            (((sum + r) mod 10) :: v))
        else (0, (((sum + r) mod 10) :: v)) in
  let base = (0, []) in
  let args = [0; 0; 0; 0; 0; 0; 0] @ l2 in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      match a with
      | (c,d) ->
          if ((i + j) + c) > 9
          then (1, ((((i + j) + c) mod 10) :: d))
          else (0, ((((i + j) + c) mod 10) :: d)) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let carryFunc p = let z = List.rev p in match z with | h::t -> List.rev t;;

let intListToInt l = int_of_string (sepConcat "" (List.map string_of_int l));;

let rec mulByDigit i l =
  if i > 0 then bigAdd l (mulByDigit (i - 1) l) else [];;

let bigMul l1 l2 =
  let f a x =
    match a with
    | (r,v) ->
        let sum = intListToInt (mulByDigit (intListToInt l1) [x]) in
        if (sum + r) > 9
        then
          ((intListToInt (carryFunc (mulByDigit (intListToInt l1) [x]))),
            (((sum + r) mod 10) :: v))
        else (0, (((sum + r) mod 10) :: v)) in
  let base = (0, []) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(47,61)-(47,62)
(50,66)-(50,67)
(54,13)-(54,34)
(54,13)-(54,39)
(54,14)-(54,15)
(54,17)-(54,18)
(54,20)-(54,21)
(54,23)-(54,24)
(54,26)-(54,27)
(54,29)-(54,30)
(54,32)-(54,33)
(54,35)-(54,36)
(55,2)-(55,49)
(55,16)-(55,42)
*)

(* type error slice
(4,3)-(10,19)
(4,12)-(10,17)
(6,38)-(6,54)
(6,39)-(6,50)
(6,51)-(6,53)
(15,3)-(27,36)
(15,11)-(27,34)
(27,18)-(27,33)
(27,19)-(27,26)
(27,27)-(27,29)
(41,16)-(41,22)
(41,16)-(41,47)
(41,23)-(41,24)
(41,25)-(41,47)
(41,26)-(41,36)
(41,45)-(41,46)
(44,2)-(55,49)
(44,8)-(52,43)
(44,10)-(52,43)
(47,31)-(47,63)
(47,32)-(47,42)
(47,61)-(47,62)
(54,2)-(55,49)
(54,13)-(54,34)
(54,13)-(54,34)
(54,13)-(54,39)
(54,14)-(54,15)
(54,35)-(54,36)
(55,16)-(55,30)
(55,16)-(55,42)
(55,31)-(55,32)
(55,38)-(55,42)
*)
