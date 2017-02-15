
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
        let sum = mulByDigit (intListToInt l1) s in
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
(46,18)-(46,48)
(46,47)-(46,48)
(51,13)-(51,21)
(51,13)-(51,42)
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
(39,16)-(39,22)
(39,16)-(39,47)
(39,25)-(39,47)
(39,26)-(39,36)
(46,8)-(49,43)
(46,18)-(46,28)
(46,18)-(46,48)
(47,11)-(47,20)
(47,12)-(47,15)
(48,15)-(48,24)
(48,16)-(48,19)
(48,34)-(48,43)
(48,35)-(48,38)
(49,19)-(49,28)
(49,20)-(49,23)
*)
