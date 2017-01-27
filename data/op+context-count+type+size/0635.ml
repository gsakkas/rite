
let palindrome w = failwith "TBD";;

let rec append xs1 xs2 =
  match xs1 with | [] -> xs2 | hd::tl -> hd :: (append tl xs2);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> append (listReverse tl) [hd];;

let palindrome w =
  match explode w with
  | [] -> true
  | head::[] -> true
  | head::tail ->
      if head = (List.hd (listReverse tail))
      then palindrome (List.tl (listReverse tail))
      else false;;

let palindrome w =
  match explode w with
  | [] -> true
  | hd::[] -> true
  | hd::tl ->
      (match listReverse tl with
       | hdr::tlr -> if hdr = hd then palindrome tlr else false);;


(* fix

let rec append xs1 xs2 =
  match xs1 with | [] -> xs2 | hd::tl -> hd :: (append tl xs2);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> append (listReverse tl) [hd];;

let palindrome w =
  let rec palHelper xs =
    match xs with
    | [] -> true
    | hd::tl ->
        (match listReverse tl with
         | [] -> true
         | hdr::tlr -> if hdr = hd then palHelper tlr else false) in
  palHelper (explode w);;

*)

(* changed spans
(2,16)-(2,34)
(2,20)-(2,28)
(2,20)-(2,34)
(2,29)-(2,34)
(16,3)-(22,17)
(16,9)-(16,16)
(16,9)-(16,18)
(16,17)-(16,18)
(17,11)-(17,15)
(18,17)-(18,21)
(20,10)-(20,14)
(20,18)-(20,25)
(20,18)-(20,43)
(20,27)-(20,38)
(20,27)-(20,43)
(20,39)-(20,43)
(21,12)-(21,22)
(21,12)-(21,49)
(21,24)-(21,31)
(21,24)-(21,49)
(21,33)-(21,44)
(21,45)-(21,49)
(22,12)-(22,17)
(24,16)-(30,64)
*)

(* type error slice
(7,4)-(10,9)
(7,13)-(10,7)
(8,3)-(10,7)
(9,14)-(9,27)
(9,14)-(9,29)
(9,28)-(9,29)
(9,56)-(9,58)
(9,56)-(9,65)
(9,60)-(9,65)
(10,3)-(10,5)
(10,3)-(10,7)
(10,6)-(10,7)
(15,4)-(22,19)
(15,16)-(22,17)
(16,3)-(22,17)
(16,9)-(16,16)
(16,9)-(16,18)
(16,17)-(16,18)
(17,11)-(17,15)
(29,8)-(30,64)
(30,39)-(30,49)
(30,39)-(30,53)
(30,50)-(30,53)
*)
