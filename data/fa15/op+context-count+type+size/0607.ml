
let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | [] ->
          (match x with
           | (x1,x2) when (x1 + x2) <= 9 -> 0 :: (x1 + x2) :: a
           | (x1,x2) when (x1 + x2) > 9 -> 1 :: ((x1 + x2) - 9) :: a)
      | h::t ->
          (match x with
           | (x1,x2) when ((x1 + x2) + h) <= 9 -> 0 :: ((x1 + x2) + h) :: t
           | (x1,x2) when ((x1 + x2) + h) > 9 -> 1 :: (((x1 + x2) + h) - 9)
               :: t) in
    let base = [] in
    let args = List.combine List.rev l1 List.rev l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      match a with
      | [] -> (sum / 10) :: (sum mod 10) :: a
      | h::t -> (sum / 10) :: (h + (sum mod 10)) :: t in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,7)-(29,20)
(20,13)-(20,14)
(22,12)-(24,69)
(22,18)-(22,19)
(23,45)-(23,46)
(23,45)-(23,64)
(23,51)-(23,53)
(23,51)-(23,64)
(23,56)-(23,58)
(23,63)-(23,64)
(24,44)-(24,45)
(24,51)-(24,53)
(24,51)-(24,58)
(24,51)-(24,63)
(24,51)-(24,69)
(24,56)-(24,58)
(24,62)-(24,63)
(24,68)-(24,69)
(26,12)-(29,20)
(26,18)-(26,19)
(27,51)-(27,52)
(27,58)-(27,60)
(27,58)-(27,65)
(27,58)-(27,70)
(27,58)-(27,76)
(27,63)-(27,65)
(27,69)-(27,70)
(27,75)-(27,76)
(28,50)-(28,51)
(28,50)-(29,20)
(28,58)-(28,60)
(28,58)-(28,65)
(28,58)-(28,75)
(28,58)-(29,20)
(28,63)-(28,65)
(28,74)-(28,75)
(29,19)-(29,20)
(30,5)-(32,52)
(31,5)-(32,52)
(31,16)-(31,28)
(31,16)-(31,52)
(31,29)-(31,37)
(31,41)-(31,49)
(32,5)-(32,52)
(32,49)-(32,52)
*)

(* type error slice
(31,16)-(31,28)
(31,16)-(31,52)
*)
