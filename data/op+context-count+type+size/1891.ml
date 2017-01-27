
let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x]);;

let padZero l1 l2 =
  let num1 = (List.length l2) - (List.length l1) in
  let num2 = (List.length l1) - (List.length l2) in
  (((clone 0 num1) @ l1), ((clone 0 num2) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let rec intlist x =
        if x < 10 then [x] else (intlist (x / 10)) @ [x mod 10] in
      match x with
      | (z,y) ->
          (match a with
           | [] -> let sum = z + y in intlist sum
           | h::t ->
               let sum = (h + z) + y in
               let result = (intlist sum) @ t in
               if sum < 10 then 0 :: result else result) in
    let base = [0] in
    let args = List.rev (List.combine l1 l2) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec intlist x = if x < 10 then [x] else (intlist (x / 10)) @ [x mod 10] in
  match l with
  | [] -> [0]
  | h::t ->
      let zeroList =
        match t with
        | [] -> []
        | h'::t' -> (match padZero t [0] with | (a,b) -> b) in
      let mult = intlist (h * i) in
      let res = mult @ zeroList in bigAdd res (mulByDigit i t);;

let bigMul l1 l2 =
  let f a x =
    match a with | (b,c) -> ((b @ [0]), (bigAdd ((mulByDigit x l2) @ b) c)) in
  let base = ([], 0) in
  let args = l1 in let res = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x]);;

let padZero l1 l2 =
  let num1 = (List.length l2) - (List.length l1) in
  let num2 = (List.length l1) - (List.length l2) in
  (((clone 0 num1) @ l1), ((clone 0 num2) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let rec intlist x =
        if x < 10 then [x] else (intlist (x / 10)) @ [x mod 10] in
      match x with
      | (z,y) ->
          (match a with
           | [] -> let sum = z + y in intlist sum
           | h::t ->
               let sum = (h + z) + y in
               let result = (intlist sum) @ t in
               if sum < 10 then 0 :: result else result) in
    let base = [0] in
    let args = List.rev (List.combine l1 l2) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec intlist x = if x < 10 then [x] else (intlist (x / 10)) @ [x mod 10] in
  match l with
  | [] -> [0]
  | h::t ->
      let zeroList =
        match t with
        | [] -> []
        | h'::t' -> (match padZero t [0] with | (a,b) -> b) in
      let mult = intlist (h * i) in
      let res = mult @ zeroList in bigAdd res (mulByDigit i t);;

let bigMul l1 l2 =
  let f a x =
    match a with | (b,c) -> ((b @ [0]), (bigAdd ((mulByDigit x l2) @ b) c)) in
  let base = ([], [0]) in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(48,19)-(48,20)
*)

(* type error slice
(5,40)-(5,45)
(5,40)-(5,54)
(5,46)-(5,47)
(5,49)-(5,54)
(7,4)-(10,51)
(7,13)-(10,47)
(7,16)-(10,47)
(8,3)-(10,47)
(8,15)-(8,26)
(8,15)-(8,29)
(8,15)-(8,48)
(8,27)-(8,29)
(8,34)-(8,45)
(8,34)-(8,48)
(8,46)-(8,48)
(9,3)-(10,47)
(9,15)-(9,48)
(10,6)-(10,11)
(10,6)-(10,18)
(10,6)-(10,24)
(10,6)-(10,47)
(10,12)-(10,13)
(10,14)-(10,18)
(10,20)-(10,21)
(10,22)-(10,24)
(10,29)-(10,34)
(10,29)-(10,41)
(10,29)-(10,47)
(10,35)-(10,36)
(10,37)-(10,41)
(10,43)-(10,44)
(10,45)-(10,47)
(13,3)-(13,70)
(13,51)-(13,61)
(13,51)-(13,63)
(13,62)-(13,63)
(15,4)-(31,37)
(15,12)-(31,33)
(15,15)-(31,33)
(16,3)-(31,33)
(16,12)-(30,48)
(17,5)-(30,48)
(17,11)-(27,56)
(17,13)-(27,56)
(18,7)-(27,56)
(19,34)-(19,41)
(19,34)-(19,49)
(19,43)-(19,49)
(20,7)-(27,56)
(20,13)-(20,14)
(22,12)-(27,56)
(22,18)-(22,19)
(23,20)-(23,50)
(23,30)-(23,31)
(23,30)-(23,35)
(23,34)-(23,35)
(23,39)-(23,46)
(23,39)-(23,50)
(23,47)-(23,50)
(28,5)-(30,48)
(28,16)-(28,19)
(28,17)-(28,18)
(29,5)-(30,48)
(29,16)-(29,24)
(29,16)-(29,44)
(29,26)-(29,38)
(29,26)-(29,44)
(29,39)-(29,41)
(29,42)-(29,44)
(30,5)-(30,48)
(30,15)-(30,29)
(30,15)-(30,41)
(30,30)-(30,31)
(30,32)-(30,36)
(30,37)-(30,41)
(30,45)-(30,48)
(31,3)-(31,13)
(31,3)-(31,33)
(31,15)-(31,18)
(31,15)-(31,33)
(31,20)-(31,27)
(31,20)-(31,33)
(31,28)-(31,30)
(31,31)-(31,33)
(35,3)-(43,62)
(42,27)-(42,32)
(42,31)-(42,32)
(43,48)-(43,58)
(43,48)-(43,62)
(43,59)-(43,60)
(43,61)-(43,62)
(46,3)-(49,63)
(46,9)-(47,74)
(46,11)-(47,74)
(47,5)-(47,74)
(47,11)-(47,12)
(47,31)-(47,32)
(47,31)-(47,38)
(47,31)-(47,74)
(47,33)-(47,34)
(47,35)-(47,38)
(47,36)-(47,37)
(47,42)-(47,48)
(47,42)-(47,74)
(47,51)-(47,61)
(47,51)-(47,66)
(47,51)-(47,71)
(47,62)-(47,63)
(47,64)-(47,66)
(47,68)-(47,69)
(47,70)-(47,71)
(47,73)-(47,74)
(48,3)-(49,63)
(48,15)-(48,17)
(48,15)-(48,20)
(48,19)-(48,20)
(49,3)-(49,63)
(49,14)-(49,16)
(49,30)-(49,44)
(49,30)-(49,56)
(49,45)-(49,46)
(49,47)-(49,51)
(49,52)-(49,56)
*)
