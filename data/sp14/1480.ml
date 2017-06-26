
let bigMul l1 l2 =
  let f a x = a :: x in
  let base = (0, []) in
  let args =
    let rec argmaker x y =
      match y with
      | hd::tl -> if tl = [] then [(x, hd)] else (x, hd) :: (argmaker x tl) in
    argmaker l1 l2 in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  match (List.length l1) > (List.length l2) with
  | true  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  | false  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  let rec removeZH templ =
    match templ with
    | [] -> []
    | hd::tl -> if hd = 0 then removeZH tl else hd :: tl in
  removeZH l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (addend_a,addend_b) ->
          let prevcarry = match a with | (x,y) -> x in
          let new_carry = ((prevcarry + addend_a) + addend_b) / 10 in
          let digit = ((prevcarry + addend_a) + addend_b) mod 10 in
          (match a with
           | (x,c::d::y) -> (new_carry, (new_carry :: digit :: d :: y))
           | _ -> (new_carry, [new_carry; digit])) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let comb a b = match b with | [] -> [a] | hd::tl -> List.append [a + hd] tl in
  let rec mBDhelper i x =
    match x with
    | [] -> []
    | hd::tl ->
        if (hd * i) > 9
        then ((hd * i) / 10) :: (comb ((hd * i) mod 10) (mBDhelper i tl))
        else (hd * i) :: (mBDhelper i tl) in
  mBDhelper i l;;

let bigMul l1 l2 =
  let f a x =
    match x with
    | (l2digit,templ1) ->
        let (l2digit2,templ12) = a in
        let multres = mulByDigit l2digit templ1 in
        (0, (bigAdd (templ12 @ [0]) multres)) in
  let base = (0, []) in
  let args =
    let rec argmaker x y =
      match y with
      | [] -> []
      | hd::tl -> if tl = [] then [(hd, x)] else (hd, x) :: (argmaker x tl) in
    argmaker l1 l2 in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(2,11)-(10,49)
(3,2)-(10,49)
(3,14)-(3,15)
(3,14)-(3,20)
(3,19)-(3,20)
(4,2)-(10,49)
(7,6)-(8,75)
(8,18)-(8,75)
(8,36)-(8,37)
(8,49)-(8,75)
(8,50)-(8,51)
(8,60)-(8,75)
*)

(* type error slice
(3,2)-(10,49)
(3,8)-(3,20)
(3,10)-(3,20)
(3,14)-(3,15)
(3,14)-(3,20)
(10,16)-(10,30)
(10,16)-(10,42)
(10,31)-(10,32)
*)

(* all spans
(2,11)-(10,49)
(2,14)-(10,49)
(3,2)-(10,49)
(3,8)-(3,20)
(3,10)-(3,20)
(3,14)-(3,20)
(3,14)-(3,15)
(3,19)-(3,20)
(4,2)-(10,49)
(4,13)-(4,20)
(4,14)-(4,15)
(4,17)-(4,19)
(5,2)-(10,49)
(6,4)-(9,18)
(6,21)-(8,75)
(6,23)-(8,75)
(7,6)-(8,75)
(7,12)-(7,13)
(8,18)-(8,75)
(8,21)-(8,28)
(8,21)-(8,23)
(8,26)-(8,28)
(8,34)-(8,43)
(8,35)-(8,42)
(8,36)-(8,37)
(8,39)-(8,41)
(8,49)-(8,75)
(8,49)-(8,56)
(8,50)-(8,51)
(8,53)-(8,55)
(8,60)-(8,75)
(8,61)-(8,69)
(8,70)-(8,71)
(8,72)-(8,74)
(9,4)-(9,18)
(9,4)-(9,12)
(9,13)-(9,15)
(9,16)-(9,18)
(10,2)-(10,49)
(10,16)-(10,42)
(10,16)-(10,30)
(10,31)-(10,32)
(10,33)-(10,37)
(10,38)-(10,42)
(10,46)-(10,49)
*)
