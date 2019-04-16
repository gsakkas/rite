
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
  let f a x = match a with | (_,z) -> (0, (bigAdd z x)) | _ -> (0, 0) in
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
(52,68)-(52,69)
[]
ListG (fromList [])

(53,14)-(53,16)
(0 , [])
TupleG (fromList [LitG,ListG (fromList [])])

*)

(* type error slice
(18,3)-(18,70)
(18,9)-(18,10)
(18,37)-(18,70)
(18,51)-(18,61)
(18,51)-(18,63)
(18,69)-(18,70)
(20,4)-(38,37)
(20,12)-(38,35)
(20,15)-(38,35)
(21,3)-(38,35)
(38,3)-(38,13)
(38,3)-(38,35)
(52,3)-(66,50)
(52,9)-(52,70)
(52,15)-(52,70)
(52,21)-(52,22)
(52,39)-(52,56)
(52,43)-(52,55)
(52,44)-(52,50)
(52,64)-(52,70)
(52,68)-(52,69)
(53,3)-(66,50)
(53,14)-(53,16)
(66,17)-(66,31)
(66,17)-(66,43)
(66,32)-(66,33)
(66,34)-(66,38)
*)
