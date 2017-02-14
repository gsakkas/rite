
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let z = (fst x) + (snd x) in
      match a with | (w,y) -> (((w + z) / 10), (((w + z) mod 10) :: y)) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec adder n l' a =
    match n with
    | 0 -> [0]
    | 1 -> bigAdd l' a
    | _ -> adder (n - 1) l' (bigAdd a l') in
  adder i l [0];;

let bigMul l1 l2 =
  let f a x =
    match a with
    | (w,y) -> (w, (bigAdd y (mulByDigit (x * (10 ** (List.length y))) l1))) in
  let base = (0, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let z = (fst x) + (snd x) in
      match a with | (w,y) -> (((w + z) / 10), (((w + z) mod 10) :: y)) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec adder n l' a =
    match n with
    | 0 -> [0]
    | 1 -> bigAdd l' a
    | _ -> adder (n - 1) l' (bigAdd a l') in
  adder i l [0];;

let rec mulByTen n =
  match n with | 0 -> 0 | 1 -> 10 | _ -> 10 * (mulByTen (n - 1));;

let bigMul l1 l2 =
  let f a x =
    match a with
    | (w,y) ->
        (w, (bigAdd y (mulByDigit (x * (mulByTen (List.length y))) l1))) in
  let base = (0, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(34,11)-(39,75)
(35,2)-(39,75)
(37,46)-(37,69)
(37,47)-(37,49)
(37,50)-(37,52)
(37,54)-(37,65)
(38,2)-(39,75)
(39,2)-(39,75)
(39,13)-(39,21)
(39,13)-(39,24)
(39,22)-(39,24)
(39,28)-(39,75)
(39,42)-(39,56)
(39,42)-(39,68)
(39,57)-(39,58)
(39,59)-(39,63)
(39,64)-(39,68)
(39,72)-(39,75)
*)

(* type error slice
(37,46)-(37,69)
(37,47)-(37,49)
(37,50)-(37,52)
*)
