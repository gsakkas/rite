
let rec clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | t -> t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let xx = (x1 + x2) + a1 in
      if xx > 9 then (1, ((xx - 10) :: a2)) else (0, (xx :: a2)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec helper i l acc s =
    let l2 = List.rev l in
    match l2 with
    | [] -> s :: acc
    | h::t ->
        let n = (i * h) + s in
        if n > 9
        then helper i t ((n mod 10) :: acc) (n / 10)
        else helper i t (n :: acc) 0 in
  helper i l [] 0;;

let bigMul l1 l2 =
  let f a x =
    let (v,l) = x in
    let (ac,la) = a in
    let mul = mulByDigit v l in
    let shift = mulByDigit mul ac in ((ac * 10), (bigAdd shift la)) in
  let base = (1, []) in
  let args = List.map (fun x  -> (x, (List.rev l2))) l1 in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | t -> t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let xx = (x1 + x2) + a1 in
      if xx > 9 then (1, ((xx - 10) :: a2)) else (0, (xx :: a2)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec helper i l acc s =
    let l2 = List.rev l in
    match l2 with
    | [] -> s :: acc
    | h::t ->
        let n = (i * h) + s in
        if n > 9
        then helper i t ((n mod 10) :: acc) (n / 10)
        else helper i t (n :: acc) 0 in
  helper i l [] 0;;

let bigMul l1 l2 =
  let f a x =
    let (v,l) = x in
    let (ac,la) = a in
    let mul = mulByDigit v l in
    let shift = mulByDigit ac mul in ((ac * 10), (bigAdd shift la)) in
  let base = (1, []) in
  let args = List.map (fun x  -> (x, (List.rev l2))) l1 in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(46,28)-(46,31)
ac
VarG

(46,32)-(46,34)
mul
VarG

*)

(* type error slice
(29,4)-(39,20)
(29,20)-(39,18)
(29,22)-(39,18)
(30,3)-(39,18)
(32,5)-(38,37)
(33,13)-(33,21)
(35,9)-(38,37)
(35,17)-(35,24)
(35,18)-(35,19)
(36,9)-(38,37)
(37,14)-(37,20)
(37,14)-(37,53)
(37,21)-(37,22)
(38,14)-(38,20)
(38,14)-(38,37)
(39,3)-(39,9)
(39,3)-(39,18)
(39,10)-(39,11)
(45,5)-(46,68)
(45,15)-(45,25)
(45,15)-(45,29)
(46,17)-(46,27)
(46,17)-(46,34)
(46,28)-(46,31)
*)
