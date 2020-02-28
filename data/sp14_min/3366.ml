
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
(9,7)-(10,78)
[sqsum (mulByDigit i
                   (List.rev (List.map (fun x ->
                                          x * 10)
                                       t)) @ [h * i])]
ListG [AppG [EmptyG]]

*)

(* type error slice
(2,4)-(3,72)
(2,11)-(3,70)
(3,3)-(3,70)
(3,9)-(3,26)
(3,15)-(3,16)
(3,15)-(3,26)
(3,30)-(3,70)
(3,46)-(3,60)
(3,46)-(3,70)
(3,61)-(3,62)
(6,3)-(10,78)
(7,11)-(7,13)
(9,7)-(9,12)
(9,7)-(10,78)
*)
