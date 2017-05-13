
let append list1 list2 =
  match list1 with | [] -> list2 | h::t -> list1 :: list2;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> listReverse (append t [h]);;
