
let rec appendLists (l1,l2) =
  match l1 with | [] -> l2 | h::t -> h :: (appendLists (t, l2));;

let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> appendLists ((digitsOfInt (n / 10)), [n mod 10]);;

let _ = digitsOfInt - 21041;;
