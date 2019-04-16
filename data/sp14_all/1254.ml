
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
(37,47)-(37,70)
mulByTen (List.length y)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(37,47)-(37,70)
(37,48)-(37,50)
(37,51)-(37,53)
*)
