
let rec append xs1 xs2 =
  match xs1 with | [] -> xs2 | hd::tl -> hd :: (append tl xs2);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> append (listReverse tl) [hd];;

let palindrome w = failwith "TBD";;

let palindrome w =
  match explode w with
  | [] -> true
  | head::[] -> true
  | head::tail ->
      if head = (List.hd (listReverse [w]))
      then palindrome (List.tl (listReverse [tail]))
      else false;;


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
(13,20)-(13,28)
(13,20)-(13,34)
(13,29)-(13,34)
(15,16)-(22,17)
(16,3)-(22,17)
(16,9)-(16,16)
(16,9)-(16,18)
(16,17)-(16,18)
(17,11)-(17,15)
(18,17)-(18,21)
(20,10)-(20,14)
(20,18)-(20,25)
(20,18)-(20,42)
(20,27)-(20,38)
(20,27)-(20,42)
(20,39)-(20,42)
(20,40)-(20,41)
(21,12)-(21,22)
(21,12)-(21,51)
(21,24)-(21,31)
(21,24)-(21,51)
(22,12)-(22,17)
*)

(* type error slice
(5,4)-(8,9)
(5,13)-(8,7)
(6,3)-(8,7)
(7,14)-(7,27)
(7,14)-(7,29)
(7,28)-(7,29)
(7,56)-(7,58)
(7,56)-(7,65)
(7,60)-(7,65)
(8,3)-(8,5)
(8,3)-(8,7)
(8,6)-(8,7)
(11,3)-(11,67)
(11,47)-(11,58)
(11,47)-(11,61)
(11,59)-(11,61)
(16,3)-(22,17)
(16,9)-(16,16)
(16,9)-(16,18)
(16,17)-(16,18)
(21,33)-(21,44)
(21,33)-(21,51)
(21,45)-(21,51)
(21,46)-(21,50)
*)
