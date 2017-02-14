
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

let rec mulByDigit i l =
  if i > 0 then bigAdd l (mulByDigit (i - 1) l) else [];;

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let bigMul l1 l2 =
  let f a x =
    let (s,t) = x in
    match a with
    | (r,v) ->
        let sum =
          int_of_string
            (sepConcat " " (mulByDigit (int_of_string (sepConcat "" l1)) s)) in
        if (sum + r) > 9
        then (((sum + r) / 10), (((sum + r) mod 10) :: v))
        else (0, (((sum + r) mod 10) :: v)) in
  let base = (0, []) in
  let args = List.rev (List.combine l2 l2) in
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
        then (((sum + r) / 10), (((sum + r) mod 10) :: v))
        else (0, (((sum + r) mod 10) :: v)) in
  let base = (0, []) in
  let args = List.combine l2 l2 in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(29,20)-(30,56)
(29,22)-(30,56)
(30,3)-(30,56)
(30,6)-(30,7)
(30,6)-(30,11)
(30,10)-(30,11)
(30,17)-(30,23)
(30,17)-(30,47)
(30,24)-(30,25)
(30,27)-(30,37)
(30,27)-(30,47)
(30,39)-(30,40)
(30,39)-(30,44)
(30,43)-(30,44)
(30,46)-(30,47)
(30,54)-(30,56)
(36,7)-(37,59)
(37,7)-(37,59)
(37,23)-(37,59)
(39,12)-(52,50)
(40,3)-(52,50)
(41,5)-(49,42)
(44,9)-(49,42)
(45,11)-(45,24)
(46,14)-(46,23)
(46,14)-(46,75)
(46,24)-(46,27)
(46,41)-(46,54)
(46,56)-(46,65)
(46,56)-(46,71)
(46,66)-(46,68)
(46,74)-(46,75)
(51,14)-(51,22)
(51,14)-(51,42)
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
(4,16)-(10,17)
(6,11)-(6,16)
(6,11)-(6,54)
(6,17)-(6,18)
(9,17)-(9,22)
(9,17)-(9,60)
(9,17)-(9,68)
(9,64)-(9,65)
(9,66)-(9,68)
(15,4)-(27,37)
(15,12)-(27,33)
(15,15)-(27,33)
(27,20)-(27,27)
(27,20)-(27,33)
(27,31)-(27,33)
(30,17)-(30,23)
(30,17)-(30,47)
(30,27)-(30,37)
(30,27)-(30,47)
(32,4)-(37,61)
(32,19)-(37,59)
(32,23)-(37,59)
(33,3)-(37,59)
(33,3)-(37,59)
(33,9)-(33,11)
(36,7)-(37,59)
(36,13)-(36,31)
(36,19)-(36,20)
(36,19)-(36,31)
(36,21)-(36,22)
(37,7)-(37,59)
(37,18)-(37,19)
(37,36)-(37,50)
(37,36)-(37,59)
(37,51)-(37,52)
(37,53)-(37,57)
(46,14)-(46,23)
(46,14)-(46,75)
(46,29)-(46,39)
(46,29)-(46,75)
*)
