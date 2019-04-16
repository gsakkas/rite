
let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (b1,b2) = a in
      match x with
      | (fir,sec) ->
          if ((fir + sec) + b1) < 10
          then
            (if (List.length b2) >= ((List.length l1) - 1)
             then (0, (b1 :: (((fir + sec) + b1) mod 10) :: b2))
             else (0, (((fir + sec) + b1) :: b2)))
          else
            if (List.length b2) >= ((List.length l1) - 1)
            then (0, (b1 :: (((fir + sec) + b1) mod 10) :: b2))
            else
              ((((fir + sec) + b1) / 10), ((((fir + sec) + b1) mod 10) ::
                b2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec helper a b acc =
    if a > 0 then helper (a - 1) b (bigAdd b b) else acc in
  helper i l 0;;


(* fix

let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (b1,b2) = a in
      match x with
      | (fir,sec) ->
          if ((fir + sec) + b1) < 10
          then
            (if (List.length b2) >= ((List.length l1) - 1)
             then (0, (b1 :: (((fir + sec) + b1) mod 10) :: b2))
             else (0, (((fir + sec) + b1) :: b2)))
          else
            if (List.length b2) >= ((List.length l1) - 1)
            then (0, (b1 :: (((fir + sec) + b1) mod 10) :: b2))
            else
              ((((fir + sec) + b1) / 10), ((((fir + sec) + b1) mod 10) ::
                b2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec helper a b acc =
    if a > 0 then helper (a - 1) b (bigAdd b b) else acc in
  helper i l [];;

*)

(* changed spans
(42,14)-(42,15)
[]
ListG (fromList [])

*)

(* type error slice
(15,37)-(15,75)
(15,51)-(15,61)
(15,51)-(15,63)
(15,69)-(15,75)
(17,4)-(37,37)
(17,12)-(37,35)
(17,15)-(37,35)
(18,3)-(37,35)
(37,3)-(37,13)
(37,3)-(37,35)
(41,19)-(41,25)
(41,19)-(41,48)
(41,36)-(41,48)
(41,37)-(41,43)
(42,3)-(42,9)
(42,3)-(42,15)
(42,14)-(42,15)
*)
