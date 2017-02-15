
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
    let (s,t) = x in
    match a with
    | (r,v) ->
        let sum = intListToInt (mulByDigit (intListToInt l1) [s]) in
        if (sum + r) > 9
        then
          ((intListToInt (carryFunc (mulByDigit (intListToInt l1) [s]))),
            (((sum + r) mod 10) :: v))
        else (0, (((sum + r) mod 10) :: v)) in
  let base = (0, []) in
  let args = (List.rev (List.combine l2 l2)) @ [((0, 0), (0, 0))] in
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
    let (s,t) = x in
    match a with
    | (r,v) ->
        let sum = intListToInt (mulByDigit (intListToInt l1) [s]) in
        if (sum + r) > 9
        then
          ((intListToInt (carryFunc (mulByDigit (intListToInt l1) [s]))),
            (((sum + r) mod 10) :: v))
        else (0, (((sum + r) mod 10) :: v)) in
  let base = (0, []) in
  let args = List.rev (List.combine l2 l2) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(55,13)-(55,65)
(55,45)-(55,46)
(55,47)-(55,65)
(55,48)-(55,64)
(55,49)-(55,55)
(55,50)-(55,51)
(55,53)-(55,54)
(55,57)-(55,63)
(55,61)-(55,62)
*)

(* type error slice
(2,42)-(2,43)
(2,42)-(2,64)
(2,42)-(2,64)
(2,47)-(2,64)
(2,48)-(2,53)
(2,54)-(2,55)
(4,3)-(10,19)
(4,12)-(10,17)
(6,8)-(6,62)
(6,9)-(6,56)
(6,10)-(6,15)
(6,16)-(6,17)
(6,57)-(6,58)
(6,59)-(6,61)
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
(44,2)-(56,49)
(44,8)-(53,43)
(44,10)-(53,43)
(45,4)-(53,43)
(45,16)-(45,17)
(48,31)-(48,65)
(48,32)-(48,42)
(48,61)-(48,64)
(48,61)-(48,64)
(48,62)-(48,63)
(55,2)-(56,49)
(55,13)-(55,65)
(55,45)-(55,46)
(55,47)-(55,65)
(55,47)-(55,65)
(55,48)-(55,64)
(55,49)-(55,55)
(56,16)-(56,30)
(56,16)-(56,42)
(56,31)-(56,32)
(56,38)-(56,42)
*)
