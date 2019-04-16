
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
    | (templ1,l2digit) ->
        let multres = mulByDigit l2digit templ1 in
        (0, (bigAdd [a; 0] multres)) in
  let base = ([0], []) in
  let args =
    let rec argmaker x y =
      match y with
      | [] -> []
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
(52,5)-(55,37)
match x with
| (l2digit , templ1) -> (let (l2digit2 , templ12) =
                           a in
                         let multres =
                           mulByDigit l2digit templ1 in
                         (0 , bigAdd (templ12 @ [0])
                                     multres))
CaseG VarG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,LetG NonRec (fromList [(TuplePatG (fromList [EmptyPatG]),EmptyG)]) EmptyG)])

(56,15)-(56,18)
0
LitG

(61,37)-(61,38)
hd
VarG

(61,40)-(61,42)
x
VarG

(61,51)-(61,52)
hd
VarG

(61,54)-(61,56)
x
VarG

*)

(* type error slice
(51,3)-(63,50)
(51,9)-(55,37)
(51,11)-(55,37)
(52,5)-(55,37)
(54,9)-(55,37)
(55,9)-(55,37)
(55,21)-(55,27)
(55,22)-(55,23)
(55,25)-(55,26)
(63,17)-(63,31)
(63,17)-(63,43)
(63,32)-(63,33)
*)
