
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
(29,19)-(30,55)
(29,21)-(30,55)
(30,2)-(30,55)
(30,5)-(30,6)
(30,5)-(30,10)
(30,9)-(30,10)
(30,16)-(30,22)
(30,16)-(30,47)
(30,23)-(30,24)
(30,25)-(30,47)
(30,26)-(30,36)
(30,37)-(30,44)
(30,38)-(30,39)
(30,42)-(30,43)
(30,45)-(30,46)
(30,53)-(30,55)
(36,6)-(37,58)
(37,6)-(37,58)
(37,22)-(37,58)
(39,11)-(52,49)
(40,2)-(52,49)
(41,4)-(49,43)
(44,8)-(49,43)
(45,10)-(45,23)
(46,12)-(46,76)
(46,13)-(46,22)
(46,23)-(46,26)
(46,40)-(46,53)
(46,54)-(46,71)
(46,55)-(46,64)
(46,65)-(46,67)
(46,73)-(46,74)
(51,13)-(51,21)
(51,13)-(51,42)
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
(4,15)-(10,17)
(6,9)-(6,56)
(6,10)-(6,15)
(6,16)-(6,17)
(9,14)-(9,68)
(9,15)-(9,62)
(9,16)-(9,21)
(9,63)-(9,64)
(9,65)-(9,67)
(15,3)-(27,36)
(15,11)-(27,34)
(15,14)-(27,34)
(27,18)-(27,33)
(27,19)-(27,26)
(27,30)-(27,32)
(30,16)-(30,22)
(30,16)-(30,47)
(30,25)-(30,47)
(30,26)-(30,36)
(32,3)-(37,60)
(32,18)-(37,58)
(32,22)-(37,58)
(33,2)-(37,58)
(33,2)-(37,58)
(33,8)-(33,10)
(36,6)-(37,58)
(36,12)-(36,31)
(36,18)-(36,19)
(36,18)-(36,31)
(36,20)-(36,21)
(37,6)-(37,58)
(37,17)-(37,18)
(37,35)-(37,49)
(37,35)-(37,58)
(37,50)-(37,51)
(37,52)-(37,56)
(46,12)-(46,76)
(46,13)-(46,22)
(46,27)-(46,75)
(46,28)-(46,38)
*)
