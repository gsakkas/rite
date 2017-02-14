
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
(55,15)-(55,66)
(55,46)-(55,47)
(55,48)-(55,66)
(55,51)-(55,52)
(55,51)-(55,55)
(55,51)-(55,63)
(55,54)-(55,55)
(55,59)-(55,63)
*)

(* type error slice
(2,43)-(2,44)
(2,43)-(2,63)
(2,43)-(2,63)
(2,49)-(2,54)
(2,49)-(2,63)
(2,55)-(2,56)
(4,4)-(10,20)
(4,13)-(10,17)
(6,11)-(6,16)
(6,11)-(6,54)
(6,11)-(6,62)
(6,17)-(6,18)
(6,58)-(6,59)
(6,60)-(6,62)
(15,4)-(27,37)
(15,12)-(27,33)
(27,20)-(27,27)
(27,20)-(27,33)
(27,28)-(27,30)
(41,17)-(41,23)
(41,17)-(41,47)
(41,24)-(41,25)
(41,27)-(41,37)
(41,27)-(41,47)
(41,46)-(41,47)
(44,3)-(56,50)
(44,9)-(53,42)
(44,11)-(53,42)
(45,5)-(53,42)
(45,17)-(45,18)
(48,33)-(48,43)
(48,33)-(48,65)
(48,62)-(48,65)
(48,62)-(48,65)
(48,63)-(48,64)
(55,3)-(56,50)
(55,15)-(55,66)
(55,46)-(55,47)
(55,48)-(55,66)
(55,48)-(55,66)
(55,51)-(55,55)
(55,51)-(55,63)
(56,17)-(56,31)
(56,17)-(56,43)
(56,32)-(56,33)
(56,39)-(56,43)
*)
