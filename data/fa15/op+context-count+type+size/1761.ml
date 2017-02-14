
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

let bigMul l1 l2 =
  let f a x =
    let (s,t) = x in
    match a with
    | (r,v) ->
        let sum = mulByDigit (int_of_string l1) s in
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
(33,2)-(43,49)
(34,4)-(40,43)
(37,8)-(40,43)
(37,18)-(37,49)
(37,30)-(37,43)
(37,48)-(37,49)
(39,33)-(39,51)
(39,34)-(39,43)
(39,35)-(39,38)
(39,41)-(39,42)
(39,48)-(39,50)
(39,55)-(39,56)
(40,14)-(40,15)
(40,17)-(40,42)
(40,18)-(40,36)
(40,19)-(40,28)
(40,20)-(40,23)
(40,26)-(40,27)
(40,33)-(40,35)
(40,40)-(40,41)
(41,2)-(43,49)
(41,13)-(41,20)
(41,14)-(41,15)
(41,17)-(41,19)
(42,2)-(43,49)
(42,13)-(42,21)
(42,13)-(42,42)
(42,22)-(42,42)
(42,23)-(42,35)
(42,36)-(42,38)
(42,39)-(42,41)
(43,2)-(43,49)
(43,16)-(43,30)
(43,16)-(43,42)
(43,31)-(43,32)
(43,33)-(43,37)
(43,38)-(43,42)
(43,46)-(43,49)
*)

(* type error slice
(4,3)-(10,19)
(4,12)-(10,17)
(4,15)-(10,17)
(9,44)-(9,60)
(9,45)-(9,56)
(9,57)-(9,59)
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
(37,8)-(40,43)
(37,18)-(37,28)
(37,18)-(37,49)
(38,11)-(38,20)
(38,12)-(38,15)
(39,15)-(39,24)
(39,16)-(39,19)
(39,34)-(39,43)
(39,35)-(39,38)
(40,19)-(40,28)
(40,20)-(40,23)
*)
