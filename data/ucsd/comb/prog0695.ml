
let append list1 list2 =
  match list1 with | [] -> list2 | h::t -> list1 :: list2;;

let append list1 list2 =
  match list1 with | [] -> list2 | h::t -> h :: (append [] t);;

let append list1 list2 =
  match list1 with | [] -> list2 | h::t -> h :: (append t list2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> listReverse (append t [h]);;

let _ = listReverse [1; 2; 3; 4];;
