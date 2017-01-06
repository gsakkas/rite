
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


(* changed spans
(13,20)-(13,36)
(15,5)-(15,17)
(16,9)-(16,18)
(18,5)-(18,9)
(19,5)-(19,9)
(19,11)-(19,15)
(20,10)-(20,14)
(20,17)-(20,23)
(20,26)-(20,44)
(21,12)-(21,53)
*)

(* type error slice
(13,20)-(13,34)
*)
