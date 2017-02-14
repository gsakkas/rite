
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (v1,v2) ->
          (match a with
           | (list1,list2) ->
               (match list1 with
                | [] ->
                    ((((v1 + v2) / 10) :: list1), (((v1 + v2) mod 10) ::
                      list2))
                | h::t ->
                    (((((v1 + v2) + h) / 10) :: list1),
                      ((((v1 + v2) + h) mod 10) :: list2)))) in
    let base = ([], []) in
    let args = List.append (List.rev (List.combine l1 l2)) [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      let rec adder x = match x with | [] -> [] | h::t -> bigAdd h (adder t) in
      (adder (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t)))) @
        [helper [] (h * i)];;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (v1,v2) ->
          (match a with
           | (list1,list2) ->
               (match list1 with
                | [] ->
                    ((((v1 + v2) / 10) :: list1), (((v1 + v2) mod 10) ::
                      list2))
                | h::t ->
                    (((((v1 + v2) + h) / 10) :: list1),
                      ((((v1 + v2) + h) mod 10) :: list2)))) in
    let base = ([], []) in
    let args = List.append (List.rev (List.combine l1 l2)) [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      let rec adder x = match x with | [] -> [] | h::t -> bigAdd h (adder t) in
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
        ((helper [] (h * i)) @ []);;

*)

(* changed spans
(38,8)-(38,13)
(38,8)-(38,68)
(39,9)-(39,28)
(39,10)-(39,16)
*)

(* type error slice
(2,35)-(2,36)
(2,35)-(2,55)
(2,35)-(2,55)
(2,41)-(2,46)
(2,41)-(2,55)
(2,47)-(2,48)
(4,4)-(7,80)
(4,13)-(7,76)
(4,16)-(7,76)
(6,23)-(6,28)
(6,23)-(6,66)
(6,29)-(6,30)
(7,14)-(7,25)
(7,14)-(7,76)
(7,27)-(7,32)
(7,27)-(7,70)
(7,74)-(7,76)
(12,4)-(29,37)
(12,12)-(29,33)
(12,15)-(29,33)
(29,20)-(29,27)
(29,20)-(29,33)
(29,31)-(29,33)
(36,9)-(36,66)
(36,9)-(36,66)
(36,23)-(36,26)
(36,32)-(36,38)
(36,32)-(36,66)
(36,41)-(36,57)
(36,54)-(36,57)
(37,59)-(37,65)
(37,59)-(37,76)
(37,69)-(37,74)
(37,69)-(37,76)
(38,8)-(38,13)
(38,8)-(38,68)
(38,8)-(39,28)
(38,73)-(38,74)
(39,9)-(39,28)
(39,9)-(39,28)
(39,10)-(39,16)
(39,10)-(39,26)
*)
