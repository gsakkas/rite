
let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      sqsum
        ((mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i]);;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      [sqsum
         ((mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i])];;

*)

(* changed spans
(9,6)-(10,77)
*)

(* type error slice
(2,3)-(3,71)
(2,10)-(3,69)
(3,2)-(3,69)
(3,2)-(3,69)
(3,8)-(3,25)
(3,14)-(3,15)
(3,14)-(3,25)
(3,29)-(3,69)
(3,45)-(3,59)
(3,45)-(3,69)
(3,60)-(3,61)
(6,2)-(10,77)
(6,2)-(10,77)
(7,10)-(7,12)
(9,6)-(9,11)
(9,6)-(10,77)
*)
