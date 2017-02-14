
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
(29,20)-(30,56)
(33,3)-(43,50)
(34,5)-(40,42)
(37,9)-(40,42)
(37,19)-(37,50)
(37,31)-(37,44)
(37,49)-(37,50)
(39,36)-(39,39)
(39,36)-(39,43)
(39,36)-(39,51)
(39,42)-(39,43)
(39,49)-(39,51)
(39,56)-(39,57)
(40,15)-(40,16)
(40,21)-(40,24)
(40,21)-(40,28)
(40,21)-(40,36)
(40,21)-(40,42)
(40,27)-(40,28)
(40,34)-(40,36)
(40,41)-(40,42)
(41,3)-(43,50)
(41,15)-(41,16)
(41,15)-(41,20)
(41,18)-(41,20)
(42,3)-(43,50)
(42,14)-(42,22)
(42,14)-(42,42)
(42,24)-(42,36)
(42,24)-(42,42)
(42,37)-(42,39)
(42,40)-(42,42)
(43,3)-(43,50)
(43,17)-(43,31)
(43,17)-(43,43)
(43,32)-(43,33)
(43,34)-(43,38)
(43,39)-(43,43)
(43,47)-(43,50)
*)

(* type error slice
(4,4)-(10,20)
(4,13)-(10,17)
(4,16)-(10,17)
(9,46)-(9,57)
(9,46)-(9,60)
(9,58)-(9,60)
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
(37,9)-(40,42)
(37,19)-(37,29)
(37,19)-(37,50)
(38,13)-(38,16)
(38,13)-(38,20)
(39,17)-(39,20)
(39,17)-(39,24)
(39,36)-(39,39)
(39,36)-(39,43)
(40,21)-(40,24)
(40,21)-(40,28)
*)
