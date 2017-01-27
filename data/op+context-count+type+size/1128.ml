
let rec clone x n =
  let rec helper a x n =
    if n <= 0 then a else (let a' = x :: a in helper a' x (n - 1)) in
  helper [] x n;;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 > length2
  then (l1, (List.append (clone 0 (length1 - length2)) l2))
  else
    if length2 > length1
    then ((List.append (clone 0 (length2 - length1)) l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (o,z) ->
               if ((o + x1) + x2) > 9
               then (1, ((((o + x1) + x2) mod 10) :: z))
               else (0, (((o + x1) + x2) :: z))) in
    let base = (0, []) in
    let args =
      let rec pair acc list1 list2 =
        match (list1, list2) with
        | (h1::t1,h2::t2) -> pair (List.append acc [(h1, h2)]) t1 t2
        | (_,_) -> List.append acc [(0, 0)] in
      pair [] (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec helper acc carry i l =
    match l with
    | [] -> (match acc with | [] -> [] | h::t -> if h = 0 then t else acc)
    | h::t ->
        let x = (h * i) + carry in
        let n = if x > 9 then x mod 10 else x in
        let carry' = if x > 9 then x / 10 else 0 in
        let acc' = n :: acc in helper acc' carry' i t in
  helper [] 0 i (List.rev (0 :: l));;

let bigMul l1 l2 =
  let f a x = match a with | (_,z) -> (0, (bigAdd z x)) | _ -> (0, []) in
  let base = [] in
  let args =
    let rec digitProducts acc place l1 l2 =
      match l1 with
      | [] -> acc
      | h::t ->
          let placeHolders =
            let rec buildZeros a places =
              if places = 0 then a else buildZeros (0 :: a) (places - 1) in
            buildZeros [] place in
          let a = List.append (mulByDigit h l2) placeHolders in
          digitProducts (a :: acc) (place + 1) t l2 in
    digitProducts [] 0 l1 l2 in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  let rec helper a x n =
    if n <= 0 then a else (let a' = x :: a in helper a' x (n - 1)) in
  helper [] x n;;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 > length2
  then (l1, (List.append (clone 0 (length1 - length2)) l2))
  else
    if length2 > length1
    then ((List.append (clone 0 (length2 - length1)) l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (o,z) ->
               if ((o + x1) + x2) > 9
               then (1, ((((o + x1) + x2) mod 10) :: z))
               else (0, (((o + x1) + x2) :: z))) in
    let base = (0, []) in
    let args =
      let rec pair acc list1 list2 =
        match (list1, list2) with
        | (h1::t1,h2::t2) -> pair (List.append acc [(h1, h2)]) t1 t2
        | (_,_) -> List.append acc [(0, 0)] in
      pair [] (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec helper acc carry i l =
    match l with
    | [] -> (match acc with | [] -> [] | h::t -> if h = 0 then t else acc)
    | h::t ->
        let x = (h * i) + carry in
        let n = if x > 9 then x mod 10 else x in
        let carry' = if x > 9 then x / 10 else 0 in
        let acc' = n :: acc in helper acc' carry' i t in
  helper [] 0 i (List.rev (0 :: l));;

let bigMul l1 l2 =
  let f a x = match a with | (_,z) -> (0, (bigAdd z x)) | _ -> (0, []) in
  let base = (0, []) in
  let args =
    let rec digitProducts acc place l1 l2 =
      match l1 with
      | [] -> acc
      | h::t ->
          let placeHolders =
            let rec buildZeros a places =
              if places = 0 then a else buildZeros (0 :: a) (places - 1) in
            buildZeros [] place in
          let a = List.append (mulByDigit h l2) placeHolders in
          digitProducts (a :: acc) (place + 1) t l2 in
    digitProducts [] 0 l1 l2 in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(35,38)-(35,39)
(35,41)-(35,42)
(53,14)-(53,16)
*)

(* type error slice
(2,4)-(5,18)
(2,15)-(5,16)
(2,17)-(5,16)
(3,3)-(5,16)
(4,28)-(4,65)
(4,37)-(4,43)
(4,47)-(4,53)
(4,47)-(4,65)
(4,54)-(4,56)
(4,57)-(4,58)
(4,60)-(4,65)
(5,3)-(5,9)
(5,3)-(5,16)
(5,10)-(5,12)
(5,13)-(5,14)
(5,15)-(5,16)
(7,4)-(15,20)
(7,13)-(15,17)
(7,16)-(15,17)
(8,3)-(15,17)
(8,17)-(8,28)
(8,17)-(8,31)
(8,29)-(8,31)
(9,3)-(15,17)
(9,17)-(9,28)
(9,17)-(9,31)
(9,29)-(9,31)
(10,3)-(15,17)
(11,9)-(11,11)
(11,9)-(11,58)
(11,14)-(11,25)
(11,14)-(11,58)
(11,27)-(11,32)
(11,27)-(11,53)
(11,33)-(11,34)
(11,36)-(11,53)
(11,56)-(11,58)
(18,3)-(18,70)
(18,51)-(18,61)
(18,51)-(18,63)
(18,62)-(18,63)
(20,4)-(38,37)
(20,12)-(38,33)
(20,15)-(38,33)
(21,3)-(38,33)
(21,12)-(37,52)
(22,5)-(37,52)
(22,11)-(29,46)
(22,13)-(29,46)
(23,7)-(29,46)
(23,13)-(23,14)
(25,12)-(29,46)
(25,18)-(25,19)
(27,16)-(29,46)
(27,21)-(27,22)
(27,21)-(27,27)
(27,21)-(27,33)
(27,25)-(27,27)
(27,31)-(27,33)
(28,22)-(28,23)
(28,22)-(28,55)
(28,29)-(28,49)
(28,29)-(28,55)
(28,54)-(28,55)
(30,5)-(37,52)
(30,17)-(30,18)
(30,17)-(30,22)
(30,20)-(30,22)
(31,5)-(37,52)
(32,7)-(36,41)
(33,9)-(35,44)
(34,30)-(34,34)
(34,30)-(34,69)
(34,36)-(34,47)
(34,36)-(34,62)
(34,48)-(34,51)
(34,52)-(34,62)
(34,54)-(34,56)
(34,54)-(34,60)
(34,58)-(34,60)
(34,64)-(34,66)
(34,67)-(34,69)
(36,7)-(36,11)
(36,7)-(36,41)
(36,12)-(36,14)
(36,16)-(36,24)
(36,16)-(36,27)
(36,25)-(36,27)
(36,30)-(36,38)
(36,30)-(36,41)
(36,39)-(36,41)
(37,5)-(37,52)
(37,19)-(37,33)
(37,19)-(37,45)
(37,34)-(37,35)
(37,36)-(37,40)
(37,41)-(37,45)
(37,49)-(37,52)
(38,3)-(38,13)
(38,3)-(38,33)
(38,15)-(38,18)
(38,15)-(38,33)
(38,20)-(38,27)
(38,20)-(38,33)
(38,28)-(38,30)
(38,31)-(38,33)
(40,4)-(49,38)
(40,20)-(49,34)
(40,22)-(49,34)
(41,3)-(49,34)
(42,5)-(48,54)
(45,18)-(45,23)
(45,22)-(45,23)
(47,9)-(48,54)
(47,22)-(47,49)
(47,36)-(47,42)
(48,9)-(48,54)
(48,20)-(48,28)
(48,32)-(48,38)
(48,32)-(48,54)
(48,39)-(48,43)
(48,44)-(48,50)
(48,51)-(48,52)
(48,53)-(48,54)
(49,3)-(49,9)
(49,3)-(49,34)
(49,10)-(49,12)
(49,13)-(49,14)
(49,15)-(49,16)
(49,18)-(49,26)
(49,18)-(49,34)
(49,28)-(49,29)
(49,28)-(49,34)
(49,33)-(49,34)
(52,3)-(66,50)
(52,9)-(52,70)
(52,11)-(52,70)
(52,15)-(52,70)
(52,21)-(52,22)
(52,40)-(52,41)
(52,40)-(52,54)
(52,44)-(52,50)
(52,44)-(52,54)
(52,51)-(52,52)
(52,53)-(52,54)
(53,3)-(66,50)
(53,14)-(53,16)
(54,3)-(66,50)
(55,5)-(65,29)
(56,7)-(64,52)
(63,32)-(63,42)
(63,32)-(63,47)
(63,43)-(63,44)
(63,45)-(63,47)
(64,11)-(64,24)
(64,11)-(64,52)
(64,26)-(64,34)
(64,37)-(64,46)
(64,48)-(64,49)
(64,50)-(64,52)
(65,5)-(65,18)
(65,5)-(65,29)
(65,19)-(65,21)
(65,22)-(65,23)
(65,24)-(65,26)
(65,27)-(65,29)
(66,17)-(66,31)
(66,17)-(66,43)
(66,32)-(66,33)
(66,34)-(66,38)
(66,39)-(66,43)
*)
